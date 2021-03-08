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
        Axes.annotate(r'$N$   : ' + str(len(Y_Obs)), xy=(0.65, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2_{ajd}$: ' + format(round(R2adj, 3), '.3f'), xy=(0.65, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$NE$ : ' + format(round(NE.mean(), 2), '.2f') + '$\pm$' + format(round(NE.std(), 2), '.2f'),
                      xy=(0.65, 0.025), xycoords='axes fraction')
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
        Axes.annotate(r'$N$   : ' + str(len(Y_Obs)), xy=(0.65, 0.175), xycoords='axes fraction')
        Axes.annotate(r'$R^2_{ajd}$: ' + format(round(R2adj, 3), '.3f'), xy=(0.65, 0.1), xycoords='axes fraction')
        Axes.annotate(r'$NE$ : ' + format(round(NE.mean(), 2), '.2f') + '$\pm$' + format(round(NE.std(), 2), '.2f'),
                      xy=(0.65, 0.025), xycoords='axes fraction')
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
        Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
        Axes.set_ylabel('Fitted $\mathbb{S}_{xy}$')
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

# 01 Set paths
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory, '04_Results/04_General_LinearRegression/')
MatchingFolder = os.path.join(WorkingDirectory,'04_Results/05_Variables_Matching')
ResultsFolder = os.path.join(WorkingDirectory,'04_Results/06_MatchedROI_LinearRegression/')


# 02 Load Data
HealthyData = pd.read_csv(DataFolder + '00_Healthy_StiffnessData.csv')
OIData = pd.read_csv(DataFolder + '00_OI_StiffnessData.csv')
Matched_Healthy = pd.read_csv(os.path.join(MatchingFolder,'01_Matched_Healthy.csv'))
Matched_OI = pd.read_csv(os.path.join(MatchingFolder,'01_Matched_OI.csv'))

## Filter to keep only matched ROIs
Filtered_Healthy = pd.DataFrame()
Filtered_OI = pd.DataFrame()

for Index in Matched_Healthy.index:

    ROINumber = Matched_Healthy.loc[Index,'ROI Number']
    Scan = Matched_Healthy.loc[Index, 'Scan']

    Filter1 = HealthyData['ROI Number'].astype('int') == ROINumber
    Filter2 = HealthyData['Scan'] == Scan

    StiffnessData = HealthyData[Filter1 & Filter2]

    Filtered_Healthy = Filtered_Healthy.append(StiffnessData,ignore_index=True)

for Index in Matched_OI.index:

    ROINumber = Matched_OI.loc[Index, 'ROI Number']
    Scan = Matched_OI.loc[Index, 'Scan']

    Filter1 = OIData['ROI Number'].astype('int') == ROINumber
    Filter2 = OIData['Scan'] == Scan

    StiffnessData = OIData[Filter1 & Filter2]

    if not StiffnessData['BV/TV'].values[0] == Matched_OI['BV/TV'].loc[Index]:
        print(Index)

    Filtered_OI = Filtered_OI.append(StiffnessData, ignore_index=True)

## Add group variable and append data
Filtered_Healthy['Group'] = -1
Filtered_OI['Group'] = 1

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(Filtered_Healthy['BV/TV'],
          Filtered_Healthy['m3']/Filtered_Healthy['m1'],
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='Healthy Data')
Axes.plot(Filtered_OI['BV/TV'],
          Filtered_OI['m3']/Filtered_OI['m1'],
          linestyle='none',marker='o',color=(1,0,0),fillstyle='none',label='OI Data')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Degree of Anisotropy (-)')
plt.legend(loc='upper center',bbox_to_anchor=(0.5,1.15),ncol=2)
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)

Data = Filtered_Healthy.append(Filtered_OI,ignore_index=True)


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
    Group = pd.DataFrame({'Group': np.repeat(Data['Group'].loc[Index], len(y_i))})

    LinearSystem = LinearSystem.append(pd.concat([y,X,Scan,Group],axis=1),ignore_index=True)
LinearSystem['IF'] = 1.0

