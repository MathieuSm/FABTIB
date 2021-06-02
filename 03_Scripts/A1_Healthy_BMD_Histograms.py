# 00 Initialization
import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
import matplotlib.pyplot as plt


desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)

## Define functions
def Load_Itk(Filename):

    # Reads the image using SimpleITK
    Itkimage = sitk.ReadImage(Filename)

    # Convert the image to a  numpy array first and then shuffle the dimensions to get axis in the order z,y,x
    CT_Scan = sitk.GetArrayFromImage(Itkimage)

    # Read the origin of the ct_scan, will be used to convert the coordinates from world to voxel and vice versa.
    Origin = np.array(list(reversed(Itkimage.GetOrigin())))

    # Read the spacing along each dimension
    Spacing = np.array(list(reversed(Itkimage.GetSpacing())))

    # Read the dimension of the CT scan (in voxel)
    Size = np.array(list(reversed(Itkimage.GetSize())))

    return CT_Scan, Origin, Spacing, Size
def PlotROIInScan(CT_Scan, ROI_Origin, ROI_Spacing, ROI_Size, XY=True, XZ=True, YZ=True):

    if XY:
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Image = Axes.imshow(CT_Scan[int(Z1 + ROI_Size[0] / 2), :, :])
        Axes.plot([X1, X1], [Y1, Y2], color=(1, 0, 0))
        Axes.plot([X1, X2], [Y2, Y2], color=(1, 0, 0))
        Axes.plot([X2, X2], [Y1, Y2], color=(1, 0, 0))
        Axes.plot([X1, X2], [Y1, Y1], color=(1, 0, 0))
        plt.colorbar(Image)
        plt.show()
        plt.close(Figure)

    if XZ:
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Image = Axes.imshow(CT_Scan[:, int(Y1 + ROI_Size[1] / 2), :])
        Axes.plot([X1, X1], [Z1, Z2], color=(1, 0, 0))
        Axes.plot([X1, X2], [Z2, Z2], color=(1, 0, 0))
        Axes.plot([X2, X2], [Z1, Z2], color=(1, 0, 0))
        Axes.plot([X1, X2], [Z1, Z1], color=(1, 0, 0))
        plt.colorbar(Image)
        plt.ylim([0,CT_Scan.shape[0]])
        plt.show()
        plt.close(Figure)

    if YZ:
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Image = Axes.imshow(CT_Scan[:, :, int(X1 + ROI_Size[2] / 2)])
        Axes.plot([Y1, Y1], [Z1, Z2], color=(1, 0, 0))
        Axes.plot([Y1, Y2], [Z2, Z2], color=(1, 0, 0))
        Axes.plot([Y2, Y2], [Z1, Z2], color=(1, 0, 0))
        Axes.plot([Y1, Y2], [Z1, Z1], color=(1, 0, 0))
        plt.colorbar(Image)
        plt.ylim([0, CT_Scan.shape[0]])
        plt.show()
        plt.close(Figure)

    return
def PlotCorrespondence(ROI_Scan, ROI, XY=True, XZ=True, YZ=True):
    if XY:
        ## Verify XY correspondence
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Axes.imshow(ROI_Scan[43, :, :], cmap='binary')
        Image = Axes.imshow(ROI[43, :, :], cmap='jet', alpha=0.5)
        plt.colorbar(Image)
        plt.show()
        plt.close(Figure)

    if XZ:
        ## Verify XZ correspondence
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Axes.imshow(ROI_Scan[:, 43, :], cmap='binary')
        Image = Axes.imshow(ROI[:, 43, :], cmap='jet', alpha=0.5)
        plt.colorbar(Image)
        plt.show()
        plt.close(Figure)

    if YZ:
        ## Verify YZ correspondence
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Axes.imshow(ROI_Scan[:, :, 43], cmap='binary')
        Image = Axes.imshow(ROI[:, :, 43], cmap='jet', alpha=0.5)
        plt.colorbar(Image)
        plt.show()
        plt.close(Figure)

    return
def WriteRaw(ImageArray, OutputFileName, PixelType):

    if PixelType == 'uint':

        MinValue = ImageArray.min()

        if MinValue < 0:
            ShiftedImageArray = ImageArray + abs(MinValue)
            MaxValue = ShiftedImageArray.max()
        elif MinValue > 0:
            ShiftedImageArray = ImageArray - MinValue
            MaxValue = ShiftedImageArray.max()
        else :
            ShiftedImageArray = ImageArray
            MaxValue = ShiftedImageArray.max()

        ScaledImageArray = ShiftedImageArray / MaxValue * 255

        CastedImageArray = ScaledImageArray.astype(np.uint8)

    elif PixelType == 'short':
        CastedImageArray = ImageArray.astype(np.short)
    elif PixelType == 'float':
        CastedImageArray = ImageArray.astype('float32')

    File = np.memmap(OutputFileName, dtype=CastedImageArray.dtype, mode='w+', shape=CastedImageArray.shape)
    File[:] = CastedImageArray[:]
    del File

    return
