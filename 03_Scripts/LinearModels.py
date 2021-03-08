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
def ANCOVA(Models, ModelNames, ModelsType):

    ModelsResults = pd.DataFrame()

    for Model in Models:

        Index = list(Models).index(Model)

        ## Compute values for ANCOVA
        Y_Obs = Model.model.endog
        E = Model.resid.values
        RSS = np.sum(E ** 2)
        SE = np.sqrt(RSS / Model.df_resid)
        TSS = np.sum((Y_Obs - Y_Obs.mean()) ** 2)
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

    else:
        Models0 = [1]
        Models1 = [0]

    ## Build Analysis-of-Covariance table
    ANCOVATable = pd.DataFrame()
    for i in range(len(Models0)):

        RegSS_Diff = abs(ModelsResults['Regression SS'].loc[Models0[i]] - ModelsResults['Regression SS'].loc[Models1[i]])
        df = ModelsResults['df'].loc[Models0[i]] - ModelsResults['df'].loc[Models1[i]]
        k = (len(Y_Obs) - ModelsResults['df'].loc[Models0[i]] - 1)
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

    return ModelsResults[['Model', 'df', 'Regression SS', 'R2', 'SE']], \
           ANCOVATable[['Models contrasted','Sum of Squares','df','F','p']]
def PlotRegressionResults(Model, Data, PlotTypes=['BV/TV', 'DA', 'CV', 'Constants'], Alpha=0.95, Partial=False):

    ## Get data from the model
    Y_Obs = np.exp(Model.model.endog)
    Y_Fit = np.exp(Model.fittedvalues)
    if Partial:
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
    if 'BV/TV' in PlotTypes:
        Color = np.exp(Data['LogBVTV'].values)
        VMin = HealthyData['BV/TV'].min()
        VMax = HealthyData['BV/TV'].max()
        Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Scatter = Axes.scatter(Y_Obs, np.array(Y_Fit), c=Color, vmin=VMin, vmax=VMax, cmap='jet', marker='o')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + format(round(R2, 4), '.4f'), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + format(round(SE, 4), '.4f'), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$ (MPa)')
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
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + format(round(R2, 4), '.4f'), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + format(round(SE, 4), '.4f'), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_xlim([SMin, SMax])
        Axes.set_ylim([SMin, SMax])
        plt.xscale('log')
        plt.yscale('log')
        ColorBar = plt.colorbar(Scatter)
        ColorBar.ax.set_ylabel('Degree of Anisotropy (-)')
        plt.subplots_adjust(left=0.15, bottom=0.15)
        plt.show()

    if 'CV' in PlotTypes:
        Color = np.exp(Data['LogCV'].values)
        VMin = HealthyData['Variation Coefficient'].min()
        VMax = HealthyData['Variation Coefficient'].max()
        Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Scatter = Axes.scatter(Y_Obs, np.array(Y_Fit), c=Color, vmin=VMin, vmax=VMax, cmap='jet', marker='o')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + format(round(R2, 4), '.4f'), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + format(round(SE, 4), '.4f'), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_xlim([SMin, SMax])
        Axes.set_ylim([SMin, SMax])
        plt.xscale('log')
        plt.yscale('log')
        ColorBar = plt.colorbar(Scatter)
        ColorBar.ax.set_ylabel('Coefficient of Variation (-)')
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
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + format(round(R2, 4),'.4f'), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + format(round(SE, 4),'.4f'), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$')
        Axes.set_xlim([SMin, SMax])
        Axes.set_ylim([SMin, SMax])
        plt.xscale('log')
        plt.yscale('log')
        plt.legend(loc='upper left')
        plt.subplots_adjust(left=0.15, bottom=0.15)
        plt.show()

    return
