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
def PlotRegressionResults(Model, Data, Random=True, Colors=[(0,0,1),(0,1,0),(1,0,0)]):

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
    DPI = 1000
    SMax = max(HealthyData[Y_Elements].max()) * 5
    SMin = min(OIData[Y_Elements].min()) / 5

    OI_Types = Data['Type'].unique()
    Markers = ['o','x','^']
    Labels = ['Type I','Type III', 'Type IV']

    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=DPI, sharey=True, sharex=True)
    for i in [0,2,1]:
        Axes.plot(Y_Obs[Data['Type']==OI_Types[i]], Y_Fit[Data['Type']==OI_Types[i]],
                  color=Colors[i], linestyle='none', marker=Markers[i],
                  markeredgewidth=2, label='OI ' + Labels[i])
    Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
    Axes.annotate(r'N ROIs   : ' + str(NROIs), xy=(0.3, 0.1), xycoords='axes fraction')
    Axes.annotate(r'N Points : ' + str(len(Y_Obs)), xy=(0.3, 0.025), xycoords='axes fraction')
    Axes.annotate(r'$R^2_{ajd}$: ' + format(round(R2adj, 3), '.3f'), xy=(0.65, 0.1), xycoords='axes fraction')
    Axes.annotate(r'NE : ' + format(round(NE.mean(), 2), '.2f') + '$\pm$' + format(round(NE.std(), 2), '.2f'),
                  xy=(0.65, 0.025), xycoords='axes fraction')
    Axes.set_xlabel('Observed $\mathrm{\mathbb{S}}$ (MPa)')
    Axes.set_ylabel('Fitted $\mathrm{\mathbb{S}}$ (MPa)')
    Axes.set_xlim([SMin, SMax])
    Axes.set_ylim([SMin, SMax])
    plt.xscale('log')
    plt.yscale('log')
    plt.legend(loc='upper left')
    plt.subplots_adjust(left=0.15, bottom=0.15)
    plt.show()

    return R2adj, NE
def Covariance(x, y):
    if not len(x) == len(y):
        print('Covariables vectors not of equal lengths')
    else:
        x_bar, y_bar = x.mean(), y.mean()
        Cov = np.sum(((x - x_bar) * (y - y_bar)) / (len(x) - 1))
        return Cov
def FisherZTransformation(r):
    z = 1 / 2 * np.log((1 + r) / (1 - r))
    return z
def SpearmanFillerStandardError(N):
    Sz = 1.03 / np.sqrt(N - 3)
    return Sz
def SpearmanCorrelation(x, y):
    # Compute Spearman correlation coefficient and it's corresponding 95% confidence interval
    # According to Bishara2017, doi:10.3758/s13428-016-0702-8
    # Should be use to show monotonic relation between two variables x and y

    x_Ranks = x.rank(method='average')
    y_Ranks = y.rank(method='average')
    Cov = Covariance(x_Ranks, y_Ranks)
    Rho = Cov / (x_Ranks.std(ddof=1) * y_Ranks.std(ddof=1))

    Z_f = FisherZTransformation(Rho)
    S_z = SpearmanFillerStandardError(len(x))
    Z_CI = Z_f + 1.96 * np.array([S_z, -S_z])
    CI = (np.exp(2 * Z_CI) - 1) / (np.exp(2 * Z_CI) + 1)

    return Rho, CI


# 01 Set path and build data
WorkingDirectory = os.getcwd()
ResultsFolder = os.path.join(WorkingDirectory, '04_Results/04_General_LinearRegression/')
MatchingFolder = os.path.join(WorkingDirectory,'04_Results/02_Individuals_Matching/')

## Load data
HealthyData = pd.read_csv(ResultsFolder + '00_Healthy_StiffnessData.csv')
OIData = pd.read_csv(ResultsFolder + '00_OI_StiffnessData.csv')

## Add filter for OI types
OI_I = ['350402_C0000050_SEG_UNCOMP',
        '350201_C0000066_SEG_UNCOMP',
        '350202_C0000070_SEG_UNCOMP',
        '350203_C0000099_SEG_UNCOMP',
        '350302_C0000111_SEG_UNCOMP',
        '350404_C0000120_SEG_UNCOMP',
        '350208_C0000141_SEG_UNCOMP',
        '350405_C0000145_SEG_UNCOMP',
        '350303_C0000153_SEG_UNCOMP',
        '310201_C0000160_SEG_UNCOMP',
        '351001_C0000037_SEG_UNCOMP',
        '351302_C0000051_SEG_UNCOMP',
        '351303_C0000072_SEG_UNCOMP',
        '350701_C0000082_SEG_UNCOMP',
        '350608_C0000085_SEG_UNCOMP',
        '351304_C0000089_SEG_UNCOMP',
        '350605_C0000091_SEG_UNCOMP',
        '350702_C0000096_SEG_UNCOMP',
        '351305_C0000122_SEG_UNCOMP',
        '350704_C0000129_SEG_UNCOMP',
        '351306_C0000147_SEG_UNCOMP',
        '351101_C0000151_SEG_UNCOMP',
        '351308_C0000194_SEG_UNCOMP',
        '350908_C0000201_SEG_UNCOMP',
        '350912_C0000226_SEG_UNCOMP',
        '350910_C0000231_SEG_UNCOMP',
        '350913_C0000239_SEG_UNCOMP',
        '350914_C0000261_SEG_UNCOMP',
        '350703_C0000118_SEG_UNCOMP',
        '350108_C0000130_SEG_UNCOMP',
        '350207_C0000137_SEG_UNCOMP',
        '350407_C0000158_SEG_UNCOMP',
        '351310_C0000159_SEG_UNCOMP',
        '350304_C0000179_SEG_UNCOMP',
        '350705_C0000245_SEG_UNCOMP']
