# 00 Initialization
import os
import numpy as np
import pandas as pd
from matplotlib.ticker import LogFormatter
import matplotlib.pyplot as plt
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
def ComputeCoefficients(X, Y, Alpha=0.95):

    # Solve using matrix computation
    LHS = X.T * X
    RHS = X.T * np.matrix(Y).T
    B = np.linalg.solve(LHS, RHS)
    print('\nBi coefficients:')
    print(B.round(6))

    # Compute residuals and goodness of fit
    E = np.matrix(Y).T - X * B
    E = np.array(E)[:, 0]
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / (N - X.shape[1]))
    TSS = np.sum((Y - Y.mean()) ** 2)
    RegSS = TSS - RSS
    R2 = RegSS / TSS

    # Covariance matrix and standard error of the coefficients
    C = np.linalg.inv(X.T * X)
    SE_B = SE * np.sqrt(np.matrix(np.abs(np.diag(C))).T)
    print('\nBi standard errors:')
    print(SE_B.round(6))

    # Build 95% CI for slopes
    t_Alpha = t.interval(Alpha, N - X.shape[1] - 1)

    B_CI = B + SE_B * np.array(t_Alpha)


    if X.shape[1] < 8:

        Mu0 = np.exp(B[2, 0])
        Lambda0p = np.exp(B[1, 0])
        Lambda0 = np.exp(B[0, 0]) - 2 * Mu0

        # Compute CI for lambda 0
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
    if X.shape[1] > 3:
        l = B[4, 0]
        k = B[3, 0]
        print('k: ' + str(round(k, 3)) +
              ' [' + str(round(B_CI[3, 0], 3)) + ' - ' +
              str(round(B_CI[3, 1], 3)) + ']')
        print('l: ' + str(round(l, 3)) +
              ' [' + str(round(B_CI[4, 0], 3)) + ' - ' +
              str(round(B_CI[4, 1], 3)) + ']')

    if X.shape[1] == 8:

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
            B_CI_Comb[i] += np.array(B[Combination[0]] + B[Combination[1]] + SE_B_Comb[i] * np.array(t_Alpha))[0]

        Mu0 = np.exp(B[2, 0] - B[7, 0])
        Lambda0p = np.exp(B[1, 0] - B[6, 0])
        Lambda0 = np.exp(B[0, 0] - B[5, 0]) - 2 * Mu0

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
            B_CI_Comb[i] += np.array(B[Combination[0]] - B[Combination[1]] + SE_B_Comb[i] * np.array(t_Alpha))[0]

        Mu0 = np.exp(B[2, 0] + B[7, 0])
        Lambda0p = np.exp(B[1, 0] + B[6, 0])
        Lambda0 = np.exp(B[0, 0] + B[5, 0]) - 2 * Mu0

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

    elif X.shape[1] == 11:

        Combinations = [[1, 6, 9], [2, 7, 10]]

        # Compute CI for combination of parameters
        SE_B_Comb = np.zeros(len(Combinations))
        B_CI_Comb = np.zeros((len(Combinations), 2))

        for i in range(len(Combinations)):
            Combination = Combinations[i]
            C_add = 0
            for j in Combination:
                C_add += C[j, j]
            SE_B_Comb[i] += SE * np.sqrt(C_add)
            B_CI_Comb[i] += np.array(B[Combination[0]] +
                                     B[Combination[1]] +
                                     B[Combination[2]] +
                                     SE_B_Comb[i] * np.array(t_Alpha))[0]

        Mu0 = np.exp(B[2, 0] + (-1)*B[7, 0] + X[:,10].mean() * B[10,0])
        Lambda0p = np.exp(B[1, 0] + (-1)*B[6, 0] + X[:,9].mean() * B[9,0])
        Lambda0 = np.exp(B[0, 0] + (-1)*B[5, 0] + X[:,8].mean() * B[8,0]) - 2 * Mu0

        # Compute CI for lambda 0
        C_add = np.abs(C[0, 0]) + np.abs(C[2, 2]) + \
                np.abs(C[5, 5]) + np.abs(C[7, 7]) + \
                np.abs(C[8, 8]) + np.abs(C[10, 10])
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
        SE_B_Comb = np.zeros(len(Combinations))
        B_CI_Comb = np.zeros((len(Combinations), 2))

        for i in range(len(Combinations)):
            Combination = Combinations[i]
            C_add = 0
            for j in Combination:
                C_add += C[j, j]
            SE_B_Comb[i] += SE * np.sqrt(C_add)
            B_CI_Comb[i] += np.array(B[Combination[0]] -
                                     B[Combination[1]] -
                                     B[Combination[2]] + SE_B_Comb[i] * np.array(t_Alpha))[0]

        Mu0 = np.exp(B[2, 0] + (+1) * B[7, 0] + X[:, 10].mean() * B[10, 0])
        Lambda0p = np.exp(B[1, 0] + (+1) * B[6, 0] + X[:, 9].mean() * B[9, 0])
        Lambda0 = np.exp(B[0, 0] + (+1) * B[5, 0] + X[:, 8].mean() * B[8, 0]) - 2 * Mu0

        # Compute CI for lambda 0
        C_add = np.abs(C[0, 0]) + np.abs(C[2, 2]) + \
                np.abs(C[5, 5]) + np.abs(C[7, 7]) + \
                np.abs(C[8, 8]) + np.abs(C[10, 10])
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

    elif X.shape[1] == 12:

        Combinations = [[1, 6, 9], [2, 7, 10]]

        # Compute CI for combination of parameters
        SE_B_Comb = np.zeros(len(Combinations))
        B_CI_Comb = np.zeros((len(Combinations), 2))

        for i in range(len(Combinations)):
            Combination = Combinations[i]
            C_add = 0
            for j in Combination:
                C_add += C[j, j]
            SE_B_Comb[i] += SE * np.sqrt(C_add)
            B_CI_Comb[i] += np.array(B[Combination[0]] +
                                     B[Combination[1]] +
                                     B[Combination[2]] +
                                     SE_B_Comb[i] * np.array(t_Alpha))[0]

        Mu0 = np.exp(B[2, 0] + (-1) * B[7, 0] + X[:, 10].mean() * B[10, 0])
        Lambda0p = np.exp(B[1, 0] + (-1) * B[6, 0] + X[:, 9].mean() * B[9, 0])
        Lambda0 = np.exp(B[0, 0] + (-1) * B[5, 0] + X[:, 8].mean() * B[8, 0]) - 2 * Mu0

        # Compute CI for lambda 0
        C_add = np.abs(C[0, 0]) + np.abs(C[2, 2]) + \
                np.abs(C[5, 5]) + np.abs(C[7, 7]) + \
                np.abs(C[8, 8]) + np.abs(C[10, 10])
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
        SE_B_Comb = np.zeros(len(Combinations))
        B_CI_Comb = np.zeros((len(Combinations), 2))

        for i in range(len(Combinations)):
            Combination = Combinations[i]
            C_add = 0
            for j in Combination:
                C_add += C[j, j]
            SE_B_Comb[i] += SE * np.sqrt(C_add)
            B_CI_Comb[i] += np.array(B[Combination[0]] -
                                     B[Combination[1]] -
                                     B[Combination[2]] + SE_B_Comb[i] * np.array(t_Alpha))[0]

        Mu0 = np.exp(B[2, 0] + (+1) * B[7, 0] + X[:, 10].mean() * B[10, 0])
        Lambda0p = np.exp(B[1, 0] + (+1) * B[6, 0] + X[:, 9].mean() * B[9, 0])
        Lambda0 = np.exp(B[0, 0] + (+1) * B[5, 0] + X[:, 8].mean() * B[8, 0]) - 2 * Mu0

        # Compute CI for lambda 0
        C_add = np.abs(C[0, 0]) + np.abs(C[2, 2]) + \
                np.abs(C[5, 5]) + np.abs(C[7, 7]) + \
                np.abs(C[8, 8]) + np.abs(C[10, 10])
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

    return B, SE_B, B_CI, SE, R2
