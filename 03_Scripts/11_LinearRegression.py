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


## Define functions
def Z_test(x1, x2, Alpha=0.95):

        ResultsTable = pd.DataFrame()

        # Compute standard deviation and number of observation
        S_x1 = x1.std(ddof=1)
        S_x2 = x2.std(ddof=1)
        N_x1 = len(x1)
        N_x2 = len(x2)

        # Test statistic and p value
        Z = (x1.mean() - x2.mean()) / np.sqrt(S_x1 ** 2 / N_x1 + S_x2 ** 2 / N_x2)
        p = 2 * (1 - norm.cdf(abs(Z)))

        # Rejection range
        MinValue = norm.ppf( (1 - Alpha) / 2)
        MaxValue = norm.ppf(1 - (1 - Alpha) / 2)
        RejectionRange = np.array([[-np.inf, round(MinValue,3)], [round(MaxValue,3), np.inf]])

        Results = {'Test statistic': round(Z, 3),
                   'p value': round(p, 9),
                   'Significance level (%)': Alpha * 100,
                   'Rejection range': RejectionRange}

        ResultsTable = ResultsTable.append(Results,ignore_index=True)

        return ResultsTable
def Covariance(x,y):

    if not len(x) == len(y):
        print('Covariables vectors not of equal lengths')
    else:
        x_bar, y_bar = x.mean(), y.mean()
        Cov = np.sum(((x - x_bar) * (y - y_bar)) / (len(x) - 1))
        return Cov
def FisherZTransformation(r):
    z = 1/2 * np.log((1+r)/(1-r))
    return z
def SpearmanFillerStandardError(N):
    Sz = 1.03/np.sqrt(N-3)
    return Sz
def SpearmanCorrelation(x,y):

    # Compute Spearman correlation coefficient and it's corresponding 95% confidence interval
    # According to Bishara2017, doi:10.3758/s13428-016-0702-8
    # Should be use to show monotonic relation between two variables x and y

    x_Ranks = x.rank(method='average')
    y_Ranks = y.rank(method='average')
    Cov = Covariance(x_Ranks,y_Ranks)
    Rho = Cov / (x_Ranks.std(ddof=1)*y_Ranks.std(ddof=1))

    Z_f = FisherZTransformation(Rho)
    S_z = SpearmanFillerStandardError(len(x))
    Z_CI = Z_f + 1.96 * np.array([S_z, -S_z])
    CI = (np.exp(2 * Z_CI) - 1) / (np.exp(2 * Z_CI) + 1)

    return Rho, CI
def PearsonFillerStandardError(N):
    Sz = 1./np.sqrt(N-3)
    return Sz
def PearsonCorrelation(x,y):

    Cov = Covariance(x, y)
    r = Cov / (x.std(ddof=1) * y.std(ddof=1))

    Z_f = FisherZTransformation(r)
    S_z = PearsonFillerStandardError(len(x))

    Z_CI = Z_f + 1.96 * np.array([S_z, -S_z])
    CI = (np.exp(2 * Z_CI) - 1) / (np.exp(2 * Z_CI) + 1)

    return r, CI
def ANCOVA(Observations, Models, ModelNames, ModelsType):

    ModelsResults = pd.DataFrame()

    for Model in Models:

        Index = list(Models).index(Model)

        ## Compute values for ANCOVA
        E = Model.resid.values
        RSS = np.sum(E ** 2)
        SE = np.sqrt(RSS / Model.df_resid)
        TSS = np.sum((Observations - Observations.mean()) ** 2)
        RegSS = TSS - RSS
        R2 = RegSS / TSS

        if ModelsType == 'Standard':
            DOF = Model.df_model
        elif ModelsType == 'Mixed-Effect':
            DOF = Model.df_modelwc

        ModelResults = {'Model': ModelNames[Index],
                        'Regression SS': RegSS,
                        'Residual SS': RSS,
                        'df': DOF,
                        'R2': round(R2, 3),
                        'SE': round(SE,3)}
        ModelsResults = ModelsResults.append(ModelResults, ignore_index=True)
    print('\n\nResults of the fitting:')
    print(ModelsResults[['Model', 'df', 'Regression SS', 'R2', 'SE']])

    ## Build lists of models to compare
    NModels = len(Models)
    Models0 = []
    Models1 = []
    if NModels > 2:
        ListA = np.arange(1,NModels).tolist()
        ListB = np.arange(0,NModels-1).tolist()

        for i in ListB:
            for j in ListA:
                Models0.append(j)
                Models1.append(i)
            del ListA[0]

    ## Build Analysis-of-Covariance table
    ANCOVATable = pd.DataFrame()
    for i in range(len(Models0)):

        RegSS_Diff = abs(ModelsResults['Regression SS'].loc[Models0[i]] - ModelsResults['Regression SS'].loc[Models1[i]])
        df = ModelsResults['df'].loc[Models0[i]] - ModelsResults['df'].loc[Models1[i]]
        k = (len(FilteredSystem) - ModelsResults['df'].loc[Models0[i]] - 1)
        F_0 = RegSS_Diff / df * k / ModelsResults['Residual SS'].loc[Models0[i]]
        pValue = f.sf(F_0, df, k)

        ANCOVALine = {'Models contrasted':ModelNames[Models0[i]] + ' - ' + ModelNames[Models1[i]],
                     'Sum of Squares':RegSS_Diff,
                     'df':df,
                     'F':F_0,
                     'p':pValue}
        ANCOVATable = ANCOVATable.append(ANCOVALine,ignore_index=True)

    print('\nResults of the ANCOVA:')
    print(ANCOVATable[['Models contrasted','Sum of Squares','df','F','p']])

    return ModelsResults, ANCOVATable[['Models contrasted','Sum of Squares','df','F','p']]