def Get_MixedEffect_Parameters(Model, Alpha=0.95):

    # Get parameters from the summary table
    ParameterTables = Model.summary().tables[1]
    Parameters = ParameterTables[['Coef.','Std.Err.']].astype('float')

    # Get confidence intervals
    CI = pd.DataFrame(Model.conf_int(1-Alpha))
    CI.columns = ['2.5% CI', '97.5% CI']

    # Adjust variance of random parameters
    Scale = Model.scale
    for Sxy in ['IF']:
        CI.loc[Sxy + ' Var'] = CI.loc[Sxy + ' Var'] * Scale

    pValues = pd.DataFrame(Model.pvalues)
    pValues.columns = ['p value']

    ParametersDataFrame = pd.concat([Parameters, CI, pValues], axis=1)
    ParametersDataFrame = ParametersDataFrame.transpose()

    for Column in ['Sii','Sij','Sjj']:
        NewCol = 'Exp ' + Column
        ParametersDataFrame[NewCol] = np.exp(ParametersDataFrame[Column])

    return ParametersDataFrame
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
        MinValue = norm.ppf((1 - Alpha) / 2)
        MaxValue = norm.ppf(1 - (1 - Alpha) / 2)
        RejectionRange = np.array([[-np.inf, round(MinValue, 3)], [round(MaxValue, 3), np.inf]])

        Results = {'Test statistic': round(Z, 3),
                   'p value': round(p, 9),
                   'Significance level (%)': Alpha * 100,
                   'Rejection range': RejectionRange}

        ResultsTable = ResultsTable.append(Results, ignore_index=True)

        return ResultsTable
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
def PearsonFillerStandardError(N):
    Sz = 1. / np.sqrt(N - 3)
    return Sz
def PearsonCorrelation(x, y):
    Cov = Covariance(x, y)
    r = Cov / (x.std(ddof=1) * y.std(ddof=1))

    Z_f = FisherZTransformation(r)
    S_z = PearsonFillerStandardError(len(x))

    Z_CI = Z_f + 1.96 * np.array([S_z, -S_z])
    CI = (np.exp(2 * Z_CI) - 1) / (np.exp(2 * Z_CI) + 1)

    return r, CI
