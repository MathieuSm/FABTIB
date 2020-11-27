# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

# 02 Load Data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')

ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('Scans.csv')]
ScanLists.sort()

HealthyGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[0]))
OIGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[1]))

OIGroup = OIGroup.dropna()      # Filter patients without data

# 03 Show original group distribution
for DataGroup in ScanLists:
    ScanList = pd.read_csv(os.path.join(DataFolder,DataGroup))

    plt.rc('font', size=12)
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
    ScanList.hist('Age',grid=False,color=(1,1,1),edgecolor=(0,0,0),ax=Axes).max()
    Axes.plot([ScanList['Age'].mean(),ScanList['Age'].mean()],[0,80],
              linestyle='--',color=(1,0,0),label='Mean : ' + str(int(ScanList['Age'].mean().round())))
    Axes.plot([ScanList['Age'].median(),ScanList['Age'].median()],[0,80],
              linestyle='--',color=(0,0,1),label='Median : ' + str(int(ScanList['Age'].median().round())))
    Axes.set_xlabel('Age')
    Axes.set_ylabel('Number')
    Axes.set_xlim([15, 95])
    Axes.set_ylim([0, 75])
    Axes.annotate('N = ' + str(len(ScanList)),(80,30))
    Axes.set_title('')
    plt.legend(loc='upper right')
    plt.show()
    plt.close(Figure)


# 04 Filter healthy group for comparative extrema
Filter1 = HealthyGroup['Age'] >= OIGroup['Age'].min()/1.075
Filter2 = HealthyGroup['Age'] <= OIGroup['Age'].max()*1.075

HealthyGroup = HealthyGroup[Filter1&Filter2]

# 05 Build subgroups around the median of OI group
for Group in [HealthyGroup, OIGroup]:
    Group1 = Group[Group['Age']<=OIGroup['Age'].median()]
    Group2 = Group[Group['Age']>=OIGroup['Age'].median()]

    if Group.size == HealthyGroup.size:
     PatientsByGroup = int(min(len(Group1),len(Group2),len(OIGroup)/2))

    SubGroup1 = Group1.sample(PatientsByGroup)
    SubGroup2 = Group2.sample(PatientsByGroup)

    plt.rc('font', size=12)
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)

    if Group.size == HealthyGroup.size:

        SubHealthy = SubGroup1.append(SubGroup2)

        SubHealthy.hist('Age', grid=False, color=(1, 1, 1), edgecolor=(0, 0, 0), ax=Axes)
        Axes.plot([SubHealthy['Age'].mean(), SubHealthy['Age'].mean()], [0, 40],
                  linestyle='--', color=(1, 0, 0), label='Mean : ' + str(int(SubHealthy['Age'].mean().round())))
        Axes.plot([SubHealthy['Age'].median(), SubHealthy['Age'].median()], [0, 40],
                  linestyle='--', color=(0, 0, 1), label='Median : ' + str(int(SubHealthy['Age'].median().round())))
        Axes.annotate('N = ' + str(len(SubHealthy)), (80, 7))


    elif Group.size == OIGroup.size:

        SubOI = SubGroup1.append(SubGroup2)

        SubOI.hist('Age', grid=False, color=(1, 1, 1), edgecolor=(0, 0, 0), ax=Axes)
        Axes.plot([SubOI['Age'].mean(), SubOI['Age'].mean()], [0, 40],
                  linestyle='--', color=(1, 0, 0), label='Mean : ' + str(int(SubOI['Age'].mean().round())))
        Axes.plot([SubOI['Age'].median(), SubOI['Age'].median()], [0, 40],
                  linestyle='--', color=(0, 0, 1), label='Median : ' + str(int(SubOI['Age'].median().round())))
        Axes.annotate('N = ' + str(len(SubOI)), (80, 7))


    Axes.set_xlabel('Age')
    Axes.set_ylabel('Number')
    Axes.set_xlim([15, 95])
    Axes.set_ylim([0, 10])
    Axes.set_title('')
    plt.legend(loc='upper right')
    plt.show()
    plt.close(Figure)

HealthyGroup.to_csv(os.path.join(DataFolder,'01_HealthySubgroup.csv'),index=False)
OIGroup.to_csv(os.path.join(DataFolder,'02_OISubgroup.csv'),index=False)