def ComputeOriginalModelConstants(Model,Alpha=0.95,k=0,l=0):

    ## Print summary
    print('\n\n Summary and constant for original model\n')
    print(Model.summary())

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

    return Table
def ComputeCVModelConstants(Model,Alpha=0.95,k=0,l=0):

    ## Print summary
    print('\n\n Summary and constant for CV model\n')
    print(Model.summary())

    ## Get values, covariance matrix and CI
    B = Model.params
    C = Model.cov_params()
    B_CI = Model.conf_int()

    ## Set t value for given confidence level
    t_Alpha = t.interval(Alpha, Model.nobs - 12 - 1)

    ## Get CV factor
    Beta = B['LogCV']

    ## Get CV values for constant range computation
    CV_Values = Model.model.exog[:, -1]

    ## Compute stiffness constants
    Mu0 = np.exp(B['Sjj'] + CV_Values * Beta) / 2
    Lambda0p = np.exp(B['Sij'] + CV_Values * Beta)
    Lambda0 = np.exp(B['Sii'] + CV_Values * Beta) - 2 * Mu0

    ## Compute CI for lambda0 (source:https://stats.stackexchange.com/questions/485636/how-do-you-get-confidence-intervals-for-interactions-of-variables)
    Interactions = ['Sii','Sjj','LogCV']
    C_add = 0
    for I in Interactions:
        C_add += np.abs(C.loc[I, I])
    SE_L0 = np.sqrt(C_add + 2*np.abs(C.loc['Sii', 'Sij'])
                          + 2*np.abs(C.loc['Sii', 'LogCV'])
                          + 2*np.abs(C.loc['Sij', 'LogCV']))
    L0_u = np.log(Lambda0) + SE_L0 * np.array(t_Alpha[0])
    L0_o = np.log(Lambda0) + SE_L0 * np.array(t_Alpha[1])

    ## Compute CI for lambda0p
    Interactions = ['Sij', 'LogCV']
    C_add = 0
    for I in Interactions:
        C_add += np.abs(C.loc[I, I])
    SE_L0p = np.sqrt(C_add + 2*np.abs(C.loc['Sij', 'LogCV']))
    L0p_u = np.log(Lambda0p) + SE_L0p * np.array(t_Alpha[0])
    L0p_o = np.log(Lambda0p) + SE_L0p * np.array(t_Alpha[1])

    ## Compute CI for Mu0
    Interactions = ['Sjj', 'LogCV']
    C_add = 0
    for I in Interactions:
        C_add += np.abs(C.loc[I, I])
    SE_Mu0 = np.sqrt(C_add + 2*np.abs(C.loc['Sjj', 'LogCV']))
    Mu0_u = np.log(Mu0) + SE_Mu0 * np.array(t_Alpha[0])
    Mu0_o = np.log(Mu0) + SE_Mu0 * np.array(t_Alpha[1])

    print('\n\nFit constants with ' + str(Alpha * 100) + '% CI :')
    print('Lambda0: ' + str(int(round(Lambda0.mean(), 0))) +
          ' [' + str(int(round(np.exp(L0_u.mean()), 0))) + ' - ' +
          str(int(round(np.exp(L0_o.mean()), 0))) + ']')
    print('Lambda0p: ' + str(int(round(Lambda0p.mean(), 0))) +
          ' [' + str(int(round(np.exp(L0p_u.mean()), 0))) + ' - ' +
          str(int(round(np.exp(L0p_o.mean()), 0))) + ']')
    print('Mu0: ' + str(int(round(Mu0.mean(), 0))) +
          ' [' + str(int(round(np.exp(Mu0_u.mean()), 0))) + ' - ' +
          str(int(round(np.exp(Mu0_o.mean()), 0))) + ']')

    ## Build data frame
    Table = pd.DataFrame({'CV Values':CV_Values,
                          'Lambda0': Lambda0,
                          'Lambda0 u': np.exp(L0_u),
                          'Lambda0 o': np.exp(L0_o),
                          'Lambda0p': Lambda0p,
                          'Lambda0p u': np.exp(L0p_u),
                          'Lambda0p o': np.exp(L0p_o),
                          'Mu0': Mu0,
                          'Mu0 u': np.exp(Mu0_u),
                          'Mu0 o': np.exp(Mu0_o)})

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

        Table[['k','k CI','l','l CI']] = k, B_CI.loc['Logmxy',:], l, B_CI.loc['Logmxy',:]

    else:
        print('k: ' + str(round(k, 3)))
        print('l: ' + str(round(l, 3)) + '\n\n')

        Table[['k','l']] = k, l

    return Table