def PlotRegressionResults(X, B, Data, Y, Alpha=0.95):

    # Compute sum of square
    E = np.matrix(np.log(Data[Y])).T - X * B
    E = np.array(E)[:, 0]
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / (N - X.shape[1]))

    # Compute quality of fit
    TSS = np.sum((np.log(Data[Y]) - np.log(Data[Y]).mean()) ** 2)
    RegSS = TSS - RSS
    R2 = RegSS / TSS

    # Compute variance-covariance matrix
    C = np.linalg.inv(X.T * X)

    # Plot regression result
    Y_Fit = np.exp(np.array(X * B)[:, 0])
    Line = np.linspace(min(Data[Y].min(), Y_Fit.min()),
                       max(Data[Y].max(), Y_Fit.max()), len(Data[Y]))

    B_0 = np.sqrt(np.diag(np.abs(X * C * X.T)))
    t_Alpha = t.interval(Alpha, N - X.shape[1] - 1)
    CI_Line_u = Line + t_Alpha[0] * np.exp(SE) * np.exp(B_0)
    CI_Line_o = Line + t_Alpha[1] * np.exp(SE) * np.exp(B_0)

    Sii = Y_Fit * np.array(X[:, 0].T)[0]
    Sij = Y_Fit * np.array(X[:, 1].T)[0]
    Sjj = Y_Fit * np.array(X[:, 2].T)[0]

    ## Plots
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=500, sharey=True, sharex=True)
    Axes.plot(Data[Y], Sii,
              color=(0, 0, 1), linestyle='none', marker='o', label=r'$\lambda_{ii}$')
    Axes.plot(Data[Y], Sij,
              color=(0, 1, 0), linestyle='none', marker='o', label=r'$\lambda_{ij}$')
    Axes.plot(Data[Y], Sjj,
              color=(1, 0, 0), linestyle='none', marker='o', label=r'$\mu_{ij}$')
    Axes.plot(np.sort(Line), np.sort(CI_Line_u), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(np.sort(Line), np.sort(CI_Line_o), color=(0.4, 0.4, 0.4), linestyle='--')
    Axes.plot(Line, Line, color=(0, 0, 0), linestyle='--')
    Axes.annotate(r'N: ' + str(len(Data)), (10 ** 3, 20 ** 1))
    Axes.annotate(r'$R^2$: ' + str(round(R2, 4)), (10 ** 3, 10 ** 1))
    Axes.set_xlabel('Observed $\mathbb{S}_{xy}$')
    Axes.set_ylabel(r'Fitted $\mathbb{S}_{xy}$')
    plt.xscale('log')
    plt.yscale('log')
    plt.legend(loc='upper left')
    plt.show()

    Indices = Data[Data['Group'] == 'Control'].index
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=500, sharey=True, sharex=True)
    Axes.plot(Data[Y], Y_Fit, alpha=0.1,
              color=(0, 0, 0), linestyle='none', marker='o')
    Axes.plot(Data[Y][Indices], Sii[:len(Indices)],
              color=(0, 0, 1), linestyle='none', marker='o', label=r'$\lambda_{ii}$')
    Axes.plot(Data[Y][Indices], Sij[:len(Indices)],
              color=(0, 1, 0), linestyle='none', marker='o', label=r'$\lambda_{ij}$')
    Axes.plot(Data[Y][Indices], Sjj[:len(Indices)],
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

    Indices = Data[Data['Group'] == 'Test'].index
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100, sharey=True, sharex=True)
    Axes.plot(Data[Y], Y_Fit, alpha=0.1,
              color=(0, 0, 0), linestyle='none', marker='o')
    Axes.plot(Data[Y][Indices], Sii[-len(Indices):],
              color=(0, 0, 1), linestyle='none', marker='o', label=r'$\lambda_{ii}$')
    Axes.plot(Data[Y][Indices], Sij[-len(Indices):],
              color=(0, 1, 0), linestyle='none', marker='o', label=r'$\lambda_{ij}$')
    Axes.plot(Data[Y][Indices], Sjj[-len(Indices):],
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
Data = pd.read_csv(ResultFolder + '/Data.csv')

# 02 Build Data for Linear regression
New = 'No'     # If set to 'Yes' reBuild the regression data, else use the existing

if New == 'Yes':
    Columns = Data.columns
    Y = Columns[-12:]
    Yf = [1,1,1,1,1,1,1,1,1,0.5,0.5,0.5]
    m = Columns[4:7]
    k = [0,0,0,1,1,1,2,2,2,1,2,0]
    l = [0,1,2,0,1,2,0,1,2,2,0,1]
    Sii = [1,0,0,0,1,0,0,0,1,0,0,0]
    Sij = [0,1,1,1,0,1,1,1,0,0,0,0]
    Sjj = [0,0,0,0,0,0,0,0,0,1,1,1]

    RegressionData = pd.DataFrame()
    for i in Data.index:
        for j in range(12):
            DataLine = {'Subject id':Data.loc[i,'Scan'],
                        'Sample':Data.loc[i,'ROI Number'],
                        'Sxy':Data.loc[i,Y[j]],
                        'BVTV':Data.loc[i,'BVTV'],
                        'mxy':Data.loc[i,m[k[j]]] * Data.loc[i,m[l[j]]],
                        'Sii':Sii[j],
                        'Sij':Sij[j],
                        'Sjj':Sjj[j],
                        'CV':Data.loc[i,'Variation Coefficient'],
                        'OI Type':Data.loc[i,'OI Type'],
                        'Group':Data.loc[i,'Group']}
            RegressionData = RegressionData.append(DataLine,ignore_index=True)
    RegressionData = RegressionData.astype({'Sii': int,
                                            'Sij': int,
                                            'Sjj': int,
                                            'Sample': int})

    ## Add deviation regressor Sg
    RegressionData['Sg'] = RegressionData['Group']
    RegressionData['Sg'] = RegressionData['Sg'].replace('Test',1)
    RegressionData['Sg'] = RegressionData['Sg'].replace('Control',-1)
else:
    RegressionData = pd.read_csv(ResultFolder + '/RegressionData.csv')


# 02 Define filter parameter
ControlData = Data[Data['Group']=='Control']
TestData = Data[Data['Group']=='Test']

Threshold = (ControlData.quantile(0.75)['Variation Coefficient']
             - ControlData.quantile(0.25)['Variation Coefficient']) * 1.5 \
             + ControlData.quantile(0.75)['Variation Coefficient']
MinBVTV = 0.1/3*2

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(TestData['BVTV'],TestData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(0, 0, 1),label='Test')
Axes.plot(ControlData['BVTV'],ControlData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0),label='Control')
Axes.plot([MinBVTV,MinBVTV],[0,Data['Variation Coefficient'].max()], linestyle='--', color=(0.4, 0.4, 0.4),
          label='Windowing [' + str(round(MinBVTV,3)) + r', $\infty$)')
