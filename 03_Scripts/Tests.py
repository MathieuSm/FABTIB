####################################
# FOR MISSING DATA
####################################

import os
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use('WebAgg')
import matplotlib.pyplot as plt



## 00 Initialization
desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

## Set variables
WorkingDirectory = os.getcwd()
ScanFolder = os.path.join(WorkingDirectory,'02_Data')
DataSubFolders = [File for File in os.listdir(ScanFolder) if os.path.isdir(os.path.join(ScanFolder,File))]
DataSubFolders.sort()

DataGroup = 1   # 0 = Healthy group, 1 = OI group

DataFolder = os.path.join(WorkingDirectory,'04_Results',DataSubFolders[DataGroup],'00_ROI')

Files = os.listdir(DataFolder)
for File in Files:
    Name = File[0] + '_' + File[:-9] + '_Cleaned' + File[-4:]
    os.rename(File,Name)



Files = pd.DataFrame()
for i in FabricFiles:
    Files = Files.append({'Scan':i[:-4]},ignore_index=True)


MissingData = pd.DataFrame()
for i in ConstantsFiles:
    if i[:-4] not in Files.values:
        MissingData = MissingData.append({'$ROINumber':i[0],'$Scan':i[2:-4]},ignore_index=True)


MOrdered = MissingData.sort_values(by=['$Scan','$ROINumber'])
MOrdered = MOrdered.reset_index()
del MOrdered['index']

MOrdered2 = MedtoolParametersData.sort_values(by=['$Scan','$ROINumber'])
MOrdered2 = MOrdered2.reset_index()
del MOrdered2['index']


Test = pd.DataFrame()
for i in MOrdered.index:

    ROINumber = MOrdered.loc[i]['$ROINumber']
    Scan = MOrdered.loc[i]['$Scan']

    Filter1 = MOrdered2['$ROINumber'] == int(ROINumber)
    Filter2 = MOrdered2['$Scan'] == Scan

    XPos = MOrdered2[Filter1 & Filter2]['$XPos'].values[0]
    XRange = MOrdered2[Filter1 & Filter2]['$XRange'].values[0]
    YPos = MOrdered2[Filter1 & Filter2]['$YPos'].values[0]
    YRange = MOrdered2[Filter1 & Filter2]['$YRange'].values[0]
    ZPos = MOrdered2[Filter1 & Filter2]['$ZPos'].values[0]
    ZRange = MOrdered2[Filter1 & Filter2]['$ZRange'].values[0]

    Data = {'$ROINumber':ROINumber,
            '$Scan':Scan,
            '$XPos':XPos,
            '$XRange':XRange,
            '$YPos':YPos,
            '$YRange':YRange,
            '$ZPos':ZPos,
            '$ZRange':ZRange}

    Test = Test.append(Data,ignore_index=True)

ColsToInt = ['$XPos', '$YPos', '$ZPos', '$XRange', '$YRange', '$ZRange', '$ROINumber']
Test[ColsToInt] = Test[ColsToInt].astype(int)


####################################
# FOR OI ROI ANALYSIS
####################################


import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
import matplotlib.pyplot as plt

# 00 Initialization
desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

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
    ImageArray, Origin, Spacing, Size = Load_Itk(ROIFilePath)

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


## Set variables
WorkingDirectory = os.getcwd()
ScanFolder = os.path.join(WorkingDirectory,'02_Data')
DataSubFolders = [File for File in os.listdir(ScanFolder) if os.path.isdir(os.path.join(ScanFolder,File))]
DataSubFolders.sort()

DataGroup = 1   # 0 = Healthy group, 1 = OI group

DataFolder = os.path.join(WorkingDirectory,'04_Results',DataSubFolders[DataGroup],'02_TransformedTensors')
ROIFolder = os.path.join(WorkingDirectory,'04_Results',DataSubFolders[DataGroup],'00_ROI')
ROIFolder = '/home/mathieu/Documents/MscThesis/02_Data/FabricElasticityRelationship/2_TestGroupOI/B_Edit/03_CleanROI/'
FitFolder = os.path.join(WorkingDirectory,'04_Results',DataSubFolders[DataGroup],'03_LinearRegression')

Samples = [File for File in os.listdir(ROIFolder) if File.endswith('.mhd')]
Samples.sort()



# 01 Compute ROI coefficient of variation
Data = pd.DataFrame()