OI_III = ['351311_C0000220_SEG_UNCOMP',
          '350101_C0000121_SEG_UNCOMP']
OI_IV = ['350104_C0000094_SEG_UNCOMP',
         '350205_C0000112_SEG_UNCOMP',
         '310101_C0000118_SEG_UNCOMP',
         '350206_C0000126_SEG_UNCOMP',
         '351301_C0000034_SEG_UNCOMP',
         '350901_C0000049_SEG_UNCOMP',
         '350902_C0000057_SEG_UNCOMP',
         '350903_C0000061_SEG_UNCOMP',
         '351002_C0000083_SEG_UNCOMP',
         '351102_C0000226_SEG_UNCOMP',
         '350915_C0000250_SEG_UNCOMP',
         '350606_C0000070_SEG_UNCOMP',
         '350107_C0000104_SEG_UNCOMP']
Filter1 = OIData['Scan'].isin(OI_I)
Filter3 = OIData['Scan'].isin(OI_III)
Filter4 = OIData['Scan'].isin(OI_IV)
Filters = [Filter1,Filter3,Filter4]

# 02 Build linear system for regressions
for i in range(3):

    Data = OIData[Filters[i]]

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

        LinearSystem = LinearSystem.append(pd.concat([y,X,Scan],axis=1),ignore_index=True)
    LinearSystem['IF'] = 1.0

    if i == 0:
        OI_I_System = LinearSystem.copy()
        OI_I_System['Type'] = 1
        OI_I_Data = Data.copy()
        OI_I_Data['Type'] = 1
    elif i == 1:
        OI_III_System = LinearSystem.copy()
        OI_III_System['Type'] = 3
        OI_III_Data = Data.copy()
        OI_III_Data['Type'] = 3
    else:
        OI_IV_System = LinearSystem.copy()
        OI_IV_System['Type'] = 4
        OI_IV_Data = Data.copy()
        OI_IV_Data['Type'] = 4

Data = OI_I_Data.append([OI_III_Data,OI_IV_Data]).reset_index(drop=True)
System = OI_I_System.append([OI_III_System,OI_IV_System]).reset_index(drop=True)

## Linear mixed-effect models
OI_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=System, groups=System['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)

# 05 Plot the results of the regression
R2adj, NE = PlotRegressionResults(OI_LMM,System, Random=False,Colors=[(1,0,0),(0,0,1),(0,1,0)])


# 06 Set filter parameters
CVLim = 0.263


## Plot filtering and compute correlation between variables
GroupedData = HealthyData.append(OIData)
Rho, Rho_CI = SpearmanCorrelation(GroupedData['BV/TV'],GroupedData['Variation Coefficient'])
Text = r'$\rho$ = ' + str(round(Rho,3)) + ' [' + str(round(Rho_CI[0],3)) + ' , ' + str(round(Rho_CI[1],3)) + ']'

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=500)
Axes.plot(OIData[Filter1]['BV/TV'],
          OIData[Filter1]['Variation Coefficient'],
          linestyle='none',marker='o',markeredgewidth=2,color=(1,0,0),label='OI Type I')
Axes.plot(OIData[Filter4]['BV/TV'],
          OIData[Filter4]['Variation Coefficient'],
          linestyle='none',marker='^',markeredgewidth=2,color=(0,1,0),label='OI Type IV')
Axes.plot(OIData[Filter3]['BV/TV'],
          OIData[Filter3]['Variation Coefficient'],
          linestyle='none',marker='x',color=(0,0,1),markeredgewidth=2,label='OI Type III')
Axes.plot([OIData['BV/TV'].min(),HealthyData['BV/TV'].max()],[CVLim,CVLim],color=(0,0,0),linestyle='--',label='CV Threshold')
Axes.annotate(Text, xy=(0.25, 1.05), xycoords='axes fraction')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)



# Matched OI distribution
Matched_OI = pd.read_csv(os.path.join(MatchingFolder,'Matched_OI.csv'))
Matched_OI['OI_Type'].value_counts()