def PlotFilteredRegression(Model, CompleteData, PlotTypes=['BV/TV', 'DA', 'CV', 'Constants'], Alpha=0.95):

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

    ## Predict values for excluded data
    FilteredIndex = Model.model.data.orig_exog.index
    ExcludedData = pd.DataFrame()
    for Index in CompleteData.index:
        if Index not in FilteredIndex:
            ExcludedData = ExcludedData.append(CompleteData.loc[Index])

    Y_Predict = np.exp(Model.predict(ExcludedData))

    ## Plots
    DPI = 100
    SMax = max(HealthyData[Y_Elements].max()) * 5
    SMin = min(OIData[Y_Elements].min()) / 5
    if 'BV/TV' in PlotTypes:
        Color = np.exp(CompleteData.loc[FilteredIndex,'LogBVTV'].values)
        VMin = HealthyData['BV/TV'].min()
        VMax = HealthyData['BV/TV'].max()
        Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Scatter = Axes.scatter(Y_Obs, np.array(Y_Fit), c=Color, vmin=VMin, vmax=VMax, cmap='jet', marker='o')
        Axes.plot(np.exp(ExcludedData['LogSxy']),Y_Predict,linestyle='none',color=(0,0,0),marker='o',alpha=0.2, label='Excluded data')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + str(round(SE, 4)), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_xlim([SMin,SMax])
        Axes.set_ylim([SMin,SMax])
        plt.xscale('log')
        plt.yscale('log')
        ColorBar = plt.colorbar(Scatter)
        ColorBar.ax.set_ylabel('BV/TV (-)')
        plt.legend(loc='upper left')
        plt.subplots_adjust(left=0.15, bottom=0.15)
        plt.show()

    if 'DA' in PlotTypes:
        Color = np.exp(CompleteData.loc[FilteredIndex,'Logmxy'].values)
        Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Scatter = Axes.scatter(Y_Obs, np.array(Y_Fit), c=Color, cmap='jet', marker='o')
        Axes.plot(np.exp(ExcludedData['LogSxy']),Y_Predict,linestyle='none',color=(0,0,0),marker='o',alpha=0.2, label='Excluded data')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + str(round(SE, 4)), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_xlim([SMin, SMax])
        Axes.set_ylim([SMin, SMax])
        plt.xscale('log')
        plt.yscale('log')
        ColorBar = plt.colorbar(Scatter)
        ColorBar.ax.set_ylabel('Degree of Anisotropy (-)')
        plt.legend(loc='upper left')
        plt.subplots_adjust(left=0.15, bottom=0.15)
        plt.show()

    if 'CV' in PlotTypes:
        Color = np.exp(CompleteData.loc[FilteredIndex,'LogCV'].values)
        VMin = HealthyData['Variation Coefficient'].min()
        VMax = HealthyData['Variation Coefficient'].max()
        Figure, Axes = plt.subplots(1, 1, figsize=(6.5, 4.5), dpi=DPI, sharey=True, sharex=True)
        Scatter = Axes.scatter(Y_Obs, np.array(Y_Fit), c=Color, vmin=VMin, vmax=VMax, cmap='jet', marker='o')
        Axes.plot(np.exp(ExcludedData['LogSxy']),Y_Predict,linestyle='none',color=(0,0,0),marker='o',alpha=0.2, label='Excluded data')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + str(round(SE, 4)), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$ (MPa)')
        Axes.set_xlim([SMin, SMax])
        Axes.set_ylim([SMin, SMax])
        plt.xscale('log')
        plt.yscale('log')
        ColorBar = plt.colorbar(Scatter)
        ColorBar.ax.set_ylabel('Coefficient of Variation (-)')
        plt.legend(loc='upper left')
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
        Axes.plot(np.exp(ExcludedData['LogSxy']),Y_Predict,linestyle='none',color=(0,0,0),marker='o',alpha=0.2, label='Excluded data')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
        # Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
        Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
        Axes.annotate(r'$N$  : ' + str(len(Y_Obs)), xy=(0.7, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), xy=(0.7, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$SE$: ' + str(round(SE, 4)), xy=(0.7, 0.025), xycoords='axes fraction')
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$')
        Axes.set_xlim([SMin, SMax])
        Axes.set_ylim([SMin, SMax])
        plt.xscale('log')
        plt.yscale('log')
        plt.legend(loc='upper left')
        plt.subplots_adjust(left=0.15, bottom=0.15)
        plt.show()

    return



# 01 Set path and build data
WorkingDirectory = os.getcwd()
ResultsFolder = os.path.join(WorkingDirectory, '04_Results/02_General_LinearRegression/')

## Load data
HealthyData = pd.read_csv(ResultsFolder + '00_Healthy_StiffnessData.csv')
OIData = pd.read_csv(ResultsFolder + '00_OI_StiffnessData.csv')

## Set group to analyze
Group = 'Healthy'   # Healthy or OI

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
Healthy_Original_Model = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=HealthySystem).fit()
CV_Model = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1", data=System2Fit).fit()

## Mixed-effect linear models
Original_MixedModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"IF": "IF-1"}).fit()

CV_MixedModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1",
                         data=System2Fit, groups=System2Fit['Scan'],
                         vc_formula={"IF": "IF-1"}).fit()


# 04 Perform Analysis-of-Covariance
Standard_Models = [Original_Model,CV_Model]
Mixed_Models = [Original_MixedModel,CV_MixedModel]
ModelNames = ['Original', 'CV']

Results_Standard, ANCOVA_Standard = ANCOVA(Standard_Models,ModelNames,'Standard')
Results_Mixed, ANCOVA_Mixed = ANCOVA(Mixed_Models,ModelNames,'Mixed-Effect')


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

    ## Compute R2 and standard error of the estimate
    E = Model.resid.values
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / Model.df_resid)
    TSS = np.sum((Model.model.endog - Model.model.endog.mean()) ** 2)
    RegSS = TSS - RSS
    R2 = RegSS / TSS

    Table[['R2', 'SE']] = R2, SE

    ## Partial R2
    for Parameter in B.index:
        if 'Var' in Parameter:
            Y_Obs = np.exp(Model.model.endog)
            Y_Predict = np.exp(Model.predict())
            E_Predict = np.log(Y_Obs) - np.log(Y_Predict)
            RSS_Predict = np.sum(E_Predict ** 2)
            SE_Predict = np.sqrt(RSS_Predict / Model.df_resid)
            RegSS_Predict = TSS - RSS_Predict
            R2_Predict = RegSS_Predict / TSS

            Table[['Partial R2', 'Partial SE']] = R2_Predict, SE_Predict

    return Table
