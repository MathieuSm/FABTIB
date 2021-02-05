# 00 Initialization
import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

# 01 Define functions
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
def SelectROI(Stack, VoxelsRange, VoxelMargin, ROINumber):

    HalfStackHeight = int(Stack.shape[0] / 2)

    ZMin, YMin, XMin = np.ceil(VoxelsRange / 2).astype('int') + VoxelMargin
    ZMax, YMax, XMax = Stack.shape - np.ceil(VoxelsRange / 2).astype('int') - VoxelMargin

    if ROINumber < 3:
        Z, Y, X = np.random.randint([ZMin, YMin, XMin], [HalfStackHeight, YMax, XMax])
    else:
        Z, Y, X = np.random.randint([HalfStackHeight, YMin, XMin], [ZMax, YMax, XMax])

    Z1, Y1, X1 = [Z, Y, X] - np.round(VoxelsRange / 2).astype('int')
    Z2, Y2, X2 = [Z1, Y1, X1] + VoxelsRange

    ROI = [Z, Y, X, Z1, Y1, X1, Z2, Y2, X2]

    return ROI
def ROISelection(Stack, VoxelsRange, VoxelMargin, ROINumber, TrabBone, CortBone):

    ROI = SelectROI(Stack, VoxelsRange, VoxelMargin, ROINumber)

    Z, Y, X, Z1, Y1, X1, Z2, Y2, X2 = ROI

    Inside = Stack[Z, Y, X] == TrabBone
    Cortical = CortBone in Stack[Z1:Z2, Y1:Y2, X1:X2]

    # Initialize loop
    Iteration = 0

    while not Inside or Cortical:

        ROI = SelectROI(Stack, VoxelsRange, VoxelMargin, ROINumber)

        Z, Y, X, Z1, Y1, X1, Z2, Y2, X2 = ROI

        Inside = Stack[Z, Y, X] == TrabBone
        Cortical = CortBone in np.unique(Stack[Z1:Z2, Y1:Y2, X1:X2])

        Iteration += 1

        if Iteration > 1e3:

            print('No ROI could be selected after %i iterations !'%Iteration)

            Ratio = Size[2] / Size[1]

            GS = gridspec.GridSpec(1, 2, width_ratios=[1, Ratio])
            Figure = plt.figure(figsize=(11, 4.5), dpi=100)
            Axes1 = plt.subplot(GS[0])
            Axes2 = plt.subplot(GS[1])
            Axes = [Axes1, Axes2]

            for Plane in range(2):

                if Plane == 0:
                    Axes[Plane].imshow(CT_Scan[:, :, int(Size[2]/2)], cmap='bone')
                    Axes[Plane].set_xlabel('Direction 2 (voxel)')
                    Axes[Plane].set_ylabel('Direction 3 (voxel)')

                else:
                    Axes[Plane].imshow(CT_Scan[:, int(Size[1]/2), :], cmap='bone')
                    Axes[Plane].set_yticks([])
                    Axes[Plane].set_xlabel('Direction 1 (voxel)')

                Axes[Plane].plot([0, Size[Plane + 1]], [StackHeight, StackHeight], color=(1, 0, 0))
                Axes[Plane].plot([0, Size[Plane + 1]], [2 * StackHeight, 2 * StackHeight], color=(1, 0, 0))
                Axes[Plane].set_xlim([0, Size[Plane + 1]])
                Axes[Plane].set_ylim([0, Size[0]])

            plt.show()

            break

    return Z1, Y1, X1


# 02 Load Paths
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')
ResultsFolder = os.path.join(WorkingDirectory,'04_Results/00_ROI_Selection')

DataSubFolders = [File for File in os.listdir(DataFolder) if os.path.isdir(os.path.join(DataFolder,File))]
DataSubFolders.sort()

ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('.csv')]
ScanLists.sort()

# 03 Load Data
DataGroup = 0   # 0 = Healthy group, 1 = OI group
Plots = False   # Plot the different ROI location

ScansPath = os.path.join(DataFolder,DataSubFolders[DataGroup])
Scans = [File for File in os.listdir(ScansPath) if File.endswith('.mhd')]
Scans.sort()

ScanList = pd.read_csv(os.path.join(DataFolder,ScanLists[DataGroup]),sep=',')

ParametersDataFrame = pd.DataFrame()