Axes.plot([0,Data['BVTV'].max()],[Threshold,Threshold], linestyle='dashdot', color=(0, 0, 0),
          label='Threshold: ' + str(round(Threshold,2)))
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right')
plt.show()
plt.close(Figure)



# 03 Filter data
CVFilter = RegressionData['CV'] < Threshold
Windowing = RegressionData['BVTV'] > MinBVTV
FilteredData = RegressionData[CVFilter&Windowing]



# 04 Set the linear regression parameters
Y = 'Sxy'
X1, X2, X3 = 'Sii', 'Sij', 'Sjj'
X4, X5 = 'BVTV', 'mxy'
N = len(FilteredData)



# 05 Build Matrices for computation
X_o = np.matrix([FilteredData[X1],
                 FilteredData[X2],
                 FilteredData[X3],
                 np.log(FilteredData[X4]),
                 np.log(FilteredData[X5])]).T

## Add group factor interactions
I = np.matrix([FilteredData['Sg'] * FilteredData[X1],
               FilteredData['Sg'] * FilteredData[X2],
               FilteredData['Sg'] * FilteredData[X3],
               np.log(FilteredData['CV']) * FilteredData[X1],
               np.log(FilteredData['CV']) * FilteredData[X2],
               np.log(FilteredData['CV']) * FilteredData[X3],
               FilteredData['Sg'] * np.log(FilteredData['CV'])]).T