def WriteMHD(ImageArray, Spacing, Origin, Path, FileName, PixelType='uint'):

    if PixelType == 'short' or PixelType == 'float':
        if len(ImageArray.shape) == 2:

            Array_3D = np.zeros((1,ImageArray.shape[0],ImageArray.shape[1]))

            for j in range(ImageArray.shape[0]):
                for i in range(ImageArray.shape[1]):
                    Array_3D[0,j,i] = ImageArray[j,i]

            ImageArray = Array_3D

    nz, ny, nx = np.shape(ImageArray)

    lx = float(Spacing[0])
    ly = float(Spacing[1])
    lz = float(Spacing[2])

    TransformMatrix = '1 0 0 0 1 0 0 0 1'
    Offset = str(Origin[::-1])[1:-1]
    CenterOfRotation = '0 0 0'
    AnatomicalOrientation = 'LPS'

    outs = open(os.path.join(Path, FileName) + '.mhd', 'w')
    outs.write('ObjectType = Image\n')
    outs.write('NDims = 3\n')
    outs.write('BinaryData = True\n')
    outs.write('BinaryDataByteOrderMSB = False\n')
    outs.write('CompressedData = False\n')
    outs.write('TransformMatrix = %s \n' % TransformMatrix)
    outs.write('Offset = %s \n' % Offset)
    outs.write('CenterOfRotation = %s \n' % CenterOfRotation)
    outs.write('AnatomicalOrientation = %s \n' % AnatomicalOrientation)
    outs.write('ElementSpacing = %g %g %g\n' % (lx, ly, lz))
    outs.write('DimSize = %i %i %i\n' % (nx, ny, nz))

    if PixelType == 'uint':
        outs.write('ElementType = %s\n' % 'MET_UCHAR')
    elif PixelType == 'short':
        outs.write('ElementType = %s\n' % 'MET_SHORT')
    elif PixelType == 'float':
        outs.write('ElementType = %s\n' % 'MET_FLOAT')

    outs.write('ElementDataFile = %s\n' % (FileName + '.raw'))
    outs.close()

    WriteRaw(ImageArray, os.path.join(Path, FileName) + '.raw', PixelType)

    return



# 01 Set paths
WorkingDirectory = os.getcwd()
MatchingPath = os.path.join(WorkingDirectory,'04_Results/05_Variables_Matching')
ScanPath = os.path.join(WorkingDirectory,'10_Additionnal/01_Healthy_BMD/01_Scans/')
ROIPath = os.path.join(WorkingDirectory,'04_Results/01_ROI_Analysis/01_Healthy_ROIs/00_Cleaned_ROIs/')
ResultsDirectory = os.path.join(WorkingDirectory,'10_Additionnal/01_Healthy_BMD/02_ROIs/')

## Initialization
BinsValues = np.arange(0,1.5e4,300)
Histograms = pd.DataFrame(columns=BinsValues[:-1])
Matched_Healthy = pd.read_csv(os.path.join(MatchingPath,'01_Matched_Healthy.csv'))


