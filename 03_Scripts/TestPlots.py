# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.formula.api as smf
from scipy.stats.distributions import norm, t, f
from scipy.stats import shapiro


desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)


# 01 Set path and build data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory, '04_Results/02_General_LinearRegression/')
ResultsFolder = os.path.join(WorkingDirectory, '04_Results/XX_ArticlePlots/OI_CV_Gif/')

## Load data
HealthyData = pd.read_csv(DataFolder + '00_Healthy_StiffnessData.csv')
OIData = pd.read_csv(DataFolder + '00_OI_StiffnessData.csv')

## Set group to analyze
Group = 'OI'   # Healthy or OI

if Group == 'Healthy':
    Data = HealthyData
elif Group == 'OI':
    Data = OIData


# 02 Build linear system for regressions
Y_Elements = Data.columns[2:14]

LinearSystem = pd.DataFrame()
for Index in Data.index:
    m1, m2, m3 = Data[['m1','m2','m3']].loc[Index]
    BVTV = Data['BV/TV'].loc[Index]
    CV = Data['Variation Coefficient'].loc[Index]
    X_i = np.array([[1, 0, 0, np.log(BVTV), np.log(m1 ** 2), np.log(CV)],
                    [0, 1, 0, np.log(BVTV), np.log(m1 * m2), np.log(CV)],
                    [0, 1, 0, np.log(BVTV), np.log(m1 * m3), np.log(CV)],
                    [0, 1, 0, np.log(BVTV), np.log(m2 * m1), np.log(CV)],
                    [1, 0, 0, np.log(BVTV), np.log(m2 ** 2), np.log(CV)],
                    [0, 1, 0, np.log(BVTV), np.log(m2 * m3), np.log(CV)],
                    [0, 1, 0, np.log(BVTV), np.log(m3 * m1), np.log(CV)],
                    [0, 1, 0, np.log(BVTV), np.log(m3 * m2), np.log(CV)],
                    [1, 0, 0, np.log(BVTV), np.log(m3 ** 2), np.log(CV)],
                    [0, 0, 1, np.log(BVTV), np.log(m2 * m3), np.log(CV)],
                    [0, 0, 1, np.log(BVTV), np.log(m3 * m1), np.log(CV)],
                    [0, 0, 1, np.log(BVTV), np.log(m1 * m2), np.log(CV)]])

    y_i = np.log(Data[Y_Elements].loc[Index].values)

    y = pd.DataFrame({'LogSxy':y_i})
    X = pd.DataFrame({'Sii':X_i[:,0],
                      'Sij':X_i[:,1],
                      'Sjj':X_i[:,2],
                      'LogBVTV':X_i[:,3],
                      'Logmxy':X_i[:,4],
                      'LogCV':X_i[:,5]})

    Scan = pd.DataFrame({'Scan': np.repeat(Data['Scan'].loc[Index], len(y_i))})
    ROI = pd.DataFrame({'ROI Number': np.repeat(Data['ROI Number'].loc[Index], len(y_i))})

    LinearSystem = LinearSystem.append(pd.concat([y,X,Scan,ROI],axis=1),ignore_index=True)


# 03 Build linear models
System2Fit = LinearSystem.copy()

## Standard linear models
Original_Model = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=System2Fit).fit()
CV_Model = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1", data=System2Fit).fit()

## Mixed-effect linear models
Original_MixedModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"Sii+Sij+Sjj": "Sii+Sij+Sjj-1"}).fit()

CV_MixedModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"Sii+Sij+Sjj": "Sii+Sij+Sjj-1"}).fit()

# 04 Plot the results of the regression
# CV_Ordered = Data.groupby('Scan')['Variation Coefficient'].mean().sort_values()
CV_Ordered = Data.sort_values(by=['Variation Coefficient'])

Model=Original_Model
Data = System2Fit
PlotTypes = ['CV']
Alpha=0.95

## Get data from the model
Y_Obs = np.exp(Model.model.endog)
Y_Fit = np.exp(Model.fittedvalues)
N = int(Model.nobs)
C = np.matrix(Model.cov_params())
X = np.matrix(Model.model.exog)

if not C.shape[0] == X.shape[1]:
    C = C[:-1,:-1]


## Compute R2 and standard error of the estimate
E = Model.resid.values
RSS = np.sum(E ** 2)
SE = np.sqrt(RSS / Model.df_resid)
TSS = np.sum((Model.model.endog - Model.model.endog.mean()) ** 2)
RegSS = TSS - RSS
R2 = RegSS / TSS

Line = np.linspace(min(Y_Obs.min(), Y_Fit.min()),
                   max(Y_Obs.max(), Y_Fit.max()), N)