X = np.concatenate((X_o,I),axis=1)

## Check for collinearity
Model = [X1, X2, X3, X4, X5,
         'Sg x Sii', 'Sg x Sij', 'Sg x Sjj',
         'CV X Sii', 'CV X Sij', 'CV x Sjj',
         'Sg x CV']
print('\nCheck for collinearity...')
VIF = np.zeros((X.shape[1],X.shape[1]))
for i in range(X.shape[1]):
    for j in range(i):
        X1_s = np.array(X[:,i] - X[:,i].mean())[:,0]
        X2_s = np.array(X[:,j] - X[:,j].mean())[:,0]
        r12 = np.sum(X1_s*X2_s) / np.sqrt(np.sum(X1_s**2)*np.sum(X2_s**2))
        VIF[i,j] = 1 / (1-r12**2)
Collinearities = np.nonzero(np.sqrt(VIF)>2)
print('\nHigh collinearity for:')
for i in range(len(Collinearities[0])):
    print(str(Model[Collinearities[0][i]]) +
          ' and ' +
          str(Model[Collinearities[1][i]]) +
          ' -> sqrt(VIF): ' +
          str(np.sqrt(VIF[Collinearities[0][i],Collinearities[1][i]]).round(1)))

## Compute coefficients
B, SE_B, B_CI, SE, R2 = ComputeCoefficients(X,np.log(FilteredData[Y]))

