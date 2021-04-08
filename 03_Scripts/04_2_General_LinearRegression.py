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
def LikelihoodRatioTest(Model1, Model2, Delta_DOF):
    L1 = Model1.llf
    L2 = Model2.llf
    LRT = 2 * (L2 - L1)

    p = 1 - chi2.cdf(LRT, Delta_DOF)

    return p
def PlotRegressionResults(Model, Data, PlotTypes=['BV/TV', 'DA', 'Constants'], Alpha=0.95, Random=True):

    ## Get data from the model
    Y_Obs = np.exp(Model.model.endog)
    Y_Fit = np.exp(Model.fittedvalues)
    if not Random:
        Y_Fit = np.exp(Model.predict())
    N = int(Model.nobs)
    C = np.matrix(Model.cov_params())
    X = np.matrix(Model.model.exog)

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

    B_0 = np.sqrt(np.diag(np.abs(X * C * X.T)))
    t_Alpha = t.interval(Alpha, N - X.shape[1] - 1)
    CI_Line_u = Line + t_Alpha[0] * np.exp(SE) * np.exp(B_0)
    CI_Line_o = Line + t_Alpha[1] * np.exp(SE) * np.exp(B_0)

    Sii = Y_Fit * np.array(X[:, 0].T)[0]
    Sij = Y_Fit * np.array(X[:, 1].T)[0]
    Sjj = Y_Fit * np.array(X[:, 2].T)[0]

    ## Plots
    DPI = 500
    SMax = max(HealthyData[Y_Elements].max()) * 5
    SMin = min(OIData[Y_Elements].min()) / 5
    if 'BV/TV' in PlotTypes:
        Color = np.exp(Data['LogBVTV'].values)
        VMin = HealthyData['BV/TV'].min()
        VMax = HealthyData['BV/TV'].max()
        Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Scatter = Axes.scatter(Y_Obs, np.array(Y_Fit), c=Color, vmin=VMin, vmax=VMax, cmap='jet', marker='o')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$   : ' + str(len(Y_Obs)), xy=(0.65, 0.175), xycoords='axes fraction')
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
        plt.show()

    if 'DA' in PlotTypes:
        Color = np.exp(Data['Logmxy'].values)
        Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Scatter = Axes.scatter(Y_Obs, np.array(Y_Fit), c=Color, cmap='jet', marker='o')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$   : ' + str(len(Y_Obs)), xy=(0.65, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2_{ajd}$: ' + format(round(R2adj, 3), '.3f'), xy=(0.65, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$NE$ : ' + format(round(NE.mean(), 2), '.2f') + '$\pm$' + format(round(NE.std(), 2), '.2f'),
                      xy=(0.65, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathrm{\mathbb{S}}$ (MPa)')
        Axes.set_ylabel('Fitted $\mathrm{\mathbb{S}}$ (MPa)')
        Axes.set_xlim([SMin, SMax])
        Axes.set_ylim([SMin, SMax])
        plt.xscale('log')
        plt.yscale('log')
        ColorBar = plt.colorbar(Scatter)
        ColorBar.ax.set_ylabel('Degree of Anisotropy (-)')
        plt.subplots_adjust(left=0.15, bottom=0.15)
        plt.show()

    if 'Constants' in PlotTypes:
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Axes.plot(Y_Obs, Sii,
                  color=(0, 0, 1), linestyle='none', marker='o', label=r'$\lambda_{ii}$')
        Axes.plot(Y_Obs, Sij,
                  color=(0, 1, 0), linestyle='none', marker='o', label=r'$\lambda_{ij}$')
        Axes.plot(Y_Obs, Sjj,
                  color=(1, 0, 0), linestyle='none', marker='o', label=r'$\mu_{ij}$')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$   : ' + str(len(Y_Obs)), xy=(0.65, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2_{ajd}$: ' + format(round(R2adj, 3),'.3f'), xy=(0.65, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$NE$ : ' + format(round(NE.mean(), 2), '.2f') + '$\pm$' + format(round(NE.std(), 2), '.2f'), xy=(0.65, 0.025), xycoords='axes fraction')
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
def ComputeLMConstants(Model,Alpha=0.95,k=0,l=0):

    ## Get general model parameters
    N = int(Model.nobs)
    p = len(Model.params)

    ## Get values, covariance matrix and CI
    B = Model.params
    C = Model.cov_params()
    B_CI = Model.conf_int()

    ## Set t value for given confidence level
    t_Alpha = t.interval(Alpha, Model.nobs - 12 - 1)

    ## Compute stiffness constants
    Mu0 = np.exp(B['Sjj']) / 2
    Lambda0p = np.exp(B['Sij'])
    Lambda0 = np.exp(B['Sii']) - 2 * Mu0

    ## Compute CI for lambda 0
    C_add = np.abs(C.loc['Sii', 'Sii']) + np.abs(C.loc['Sjj', 'Sjj'])
    SE_L0 = np.sqrt(C_add + 2* np.abs(C.loc['Sii', 'Sjj']))
    L0_CI = np.log(Lambda0) + SE_L0 * np.array(t_Alpha)

    print('\n\nFit constants with ' + str(Alpha * 100) + '% CI :')
    print('Lambda0: ' + str(int(round(Lambda0, 0))) +
          ' [' + str(int(round(np.exp(L0_CI[0]), 0))) + ' - ' +
          str(int(round(np.exp(L0_CI[1]), 0))) + ']')
    print('Lambda0p: ' + str(int(round(Lambda0p, 0))) +
          ' [' + str(int(round(np.exp(B_CI.loc['Sij', 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI.loc['Sij', 1]), 0))) + ']')
    print('Mu0: ' + str(int(round(Mu0, 0))) +
          ' [' + str(int(round(np.exp(B_CI.loc['Sjj', 0]) / 2, 0))) + ' - ' +
          str(int(round(np.exp(B_CI.loc['Sjj', 1]) / 2, 0))) + ']')

    ## Build data frame
    Table = pd.DataFrame({'Lambda0': Lambda0,
                          'Lambda0 CI': np.exp(L0_CI),
                          'Lambda0p': Lambda0p,
                          'Lambda0p CI': np.exp(B_CI.loc['Sij', :]),
                          'Mu0': Mu0,
                          'Mu0 CI': np.exp(B_CI.loc['Sjj', :]) / 2})

    ## Get exponent values
    if 'LogBVTV' in B and 'Logmxy' in B:
        l = B['Logmxy']
        k = B['LogBVTV']

        print('k: ' + str(round(k, 3)) +
              ' [' + str(round(B_CI.loc['LogBVTV', 0], 3)) + ' - ' +
              str(round(B_CI.loc['LogBVTV', 1], 3)) + ']')
        print('l: ' + str(round(l, 3)) +
              ' [' + str(round(B_CI.loc['Logmxy', 0], 3)) + ' - ' +
              str(round(B_CI.loc['Logmxy', 1], 3)) + ']' + '\n\n')

        Table[['k','k CI','l','l CI']] = k, B_CI.loc['LogBVTV',:], l, B_CI.loc['Logmxy',:]

    else:
        print('k: ' + str(round(k, 3)))
        print('l: ' + str(round(l, 3)) + '\n\n')

        Table[['k','l']] = k, l

    ## Compute R2 and standard error of the estimate
    E = Model.resid.values
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / Model.df_resid)
    TSS = np.sum((Model.model.endog - Model.model.endog.mean()) ** 2)
    RegSS = TSS - RSS
    R2 = RegSS / TSS

    ## Compute R2 adj and NE
    R2adj = 1 - RSS/TSS * (12*N-1)/(12*N-p-1)

    NE = np.array([])
    Y_Obs = np.exp(Model.model.endog)
    Y_Fit = np.exp(Model.fittedvalues)
    for i in range(0,N,12):
        ObservedTensor = Y_Obs[i:i+12]
        PredictedTensor = Y_Fit[i:i+12]

        Numerator = np.sum((ObservedTensor-PredictedTensor)**2)
        Denominator = np.sum(ObservedTensor**2)

        NE = np.append(NE,np.sqrt(Numerator/Denominator))

    Table[['R2', 'SE', 'R2 adj', 'NE', 'NE std']] = R2, SE, R2adj, np.mean(NE), np.std(NE)

    ## Partial R2
    for Parameter in B.index:
        if 'Var' in Parameter:
            Y_Predict = np.exp(Model.predict())
            E_Predict = np.log(Y_Obs) - np.log(Y_Predict)
            RSS_Predict = np.sum(E_Predict ** 2)
            SE_Predict = np.sqrt(RSS_Predict / Model.df_resid)
            RegSS_Predict = TSS - RSS_Predict
            R2_Predict = RegSS_Predict / TSS

            ## Compute R2 adj and NE
            R2adj_Predict = 1 - RSS_Predict / TSS * (12 * N - 1) / (12 * N - p - 1)

            NE_Predict = np.array([])
            for i in range(0, N, 12):
                ObservedTensor = Y_Obs[i:i + 12]
                PredictedTensor = Y_Predict[i:i + 12]

                Numerator = np.sum((ObservedTensor - PredictedTensor) ** 2)
                Denominator = np.sum(ObservedTensor ** 2)

                NE_Predict = np.append(NE_Predict, np.sqrt(Numerator / Denominator))

            Table[['R2 Partial', 'SE Partial', 'R2 adj Partial', 'NE Partial', 'NE std Partial']] =\
                R2_Predict, SE_Predict, R2adj_Predict, np.mean(NE_Predict), np.std(NE_Predict)

    return Table
def WriteLatexTable(TableName,TableCaption,TableResults, DataSets, FixedEffectOnly=False):

    # Create file and open template
    TableFile = open(os.path.join(ResultsFolder, TableName),'w')
    TemplateFile  = open(os.path.join(WorkingDirectory, '03_Scripts', 'TableTemplate.txt'), 'r')
    TemplateText  = TemplateFile.read()

    # Find specific locations
    TableTextStart = TemplateText.find('DATASET')
    TableTextEnd = TemplateText.find('bottomrule')

    # Separate text
    TableCaption = TemplateText[:TableTextStart].replace('TABLECAPTION',TableCaption)
    TableText = TemplateText[TableTextStart:TableTextEnd-1]
    TableEnding = TemplateText[TableTextEnd-1:]

    # Write table
    TableFile.write(TableCaption)

    for ResultsN in range(len(TableResults)):

        Results = TableResults[ResultsN]
        ResultsText = TableText

        # Replace text by corresponding values
        ResultsText = ResultsText.replace('DATASET',DataSets[ResultsN])

        ResultsText = ResultsText.replace('L0 ', str(int(round(Results['Lambda0'][0],0))) + ' ')
        ResultsText = ResultsText.replace('L0D', str(int(round(Results['Lambda0 CI'][0], 0))))
        ResultsText = ResultsText.replace('L0U', str(int(round(Results['Lambda0 CI'][1], 0))))

        ResultsText = ResultsText.replace('L0p ', str(int(round(Results['Lambda0p'][0], 0))) + ' ')
        ResultsText = ResultsText.replace('L0pD', str(int(round(Results['Lambda0p CI'][0], 0))))
        ResultsText = ResultsText.replace('L0pU', str(int(round(Results['Lambda0p CI'][1], 0))))

        ResultsText = ResultsText.replace('M0 ', str(int(round(Results['Mu0'][0], 0))) + ' ')
        ResultsText = ResultsText.replace('M0D', str(int(round(Results['Mu0 CI'][0], 0))))
        ResultsText = ResultsText.replace('M0U', str(int(round(Results['Mu0 CI'][1], 0))))

        ResultsText = ResultsText.replace('eK ', str(round(Results['k'][0], 2)) + ' ')
        if 'k CI' in Results.columns:
            ResultsText = ResultsText.replace('eKD', str(round(Results['k CI'][0], 2)))
            ResultsText = ResultsText.replace('eKU', str(round(Results['k CI'][1], 2)))

        ResultsText = ResultsText.replace('eL ', str(round(Results['l'][0], 2)) + ' ')
        if 'l CI' in Results.columns:
            ResultsText = ResultsText.replace('eLD', str(round(Results['l CI'][0], 2)))
            ResultsText = ResultsText.replace('eLU', str(round(Results['l CI'][1], 2)))

        if FixedEffectOnly:
            ResultsText = ResultsText.replace('R2adj', str(round(Results['R2 adj Partial'][0], 3)))
            ResultsText = ResultsText.replace('NEm', str(int(round(Results['NE Partial'][0]*100, 0))))
            ResultsText = ResultsText.replace('NEstd', str(int(round(Results['NE std Partial'][0]*100, 0))))

        else:
            ResultsText = ResultsText.replace('R2adj', str(round(Results['R2 adj'][0], 3)))
            ResultsText = ResultsText.replace('NEm', str(int(round(Results['NE'][0]*100, 0))))
            ResultsText = ResultsText.replace('NEstd', str(int(round(Results['NE std'][0]*100, 0))))

        TableFile.write(ResultsText)

    TableFile.write(TableEnding)

    TableFile.close()
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

## Load data
HealthyData = pd.read_csv(ResultsFolder + '00_Healthy_StiffnessData.csv')
OIData = pd.read_csv(ResultsFolder + '00_OI_StiffnessData.csv')

## Set group to analyze
for Group in ['Healthy','OI']:

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

        LinearSystem = LinearSystem.append(pd.concat([y,X,Scan],axis=1),ignore_index=True)
    LinearSystem['IF'] = 1.0

    # 03 Build linear models
    if Group == 'Healthy':
        HealthySystem = LinearSystem.copy()
    elif Group == 'OI':
        OISystem = LinearSystem.copy()


## Standard linear models
Healthy_LM = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=HealthySystem).fit()
OI_LM = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=OISystem).fit()


## Linear mixed-effect models
Healthy_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=HealthySystem, groups=HealthySystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)
OI_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=OISystem, groups=OISystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)