def ComputeGroupModelConstants(Model,Alpha=0.95,k=0,l=0):

    ## Print summary
    print('\n\n Summary and constant for Group model\n')
    print(Model.summary())

    ## Get values, covariance matrix and CI
    B = Model.params
    C = Model.cov_params()
    B_CI = Model.conf_int()

    ## Set t value for given confidence level
    t_Alpha = t.interval(Alpha, Model.nobs - 12 - 1)

    ## Get Group factors
    Beta1 = B['Group:Sii']
    Beta2 = B['Group:Sij']
    Beta3 = B['Group:Sjj']

    ## Get Group values for constant range computation
    B1_Values = np.unique(Model.model.exog[:, -3])
    B2_Values = np.unique(Model.model.exog[:, -2])
    B3_Values = np.unique(Model.model.exog[:, -1])

    ## Compute stiffness constants
    Mu0 = np.exp(B['Sjj'] + B3_Values * Beta3) / 2
    Lambda0p = np.exp(B['Sij'] + B2_Values * Beta2)
    Lambda0 = np.exp(B['Sii'] + B1_Values * Beta1) - 2 * Mu0

    ## Compute CI for lambda0 (source:https://stats.stackexchange.com/questions/485636/how-do-you-get-confidence-intervals-for-interactions-of-variables)
    Interactions = ['Sii','Sjj','Group:Sii']
    C_add = 0
    for I in Interactions:
        C_add += np.abs(C.loc[I, I])
    SE_L0 = np.sqrt(C_add + 2*np.abs(C.loc['Sii', 'Sij'])
                          + 2*np.abs(C.loc['Sii', 'Group:Sii'])
                          + 2*np.abs(C.loc['Sij', 'Group:Sii']))
    L0_u = np.log(Lambda0) + SE_L0 * np.array(t_Alpha[0])
    L0_o = np.log(Lambda0) + SE_L0 * np.array(t_Alpha[1])

    ## Compute CI for lambda0p
    Interactions = ['Sij', 'Group:Sij']
    C_add = 0
    for I in Interactions:
        C_add += np.abs(C.loc[I, I])
    SE_L0p = np.sqrt(C_add + 2*np.abs(C.loc['Sij', 'Group:Sij']))
    L0p_u = np.log(Lambda0p) + SE_L0p * np.array(t_Alpha[0])
    L0p_o = np.log(Lambda0p) + SE_L0p * np.array(t_Alpha[1])

    ## Compute CI for Mu0
    Interactions = ['Sjj', 'Group:Sjj']
    C_add = 0
    for I in Interactions:
        C_add += np.abs(C.loc[I, I])
    SE_Mu0 = np.sqrt(C_add + 2*np.abs(C.loc['Sjj', 'Group:Sjj']))
    Mu0_u = np.log(Mu0) + SE_Mu0 * np.array(t_Alpha[0])
    Mu0_o = np.log(Mu0) + SE_Mu0 * np.array(t_Alpha[1])

    print('\n\nFit constants with ' + str(Alpha * 100) + '% CI :')
    print('Lambda0: ' + str(int(round(Lambda0.mean(), 0))) +
          ' [' + str(int(round(np.exp(L0_u.mean()), 0))) + ' - ' +
          str(int(round(np.exp(L0_o.mean()), 0))) + ']')
    print('Lambda0p: ' + str(int(round(Lambda0p.mean(), 0))) +
          ' [' + str(int(round(np.exp(L0p_u.mean()), 0))) + ' - ' +
          str(int(round(np.exp(L0p_o.mean()), 0))) + ']')
    print('Mu0: ' + str(int(round(Mu0.mean(), 0))) +
          ' [' + str(int(round(np.exp(Mu0_u.mean()), 0))) + ' - ' +
          str(int(round(np.exp(Mu0_o.mean()), 0))) + ']')

    ## Build data frame
    Table = pd.DataFrame({'Group Value':B1_Values,
                          'Lambda0': Lambda0,
                          'Lambda0 u': np.exp(L0_u),
                          'Lambda0 o': np.exp(L0_o),
                          'Lambda0p': Lambda0p,
                          'Lambda0p u': np.exp(L0p_u),
                          'Lambda0p o': np.exp(L0p_o),
                          'Mu0': Mu0,
                          'Mu0 u': np.exp(Mu0_u),
                          'Mu0 o': np.exp(Mu0_o)})

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

        Table[['k','k CI','l','l CI']] = k, B_CI.loc['Logmxy',:], l, B_CI.loc['Logmxy',:]

    else:
        print('k: ' + str(round(k, 3)))
        print('l: ' + str(round(l, 3)) + '\n\n')

        Table[['k','l']] = k, l

    return Table