a = ComputeOriginalModelConstants(Original_Model)
b = ComputeOriginalModelConstants(Original_MixedModel)

# 05 Plot the results of the regression
PlotRegressionResults(Original_Model,System2Fit,['CV'])
PlotRegressionResults(Original_MixedModel,System2Fit,['Constants'])
PlotRegressionResults(Original_MixedModel,System2Fit,['Constants'],Partial=True)
PlotRegressionResults(CV_Model,System2Fit)
PlotRegressionResults(CV_MixedModel,System2Fit)

# 06 Analyze mixed model results
Original_MixedParameter = Get_MixedEffect_Parameters(Original_MixedModel)
CV_MixedParameter = Get_MixedEffect_Parameters(CV_MixedModel)

# 07 Compute filter parameters
HealthyData['LogCV'] = np.log(HealthyData['Variation Coefficient'])
HealthyData['LogBVTV'] = np.log(HealthyData['BV/TV'])
CVLim = HealthyData.quantile(0.75)['LogCV'] \
        + (HealthyData.quantile(0.75)['LogCV']
        - HealthyData.quantile(0.25)['LogCV']) * 1.5
BVTVLim =  HealthyData.quantile(0.25)['LogBVTV'] \
           - (HealthyData.quantile(0.75)['LogBVTV']
           - HealthyData.quantile(0.25)['LogBVTV']) * 1.5

## Plot filtering and compute correlation between variables
HealthyRho, HealthyCI = SpearmanCorrelation(HealthyData['BV/TV'],HealthyData['Variation Coefficient'])
HealthyText = r'$\rho$ = ' + str(round(HealthyRho,3)) + ' [' + str(round(HealthyCI[0],3)) + ' , ' + str(round(HealthyCI[1],3)) + ']'

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(HealthyData['BV/TV'],
          HealthyData['Variation Coefficient'],
          linestyle='none',marker='o',color=(0,0,0),fillstyle='none',label='Healthy Data')
Axes.plot([np.exp(BVTVLim),np.exp(BVTVLim)],[0,OIData['Variation Coefficient'].max()],color=(1,0,0),linestyle='--',label='ln(BV/TV) Healthy Outlier')
Axes.plot([OIData['BV/TV'].min(),HealthyData['BV/TV'].max()],[np.exp(CVLim),np.exp(CVLim)],color=(0,0,1),linestyle='--',label='ln(CV) Healthy Outlier')
Axes.annotate(HealthyText, xy=(0.25, 1.05), xycoords='axes fraction')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)

OIRho, OICI = SpearmanCorrelation(OIData['BV/TV'],OIData['Variation Coefficient'])
OIText = r'$\rho$ = ' + str(round(OIRho,3)) + ' [' + str(round(OICI[0],3)) + ' , ' + str(round(OICI[1],3)) + ']'

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(OIData['BV/TV'],
          OIData['Variation Coefficient'],
          linestyle='none',marker='o',color=(0,0,0),fillstyle='none',label='OI Data')
Axes.plot([np.exp(BVTVLim),np.exp(BVTVLim)],[0,OIData['Variation Coefficient'].max()],color=(1,0,0),linestyle='--',label='ln(BV/TV) Healthy Outlier')
Axes.plot([OIData['BV/TV'].min(),HealthyData['BV/TV'].max()],[np.exp(CVLim),np.exp(CVLim)],color=(0,0,1),linestyle='--',label='ln(CV) Healthy Outlier')
Axes.annotate(OIText, xy=(0.25, 1.05), xycoords='axes fraction')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)



