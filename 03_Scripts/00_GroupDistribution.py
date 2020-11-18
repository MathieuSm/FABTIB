# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

# 01 Define functions

# 02 Load Paths
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')

ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('Scans.csv')]
ScanLists.sort()

for DataGroup in ScanLists:
    ScanList = pd.read_csv(os.path.join(DataFolder,DataGroup))

    Sex = ScanList['Sex'].unique()

    for Gender in Sex:

        print(DataGroup[3:-18] + ' ' + Gender)

        SubList = ScanList[ScanList['Sex']==Gender]

        plt.rc('font', size=12)
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
        SubList.hist('Age',grid=False,color=(1,1,1),edgecolor=(0,0,0),ax=Axes,label=DataGroup[3:-18])
        Axes.set_xlabel('Age')
        Axes.set_ylabel('Number')
        Axes.set_xlim([15, 95])
        Axes.set_ylim([0, 40])
        Axes.annotate('N = ' + str(len(SubList)),(80,30))
        Axes.set_title('')
        plt.show()
        plt.close(Figure)