def QQPlot(DataValues, Alpha_CI=0.95, DataLabel='Data'):

    ### Based on: https://www.tjmahr.com/quantile-quantile-plots-from-scratch/
    ### Itself based on Fox book: Fox, J. (2015)
    ### Applied Regression Analysis and Generalized Linear Models.
    ### Sage Publications, Thousand Oaks, California.

    # Data analysis
    N = len(DataValues)
    X_Bar = np.mean(DataValues)
    S_X = np.std(DataValues)

    # Sort data to get the rank
    Data_Sorted = np.zeros(N)
    Data_Sorted += DataValues
    Data_Sorted.sort()

    # Compute quantiles
    EmpiricalQuantiles = np.arange(0.5, N + 0.5) / N
    TheoreticalQuantiles = norm.ppf(EmpiricalQuantiles, X_Bar, S_X)
    ZQuantiles = norm.ppf(EmpiricalQuantiles,0,1)

    # Compute data variance
    DataIQR = np.quantile(DataValues, 0.75) - np.quantile(DataValues, 0.25)
    NormalIQR = np.sum(np.abs(norm.cdf(np.array([0.25, 0.75]), 0, 1)))
    Variance = DataIQR / NormalIQR
    Z_Space = np.linspace(min(ZQuantiles), max(ZQuantiles), 100)
    Variance_Line = Z_Space * Variance + np.median(DataValues)

    # Compute alpha confidence interval (CI)
    Z_SE = np.sqrt(norm.cdf(Z_Space) * (1 - norm.cdf(Z_Space)) / N) / norm.pdf(Z_Space)
    Data_SE = Z_SE * Variance
    Z_CI_Quantile = norm.ppf(np.array([(1 - Alpha_CI) / 2]), 0, 1)

    # Create point in the data space
    Data_Space = np.linspace(min(TheoreticalQuantiles), max(TheoreticalQuantiles), 100)

    # QQPlot
    BorderSpace = max( 0.05*abs(Data_Sorted.min()), 0.05*abs(Data_Sorted.max()))
    Y_Min = Data_Sorted.min() - BorderSpace
    Y_Max = Data_Sorted.max() + BorderSpace
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Axes.plot(TheoreticalQuantiles, Data_Sorted, linestyle='none', marker='o', mew=0.5, fillstyle='none', color=(0, 0, 0), label=DataLabel)
    Axes.plot(Data_Space, Variance_Line, linestyle='--', color=(1, 0, 0), label='Variance :' + str(format(np.round(Variance, 2),'.2f')))
    Axes.plot(Data_Space, Variance_Line + Z_CI_Quantile * Data_SE, linestyle='--', color=(0, 0, 1), label=str(int(100*Alpha_CI)) + '% CI')
    Axes.plot(Data_Space, Variance_Line - Z_CI_Quantile * Data_SE, linestyle='--', color=(0, 0, 1))
    plt.xlabel('Theoretical quantiles (-)')
    plt.ylabel('Empirical quantiles (-)')
    plt.ylim([Y_Min, Y_Max])
    plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15), prop={'size':10})
    plt.show()
    plt.close(Figure)

    return Variance