## Plot regression results
PlotRegressionResults(X,B,FilteredData,Y)



# 06 Compute effect display for group by CV interaction
Sg_Values = np.array(['Healthy','OI'])
CV_Values = np.linspace(FilteredData['CV'].min(),FilteredData['CV'].max(),20)
X_0 = np.zeros((len(Sg_Values) * len(CV_Values), X.shape[1]))
X_0[:,:] = np.mean(X,axis=0)
X_05 = np.tile([-1,1],len(CV_Values))
for i in range(3):
    X_0[:,5+i] = X_05 * X_0[:,i]
X_09 = np.repeat(np.log(CV_Values),len(Sg_Values))
for i in range(3):
    X_0[:,8+i] = X_09 * X_0[:,i]
X_0[:,11] =  X_05 * X_09

X_0 = np.matrix(X_0)
C = np.linalg.inv(X.T*X)
b_0 = np.sqrt(np.diag(np.abs(X_0*C*X_0.T)))

Line = np.array(X_0 * B)[:,0]

Alpha = 0.95
t_Alpha = t.interval(Alpha, N - X.shape[1] - 1)
CI_Line_u = Line + t_Alpha[0] * SE * b_0
CI_Line_o = Line + t_Alpha[1] * SE * b_0

## Plot effect display
Locations = ['lower left', 'upper left']
Figure, Axes = plt.subplots(1,1*2,figsize=(5.5*2,4.5),dpi=100*2,sharey=True,sharex=True)
for i in range(2):
    Axes[i].plot(CV_Values, np.exp(Line[i::2]), color=(1, 0, 0), linestyle='--',label='Regression line')
    Axes[i].plot(CV_Values, np.exp(CI_Line_u[i::2]), color=(0, 0, 1), linestyle='--')
    Axes[i].plot(CV_Values, np.exp(CI_Line_o[i::2]), color=(0, 0, 1), linestyle='--',label='95% CI')
    Axes[i].set_title(Sg_Values[i])
    Axes[i].set_xlabel('Variation coefficient')
    Axes[i].legend(loc=Locations[i])
    Axes[i].set_xscale('log')
    Axes[i].set_xticks([6E-2,1E-1,4E-1])
    Axes[i].set_xticklabels([6E-2, 1E-1, 4E-1])