for Sample in Samples:

    SampleData = pd.DataFrame()
    DataDict = {'ROI Number':Sample[0],'Scan':Sample[1:-9]}
    SampleData = SampleData.append(DataDict,ignore_index=True)

    VariationCoefficientData = pd.DataFrame()
    for ROI in SampleData['ROI Number']:
        VariationCoefficient = ROIAnalysis(os.path.join(ROIFolder,Sample))
        VariationCoefficientData = VariationCoefficientData.append({'CV':VariationCoefficient},
                                                                   ignore_index=True)
    SampleData['Variation Coefficient'] = VariationCoefficientData['CV']

    Data = Data.append(SampleData,ignore_index=True)

Data2 = pd.DataFrame()
for Sample in Samples:
    SampleData = pd.read_csv(os.path.join(DataFolder,Sample[1:-9]+'.csv'))
    SampleData = SampleData.sort_values(by='ROI Number',ignore_index=True)
    Data2 = Data2.append(SampleData,ignore_index=True)
Data2 = Data2.drop_duplicates()

Data2 = Data2.sort_values(by=['Scan','ROI Number'],ignore_index=True)
Data = Data.sort_values(by=['Scan','ROI Number'],ignore_index=True)

Data2['Variation Coefficient'] = Data['Variation Coefficient']
Data2.to_csv(os.path.join(FitFolder,'00_Data.csv'),index=False)

Data = Data2

# 02 Define filter parameter
Threshold = (Data.quantile(0.75)['Variation Coefficient']
             - Data.quantile(0.25)['Variation Coefficient']) * 1.5 \
             + Data.quantile(0.75)['Variation Coefficient']
MinBVTV = Data['BVTV'].min()
MaxBVTV = Data['BVTV'].max()

## Compare to actual filter parameter
Filter = pd.read_csv(os.path.join(FitFolder,'01_Filter.csv'))

if MinBVTV < Filter['Min BVTV'].values[0]:
    MinBVTV = Filter['Min BVTV'].values[0]
if MaxBVTV > Filter['Max BVTV'].values[0]:
    MaxBVTV = Filter['Max BVTV'].values[0]

if DataGroup == 1:
    Threshold = Filter['Threshold'].values[0]

FilterData = pd.DataFrame({'Threshold':Threshold,'Min BVTV':MinBVTV,'Max BVTV':MaxBVTV},index=[0])

## Save filter parameters for both group
for Group in range(2):
    FilterFolder = os.path.join(WorkingDirectory,'04_Results',DataSubFolders[Group],'03_LinearRegression')
    FilterData.to_csv(os.path.join(FilterFolder,'01_Filter.csv'),index=False)


####################################
# FOR ROI ANALYSIS CORRECTION
####################################


Data2 = pd.read_csv(os.path.join(DataFolder,'00_Data.csv'))
Data = pd.read_csv('/home/mathieu/Documents/MscThesis/02_Data/FabricElasticityRelationship/2_TestGroupOI/D_PostProcess/3_HomogenizationAnalyzed.csv',sep=';')

Test = pd.DataFrame()
for i in Data.index:
    ROI = Data['ROINumber'].loc[i]
    Scan = Data['Sample'].loc[i]

    Filter1 = Data2['ROI Number'] == ROI
    Filter2 = Data2['Scan'] == Scan

    ScanData = Data2[Filter1&Filter2]
    ScanData['Variation Coefficient'] = Data['CV'].loc[i]

    Test = Test.append(ScanData,ignore_index=True)

Test2 = pd.DataFrame()
Test2[['ROI Number','Scan']] = Data2[['ROI Number','Scan']]
for i in Data.index:
    Thing = {'ROI Number':Data['ROINumber'].loc[i],'Scan':Data['Sample'].loc[i]}
    Test2 = Test2.append(Thing,ignore_index=True)

Test3 = pd.DataFrame()
for i in Test2.index:

    Filter1 = Test2['ROI Number'] == Test2['ROI Number'].loc[i]
    Filter2 = Test2['Scan'] == Test2['Scan'].loc[i]

    if len(Test2[Filter1&Filter2])<2:
        Test3 = Test3.append(Test2.loc[i],ignore_index=True)

for i in Test3.index:
    ROINumber = int(Test3['ROI Number'].loc[i])
    Scan = Test3['Scan'].loc[i]

    Filter1 = Data2['ROI Number'] == ROINumber
    Filter2 = Data2['Scan'] == Scan

    ScanData = Data2[Filter1&Filter2]
    Test = Test.append(ScanData,ignore_index=True)





plt.rc('font', size=12)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(Data2['BVTV'],Data2['Variation Coefficient'],linestyle='none',marker='o',color=(0,0,0),fillstyle='none',label='Data')
Axes.plot(Test['BVTV'],Test['Variation Coefficient'],linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='Data')
Axes.plot(Data['BVTV'],Data['CV'],linestyle='none',marker='o',color=(1,0,0),fillstyle='none',label='Data')
plt.show()