def PlotRegressionResults(Data,Y_Obs, Y_Fit, SE, R2, X, C_x, Alpha=0.95):

    N = len(Y_Obs)

    Line = np.linspace(min(Y_Obs.min(), Y_Fit.min()),
                       max(Y_Obs.max(), Y_Fit.max()), N)

    B_0 = np.sqrt(np.diag(np.abs(X * C_x * X.T)))
    t_Alpha = t.interval(Alpha, N - X.shape[1] - 1)
    CI_Line_u = Line + t_Alpha[0] * np.exp(SE) * np.exp(B_0)
    CI_Line_o = Line + t_Alpha[1] * np.exp(SE) * np.exp(B_0)

    Sii = Y_Fit * np.array(X[:, 0].T)[0]
    Sij = Y_Fit * np.array(X[:, 1].T)[0]
    Sjj = Y_Fit * np.array(X[:, 2].T)[0]

    ## Plots
    DPI = 100
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=DPI, sharey=True, sharex=True)
    Axes.plot(Y_Obs, Sii,
              color=(0, 0, 1), linestyle='none', marker='o', label=r'$\lambda_{ii}$')
    Axes.plot(Y_Obs, Sij,
              color=(0, 1, 0), linestyle='none', marker='o', label=r'$\lambda_{ij}$')
    Axes.plot(Y_Obs, Sjj,
              color=(1, 0, 0), linestyle='none', marker='o', label=r'$\mu_{ij}$')
    Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
    # Axes.annotate(r'N: ' + str(len(Y_Obs)), (10 ** 3, 20 ** 1))
    # Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), (10 ** 3, 10 ** 1))
    Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
    Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), xy=(0.7, 0.1), xycoords='axes fraction')
    Axes.annotate(r'$SE$: ' + str(round(SE, 4)), xy=(0.7, 0.025), xycoords='axes fraction')
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
    Axes.set_ylabel(r'Fitted $\mathbb{S}_{xy}$')
    plt.xscale('log')
    plt.yscale('log')
    plt.legend(loc='upper left')
    plt.show()

    Indices = Data[Data['Group'] == -1].index
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=DPI, sharey=True, sharex=True)
    Axes.plot(Y_Obs, Y_Fit, alpha=0.1,
              color=(0, 0, 0), linestyle='none', marker='o')
    Axes.plot(Y_Obs[Indices], Sii[:len(Indices)],
              color=(0, 0, 1), linestyle='none', marker='o', label=r'$\lambda_{ii}$')
    Axes.plot(Y_Obs[Indices], Sij[:len(Indices)],
              color=(0, 1, 0), linestyle='none', marker='o', label=r'$\lambda_{ij}$')
    Axes.plot(Y_Obs[Indices], Sjj[:len(Indices)],
              color=(1, 0, 0), linestyle='none', marker='o', label=r'$\mu_{ij}$')
    Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
    Axes.annotate(r'N  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
    Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), xy=(0.7, 0.1), xycoords='axes fraction')
    Axes.annotate(r'$SE$: ' + str(round(SE, 4)), xy=(0.7, 0.025), xycoords='axes fraction')
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
    Axes.set_ylabel(r'Fitted $\mathbb{S}_{xy}$')
    plt.xscale('log')
    plt.yscale('log')
    plt.legend(loc='upper left')
    plt.show()

    Indices = Data[Data['Group'] == 1].index
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=DPI, sharey=True, sharex=True)
    Axes.plot(Y_Obs, Y_Fit, alpha=0.1,
              color=(0, 0, 0), linestyle='none', marker='o')
    Axes.plot(Y_Obs[Indices], Sii[-len(Indices):],
              color=(0, 0, 1), linestyle='none', marker='o', label=r'$\lambda_{ii}$')
    Axes.plot(Y_Obs[Indices], Sij[-len(Indices):],
              color=(0, 1, 0), linestyle='none', marker='o', label=r'$\lambda_{ij}$')
    Axes.plot(Y_Obs[Indices], Sjj[-len(Indices):],
              color=(1, 0, 0), linestyle='none', marker='o', label=r'$\mu_{ij}$')
    Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
    Axes.annotate(r'N  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
    Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), xy=(0.7, 0.1), xycoords='axes fraction')
    Axes.annotate(r'$SE$: ' + str(round(SE, 4)), xy=(0.7, 0.025), xycoords='axes fraction')
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
    Axes.set_ylabel(r'Fitted $\mathbb{S}_{xy}$')
    plt.xscale('log')
    plt.yscale('log')
    plt.legend(loc='upper left')
    plt.show()

    return



# 01 Set path and build data
WorkingDirectory = os.getcwd()
ResultsFolder = os.path.join(WorkingDirectory, '04_Results/05_LinearRegression/')
BoxplotsFolder = os.path.join(ResultsFolder, 'Variables_Distributions/')

## Load data
HealthyData = pd.read_csv(ResultsFolder + '00_Healthy_StiffnessData.csv')
OIData = pd.read_csv(ResultsFolder + '00_OI_StiffnessData.csv')

## Filter out the control matched with the missing OI
Control2Filter = 'C0001785_SEG_UNCOMP'
Filter = HealthyData['Scan'] == Control2Filter
HealthyData = HealthyData.drop(HealthyData[Filter].index)

## Build grouped data frames
HealthyData['Group'] = 'Healthy'
OIData['Group'] = 'OI'
Data = pd.concat([HealthyData,OIData],axis=0,ignore_index=True)

## Add DA
Data['Degree of Anisotropy'] = Data['m3'] / Data['m1']

## Filter data
Threshold = (HealthyData.quantile(0.75)['Variation Coefficient']
             - HealthyData.quantile(0.25)['Variation Coefficient']) * 1.5 \
             + HealthyData.quantile(0.75)['Variation Coefficient']
MinBVTV = 0.1/3*2

CVFilter = Data['Variation Coefficient'] < Threshold
Windowing = Data['BV/TV'] > MinBVTV
FilteredData = Data[Windowing&CVFilter]