## Likelihood ratio test
Healthy_p = LikelihoodRatioTest(Healthy_LM,Healthy_LMM,1)
print('p value of LRT for healthy group: ' + str(Healthy_p))
OI_p = LikelihoodRatioTest(OI_LM,OI_LMM,1)
print('p value of LRT for OI group: ' + str(OI_p))




# 05 Plot the results of the regression
H_LMM_R2adj, H_LMM_NE = PlotRegressionResults(Healthy_LMM,HealthySystem,['Constants'],Random=False)
OI_LMM_R2adj, OI_LMM_NE = PlotRegressionResults(OI_LMM,OISystem,['Constants'],Random=False)



# 06 Set filter parameters
CVLim = 0.263

## Plot filtering and compute correlation between variables
GroupedData = HealthyData.append(OIData)
Rho, Rho_CI = SpearmanCorrelation(GroupedData['BV/TV'],GroupedData['Variation Coefficient'])
Text = r'$\rho$ = ' + str(round(Rho,3)) + ' [' + str(round(Rho_CI[0],3)) + ' , ' + str(round(Rho_CI[1],3)) + ']'

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=500)
Axes.plot(HealthyData['BV/TV'],
          HealthyData['Variation Coefficient'],
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='Healthy Data')
Axes.plot(OIData['BV/TV'],
          OIData['Variation Coefficient'],
          linestyle='none',marker='o',color=(1,0,0),fillstyle='none',label='OI Data')
