# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.formula.api as smf
from scipy.stats.distributions import norm, t, f, chi2
from scipy.stats import shapiro


desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)


## Define functions
def PlotRegressionResults(Model, Data, Random=True):

    ## Get data from the model
    Y_Obs = np.exp(Model.model.endog)
    Y_Fit = np.exp(Model.fittedvalues)
    if not Random:
        Y_Fit = np.exp(Model.predict())
    N = int(Model.nobs)
    C = np.matrix(Model.cov_params())
    X = np.matrix(Model.model.exog)
    NROIs = int(N/12)

    if not C.shape[0] == X.shape[1]:
        C = C[:-1,:-1]


    ## Compute R2 and standard error of the estimate
    E = np.log(Y_Obs) - np.log(Y_Fit)
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / Model.df_resid)
    TSS = np.sum((Model.model.endog - Model.model.endog.mean()) ** 2)
    RegSS = TSS - RSS
    R2 = RegSS / TSS

    ## Compute R2 adj and NE
    R2adj = 1 - RSS/TSS * (12*N-1)/(12*N-X.shape[1]-1)

    NE = np.array([])
    for i in range(0,N,12):
        ObservedTensor = Y_Obs[i:i+12]
        PredictedTensor = Y_Fit[i:i+12]

        Numerator = np.sum((ObservedTensor-PredictedTensor)**2)
        Denominator = np.sum(ObservedTensor**2)

        NE = np.append(NE,np.sqrt(Numerator/Denominator))


    Line = np.linspace(min(Y_Obs.min(), Y_Fit.min()),
                       max(Y_Obs.max(), Y_Fit.max()), N)

    ## Plots
    DPI = 500
    SMax = max(HealthyData[Y_Elements].max()) * 5
    SMin = min(OIData[Y_Elements].min()) / 5

    Color = np.exp(Data['LogBVTV'].values)
    VMin = HealthyData['BV/TV'].min()
    VMax = HealthyData['BV/TV'].max()

    Good = Data[Data['LogCV']<=np.log(0.263)].index.values
    Bad = Data[Data['LogCV']>np.log(0.263)].index.values

    Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=1000, sharey=True, sharex=True)
    Axes.scatter(Y_Obs[Bad], np.array(Y_Fit)[Bad], c=Color[Bad], vmin=VMin, vmax=VMax, cmap='jet', marker='x')
    Scatter = Axes.scatter(Y_Obs[Good], np.array(Y_Fit)[Good], c=Color[Good], vmin=VMin, vmax=VMax, cmap='jet', marker='o')
    Axes.scatter([],[], color=(0,0,0), marker='x',label='Above CV Threshold')
    Axes.scatter([],[], color=(0,0,0), marker='o', label='Below CV Threshold')
    Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
    Axes.annotate(r'N ROIs   : ' + str(NROIs), xy=(0.25, 0.1), xycoords='axes fraction')
    Axes.annotate(r'N Points : ' + str(len(Y_Obs)), xy=(0.25, 0.025), xycoords='axes fraction')
    Axes.annotate(r'$R^2_{ajd}$: ' + format(round(R2adj, 3), '.3f'), xy=(0.65, 0.1), xycoords='axes fraction')
    Axes.annotate(r'$NE$ : ' + format(round(NE.mean(), 2), '.2f') + '$\pm$' + format(round(NE.std(), 2), '.2f'),
                  xy=(0.65, 0.025), xycoords='axes fraction')
    Axes.set_xlabel('Observed $\mathrm{\mathbb{S}}$ (MPa)')
    Axes.set_ylabel('Fitted $\mathrm{\mathbb{S}}$ (MPa)')
    Axes.set_xlim([SMin,SMax])
    Axes.set_ylim([SMin,SMax])
    plt.xscale('log')
    plt.yscale('log')
    ColorBar = plt.colorbar(Scatter)
    ColorBar.ax.set_ylabel('BV/TV (-)')
    plt.subplots_adjust(left=0.15, bottom=0.15)
    plt.legend(loc='upper left')
    plt.show()

    return R2adj, NE

# 01 Set path and build data
WorkingDirectory = os.getcwd()
ResultsFolder = os.path.join(WorkingDirectory, '04_Results/04_General_LinearRegression/')

## Load data
HealthyData = pd.read_csv(ResultsFolder + '00_Healthy_StiffnessData.csv')
OIData = pd.read_csv(ResultsFolder + '00_OI_StiffnessData.csv')
FullData = HealthyData.append(OIData).reset_index(drop=True)


# 02 Build linear system for regressions
Y_Elements = FullData.columns[2:14]

LinearSystem = pd.DataFrame()
for Index in FullData.index:
    m1, m2, m3 = FullData[['m1','m2','m3']].loc[Index]
    BVTV = FullData['BV/TV'].loc[Index]
    CV = FullData['Variation Coefficient'].loc[Index]
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

    y_i = np.log(FullData[Y_Elements].loc[Index].values)

    y = pd.DataFrame({'LogSxy':y_i})
    X = pd.DataFrame({'Sii':X_i[:,0],
                      'Sij':X_i[:,1],
                      'Sjj':X_i[:,2],
                      'LogBVTV':X_i[:,3],
                      'Logmxy':X_i[:,4],
                      'LogCV':X_i[:,5]})

    Scan = pd.DataFrame({'Scan': np.repeat(FullData['Scan'].loc[Index], len(y_i))})

    LinearSystem = LinearSystem.append(pd.concat([y,X,Scan],axis=1),ignore_index=True)
LinearSystem['IF'] = 1.0
FullSystem = LinearSystem.copy()


## Linear mixed-effect models
Full_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=FullSystem, groups=FullSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)

# 05 Plot the results of the regression
R2adj, NE = PlotRegressionResults(Full_LMM,FullSystem, Random=False)