## Plot distribution of the variable of interest before and after filtering
Variables = ['BV/TV', 'Variation Coefficient', 'Degree of Anisotropy']
for Variable in Variables:
    Figure, Axes = plt.subplots(1, 2, figsize=(5.5, 3.5), dpi=100, sharey=True, sharex=True)
    Data.boxplot(Variable, by='Group', grid=False, ax=Axes[0], rot=0, vert=True,
                 showmeans=True,
                 boxprops=dict(linestyle='-', color='b'),
                 medianprops=dict(linestyle='-', color='r'),
                 whiskerprops=dict(linestyle='--', color='k'),
                 meanprops=dict(marker='x', color='b'))
    FilteredData.boxplot(Variable, by='Group', grid=False, ax=Axes[1], rot=0, vert=True,
                         showmeans=True,
                         boxprops=dict(linestyle='-', color='b'),
                         medianprops=dict(linestyle='-', color='r'),
                         whiskerprops=dict(linestyle='--', color='k'),
                         meanprops=dict(marker='x', color='b'))
    plt.xticks([1,2],['Healthy', 'OI'])
    Axes[0].set_ylabel(Variable)
    Axes[0].set_xlabel('Original distribution')
    Axes[1].set_xlabel('After filtering')
    Axes[0].set_title('')
    Axes[1].set_title('')
    Figure.suptitle('')
    plt.subplots_adjust(left=0.17,bottom=0.2)
    if Variable == 'BV/TV':
        plt.savefig(BoxplotsFolder + 'BVTV' + '_Boxplot.png')
    else:
        plt.savefig(BoxplotsFolder + Variable + '_Boxplot.png')
    plt.show()
    plt.close(Figure)





# 02 Check statistical differences for variables in groups (Large sample -> z-test)
ControlData = FilteredData[FilteredData['Group']=='Healthy']
OIData = FilteredData[FilteredData['Group'] == 'OI']

ZStatistics = pd.DataFrame()
for Variable in Variables:

    # Get values
    x1 = ControlData[Variable].values
    x2 = OIData[Variable].values

    ZResults = Z_test(x1, x2)

    ZResults['Variable'] = Variable

    ZStatistics = ZStatistics.append(ZResults,ignore_index=True)


## Plot filtering and compute correlation between variables
Rho, CI = SpearmanCorrelation(Data['BV/TV'],Data['Variation Coefficient'])
Text = r'$\rho$ = ' + str(round(Rho,3)) + ' [' + str(round(CI[0],3)) + ' , ' + str(round(CI[1],3)) + ']'

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(Data[Data['Group']=='Healthy']['BV/TV'],
          Data[Data['Group']=='Healthy']['Variation Coefficient'],
          linestyle='none',marker='o',color=(1,0,0),fillstyle='none',label='Healthy Data')
Axes.plot(Data[Data['Group']=='OI']['BV/TV'],
          Data[Data['Group']=='OI']['Variation Coefficient'],
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='OI Data')
Axes.plot([MinBVTV,MinBVTV],[0,Data['Variation Coefficient'].max()],color=(0.4,0.4,0.4),linestyle='--',label='BV/TV window')
Axes.plot([Data['BV/TV'].min(),Data['BV/TV'].max()],[Threshold,Threshold],color=(0,0,0),linestyle='dashdot',label='Threshold')
Axes.annotate(Text, xy=(0.25, 1.05), xycoords='axes fraction')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)


## Using normal data distribution pearson correlation can be computed
R, CI = PearsonCorrelation(Data['BV/TV'],np.log(Data['Variation Coefficient']))
Text = r'$r$ = ' + str(round(R,3)) + ' [' + str(round(CI[0],3)) + ' , ' + str(round(CI[1],3)) + ']'

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(Data[Data['Group']=='Healthy']['BV/TV'],
          np.log(Data[Data['Group']=='Healthy']['Variation Coefficient']),
          linestyle='none',marker='o',color=(1,0,0),fillstyle='none',label='Healthy Data')
Axes.plot(Data[Data['Group']=='OI']['BV/TV'],
          np.log(Data[Data['Group']=='OI']['Variation Coefficient']),
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='OI Data')
Axes.plot([MinBVTV,MinBVTV],[np.log(Data['Variation Coefficient'].min()),np.log(Data['Variation Coefficient'].max())],color=(0.4,0.4,0.4),linestyle='--',label='BV/TV window')
Axes.plot([Data['BV/TV'].min(),Data['BV/TV'].max()],[np.log(Threshold),np.log(Threshold)],color=(0,0,0),linestyle='dashdot',label='Threshold')
Axes.annotate(Text, xy=(0.25, 1.05), xycoords='axes fraction')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Log Coefficient of Variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)





# 03 Build linear system for regressions
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

    Group = pd.DataFrame({'Group':np.repeat(Data['Group'].loc[Index],len(y_i))})
    Scan = pd.DataFrame({'Scan': np.repeat(Data['Scan'].loc[Index], len(y_i))})

    LinearSystem = LinearSystem.append(pd.concat([y,X,Scan,Group],axis=1),ignore_index=True)

# Categorize group using sum constrain
LinearSystem['Group'] = LinearSystem['Group'].replace('Healthy',-1)
LinearSystem['Group'] = LinearSystem['Group'].replace('OI',+1)


