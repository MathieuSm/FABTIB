# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm

desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)


# 01 Set path and load data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory, '02_Data/')
ResultFolder = os.path.join(WorkingDirectory, '04_Results/03_Morphometry_Statistics/')

ControlMedtool = pd.read_csv(ResultFolder + '00_Healthy_Data.csv')
OIMedtool = pd.read_csv(ResultFolder + '00_OI_Data.csv')
ControlScanco = pd.read_csv(DataFolder + '01_HealthyTibiaXCT2Scans.csv')
OIScanco = pd.read_csv(DataFolder + '02_OITibiaXCT2Scans.csv')


# 02 Modify data frames and get medtool median values for each scan
ControlScanco = ControlScanco.loc[:3,['Tb. BVTV','Tb. Thickness','Tb. N.','Tb. Sp.']]

## build Scan ID columns for medtool results
ControlMedtool['Scan_ID'] = ControlMedtool['Scan']
OIMedtool['Patient_ID'] = OIMedtool['Scan']

for Index in ControlMedtool.index:
    ControlMedtool.loc[Index,'Scan_ID'] = ControlMedtool.loc[Index,'Scan_ID'][4:8]
for Index in OIMedtool.index:
    OIMedtool.loc[Index,'Patient_ID'] = OIMedtool.loc[Index,'Patient_ID'][:6]

## Take median ROI values
ControlMedtool = ControlMedtool[['Scan_ID','BV/TV','Mean Tb Th', 'Mean Tb Sp','Mean Tb N', 'Std Tb Sp']]
OIMedtool = OIMedtool[['Patient_ID','BV/TV','Mean Tb Th', 'Mean Tb Sp','Mean Tb N', 'Std Tb Sp']]
ControlMedtool = ControlMedtool.groupby('Scan_ID').median()
OIMedtool = OIMedtool.groupby('Patient_ID').median()

## Filter for matched patients
for Index in OIScanco.index:
    Scan_ID = OIScanco.loc[Index,'Patient_ID']
    if str(Scan_ID) not in OIMedtool.index:
        OIScanco = OIScanco.drop(Index)


# 03 Build relative differences
OIMedtool.columns = ['BV/TV', 'Tb. Th.', 'Tb. Sp.', 'Tb. N.', 'Tb.1/N.SD']
Rel_Dif = pd.DataFrame(index=OIMedtool.index, columns=OIMedtool.columns)
for Variable in Rel_Dif.columns:
    for Index in OIMedtool.index:
        ScancoValue = OIScanco[OIScanco['Patient_ID'] == int(Index)][Variable].values[0]
        Rel_Dif.loc[Index,Variable] = (OIMedtool.loc[Index,Variable] - ScancoValue) / ScancoValue


    ## plot to check
    Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=100)
    Axes.hist(Rel_Dif[Variable], density=False, bins=10, edgecolor=(0, 0, 0), color=(1, 1, 1))
    Axes.annotate('N: ' + str(len(Rel_Dif)), xy=(0.05, 0.9), xycoords='axes fraction')
    plt.xlabel('Relative differences (-)')
    plt.ylabel('n (-)')
    plt.title(Variable)
    plt.show()
    plt.close(Figure)

    # 04 Perform linear regression
    X = OIMedtool[Variable].values
    y = OIScanco.sort_values(by='Patient_ID')[Variable]
    X = sm.add_constant(X)

    model = sm.OLS(y, X, missing='drop').fit()

    B = model.params
    Line = X * np.matrix(B).T

    Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=100)
    Axes.plot(X[:, 1], Line, color=(1, 0, 0))
    Axes.plot(X[:, 1], y, linestyle='none', marker='o', fillstyle='none', color=(0, 0, 0))
    Axes.annotate(r'Slope: ' + str(round(B[1], 3)), xy=(0.05, 0.9), xycoords='axes fraction')
    Axes.annotate(r'$R^2$: ' + str(round(model.rsquared, 3)), xy=(0.05, 0.825), xycoords='axes fraction')
    plt.xlabel('ROI median value (medtool)')
    plt.ylabel('Full stack mean value (Scanco)')
    plt.title(Variable)
    plt.show()
    plt.close(Figure)


Variable = ['BV/TV', 'Tb. Th.', 'Tb. Sp.', 'Tb. N.', 'Tb.1/N.SD'][4]
print(round(Rel_Dif[Variable].mean(),2))
print(round(Rel_Dif[Variable].min(),2))
print(round(Rel_Dif[Variable].max(),2))


X = OIMedtool[Variable].values
y = OIScanco.sort_values(by='Patient_ID')[Variable]
X = sm.add_constant(X)

model = sm.OLS(y, X, missing='drop').fit()


print(model.params)