B_0 = np.sqrt(np.diag(np.abs(X * C * X.T)))
t_Alpha = t.interval(Alpha, N - X.shape[1] - 1)
CI_Line_u = Line + t_Alpha[0] * np.exp(SE) * np.exp(B_0)
CI_Line_o = Line + t_Alpha[1] * np.exp(SE) * np.exp(B_0)

Sii = Y_Fit * np.array(X[:, 0].T)[0]
Sij = Y_Fit * np.array(X[:, 1].T)[0]
Sjj = Y_Fit * np.array(X[:, 2].T)[0]

## Plots
DPI = 100
SMax = max(HealthyData[Y_Elements].max()) * 5
SMin = min(OIData[Y_Elements].min()) / 5

Data2Plot = pd.DataFrame()
i = 0
for Index in CV_Ordered.index:

    CV_ROI = CV_Ordered.loc[Index,['Variation Coefficient']].values[0]
    BVTV_ROI = CV_Ordered.loc[Index, ['BV/TV']].values[0]

    Scan = CV_Ordered.loc[Index,['Scan']].values[0]
    ROI = CV_Ordered.loc[Index,['ROI Number']].values[0]

    Filter1 = Data['Scan']==Scan
    Filter2 = Data['ROI Number']==ROI

    FilteredData = Data[Filter1 & Filter2].copy()
    FilteredData['Indices'] = FilteredData.index.values
    Indices = FilteredData['Indices'].reset_index(drop=True)
    Data2Plot = pd.concat([Data2Plot,Indices],axis=1)

    E_Individual = Model.resid.values[Data2Plot.values[:,i]]
    RSS_Individual = np.sum(E_Individual ** 2)
    SE_Individual = np.sqrt(RSS_Individual / Model.df_resid)

    Color = np.exp(Data['LogCV'].values)[Data2Plot.values[:,i]]
    VMin = HealthyData['Variation Coefficient'].min()
    VMax = HealthyData['Variation Coefficient'].max()

    Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
    if i > 0:
        Axes.plot(Y_Obs[Data2Plot.values[:,:i-1]], np.array(Y_Fit)[Data2Plot.values[:,:i-1]],linestyle='none',marker='o',fillstyle='none',color=(0,0,0),alpha=0.025)
    Scatter = Axes.scatter(Y_Obs[Data2Plot.values[:,i]], np.array(Y_Fit)[Data2Plot.values[:,i]], c=Color, vmin=VMin, vmax=VMax, cmap='jet', marker='o',facecolors='none')
    Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
    Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
    Axes.annotate(r'$R^2$: ' + format(round(R2, 4), '.4f'), xy=(0.7, 0.1), xycoords='axes fraction')
    Axes.annotate(r'$SE$: ' + format(round(SE, 4), '.4f'), xy=(0.7, 0.025), xycoords='axes fraction')
    Axes.annotate('ROI CV: ' + format(round(CV_ROI, 3), '.3f'), xy=(0.05, 0.925), xycoords='axes fraction')
    Axes.annotate('ROI SE: ' + format(round(SE_Individual, 3), '.3f'), xy=(0.05, 0.85), xycoords='axes fraction')
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$ (MPa)')
    Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$ (MPa)')
    Axes.set_xlim([SMin, SMax])
    Axes.set_ylim([SMin, SMax])
    plt.xscale('log')
    plt.yscale('log')
    ColorBar = plt.colorbar(Scatter)
    ColorBar.ax.set_ylabel('Coefficient of Variation (-)')
    plt.subplots_adjust(left=0.15, bottom=0.15)
    plt.savefig(ResultsFolder + 'CV_Increase-' + str(i) + '.png')
    # plt.show()
    plt.close(Figure)

    if i == 0:
        CVs = CV_ROI
        BVTVs = BVTV_ROI
        SEs = SE_Individual

    else:
        CVs = np.append(CVs, CV_ROI)
        BVTVs = np.append(BVTVs, BVTV_ROI)
        SEs = np.append(SEs,SE_Individual)

    i += 1

Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
Axes.plot(SEs, CVs, color=(0, 0, 0), linestyle='none',marker='o',fillstyle='none')
Axes.set_xlabel('Standard error of the estimate (-)')
Axes.set_ylabel('Coefficient of variation (-)')
Axes.set_xlim([0, 0.3])
Axes.set_ylim([0, 1])
plt.savefig(ResultsFolder + 'SE_CV.png')
plt.show()
plt.close(Figure)

Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
Axes.plot(SEs, BVTVs, color=(0, 0, 0), linestyle='none',marker='o',fillstyle='none')
Axes.set_xlabel('Standard error of the estimate (-)')
Axes.set_ylabel('BV/TV (-)')
Axes.set_xlim([0, 0.3])
Axes.set_ylim([0, 0.8])
plt.savefig(ResultsFolder + 'SE_BVTV.png')
plt.show()
plt.close(Figure)