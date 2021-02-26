# 00 Initialization
import os
import numpy as np
import pandas as pd
import SimpleITK as sitk

desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})


## Define function
def GetFabricInfos(FabricFile):
    FabricFile = open(FabricFile, 'r')
    FabricText = FabricFile.read()
    FabricLines = FabricText.split('\n')

    for Index in range(len(FabricLines)):

        if 'BV/TV' in FabricLines[Index]:
            BVTV = np.float(FabricLines[Index].split()[-1])

        if 'Eigen values' in FabricLines[Index]:
            m1 = np.float(FabricLines[Index].split()[5])
            m2 = np.float(FabricLines[Index].split()[6])
            m3 = np.float(FabricLines[Index].split()[7])

            DA = np.round(max(m1,m2,m3)/min(m1,m2,m3),3)

        if 'Eigen vector 1' in FabricLines[Index]:
            m1Vector = np.array([np.float(FabricLines[Index].split()[6]),
                                 np.float(FabricLines[Index].split()[7]),
                                 np.float(FabricLines[Index].split()[8])])

        if 'Eigen vector 2' in FabricLines[Index]:
            m2Vector = np.array([np.float(FabricLines[Index].split()[6]),
                                 np.float(FabricLines[Index].split()[7]),
                                 np.float(FabricLines[Index].split()[8])])

        if 'Eigen vector 3' in FabricLines[Index]:
            m3Vector = np.array([np.float(FabricLines[Index].split()[6]),
                                 np.float(FabricLines[Index].split()[7]),
                                 np.float(FabricLines[Index].split()[8])])

    FabricInfosData = pd.DataFrame()

    FabricInfos = {'BVTV':BVTV,'m1':m1,'m2':m2,'m3':m3,'DA':DA,
                   'm11':m1Vector[0],'m21':m1Vector[1],'m31':m1Vector[2],
                   'm12':m2Vector[0],'m22':m2Vector[1],'m32':m2Vector[2],
                   'm13':m3Vector[0],'m23':m3Vector[1],'m33':m3Vector[2]}

    FabricInfosData = FabricInfosData.append(FabricInfos,ignore_index=True)

    return FabricInfosData
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


Group = 'OI'   # Healthy or OI
WorkingDirectory = os.getcwd()
DataPath = os.path.join(WorkingDirectory,'04_Results/01_ROI_Analysis')
ROIsPath = os.path.join(DataPath,'01_' + Group + '_ROIs')
ResizedROIsPath = os.path.join(ROIsPath,'01_Resized_ROIs/')
FabricPath = os.path.join(DataPath,'02_' + Group + '_FabricElasticity')



# 03 Binarized resized ROI and write file
Resized_ROIs = [File for File in os.listdir(ResizedROIsPath) if File.endswith('.mhd')]

for Resized_ROI in Resized_ROIs:

    CT_Scan, Origin, Spacing, Size = Load_Itk(ResizedROIsPath + Resized_ROI)

    Threshold = 50
    CT_Scan[CT_Scan < Threshold] = 0
    CT_Scan[CT_Scan > Threshold] = 1

    BV = np.sum(CT_Scan)
    TV = Size[0] * Size[1] * Size[2]
    BVTV = BV/TV

    FabricData = GetFabricInfos(os.path.join(FabricPath,Resized_ROI[:-12] + '.fab'))

    if abs(BVTV - FabricData['BVTV'][0]) > 1e-4:
        print('Mismatch for sample: ' + Resized_ROI[:-12])
        print('BV/TV ROI: %f'%BVTV)
        print('BV/TV fabric: %f'%FabricData['BVTV'][0] + '\n\n')

