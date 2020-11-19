import os
import numpy as np
import pandas as pd

WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')

DataSubFolders = [File for File in os.listdir(DataFolder) if os.path.isdir(os.path.join(DataFolder,File))]
DataSubFolders.sort()

DataGroup = 0   # 0 = Healthy group, 1 = OI group

PipelineFile  = open(os.path.join(WorkingDirectory, '03_Scripts', '02_ROIAnalysisPipeline.txt'), 'r')
PipelineText  = PipelineFile.read()

# List samples
MedtoolParametersFile = os.path.join(DataFolder, DataSubFolders[DataGroup][:-14] + 'ROI.csv')
MedtoolParametersData = pd.read_csv(MedtoolParametersFile, sep=';')
del MedtoolParametersData['Unnamed: 8']

# Create the .bash script
BatchFile = open(os.path.join(WorkingDirectory, '03_Scripts', '02_ROIAnalysisBatch.bash'),'w')

# Set variables for files to remove
LocalPath = 'C_FEA/03_JobResults/'
FilesDict = {'*.com','*.dat','*.msg','*.par','*.pes','*.pmg','*.prt','*.sim','*.sta','*.odb'}

# Write the analysis batch
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
