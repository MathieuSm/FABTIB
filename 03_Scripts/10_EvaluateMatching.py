# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})



# 01 Define functions



# 02 Load Data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')
ResultFolder = os.path.join(WorkingDirectory,'04_Results/00_Matching/Matches')

ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('Scans.csv')]
ScanLists.sort()

HealthyGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[0]))
OIGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[1]))

OIGroup = OIGroup.dropna()     # Filter patients without data
OIGroup = OIGroup.reset_index()
OIGroup['Sex'] = OIGroup['Sex'].replace(['Female','Male'],['F','M'])
OIGroup = OIGroup[['Scan_ID_BSL','Sex','Age']]
OIGroup.columns = ['Sample Number','Sex','Age']
OIGroup['Age'] = OIGroup['Age'].astype('int')

## Binarize categorical values
OIGroup['Sex'] = OIGroup['Sex'].replace(['F','M'],[1,0])
HealthyGroup['Sex'] = HealthyGroup['Sex'].replace(['F','M'],[1,0])


# 03 plot matching algorithm results
Matches = [File for File in os.listdir(ResultFolder) if File.endswith('.txt')]
Matches.sort()

for Match in Matches:

    MatchingResults = pd.read_csv(os.path.join(ResultFolder,Match),header=None)
    Occurrences = MatchingResults[0].value_counts()
    Recurrences = Occurrences[Occurrences>1]

    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Axes.plot(MatchingResults, linestyle='none', marker='o', fillstyle='none', color=(0, 0, 0), label='Matches')
    for Recurrence in Recurrences.index:
        RepeatedPoint = MatchingResults[MatchingResults==Recurrence]
        Axes.plot(RepeatedPoint, linestyle='none', marker='x', fillstyle='none', color=(1, 0, 0))
    Axes.plot([], linestyle='none', marker='x', fillstyle='none', color=(1, 0, 0),label='Repeated')
    Axes.set_xlabel('Test individuals')
    Axes.set_ylabel('Control individuals')
    plt.legend(loc='upper center',ncol=2,bbox_to_anchor=(0.5,1.1))
    plt.savefig(os.path.join(ResultFolder, Match[:-4] + '.png'), dpi=100)
    # plt.show()
    plt.close(Figure)



# 04 Matching assessment
OIList = MatchingResults.index.values
MatchedOI = OIGroup.loc[OIList]

ControlList = MatchingResults[0].values
MatchedControl = HealthyGroup.loc[ControlList]

## Numerical assessment
Covariates = ['Age','Sex']
Covariates = ['Age']

TotalMeanOI = OIGroup[Covariates].mean()
TotalMeanControl = HealthyGroup[Covariates].mean()
TotalStdOI = OIGroup[Covariates].std()

TotalStandardBias = (TotalMeanOI-TotalMeanControl)/TotalStdOI

MatchedMeanOI = MatchedOI[Covariates].mean()
MatchedMeanControl = MatchedControl[Covariates].mean()
MatchedStdOI= MatchedOI[Covariates].std()

MatchedStandardBias = (MatchedMeanOI-MatchedMeanControl)/MatchedStdOI

Colors = [(1,0,0),(0,0,1)]

plt.rc('font', size=12)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
for i in range(len(Covariates)):
    Axes.plot([0,1], [TotalStandardBias[Covariates[i]], MatchedStandardBias[Covariates[i]]],
              color=Colors[i])
    Axes.plot([0], TotalStandardBias[Covariates[i]],
              linestyle='none', marker='o',
              color=Colors[i],label=Covariates[i])
    Axes.plot([1], MatchedStandardBias[Covariates[i]],
              linestyle='none', marker='o',
              color=Colors[i])
plt.xlim([-0.2,1.2])
plt.xticks([0,1],['Initial', 'Matched'])
Axes.set_ylabel('Standardized bias (-)')
plt.legend(loc='upper center', ncol=2, bbox_to_anchor=(0.5, 1.15))
plt.savefig(os.path.join(ResultFolder, '../StandardizedBias.png'), dpi=1000)
plt.show()
plt.close(Figure)


## Empirical cumulative distribution function
OIOrderedData = MatchedOI['Age'].sort_values().values
OIQuantiles = np.arange(1, len(OIOrderedData)+1) / len(OIOrderedData)

ControlOrderedData = MatchedControl['Age'].sort_values().values
ControlQuantiles = np.arange(1, len(ControlOrderedData)+1) / len(ControlOrderedData)

plt.rc('font', size=12)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(OIOrderedData, OIQuantiles, linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0), label='OI group')
Axes.plot(ControlOrderedData, ControlQuantiles, linestyle='none', marker='o', fillstyle='none', color=(0, 0, 1), label='Healthy group')
Axes.set_xlabel('Age (Year)')
Axes.set_ylabel('Quantile (-)')
plt.legend(loc='upper center', ncol=2, bbox_to_anchor=(0.5, 1.15))
plt.savefig(os.path.join(ResultFolder, '../ECDF.png'), dpi=1000)
plt.show()
plt.close(Figure)

## QQ plot
plt.rc('font', size=12)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot([20,70], [20,70], linestyle='--', color=(0, 0, 0), label='Diagonal')
Axes.plot(OIOrderedData, ControlOrderedData, linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0), label='Data quantiles')
Axes.set_xlabel('OI Sample')
Axes.set_ylabel('Control Sample')
plt.legend(loc='upper left')
plt.savefig(os.path.join(ResultFolder, '../QQPlot.png'), dpi=1000)
plt.show()
plt.close(Figure)

## Histograms
for Group in [HealthyGroup, OIGroup, MatchedControl, MatchedOI]:
    plt.rc('font', size=12)
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Group.hist('Age', grid=False, color=(1, 1, 1), edgecolor=(0, 0, 0), ax=Axes).max()
    Axes.plot([Group['Age'].mean(), Group['Age'].mean()], [0, 80],
              linestyle='--', color=(1, 0, 0), label='Mean : ' + str(int(Group['Age'].mean().round())))
    Axes.plot([Group['Age'].median(), Group['Age'].median()], [0, 80],
              linestyle='--', color=(0, 0, 1), label='Median : ' + str(int(Group['Age'].median().round())))
    Axes.set_xlabel('Age')
    Axes.set_ylabel('Number')
    Axes.set_xlim([15, 95])
    Axes.set_ylim([0, 75])
    Axes.annotate('N = ' + str(len(Group)), (80, 55))
    Axes.set_title('')
    plt.legend(loc='upper right')
    plt.show()
    plt.close(Figure)