Axes.plot([OIData['BV/TV'].min(),HealthyData['BV/TV'].max()],[CVLim,CVLim],color=(0,0,0),linestyle='--',label='CV Threshold')
Axes.annotate(Text, xy=(0.25, 1.05), xycoords='axes fraction')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)

## Filter system and perform linear regressions again
F_HealthySystem = HealthySystem[HealthySystem['LogCV'] <= np.log(CVLim)]
F_OISystem = OISystem[OISystem['LogCV'] < np.log(CVLim)]

## Standard linear models
F_Healthy_LM = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=F_HealthySystem).fit()
F_OI_LM = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=F_OISystem).fit()

## Linear mixed-effect models
F_Healthy_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=F_HealthySystem, groups=F_HealthySystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)
F_OI_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=F_OISystem, groups=F_OISystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)


## Likelihood ratio test
F_Healthy_p = LikelihoodRatioTest(F_Healthy_LM,F_Healthy_LMM,1)
print('p value of LRT for healthy group: ' + str(F_Healthy_p))
F_OI_p = LikelihoodRatioTest(F_OI_LM,F_OI_LMM,1)
print('p value of LRT for OI group: ' + str(F_OI_p))


# 05 Plot the results of the regression
F_H_LMM_R2adj, F_H_LMM_NE = PlotRegressionResults(F_Healthy_LMM,F_HealthySystem,['Constants'],Random=False)
F_OI_LMM_R2adj, F_OI_LMM_NE = PlotRegressionResults(F_OI_LMM,F_OISystem,['Constants'],Random=False)


## Compute filtered model parameters
F_Healthy_LM_Table = ComputeLMConstants(F_Healthy_LM)
F_Healthy_LMM_Table = ComputeLMConstants(F_Healthy_LMM)
F_OI_LM_Table = ComputeLMConstants(F_OI_LM)
F_OI_LMM_Table = ComputeLMConstants(F_OI_LMM)

## Write latex table
TableName = 'LM_Comparison.tex'
TableCaption = 'Linear models - constants comparison'
TableResults = [F_Healthy_LMM,F_OI_LMM]
DataSets = ['Healthy','OI']

WriteLatexTable(TableName,TableCaption,TableResults, DataSets, FixedEffectOnly=True)
