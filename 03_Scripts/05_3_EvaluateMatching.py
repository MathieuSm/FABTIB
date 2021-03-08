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


# 01 Set paths
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'04_Results/05_Variables_Matching/')
ResultsFolder = os.path.join(DataFolder,'Matching_Assessment')


# 02 Load Data
HealthyData = pd.read_csv(DataFolder + '00_Healthy_Data.csv')
OIData = pd.read_csv(DataFolder + '00_OI_Data.csv')
Matched_OI = pd.read_csv(os.path.join(DataFolder,'01_Matched_OI.csv'))
Matched_Healthy = pd.read_csv(os.path.join(DataFolder,'01_Matched_Healthy.csv'))



# 03 Matching assessment - Numerical
Covariates = ['BV/TV', 'Degree of Anisotropy']

TotalMeanOI = OIData[Covariates].mean()
TotalMeanControl = HealthyData[Covariates].mean()
TotalStdOI = OIData[Covariates].std()

TotalStandardBias = (TotalMeanOI-TotalMeanControl)/TotalStdOI

MatchedMeanOI = Matched_OI[Covariates].mean()
MatchedMeanControl = Matched_Healthy[Covariates].mean()
MatchedStdOI= Matched_OI[Covariates].std()

MatchedStandardBias = (MatchedMeanOI-MatchedMeanControl)/MatchedStdOI

Colors = [(1,0,0),(0,0,1)]
Labels = ['BV/TV','DA']

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
for i in range(len(Covariates)):
    Axes.plot([0,1], [TotalStandardBias[Covariates[i]], MatchedStandardBias[Covariates[i]]],
              color=Colors[i])
    Axes.plot([0], TotalStandardBias[Covariates[i]],
              linestyle='none', marker='o',
              color=Colors[i],label=Labels[i])
    Axes.plot([1], MatchedStandardBias[Covariates[i]],
              linestyle='none', marker='o',
              color=Colors[i])
plt.xlim([-0.2,1.2])
plt.xticks([0,1],['Initial', 'Matched'])
Axes.set_ylabel('Standardized bias (-)')
plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15))
plt.subplots_adjust(left=0.2)
plt.savefig(os.path.join(ResultsFolder, 'StandardizedBias.png'), dpi=1000)
plt.show()
plt.close(Figure)


## QQ plot

PlotNames = ['BVTV','DA']
for Covariate in Covariates:

    OIOrderedData = Matched_OI[Covariate].sort_values().values
    HealthyOrderedData = Matched_Healthy[Covariate].sort_values().values

    Min_V = min(OIOrderedData.min(),HealthyOrderedData.min())
    Max_V = max(OIOrderedData.max(),HealthyOrderedData.max())

    PlotName = PlotNames[Covariates.index(Covariate)]

    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Axes.plot([Min_V,Max_V], [Min_V,Max_V], linestyle='--', color=(0, 0, 0), label='Diagonal')
    Axes.plot(OIOrderedData, HealthyOrderedData, linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0), label='Data quantiles')
    Axes.set_xlabel('OI Sample')
    Axes.set_ylabel('Healthy Sample')
    plt.legend(loc='upper left')
    plt.savefig(os.path.join(ResultsFolder, 'QQPlot_' + PlotName + '.png'), dpi=1000)
    plt.show()
    plt.close(Figure)
