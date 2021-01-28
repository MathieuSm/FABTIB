# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm
import statsmodels.formula.api as smf
from scipy.stats.distributions import t
from scipy.stats.distributions import norm


desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)

## Define functions
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
def ComputeCoefficients(B, B_CI, C, N, GroupMeans, Alpha=0.95):

    l = B[4]
    k = B[3]
    Mu0 = np.exp(B[2])
    Lambda0p = np.exp(B[1])
    Lambda0 = np.exp(B[0]) - 2 * Mu0

    # Compute CI for lambda 0
    t_Alpha = t.interval(Alpha, N - 12 - 1)

    RSS = np.sum(Model_Fit.resid.values ** 2)
    SE = np.sqrt(RSS / (N - 12))

    C_add = np.abs(C[0, 0]) + np.abs(C[2, 2])
    SE_L0 = SE * np.sqrt(C_add)
    L0_CI = np.log(Lambda0) + SE_L0 * np.array(t_Alpha)

    print('\n Mean constants:')
    print('Lambda0: ' + str(int(round(Lambda0, 0))) +
          ' [' + str(int(round(np.exp(L0_CI[0]), 0))) + ' - ' +
          str(int(round(np.exp(L0_CI[1]), 0))) + ']')
    print('Lambda0p: ' + str(int(round(Lambda0p, 0))) +
          ' [' + str(int(round(np.exp(B_CI[1, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI[1, 1]), 0))) + ']')
    print('Mu0: ' + str(int(round(Mu0, 0))) +
          ' [' + str(int(round(np.exp(B_CI[2, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI[2, 1]), 0))) + ']')
    print('k: ' + str(round(k, 3)) +
          ' [' + str(round(B_CI[3, 0], 3)) + ' - ' +
          str(round(B_CI[3, 1], 3)) + ']')
    print('l: ' + str(round(l, 3)) +
          ' [' + str(round(B_CI[4, 0], 3)) + ' - ' +
          str(round(B_CI[4, 1], 3)) + ']')



    # Compute CI for combination of parameters
    Combinations = [[1, 6], [2, 7]]
    SE_B_Comb = np.zeros(len(Combinations))
    B_CI_Comb = np.zeros((len(Combinations), 2))

    for i in range(len(Combinations)):
        Combination = Combinations[i]
        C_add = 0
        for j in Combination:
            C_add += C[j, j]
        SE_B_Comb[i] += SE * np.sqrt(C_add)
        B_CI_Comb[i] += np.array(B[Combination[0]] +
                                 GroupMeans[2] * B[Combination[1]] +
                                 SE_B_Comb[i] * np.array(t_Alpha))

    Mu0 = np.exp(B[2] + GroupMeans[2] * B[7])
    Lambda0p = np.exp(B[1] + GroupMeans[2] * B[6])
    Lambda0 = np.exp(B[0] + GroupMeans[2] * B[5]) - 2 * Mu0

    # Compute CI for lambda 0
    C_add = np.abs(C[0, 0]) + np.abs(C[2, 2]) + np.abs(C[5, 5]) + np.abs(C[7, 7])
    SE_L0 = SE * np.sqrt(C_add)
    L0_CI = np.log(Lambda0) + SE_L0 * np.array(t_Alpha)

    print('\n Mean constants:')
    print('Lambda0: ' + str(int(round(Lambda0, 0))) +
          ' [' + str(int(round(np.exp(L0_CI[0]), 0))) + ' - ' +
          str(int(round(np.exp(L0_CI[1]), 0))) + ']')
    print('Lambda0p: ' + str(int(round(Lambda0p, 0))) +
          ' [' + str(int(round(np.exp(B_CI_Comb[0, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI_Comb[0, 1]), 0))) + ']')
    print('Mu0: ' + str(int(round(Mu0, 0))) +
          ' [' + str(int(round(np.exp(B_CI_Comb[1, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI_Comb[1, 1]), 0))) + ']')
    print('k: ' + str(round(k, 3)) +
          ' [' + str(round(B_CI[3, 0], 3)) + ' - ' +
          str(round(B_CI[3, 1], 3)) + ']')
    print('l: ' + str(round(l, 3)) +
          ' [' + str(round(B_CI[4, 0], 3)) + ' - ' +
          str(round(B_CI[4, 1], 3)) + ']')





    # Compute CI for combination of parameters
    Combinations = [[1, 6], [2, 7]]
    SE_B_Comb = np.zeros(len(Combinations))
    B_CI_Comb = np.zeros((len(Combinations), 2))

    for i in range(len(Combinations)):
        Combination = Combinations[i]
        C_add = 0
        for j in Combination:
            C_add += C[j, j]
        SE_B_Comb[i] += SE * np.sqrt(C_add)
        B_CI_Comb[i] += np.array(B[Combination[0]] +
                                 GroupMeans[0] * B[Combination[1]] +
                                 SE_B_Comb[i] * np.array(t_Alpha))

    Mu0 = np.exp(B[2] + GroupMeans[0] * B[7])
    Lambda0p = np.exp(B[1] + GroupMeans[0] * B[6])
    Lambda0 = np.exp(B[0] + GroupMeans[0] * B[5]) - 2 * Mu0

    # Compute CI for lambda 0
    C_add = np.abs(C[0, 0]) + np.abs(C[2, 2]) + np.abs(C[5, 5]) + np.abs(C[7, 7])
    SE_L0 = SE * np.sqrt(C_add)
    L0_CI = np.log(Lambda0) + SE_L0 * np.array(t_Alpha)

    print('\n Healthy constants:')
    print('Lambda0: ' + str(int(round(Lambda0, 0))) +
          ' [' + str(int(round(np.exp(L0_CI[0]), 0))) + ' - ' +
          str(int(round(np.exp(L0_CI[1]), 0))) + ']')
    print('Lambda0p: ' + str(int(round(Lambda0p, 0))) +
          ' [' + str(int(round(np.exp(B_CI_Comb[0, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI_Comb[0, 1]), 0))) + ']')
    print('Mu0: ' + str(int(round(Mu0, 0))) +
          ' [' + str(int(round(np.exp(B_CI_Comb[1, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI_Comb[1, 1]), 0))) + ']')
    print('k: ' + str(round(k, 3)) +
          ' [' + str(round(B_CI[3, 0], 3)) + ' - ' +
          str(round(B_CI[3, 1], 3)) + ']')
    print('l: ' + str(round(l, 3)) +
          ' [' + str(round(B_CI[4, 0], 3)) + ' - ' +
          str(round(B_CI[4, 1], 3)) + ']')

    # Compute CI for combination of parameters
    Combinations = [[1, 6], [2, 7]]
    SE_B_Comb = np.zeros(len(Combinations))
    B_CI_Comb = np.zeros((len(Combinations), 2))

    for i in range(len(Combinations)):
        Combination = Combinations[i]
        C_add = 0
        for j in Combination:
            C_add += C[j, j]
        SE_B_Comb[i] += SE * np.sqrt(C_add)
        B_CI_Comb[i] += np.array(B[Combination[0]] +
                                 GroupMeans[1] * B[Combination[1]] +
                                 SE_B_Comb[i] * np.array(t_Alpha))

    Mu0 = np.exp(B[2] + GroupMeans[1] * B[7])
    Lambda0p = np.exp(B[1] + GroupMeans[1] * B[6])
    Lambda0 = np.exp(B[0] + GroupMeans[1] * B[5]) - 2 * Mu0

    # Compute CI for lambda 0
    C_add = np.abs(C[0, 0]) + np.abs(C[2, 2]) + np.abs(C[5, 5]) + np.abs(C[7, 7])
    SE_L0 = SE * np.sqrt(C_add)
    L0_CI = np.log(Lambda0) + SE_L0 * np.array(t_Alpha)

    print('\n OI constants:')
    print('Lambda0: ' + str(int(round(Lambda0, 0))) +
          ' [' + str(int(round(np.exp(L0_CI[0]), 0))) + ' - ' +
          str(int(round(np.exp(L0_CI[1]), 0))) + ']')
    print('Lambda0p: ' + str(int(round(Lambda0p, 0))) +
          ' [' + str(int(round(np.exp(B_CI_Comb[0, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI_Comb[0, 1]), 0))) + ']')
    print('Mu0: ' + str(int(round(Mu0, 0))) +
          ' [' + str(int(round(np.exp(B_CI_Comb[1, 0]), 0))) + ' - ' +
          str(int(round(np.exp(B_CI_Comb[1, 1]), 0))) + ']')
    print('k: ' + str(round(k, 3)) +
          ' [' + str(round(B_CI[3, 0], 3)) + ' - ' +
          str(round(B_CI[3, 1], 3)) + ']')
    print('l: ' + str(round(l, 3)) +
          ' [' + str(round(B_CI[4, 0], 3)) + ' - ' +
          str(round(B_CI[4, 1], 3)) + ']')

    return
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
    Axes.annotate(r'N: ' + str(len(Y_Obs)), (3*10 ** 2, 3*10 ** -1))
    Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), (3*10 ** 2, 1.5 * 10 ** -1))
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
    Axes.set_ylabel(r'Fitted $\mathbb{S}_{xy}$')
    plt.xscale('log')
    plt.yscale('log')
    plt.ylim([10**-1, 6*10**3])
    plt.legend(loc='upper left')
    plt.show()

    Indices = Data[Data['Group'] == 'Control'].index
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
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
    Axes.set_ylabel(r'Fitted $\mathbb{S}_{xy}$')
    plt.xscale('log')
    plt.yscale('log')
    plt.ylim([10 ** -1, 6 * 10 ** 3])
    plt.legend(loc='upper left')
    plt.show()

    Indices = Data[Data['Group'] == 'Test'].index
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
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
    Axes.set_ylabel(r'Fitted $\mathbb{S}_{xy}$')
    plt.xscale('log')
    plt.yscale('log')
    plt.legend(loc='upper left')
    plt.show()

    return

# 01 Load Data
WorkingDirectory = os.getcwd()
ResultFolder = os.path.join(WorkingDirectory, '04_Results/06_ANCOVA')
Data = pd.read_csv(ResultFolder + '/RegressionData.csv')

# 02 Set the linear regression parameters (log transformation)
for i in ['Sxy','BVTV','mxy','CV']:
    Name = 'Log' + i
    Data[Name] = np.log(Data[i])

# 03 Define filter parameter
ControlData = Data[Data['Group']=='Control']
Threshold = (ControlData.quantile(0.75)['CV']
             - ControlData.quantile(0.25)['CV']) * 1.5 \
             + ControlData.quantile(0.75)['CV']
MinBVTV = 0.1/3*2


# 04 Filter data
CVFilter = Data['CV'] < Threshold
Windowing = Data['BVTV'] > MinBVTV
FilteredData = Data[Windowing]
FilteredData = Data


# 05 Build and fit the model
Model = smf.mixedlm("LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV:(Sii+Sij+Sjj) -1",
                    data=FilteredData, groups=FilteredData['Subject id'],
                    vc_formula = {"Sii" : "Sii-1","Sij" : "Sij-1","Sjj" : "Sjj-1"})

Model_Fit = Model.fit()
print(Model_Fit.summary())

# 06 Verify residuals
QQPlot(Model_Fit.resid.values)

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(np.exp(Model_Fit.fittedvalues),Model_Fit.resid, linestyle='none', marker='o', fillstyle='none', color=(0, 0, 0))
Axes.set_xlabel('Fitted values')
Axes.set_ylabel('Residuals')
Axes.set_xscale('log')
plt.show()
plt.close(Figure)


# 07 Compute values
B = Model_Fit.fe_params
B_CI = Model_Fit.conf_int().values
C = Model_Fit.cov_params().values
N = len(FilteredData)

Control_Mean = FilteredData[FilteredData['Group']=='Control']['LogCV'].mean()
Test_Mean = FilteredData[FilteredData['Group']=='Test']['LogCV'].mean()
GroupMeans = [Control_Mean,Test_Mean,FilteredData['LogCV'].mean()]

ComputeCoefficients(B,B_CI,C,N,GroupMeans)


# 08 Compute R2
E = Model_Fit.resid.values
RSS = np.sum(E ** 2)
SE = np.sqrt(RSS / (N - len(B)))
TSS = np.sum((FilteredData['LogSxy'] - FilteredData['LogSxy'].mean()) ** 2)
RegSS = TSS - RSS
R2 = RegSS / TSS
print('R2: ' + str(round(R2,4)))
print('Standard error of the estimate: ' + str(round(SE,4)))


# 05 Build Matrices for computation
X_o = np.matrix([FilteredData['Sii'],
                 FilteredData['Sij'],
                 FilteredData['Sjj'],
                 FilteredData['LogBVTV'],
                 FilteredData['Logmxy']]).T

## Add group factor interactions
I = np.matrix([FilteredData['LogCV'] * FilteredData['Sii'],
               FilteredData['LogCV'] * FilteredData['Sij'],
               FilteredData['LogCV'] * FilteredData['Sjj']]).T
X = np.concatenate((X_o,I),axis=1)

# Compute variance-covariance matrix
C = Model_Fit.cov_params().values
C_x = np.matrix(C[:-3,:-3])

# Plot regression result
Y_Fit = np.exp(Model_Fit.fittedvalues.values)
Y_Obs = FilteredData['Sxy']
PlotRegressionResults(FilteredData,Y_Obs,Y_Fit,SE,R2,X,C_x)