# Compute R2 according to excluded ROI in function of its CV
SortedSystem = HealthySystem.sort_values(by='LogCV',ascending=False,ignore_index=True)
R2sAdj = pd.DataFrame()
for i in range(0,len(SortedSystem)-12,12):

    # Perform fit on filtered system
    FilteredSystem = SortedSystem.loc[i:].copy()
    LMM_Fit = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=FilteredSystem, groups=FilteredSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)

    ## Compute R2 and standard error of the estimate
    E = LMM_Fit.resid.values
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / LMM_Fit.df_resid)
    TSS = np.sum((LMM_Fit.model.endog - LMM_Fit.model.endog.mean()) ** 2)
    RegSS = TSS - RSS
    R2 = RegSS / TSS

    ## Compute R2 adj and NE
    N = LMM_Fit.nobs
    p = LMM_Fit.df_modelwc
    R2adj = 1 - RSS / TSS * (12 * N - 1) / (12 * N - p - 1)

    R2sAdj = R2sAdj.append({'CV':np.exp(FilteredSystem.loc[i,'LogCV']),'R2adj':R2adj},ignore_index=True)

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(R2sAdj['CV'],R2sAdj['R2adj'],marker='o',linestyle='none',fillstyle='none',color='k')
plt.xlabel('CV')
plt.ylabel('$R^2_{adj}$')
plt.xticks(rotation=90)
plt.subplots_adjust(bottom=0.3)
plt.show()
plt.close(Figure)

FilterR = R2sAdj['R2adj']<0.971
FilterCV = R2sAdj['CV']>0.2
R2sAdj[FilterR&FilterCV]

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(R2sAdj[FilterR&FilterCV]['CV'],R2sAdj[FilterR&FilterCV]['R2adj'],marker='o',linestyle='none',fillstyle='none',color='k')
Axes.plot([0.325,0.325],[0.968,0.9705],color='r')
plt.xlabel('CV')
plt.ylabel('$R^2_{adj}$')
plt.xlim([0.18,0.4])
plt.show()
plt.close(Figure)


Diffs = pd.DataFrame()
Indices = R2sAdj[FilterR&FilterCV].index
for i in range(len(Indices)-1):
    i1 = Indices[i]
    i2 = Indices[i+1]
    Diff = R2sAdj[FilterR&FilterCV].loc[i2] - R2sAdj[FilterR&FilterCV].loc[i1]
    Diffs = Diffs.append(Diff,ignore_index=True)

## Filter system and perform linear regressions again
CVFilter = System2Fit['LogCV'] < CVLim
BVTVFilter = System2Fit['LogBVTV'] > BVTVLim
FilteredSystem = System2Fit[BVTVFilter]

## Standard linear models
F_Original_Model = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=FilteredSystem).fit()
F_CV_Model = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1", data=FilteredSystem).fit()

## Mixed-effect linear models
F_Original_MixedModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=FilteredSystem, groups=FilteredSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit()
F_CV_MixedModel = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1",
                         data=FilteredSystem, groups=FilteredSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit()

## Perform Analysis-of-Covariance
F_Standard_Models = [F_Original_Model,F_CV_Model]
F_Mixed_Models = [F_Original_MixedModel,F_CV_MixedModel]
F_ModelNames = ['Filtered Original', 'Filtered CV']

F_Results_Standard, F_ANCOVA_Standard = ANCOVA(F_Standard_Models,F_ModelNames,'Standard')
F_Results_Mixed, F_ANCOVA_Mixed = ANCOVA(F_Mixed_Models,F_ModelNames,'Mixed-Effect')

## Plot the results of the regression
PlotRegressionResults(F_Original_Model,FilteredSystem,['BV/TV'])
PlotFilteredRegression(F_Original_Model,System2Fit,['BV/TV'])
PlotFilteredRegression(F_CV_Model,System2Fit,['Constants'])
PlotFilteredRegression(F_Original_MixedModel,System2Fit,['Constants'])
PlotFilteredRegression(F_CV_MixedModel,System2Fit,['Constants'])



# Inspect which ROI causes problems
Filtered_OI = OIData[OIData['Variation Coefficient'] < CVLim]
Filtered_OI['NE'] = F_OI_LMM_NE
Filtered_OI['ScanN'] = Filtered_OI['Scan']
for i in Filtered_OI.index:
    ScanN = Filtered_OI['Scan'].loc[i]
    Filtered_OI['ScanN'].loc[i] = ScanN[:6]

