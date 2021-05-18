# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)

# 01 Set variables
WorkingDirectory = os.getcwd()
DataPath = os.path.join(WorkingDirectory,'02_Data/')

## Load files
Data = pd.read_csv(DataPath + '01_HealthyTibiaXCT2Scans.csv')
FullData = pd.read_excel(DataPath + 'Repro_UPAT_TOTAL_Denis_Cleaned_004_incl_nm_003.xlsx')
MapTable = pd.read_csv(DataPath + 'MapTable.csv')

# Find grading
Gradings = pd.DataFrame()
for i in Data.index:
    Measurement = Data.loc[i,'Sample Number']
    Folder = MapTable[MapTable['Measurement Number']==Measurement]['Measurement Folder'].values[0]
    for j in range(1,4):
        MeasN = 'MeasNo' + str(j)
        GradN = 'Grading' + str(j)
        Grading = FullData[FullData[MeasN] == Folder][GradN]
        if len(Grading) > 0:
            Gradings = Gradings.append({'Grading': int(Grading),'Sample Number':Measurement, 'Folder':Folder},ignore_index=True)

# Add second table data
FullData = pd.read_excel(DataPath + 'Norm_UPAT_TOTAL_hFE_corrected_Denis.xlsm')

# Find grading
for i in Data.index:
    Measurement = Data.loc[i,'Sample Number']
    Folder = MapTable[MapTable['Measurement Number']==Measurement]['Measurement Folder'].values[0]
    MeasN = 'MeasNo1'
    GradN = 'Quality1'
    Grading = FullData[FullData[MeasN] == Folder][GradN]
    if len(Grading) > 0:
        print(i)
        Gradings = Gradings.append({'Grading': int(Grading+1),'Sample Number':Measurement, 'Folder':Folder},ignore_index=True)


for i in Gradings.index:
    Measurement = Gradings['Sample Number'].loc[i]
    Folder = Gradings['Folder'].loc[i]
    Filter1 = Gradings['Sample Number'] == Measurement
    Filter2 = Gradings['Folder'] == Folder
    F_Grading = Gradings[Filter1&Filter2]
    if len(F_Grading)>1:
        print(F_Grading)

Gradings = Gradings.drop([39,40,41,42,43])



OIData = pd.read_csv(DataPath + '02_OITibiaXCT2Scans.csv')


Figure, Axes = plt.subplots(1,1,figsize=(5.5,3.5),dpi=500)
Axes.hist(Gradings['Grading'],bins=np.arange(4)+0.5-0.15,
          rwidth=0.25,edgecolor=(0,0,1),color=(1,1,1),density=True,label='Healthy scans')
Axes.hist(OIData['Motion artifacts (1-5)'],bins=np.arange(4)+0.5+0.15,
          rwidth=0.25,edgecolor=(1,0,0),color=(1,1,1),density=True,label='OI scans')
plt.xlabel('Motion artefact grading (-)')
plt.ylabel('Scans density (-)')
plt.annotate('N patients = 120',xy=(0.6,0.6),xycoords='figure fraction',color=(0,0,1))
plt.annotate('N patients =   50',xy=(0.6,0.525),xycoords='figure fraction',color=(1,0,0))
plt.xlim([0.5,5.5])
plt.legend(loc='upper right')
plt.subplots_adjust(bottom=0.2)
plt.show()
plt.close(Figure)