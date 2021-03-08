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
def ROIAnalysis(ROIFilePath):

    # Load ROI
    ImageArray, Origin, Spacing, Size = Load_Itk(ROIFilePath+'_Cleaned.mhd')

    # Compute BV/TV for each subcube
    RhoSub = np.zeros((2, 2, 2))
    Indices = [0, np.int(Size[0] / 2), Size[0]]

    for i in range(2):
        for j in range(2):
            for k in range(2):
                ii = [Indices[i], Indices[i + 1]]
                jj = [Indices[j], Indices[j + 1]]
                kk = [Indices[k], Indices[k + 1]]

                SubCube = ImageArray[ii[0]:ii[1], jj[0]:jj[1], kk[0]:kk[1]]

                BV = np.sum(SubCube)
                TV = SubCube.shape[0] * SubCube.shape[1] * SubCube.shape[2]
                RhoSub[i, j, k] = BV / TV

    return np.std(RhoSub) / np.mean(RhoSub)
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


# 01 Set variables
Group = 'OI'   # Healthy or OI
WorkingDirectory = os.getcwd()
DataPath = os.path.join(WorkingDirectory,'04_Results/01_ROI_Analysis')
MorphoPath =  os.path.join(DataPath,'04_' + Group + '_Morphometry/')
ROIsPath = os.path.join(DataPath,'01_' + Group + '_ROIs/00_Cleaned_ROIs/')
FabricPath = os.path.join(DataPath,'02_' + Group + '_FabricElasticity/')
ResultsPath = os.path.join(WorkingDirectory,'04_Results/03_Morphometry_Statistics/')


# 02 Collect data
Files = os.listdir(MorphoPath)
MorphoData = pd.DataFrame()
for File in Files:

    MorphoFile = pd.read_csv(MorphoPath + File,sep=';')

    BVTV = MorphoFile['$BVTV_voxel'].values[0]
    SMI = MorphoFile['$SMI_voxel'].values[0]
    Tb_N_Mean = MorphoFile['$Tb_N_mean'].values[0]
    Tb_Sp_Mean = MorphoFile['$Tb_Sp_mean'].values[0]
    Tb_Sp_Max = MorphoFile['$Tb_Sp_max'].values[0]
    Tb_Sp_Min = MorphoFile['$Tb_Sp_min'].values[0]
    Tb_Sp_Std = MorphoFile['$Tb_Sp_stddev'].values[0]
    Tb_Th_Mean = MorphoFile['$Tb_Th_mean'].values[0]
    Tb_Th_Max = MorphoFile['$Tb_Th_max'].values[0]
    Tb_Th_Min = MorphoFile['$Tb_Th_min'].values[0]
    Tb_Th_Std = MorphoFile['$Tb_Th_stddev'].values[0]

    CV = ROIAnalysis(ROIsPath + File[:-4])

    FabricData = GetFabricInfos(FabricPath + File[:-4] + '.fab')

    Parameters = {'ROI Number':File[0],
                  'Scan':File[2:-4],
                  'BV/TV':BVTV,
                  'SMI':SMI,
                  'Mean Tb N': Tb_N_Mean,
                  'Mean Tb Th':Tb_Th_Mean,
                  'Std Tb Th':Tb_Th_Std,
                  'Min Tb Th':Tb_Th_Min,
                  'Max Tb Th':Tb_Th_Max,
                  'Mean Tb Sp':Tb_Sp_Mean,
                  'Std Tb Sp':Tb_Sp_Std,
                  'Min Tb Sp':Tb_Sp_Min,
                  'Max Tb Sp':Tb_Sp_Max,
                  'Coefficient of Variation':CV,
                  'Degree of Anisotropy':FabricData['DA'].values[0]}

    MorphoData = MorphoData.append(Parameters,ignore_index=True)


# 03 Sort and save to csv
MorphoData = MorphoData.sort_values(by=['Scan','ROI Number'],ignore_index=True)
SortedColumns = ['ROI Number','Scan','BV/TV', 'SMI', 'Mean Tb N',
                 'Mean Tb Sp', 'Std Tb Sp', 'Min Tb Sp', 'Max Tb Sp',
                 'Mean Tb Th', 'Std Tb Th', 'Min Tb Th', 'Max Tb Th',
                 'Coefficient of Variation','Degree of Anisotropy']
MorphoData = MorphoData.reindex(SortedColumns, axis=1)
MorphoData.to_csv(ResultsPath + '00_' + Group + '_Data.csv',index=False)