Figure, Axes = plt.subplots(1, 1, figsize=(11, 4.5), dpi=100)
Axes.plot(Filtered_OI['ScanN'],Filtered_OI['NE']*100,marker='o',linestyle='none',fillstyle='none',color='k')
plt.xlabel('Patient ID')
plt.ylabel('NE (%)')
plt.xticks(rotation=90)
plt.subplots_adjust(bottom=0.3)
plt.show()
plt.close(Figure)


SortedNE = Filtered_OI.sort_values(by='NE',ascending=False)
print(SortedNE.reset_index().loc[0])


Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(HealthyData['BV/TV'],
          HealthyData['Variation Coefficient'],
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='Healthy Data')
Axes.plot(OIData['BV/TV'],
          OIData['Variation Coefficient'],
          linestyle='none',marker='o',color=(1,0,0),fillstyle='none',label='OI Data')
Axes.plot([OIData['BV/TV'].min(),HealthyData['BV/TV'].max()],[CVLim,CVLim],color=(0,0,0),linestyle='--',label='Healthy CV Outlier Limit')
Axes.plot(OIData['BV/TV'].loc[Filtered_OI['NE'].idxmax()],
          OIData['Variation Coefficient'].loc[Filtered_OI['NE'].idxmax()],
          linestyle='none',marker='x',mew=2,color=(0,0,0),label='Unfiltered bad sample')
Axes.annotate(Text, xy=(0.25, 1.05), xycoords='axes fraction')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)



# 08 Analyze error corrected with CV
System2Fit['Residuals'] = Original_Model.resid
FilteredSystem['Residuals'] = F_Original_Model.resid

## Standard linear models
CV_Model_CVEffect = smf.ols("Residuals ~ LogCV - 1 ", data=System2Fit).fit()
F_CV_Model_CVEffect = smf.ols("Residuals ~ LogCV - 1", data=FilteredSystem).fit()
CVEffect_Models = [CV_Model_CVEffect,F_CV_Model_CVEffect]
Datasets = ['Complete','Filtered']
SystemFitted = [System2Fit,FilteredSystem]

## Analyze distribution of Ln(CV)
for i in range(2):
    D = SystemFitted[i]['LogCV'].values
    D.sort()
    D_bar = np.mean(D)
    S_D = np.std(D, ddof=1)
    N_D = len(D)

    ## Kernel density estimation (Gaussian kernel)
    KernelEstimator = np.zeros(N_D)
    NormalIQR = np.abs(norm.interval(0.25, 0, 1)).sum()
    DataIQR = np.abs(np.quantile(D, 0.75)) - np.abs(np.quantile(D, 0.25))
    KernelHalfWidth = 0.9 * N_D ** (-1 / 5) * S_D
    for Value in D:
        KernelEstimator += norm.pdf(D - Value, 0, KernelHalfWidth * 2)
    KernelEstimator = KernelEstimator / N_D

    ## Histogram and density distribution
    TheoreticalDistribution = norm.pdf(D, D_bar, S_D)
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Histogram = Axes.hist(D, density=True, bins=20, edgecolor=(0, 0, 1), color=(1, 1, 1), label='Histogram')
    Axes.plot(D, KernelEstimator, color=(1, 0, 0), label='Kernel Density')
    Axes.plot(D, TheoreticalDistribution, linestyle='--', color=(0, 0, 0), label='Normal Distribution')
    Axes.plot([D_bar-1.96*S_D,D_bar+1.96*S_D],[0.4,0.4],color=(0,1,0))
    plt.xlabel('D values')
    plt.ylabel('Density (-)')
    plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15), prop={'size': 10})
    plt.show()
    plt.close(Figure)

    ## Compute correction added with CV
    B_CVEffect = CVEffect_Models[i].params
    Exponent = B_CVEffect['LogCV']
    CVMin, CVMax = np.exp(D_bar + S_D*np.array(t.interval(0.95,N_D)))

    print('\n\n' + Datasets[i] + ' Data set')
    print('CV low: ' + str(round(CVMin**Exponent,3)))
    print('CV high: ' + str(round(CVMax ** Exponent,3)))
    print('Error factor: ' + str(round((CVMax/CVMin)**Exponent,3)))