# 03 Build linear models
GroupedSystem = LinearSystem.copy()
HealthySystem = GroupedSystem[GroupedSystem['Group']==-1].copy()
OISystem = GroupedSystem[GroupedSystem['Group']==1].copy()

## Standard linear models
Grouped_LM = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=GroupedSystem).fit()
Healthy_LM = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=HealthySystem).fit()
OI_LM = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1", data=OISystem).fit()


## Linear mixed-effect models
Grouped_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=GroupedSystem, groups=GroupedSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)
Healthy_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=HealthySystem, groups=HealthySystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)
OI_LMM = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1",
                         data=OISystem, groups=OISystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)

## Likelihood ratio test
Grouped_p = LikelihoodRatioTest(Grouped_LM,Grouped_LMM,1)
print('p value of LRT for grouped data: ' + str(Grouped_p))
Healthy_p = LikelihoodRatioTest(Healthy_LM,Healthy_LMM,1)
print('p value of LRT for healthy group: ' + str(Healthy_p))
OI_p = LikelihoodRatioTest(OI_LM,OI_LMM,1)
print('p value of LRT for OI group: ' + str(OI_p))


# 05 Plot the results of the regression
G_LMM_R2adj, G_LMM_NE = PlotRegressionResults(Grouped_LMM,GroupedSystem,['Constants'],Random=False)
H_LMM_R2adj, H_LMM_NE = PlotRegressionResults(Healthy_LMM,HealthySystem,['Constants'],Random=False)
OI_LMM_R2adj, OI_LMM_NE = PlotRegressionResults(OI_LMM,OISystem,['Constants'],Random=False)


# 06 Compute values for locked k and l (comparison)
k_Group, l_Group = Grouped_LMM.params[['LogBVTV','Logmxy']]
GroupedSystem['Group_Sxy'] = GroupedSystem['LogSxy'] - (GroupedSystem['LogBVTV'] * k_Group + GroupedSystem['Logmxy'] * l_Group)
HealthySystem['Group_Sxy'] = HealthySystem['LogSxy'] - (HealthySystem['LogBVTV'] * k_Group + HealthySystem['Logmxy'] * l_Group)
OISystem['Group_Sxy'] = OISystem['LogSxy'] - (OISystem['LogBVTV'] * k_Group + OISystem['Logmxy'] * l_Group)


## Linear mixed-effect models
Healthy_kl_LMM = smf.mixedlm("Group_Sxy ~ Sii + Sij + Sjj - 1",
                         data=HealthySystem, groups=HealthySystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)
OI_kl_LMM = smf.mixedlm("Group_Sxy ~ Sii + Sij + Sjj - 1",
                         data=OISystem, groups=OISystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)



# 07 Compute model constants
Grouped_LMM_Table = ComputeLMConstants(Grouped_LMM)
Healthy_kl_LMM_Table = ComputeLMConstants(Healthy_kl_LMM, k=k_Group, l=l_Group)
OI_kl_LMM_Table = ComputeLMConstants(OI_kl_LMM, k=k_Group, l=l_Group)

## Plot comparison
V_Grouped = Grouped_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0]
E_Grouped = np.zeros((2,3))
E_Grouped[0,:] = Grouped_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0].values - \
                 Grouped_LMM_Table[['Lambda0 CI','Lambda0p CI','Mu0 CI']].loc[0].values
E_Grouped[1,:] = Grouped_LMM_Table[['Lambda0 CI','Lambda0p CI','Mu0 CI']].loc[1].values - \
                 Grouped_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0].values


V_Healthy = Healthy_kl_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0]
E_Healthy = np.zeros((2,3))
E_Healthy[0,:] = Healthy_kl_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0].values - \
                 Healthy_kl_LMM_Table[['Lambda0 CI','Lambda0p CI','Mu0 CI']].loc[0].values
E_Healthy[1,:] = Healthy_kl_LMM_Table[['Lambda0 CI','Lambda0p CI','Mu0 CI']].loc[1].values - \
                 Healthy_kl_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0].values

V_OI = OI_kl_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0]
E_OI = np.zeros((2,3))
E_OI[0,:] = OI_kl_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0].values - \
            OI_kl_LMM_Table[['Lambda0 CI','Lambda0p CI','Mu0 CI']].loc[0].values