# perform for all scans
for Scan in Scans:

    ScanFile = os.path.join(ScansPath,Scan)
    CT_Scan, Origin, Spacing, Size = Load_Itk(ScanFile)

    CubeSide = 5.3    # Side length of cubic ROI (mm)
    VoxelsRange = np.round(CubeSide / Spacing).astype('int')

    # 04 Select stack
    if DataGroup == 0:
        StackHeight = int(Size[0] / 3)
        SelectedStack = CT_Scan[2*StackHeight:,:,:]
        SoftTissue, TrabBone, CortBone = np.unique(SelectedStack)
    elif DataGroup == 1:
        StackHeight = int(Size[0])
        SelectedStack = CT_Scan
        SoftTissue, TrabBone, CortBone = np.unique(SelectedStack)


    # 05 Select 6 ROIs
    VoxelMargin = 5

    for ROINumber in range(6):

        Z1, Y1, X1 = ROISelection(SelectedStack, VoxelsRange, VoxelMargin, ROINumber, TrabBone, CortBone)

        if DataGroup == 0:
            ZPos = Z1+2*StackHeight
        elif DataGroup == 1:
            ZPos = Z1

        Parameters = {'$Scan': Scan[:-4],
                      '$ROINumber': ROINumber+1,
                      '$XPos': X1,
                      '$YPos': Y1,
                      '$ZPos': ZPos,
                      '$XRange': VoxelsRange[2],
                      '$YRange': VoxelsRange[1],
                      '$ZRange': VoxelsRange[0]}

        ParametersDataFrame = ParametersDataFrame.append(Parameters, ignore_index=True)

    # Plot
    if Plots:
        Ratio = Size[2] / Size[1]
        for Index in ParametersDataFrame.index:

            GS = gridspec.GridSpec(1,2, width_ratios=[1,Ratio])
            Figure = plt.figure(figsize=(11,4.5), dpi=100)
            Axes1 = plt.subplot(GS[0])
            Axes2 = plt.subplot(GS[1])
            Axes = [Axes1, Axes2]

            X1 = ParametersDataFrame['$XPos'].loc[Index].astype('int')
            X = X1 + np.round(ParametersDataFrame['$XRange'].loc[Index] / 2).astype('int')
            X2 = X1 + ParametersDataFrame['$XRange'].loc[Index].astype('int')

            Y1 = ParametersDataFrame['$YPos'].loc[Index].astype('int')
            Y = Y1 + np.round(ParametersDataFrame['$YRange'].loc[Index] / 2).astype('int')
            Y2 = Y1 + ParametersDataFrame['$YRange'].loc[Index].astype('int')

            Z1 = ParametersDataFrame['$ZPos'].loc[Index].astype('int')
            Z2 = Z1 + ParametersDataFrame['$ZRange'].loc[Index].astype('int')

            for Plane in range(2):

                if Plane == 0:
                    Axes[Plane].imshow(CT_Scan[:, :, X]-TrabBone, cmap='bone', clim=[0,1])
                    Axes[Plane].plot([Y1, Y2], [Z1, Z1], color=(0, 0, 1))
                    Axes[Plane].plot([Y1, Y2], [Z2, Z2], color=(0, 0, 1))
                    Axes[Plane].plot([Y1, Y1], [Z1, Z2], color=(0, 0, 1))
                    Axes[Plane].plot([Y2, Y2], [Z1, Z2], color=(0, 0, 1))
                    Axes[Plane].set_xlabel('Direction 2 (voxel)')
                    Axes[Plane].set_ylabel('Direction 3 (voxel)')

                else:
                    Axes[Plane].imshow(CT_Scan[:, Y, :]-TrabBone, cmap='bone', clim=[0,1])
                    Axes[Plane].plot([X1, X2], [Z1, Z1], color=(0, 0, 1))
                    Axes[Plane].plot([X1, X2], [Z2, Z2], color=(0, 0, 1))
                    Axes[Plane].plot([X1, X1], [Z1, Z2], color=(0, 0, 1))
                    Axes[Plane].plot([X2, X2], [Z1, Z2], color=(0, 0, 1))
                    Axes[Plane].set_yticks([])
                    Axes[Plane].set_xlabel('Direction 1 (voxel)')

                Axes[Plane].plot([0, Size[Plane + 1]], [StackHeight, StackHeight], color=(1, 0, 0))
                Axes[Plane].plot([0, Size[Plane + 1]], [2 * StackHeight, 2 * StackHeight], color=(1, 0, 0))
                Axes[Plane].set_xlim([0, Size[Plane + 1]])
                Axes[Plane].set_ylim([0, Size[0]])

            plt.show()
            plt.close(Figure)


# Save Parameters for Medtool
ColsToInt = ['$XPos', '$YPos', '$ZPos', '$XRange', '$YRange', '$ZRange', '$ROINumber']
ParametersDataFrame[ColsToInt] = ParametersDataFrame[ColsToInt].astype(int)
ParametersDataFrame.to_csv(os.path.join(ResultsFolder, DataSubFolders[DataGroup][:-14] + 'ROI.csv'),
                           sep=';', line_terminator=';\n', index=False)