# 00 Initialization
import os
import numpy as np
import pandas as pd

desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})


# 01 Define paths
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')
MatchingFolder = os.path.join(WorkingDirectory,'04_Results')
ResultsFolder = os.path.join(WorkingDirectory,'04_Results/02_ROI_Analysis')


# 02 Load data
DataGroup = 1   # 0 = Healthy group, 1 = OI group

DataSubFolders = [File for File in os.listdir(DataFolder) if os.path.isdir(os.path.join(DataFolder,File))]
DataSubFolders.sort()
MedtoolParametersFile = os.path.join(MatchingFolder, '00_ROI_Selection' , DataSubFolders[DataGroup][:-14] + 'ROI.csv')
MedtoolParametersFile = os.path.join(MatchingFolder, '00_ROI_Selection' , '02_OIROI.csv')
MedtoolParametersData = pd.read_csv(MedtoolParametersFile, sep=';')
del MedtoolParametersData['Unnamed: 8']


PipelineFile  = open(os.path.join(WorkingDirectory, '03_Scripts', '03_ROIAnalysisPipeline.txt'), 'r')
PipelineText  = PipelineFile.read()

if DataGroup == 0:
    MatchingResults = pd.read_csv(os.path.join(MatchingFolder,'01_Matching','Matched_Control.csv'))
elif DataGroup == 1:
    MatchingResults = pd.read_csv(os.path.join(MatchingFolder,'01_Matching','Matched_OI.csv'))


# 03 Filter matched individuals
for Index in MedtoolParametersData.index:

    Scan = MedtoolParametersData['$Scan'].loc[Index]

    if DataGroup == 0:
        ScanNumber = int(Scan[4:8])

        if ScanNumber not in MatchingResults['Sample Number'].values:
            MedtoolParametersData = MedtoolParametersData.drop(index=Index)

    elif DataGroup == 1:
        Patient_ID = Scan[:6]
        ScanNumber = Scan[7:15]

        Condition1 = Patient_ID not in MatchingResults['Patient_ID'].values.astype('str')
        Condition2 = ScanNumber not in MatchingResults['Scan_ID_BSL'].values

        if Condition1 or Condition2:
            MedtoolParametersData = MedtoolParametersData.drop(index=Index)


# 04 Create the .bash script
if DataGroup == 0:
    BatchFile = open(os.path.join(ResultsFolder, '01_ControlBatch.bash'),'w')
elif DataGroup == 1:
    BatchFile = open(os.path.join(ResultsFolder, '01_OIBatch.bash'),'w')


# 05 Set variables for files to remove
LocalPath = 'C_FEA/03_JobResults/'
FilesDict = {'*.com','*.dat','*.msg','*.par','*.pes','*.pmg','*.prt','*.sim','*.sta','*.odb'}

# 06 Write the analysis batch
for Index in MedtoolParametersData.index:

    ROIText = PipelineText

    for Parameter in MedtoolParametersData.columns:
        ROIParameter = MedtoolParametersData[Parameter].loc[Index]
        ROIText = ROIText.replace(Parameter[1:],str(ROIParameter))

    BatchFile.write(ROIText+'\n\n')

    for FileType in FilesDict:
        BatchFile.write('rm ' + LocalPath + str(FileType) + '\n')

    BatchFile.write('\n\n\n\n\n')

BatchFile.close()

# 07 Write copy script
if DataGroup == 0:
    CopyFile = open(os.path.join(ResultsFolder, '00_ControlCopy.sh'),'w')
elif DataGroup == 1:
    CopyFile = open(os.path.join(ResultsFolder, '00_OICopy.sh'),'w')


CopyCommand = 'sshpass -p "password" scp ' # Change password with your password
LocalPath = os.path.join(DataFolder,DataSubFolders[DataGroup])
RemoteUser = 'user'
RemoteServer = 'xxx.xx.xxx.xx'
RemoteFilePath = '/home/ms20s284/PostMscMedtool/B_Edit/01_MHDFile/'
RemotePath = ' ' + RemoteUser + '@' + RemoteServer + ':' + RemoteFilePath

for Scan in MedtoolParametersData['$Scan'].unique():

    for FileType in ['.mhd','.raw']:
        FilePath = os.path.join(LocalPath, Scan + FileType)
        CopyFile.write(CopyCommand + FilePath + RemotePath + '\n')
    CopyFile.write('\n')

CopyFile.close()