E_OI[1,:] = OI_kl_LMM_Table[['Lambda0 CI','Lambda0p CI','Mu0 CI']].loc[1].values - \
            OI_kl_LMM_Table[['Lambda0','Lambda0p','Mu0']].loc[0].values



Variables = ['$\lambda_0$','$\lambda_0$\'','$\mu_0$']
Figure, Axes = plt.subplots(1, 3, figsize=(15, 4.5),dpi=100)
for i in range(3):
    Axes[i].errorbar(np.array([1]),V_Grouped[i],E_Grouped[:,0].reshape(2,1),linestyle='none',marker='o',color=(0,1,0),label='Grouped')
    Axes[i].errorbar(np.array([1])-0.05,V_Healthy[i],E_Healthy[:,0].reshape(2,1),linestyle='none',marker='o',color=(0,0,1),label='Healthy')
    Axes[i].errorbar(np.array([1])+0.05,V_OI[i],E_OI[:,0].reshape(2,1),linestyle='none',marker='o',color=(1,0,0),label='OI')
    Axes[i].set_xlim([0.9,1.1])
    Axes[i].set_xticks([])
    Axes[i].set_xlabel(Variables[i] + ' (MPa)')
    if i == 1:
        Axes[i].legend(loc='upper center', bbox_to_anchor=(0.5, 1.15), ncol=3)
plt.show()
plt.close(Figure)

## Write latex table
TableName = 'LMM_Comparison.tex'
TableCaption = 'Linear mixed-effects models - constants comparison'
TableResults = [Grouped_LMM_Table,Healthy_kl_LMM_Table,OI_kl_LMM_Table]
DataSets = ['Grouped','Healthy','OI']

WriteLatexTable(TableName,TableCaption,TableResults, DataSets, FixedEffectOnly=False)



# 08 Test for group significance
Grouped_LM_G = smf.ols("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + Group - 1", data=GroupedSystem).fit()
Grouped_LMM_G = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + Group - 1",
                         data=GroupedSystem, groups=GroupedSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)

## Perform Analysis-of-Covariance
Standard_Models = [Grouped_LM,Grouped_LM_G]
Mixed_Models = [Grouped_LMM,Grouped_LMM_G]
ModelNames = ['Original', 'Group']

Results_Standard, ANCOVA_Standard = ANCOVA(Standard_Models,ModelNames,'Standard')
Results_Mixed, ANCOVA_Mixed = ANCOVA(Mixed_Models,ModelNames,'Mixed-Effect')



# 09 Compare with literature
k_Gross, l_Gross = 1.6, 0.99
GroupedSystem['Gross_Sxy'] = GroupedSystem['LogSxy'] - (GroupedSystem['LogBVTV'] * k_Gross + GroupedSystem['Logmxy'] * l_Gross)

k_Panya, l_Panya = 1.55, 0.84
GroupedSystem['Panya_Sxy'] = GroupedSystem['LogSxy'] - (GroupedSystem['LogBVTV'] * k_Panya + GroupedSystem['Logmxy'] * l_Panya)

Gross_LMM = smf.mixedlm("Gross_Sxy ~ Sii + Sij + Sjj - 1",
                         data=GroupedSystem, groups=GroupedSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)
Panya_LMM = smf.mixedlm("Panya_Sxy ~ Sii + Sij + Sjj - 1",
                         data=GroupedSystem, groups=GroupedSystem['Scan'],
                         vc_formula={"IF": "IF-1"}).fit(reml=True)

## Compute model parameters
Gross_LMM_Table = ComputeLMConstants(Gross_LMM, k=k_Gross, l=l_Gross)
Panya_LMM_Table = ComputeLMConstants(Panya_LMM, k=k_Panya, l=l_Panya)


## Write latex table
TableName = 'Literature_Comparison.tex'
TableCaption = 'Linear mixed-effects models - constants comparison'
TableResults = [Gross_LMM_Table,Panya_LMM_Table]
DataSets = ['Gross','Panyasantisuk']

WriteLatexTable(TableName,TableCaption,TableResults, DataSets, FixedEffectOnly=False)