# 02 Load files
ROI_Data = pd.read_csv(ResultsDirectory+'00_Shifts.csv')
for Index in Matched_Healthy.index:

    Scan = Matched_Healthy.loc[Index,'Scan']
    ROINumber = Matched_Healthy.loc[Index,'ROI Number']

    ## Load scan
    CT_Scan, Origin, Spacing, Size = Load_Itk(ScanPath+Scan[:8]+'.mhd')

    ## Scale scan to BMD values using AIM header
    AIMFile = open(ScanPath+Scan[:8]+'.AIM', 'rb')

    BinInts = AIMFile.read(32 * 4)
    AIM_ints = struct.unpack('=32i', BinInts)
    if int(AIM_ints[5]) == 16:
        Header = AIMFile.read(AIM_ints[2])
    else:
        Header = AIMFile.read(AIM_ints[8])

    ## Read AIM header
    Header = re.sub(b'(?i) +', b' ', Header)
    Header = Header.split(b'\n')
    Header.pop(0); Header.pop(0); Header.pop(0); Header.pop(0)
    Scaling = None; Slope = None; Intercept = None
    for Line in Header:
        if Line.find(b'Scaled by factor') > -1:
            Scaling = float(Line.split(b' ')[-1])
        if Line.find(b'Density: intercept') > -1:
            Intercept = float(Line.split(b' ')[-1])
        if Line.find(b'Density: slope') > -1:
            Slope = float(Line.split(b' ')[-1])

    BMD_Scan = CT_Scan / Scaling * Slope + Intercept

    ## Load segmented ROI
    ROI_File = str(ROINumber) + '_' + Scan + '_Cleaned.mhd'
    ROI_Scan, ROI_Origin, ROI_Spacing, ROI_Size = Load_Itk(ROIPath+ROI_File)


    # 03 Extract BMD ROI
    ROI_Offset = np.array(ROI_Origin / ROI_Spacing).astype('int')
    Z_Shift, Y_Shift, X_Shift = ROI_Data.loc[Index,['Z Shift','Y Shift','X Shift']].astype('int')
    X1, X2 = ROI_Offset[2] + X_Shift, ROI_Offset[2] + ROI_Size[2] + X_Shift
    Y1, Y2 = ROI_Offset[1] + Y_Shift, ROI_Offset[1] + ROI_Size[1] + Y_Shift
    Z1, Z2 = ROI_Offset[0] + Z_Shift, ROI_Offset[0] + ROI_Size[0] + Z_Shift
    ROI = BMD_Scan[Z1:Z2, Y1:Y2, X1:X2]
    PlotROIInScan(BMD_Scan, ROI_Origin, ROI_Spacing, ROI_Size, XY=False, XZ=False, YZ=False)
    PlotCorrespondence(ROI_Scan, ROI, XY=True, XZ=False, YZ=False)
    WriteMHD(ROI, Spacing, ROI_Origin, ResultsDirectory, str(ROINumber) + '_' + Scan[:8], PixelType='float')



    # 04 Get ROI tissue BMD
    tBMD = ROI * ROI_Scan
    Mean_tBMD = tBMD[tBMD > 0].mean()
    ROI_Data.loc[Index, 'Mean tBMD'] = Mean_tBMD
ROI_Data.to_csv(ResultsDirectory+'01_tBMD.csv',index=False)


## plot histogram
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
for i in Histograms.index[:-1]:
    Axes.hist(BinsValues[:-1], BinsValues, weights=Histograms.loc[i],color=(0,0,1,0.2))
Axes.hist(BinsValues[:-1], BinsValues, weights=Histograms.loc[i+1],color=(0,0,1,0.2),label='Healthy ROIs')
Axes.hist(BinsValues[:-1], BinsValues, weights=Histograms.mean(),color=(0,0,1), edgecolor=(0,0,0))
# for i in Histograms2.index[:-1]:
#     Axes.hist(BinsValues[:-1], BinsValues, weights=Histograms2.loc[i],color=(1,0,0,0.2))
# Axes.hist(BinsValues[:-1], BinsValues, weights=Histograms2.loc[i+1],color=(1,0,0,0.2),label='OI ROIs')
# Axes.hist(BinsValues[:-1], BinsValues, weights=Histograms2.mean(),color=(1,0,0), edgecolor=(0,0,0))
Axes.hist([],color=(1,1,1,0), edgecolor=(0,0,0),label='Mean histogram')
Axes.set_xlim([0,1e4])
Axes.set_xlabel('Tissue BMD (mgHA/cm$^3$)')
Axes.set_ylabel('Relative density (-)')
plt.subplots_adjust(bottom=0.15,left=0.175)
plt.legend(loc='upper right')
plt.show()
plt.close(Figure)


## Prepare histogram and store data
BinsValues2 = np.linspace(ROI_Data2['Mean tBMD'].min(),ROI_Data2['Mean tBMD'].max(),20)
Counts, Bins = np.histogram(ROI_Data['Mean tBMD'],BinsValues)
RelativeWeights = Counts/Counts.sum()
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.hist(BinsValues[:-1], BinsValues, weights=RelativeWeights,color=(0,0,1), edgecolor=(0,0,1),label='Healthy')
Axes.set_xlim([4500,5500])
Axes.set_ylim([0,0.15])
Axes.set_xlabel('Tissue BMD (mgHA/cm$^3$)')
Axes.set_ylabel('Relative density (-)')
plt.subplots_adjust(bottom=0.15,left=0.175)
plt.legend(loc='upper center',bbox_to_anchor=(0.5,1.25))
plt.subplots_adjust(top=0.8)
plt.show()
plt.close(Figure)