Axes[0].set_ylabel(Y)
plt.show()



# 07 Prepare Analysis-of-Covariance (ANCOVA)
ModelsResults = pd.DataFrame()

## Models
Xs = [X[:,:5],
      X[:,:8],
      np.concatenate([X[:,:5],X[:,8:]],axis=1),
      X,
      np.concatenate([X,np.matrix(FilteredData['Sg']*np.log(FilteredData['CV'])).T],axis=1)]
for i in range(len(Xs)):
    # Solve using matrix computation
    LHS = Xs[i].T * Xs[i]
    RHS = Xs[i].T * np.matrix(np.log(FilteredData[Y])).T
    B = np.linalg.solve(LHS, RHS)

    # Compute residuals and goodness of fit
    E = np.matrix(np.log(FilteredData[Y])).T - Xs[i] * B
    E = np.array(E)[:, 0]
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / (N - Xs[i].shape[1]))
    TSS = np.sum((np.log(FilteredData[Y]) - np.log(FilteredData[Y]).mean()) ** 2)
    RegSS = TSS - RSS
    r2 = RegSS / TSS

    ModelResults = {'Model':str(i+1),
                    'Parameters n':len(B),
                    'Regression SS':RegSS,
                    'Residual SS':RSS,
                    'df':len(B)-1,
                    'R2':round(r2,3)}
    ModelsResults = ModelsResults.append(ModelResults,ignore_index=True)



# 08 Build Analysis-of-Covariance table
from scipy.stats.distributions import f

ANCOVA = pd.DataFrame()
Models0 = np.array([2,3,4,4,5]) - 1
Models1 = np.array([1,1,2,3,4]) - 1
Sources = ['Group x Stiffness constants','CV x Stiffness constants','CV x Stiffness constants','Group x Stiffness constants','Group x CV']

for i in range(len(Models0)):

    RegSS_Diff = abs(ModelsResults['Regression SS'].loc[Models0[i]] - ModelsResults['Regression SS'].loc[Models1[i]])
    df = ModelsResults['df'].loc[Models0[i]] - ModelsResults['df'].loc[Models1[i]]
    k = (len(FilteredData) - ModelsResults['df'].loc[Models0[i]] - 1)
    F_0 = RegSS_Diff / df * k / ModelsResults['Residual SS'].loc[Models0[i]]
    pValue = f.sf(F_0, df, k)

    ANCOVALine = {'Source':Sources[i],
                 'Models contrasted':str(Models0[i] + 1) + ' - ' + str(Models1[i] + 1),
                 'Sum of Squares':RegSS_Diff,
                 'df':df,
                 'F':F_0,
                 'p':pValue}
    ANCOVA = ANCOVA.append(ANCOVALine,ignore_index=True)
print(ANCOVA[['Source','Models contrasted','Sum of Squares','df','F','p']])



# 09 Compute constants for specific model
CData = FilteredData
X_o = np.matrix([CData[X1],
                 CData[X2],
                 CData[X3],
                 np.log(CData[X4]),
                 np.log(CData[X5])]).T

# Add group factor interactions
Ii = np.matrix([CData['Sg'] * CData[X1],
                CData['Sg'] * CData[X2],
                CData['Sg'] * CData[X3],
                np.log(CData['CV']) * CData[X1],
                np.log(CData['CV']) * CData[X2],
                np.log(CData['CV']) * CData[X3],
                CData['Sg'] * np.log(CData['CV'])]).T
Xi = np.concatenate((X_o,Ii[:,:]),axis=1)
Xi = X_o

YData = np.log(CData[Y]) - np.array(X_o[:,-2:] * np.matrix([1.898,0.949]).T)[:,0]
YData = np.log(CData[Y])
## Compute coefficients
B, SE_B, B_CI, SE, R2 = ComputeCoefficients(Xi,YData)