## Define filtered data set
CVFilter = LinearSystem['LogCV'] < np.log(Threshold)
Windowing = LinearSystem['LogBVTV'] > np.log(MinBVTV)
FilteredSystem = LinearSystem[Windowing&CVFilter]





# 04 Build ANCOVA table for the different linear models
System2Fit = FilteredSystem

SimpleModel = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=System2Fit).fit()
CVModel = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1", data=System2Fit).fit()
GroupModel = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + Group:(Sii+Sij+Sjj) - 1", data=System2Fit).fit()

## Perform ANCOVA
Models = [SimpleModel,CVModel,GroupModel]
ModelNames = ['Original', 'CV', 'Group']

ModelsResults, ANCOVATable = ANCOVA(System2Fit['LogSxy'],Models,ModelNames,'Standard')



# 05 Compute stiffness values using different models
SimpleModelResults = ComputeOriginalModelConstants(SimpleModel)
CVModelResults = ComputeCVModelConstants(CVModel)
GroupModelResults = ComputeGroupModelConstants(GroupModel)

## Plot results
CV_Min = np.exp(CVModelResults['CV Values'].min())
CV_Max = np.exp(CVModelResults['CV Values'].max())
CV_Values = np.exp(CVModelResults['CV Values'].sort_values())

Constants = ['Lambda0','Lambda0p','Mu0']
ConstantNames = [r'$\lambda_0$', r'$\lambda_0$`', r'$\mu_0$']

for Constant in Constants:

    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Constant_u = SimpleModelResults[Constant + ' CI'].loc[0]
    Constant_o = SimpleModelResults[Constant + ' CI'].loc[1]
    Axes.fill_between([CV_Min,CV_Max], [Constant_u,Constant_u], [Constant_o,Constant_o],
                          color=(0,1,0), alpha=0.5)
    Constant_u = CVModelResults[Constant + ' u'][CV_Values.index]
    Constant_o = CVModelResults[Constant + ' o'][CV_Values.index]
    Axes.fill_between(CV_Values, Constant_u, Constant_o,
                          color=(1,0,0), alpha=0.2)
    Constant_u = GroupModelResults[Constant + ' u'][GroupModelResults['Group Value'] == 0].values[0]
    Constant_o = GroupModelResults[Constant + ' o'][GroupModelResults['Group Value'] == 0].values[0]
    Axes.fill_between([CV_Min,CV_Max], [Constant_u,Constant_u], [Constant_o,Constant_o],
                          color=(0,0,1), alpha=0.2)
    Constant_m = SimpleModelResults[Constant]
    Axes.plot([CV_Min,CV_Max], [Constant_m,Constant_m], color=(0,1,0))
    Axes.plot([], color=(0,1,0), label='Original model')
    Constant_m = CVModelResults[Constant][CV_Values.index]
    Axes.plot(CV_Values, Constant_m, color=(1,0,0), label='CV model')
    Constant_m = GroupModelResults[Constant][GroupModelResults['Group Value'] == 0].values[0]
    Axes.plot([CV_Min,CV_Max], [Constant_m,Constant_m], color=(0,0,1), label='Group model')
    Axes.set_xlabel('Coefficient of variation (-)')
    Axes.set_ylabel(ConstantNames[Constants.index(Constant)] + ' (MPa)')
    plt.legend(loc='upper center',ncol=3,bbox_to_anchor=(0.5,1.15))
    plt.subplots_adjust(left=0.2,right=0.8)
    plt.show()
    plt.close(Figure)



# 0& Build ANCOVA table for the different mixed-effects linear models
System2Fit = FilteredSystem

MixedSimpleModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"}).fit()
MixedCVModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"}).fit()
MixedGroupModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + Group:(Sii+Sij+Sjj) - 1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"}).fit()

## Perform ANCOVA
MixedModels = [MixedSimpleModel,MixedCVModel,MixedGroupModel]
ModelNames = ['Original', 'CV', 'Group']

ModelsResults, ANCOVATable = ANCOVA(System2Fit['LogSxy'],MixedModels,ModelNames,'Mixed-Effect')









System2Fit = FilteredSystem

MixedModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy -1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"}).fit()

Models = [SimpleModel,CVModel,GroupModel,MixedModel]
ModelNames = ['Simple', 'CV', 'Group','MixedEffect']

FitResults = pd.DataFrame()
for Model in Models:
    IndividualFitResults = ComputeValues(System2Fit,ModelName,Model)
    IndividualFitResults['Model'] = ModelNames[Models.index(Model)]
    FitResults = FitResults.append(IndividualFitResults,ignore_index=True)




# 04 Fit model for both group with constrained k and l
k, l = FitResults[['k','l']].loc[0]
LogSxy_kl = System2Fit['LogSxy'] - k * System2Fit['LogBVTV'] - l * System2Fit['Logmxy']
System2Fit = pd.concat([System2Fit,pd.DataFrame(LogSxy_kl,columns=['LogSxy_kl'])],axis=1)
HealthyGroup = System2Fit[System2Fit['Group']==-1]
OIGroup = System2Fit[System2Fit['Group']==1]

if 'Simple' in Model:

    if 'CV' in Model:
        HealthyFit = smf.ols("LogSxy_kl ~ Sii + Sij + Sjj + LogCV:(Sii+Sij+Sjj) - 1",
                            data=HealthyGroup)
        OIFit = smf.ols("LogSxy_kl ~ Sii + Sij + Sjj + LogCV:(Sii+Sij+Sjj) - 1",
                            data=OIGroup)
    elif 'Group' in Model:
        HealthyFit = smf.ols("LogSxy_kl ~ Sii + Sij + Sjj + Group:(Sii+Sij+Sjj) - 1",
                            data=HealthyGroup)
        OIFit = smf.ols("LogSxy_kl ~ Sii + Sij + Sjj + Group:(Sii+Sij+Sjj) - 1",
                            data=OIGroup)
    else:
        HealthyFit = smf.ols("LogSxy_kl ~ Sii + Sij + Sjj - 1",
                             data=HealthyGroup)
        OIFit = smf.ols("LogSxy_kl ~ Sii + Sij + Sjj - 1",
                        data=OIGroup)

elif 'Mixed' in Model:

    if 'CV' in Model:
        HealthyFit = smf.mixedlm("LogSxy_kl ~ Sii + Sij + Sjj + LogCV:(Sii+Sij+Sjj) - 1",
                                data=HealthyGroup, groups=HealthyGroup['Scan'],
                                vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"})
        OIFit = smf.mixedlm("LogSxy_kl ~ Sii + Sij + Sjj + LogCV:(Sii+Sij+Sjj) - 1",
                                data=OIGroup, groups=OIGroup['Scan'],
                                vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"})
    elif 'Group' in Model:
        HealthyFit = smf.mixedlm("LogSxy_kl ~ Sii + Sij + Sjj + Group:(Sii+Sij+Sjj) - 1",
                                data=HealthyGroup, groups=HealthyGroup['Scan'],
                                vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"})
        OIFit = smf.mixedlm("LogSxy_kl ~ Sii + Sij + Sjj + Group:(Sii+Sij+Sjj) - 1",
                                data=OIGroup, groups=OIGroup['Scan'],
                                vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"})
    else:
        HealthyFit = smf.mixedlm("LogSxy_kl ~ Sii + Sij + Sjj - 1",
                                data=HealthyGroup, groups=HealthyGroup['Scan'],
                                vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"})
        OIFit = smf.mixedlm("LogSxy_kl ~ Sii + Sij + Sjj - 1",
                                data=OIGroup, groups=OIGroup['Scan'],
                                vc_formula={"Sii": "Sii-1", "Sij": "Sij-1", "Sjj": "Sjj-1"})

FittedHealthy = HealthyFit.fit()
FittedOI = OIFit.fit()
HealthyResults = ComputeValues(HealthyGroup, Model, FittedHealthy, k=k, l=l)
OIResults = ComputeValues(OIGroup, Model, FittedOI, k=k, l=l)


# 05 Assess assumption conformity
QQPlot(Model2Fit.fit().resid.values)

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(np.exp(Model2Fit.fit().fittedvalues),Model2Fit.fit().resid, linestyle='none', marker='o', fillstyle='none', color=(0, 0, 0))
Axes.set_xlabel('Fitted values')
Axes.set_ylabel('Residuals')
Axes.set_xscale('log')
plt.show()
plt.close(Figure)


# Plot observation versus fit
X = np.matrix([System2Fit['Sii'],
               System2Fit['Sij'],
               System2Fit['Sjj'],
               System2Fit['LogBVTV'],
               System2Fit['Logmxy']]).T

if 'CV' in Model:

    ## Add group factor interactions
    I = np.matrix([System2Fit['LogCV'] * System2Fit['Sii'],
                   System2Fit['LogCV'] * System2Fit['Sij'],
                   System2Fit['LogCV'] * System2Fit['Sjj']]).T
    X = np.concatenate((X, I), axis=1)

elif 'Group' in Model:

    ## Add group factor interactions
    I = np.matrix([System2Fit['Group'] * System2Fit['Sii'],
                   System2Fit['Group'] * System2Fit['Sij'],
                   System2Fit['Group'] * System2Fit['Sjj']]).T
    X = np.concatenate((X, I), axis=1)


# Compute variance-covariance matrix
C = Model2Fit.fit().cov_params().values

if 'Mixed' in Model:
    C_x = C[:-3,:-3]
else:
    C_x = C

# Plot regression result
Y_Fit = np.exp(Model2Fit.fit().fittedvalues.values)
Y_Obs = np.exp(System2Fit['LogSxy'])
SE = FitResults['SE'].loc[0]
R2 = FitResults['R2'].loc[0]
PlotRegressionResults(System2Fit,Y_Obs,Y_Fit,SE,R2,X,C_x)

