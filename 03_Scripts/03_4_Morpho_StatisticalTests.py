# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats.distributions import norm, f, t, chi2
from scipy.stats import shapiro

desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)

## Define functions
def BartlettTest(x,y):

    # Analyze data
    k = 2
    Ni = np.array([len(x),len(y)])
    s_i = np.array([np.std(x,ddof=1),np.std(y,ddof=1)])

    N = Ni.sum()
    S_pool = 0
    for i in range(k):
        S_pool += (Ni[i] - 1) * s_i[i] ** 2
    S_pool = S_pool / (N-k)

    # Perform test statistics
    Numerator1 = (N-k) * np.log(S_pool)

    Numerator2 = 0
    for i in range(k):
        Numerator2 += (Ni[i] - 1) * np.log(s_i[i]**2)

    Denominator = 0
    for i in range(k):
        Denominator += 1/(Ni[i]-1)
    Denominator = (Denominator - 1/(N-k)) / (3*(k-1)) + 1

    X2 = (Numerator1 - Numerator2) / Denominator

    # Compute p value
    pValue = 1-chi2.cdf(X2,k-1)

    return  X2, pValue
def BrownForsytheTest(x, y):

    # Data analysis
    K = 2
    Ni = np.array([len(x),len(y)])
    N = Ni.sum()

    # Transform data
    Zi = np.abs(np.array([x-np.median(x),y-np.median(y)]))
    Z_Bar = np.concatenate([Zi[0],Zi[1]]).mean()
    Zj = np.array([Zi[0].mean(),Zi[1].mean()])

    # Compute test result
    Nominator, Denominator = 0, 0
    for i in range(K):
        Nominator += Ni[i] * (Zj[i]-Z_Bar) ** 2

        for j in range(Ni[i]):
            Denominator += (Zi[i][j]-Zj[i]) ** 2

    W =  (N-K)/(K-1) * Nominator/Denominator

    # Compute p value
    p = 1 - f.cdf(W,K-1,N-K)

    return W, p
def TwoSamples_tTest(x,y, SignificanceLevel=0.05):

    # Analyze data
    n = len(x)
    m = len(y)
    s_x = np.std(x,ddof=1)
    s_y = np.std(y,ddof=1)
    x_bar = np.mean(x)
    y_bar = np.mean(y)

    # Perform test statistic
    DOFs = n+m-2
    S_pool = np.sqrt(1/DOFs * ( (n-1)*s_x**2 + (m-1)*s_y**2 ))
    T = (x_bar - y_bar) / (S_pool * np.sqrt(1/n + 1/m))

    # Compute p value
    if T >= 0:
        p = 2 * (1-t.cdf(T,DOFs))
    else:
        p = 2 * t.cdf(T, DOFs)

    # Compute confidence interval CI
    T_Interval = np.array(t.interval(1-SignificanceLevel,DOFs))
    RejectionRange = np.array([[-np.inf,T_Interval[0]],[T_Interval[1],np.inf]])

    # Compute CI for difference in means
    MeansInterval =  (x_bar-y_bar) + T_Interval * S_pool * np.sqrt(1/n + 1/m)

    return T, p, RejectionRange, MeansInterval
def MannWhitneyUTest(x,y):

    Nx = len(x)
    Ny = len(y)

    XData = pd.DataFrame({'Values': x, 'Group': 'Control'}, index=range(len(x)))
    YData = pd.DataFrame({'Values': y, 'Group': 'Test'}, index=range(len(y)))

    Pool = XData.append(YData, ignore_index=True)
    Pool['Ranks'] = Pool['Values'].rank(method='average')

    R1 = Pool[Pool['Group']=='Control']['Ranks'].sum()
    U1 = R1 - (Nx * (Nx+1)) / 2
    U2 = Nx * Ny - U1

    U = max(U1, U2)

    UMean = Nx * Ny / 2
    UStd  = np.sqrt((Nx * Ny * (Nx + Ny + 1)) / 12)

    # Transform into the z space
    z = (U - UMean) / UStd
    p = 2 * (1 - norm.cdf(abs(z)))

    return U, p
def PermutationTest(x,y,NRepetition=0,SignificanceLevel=0.05,Variable='None'):

    if NRepetition == 0:
        NRepetition = len(x)*len(y)

    # Analyze data
    x_bar = np.mean(x)
    y_bar = np.mean(y)

    d = x_bar - y_bar

    XData = pd.DataFrame({'Values':x,'Group':'Control'},index=range(len(x)))
    YData = pd.DataFrame({'Values':y,'Group':'Test'},index=range(len(y)))

    Pool = XData.append(YData,ignore_index=True)
    N = len(Pool)

    D = np.zeros(NRepetition)
    for i in range(NRepetition):

        n = np.random.randint(1,N-1)

        SampleA = Pool.sample(n)
        SampleB = Pool.drop(SampleA.index)

        D[i] = SampleA['Values'].mean() - SampleB['Values'].mean()

    # Analyze distribution of D
    D.sort()
    D_bar = np.mean(D)
    S_D = np.std(D,ddof=1)
    N_D = len(D)

    # Kernel density estimation (Gaussian kernel)
    KernelEstimator = np.zeros(N_D)
    NormalIQR = np.abs(norm.interval(0.25,0,1)).sum()
    DataIQR = np.abs(np.quantile(D,0.75)) - np.abs(np.quantile(D,0.25))
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
    plt.xlabel('D values')
    plt.ylabel('Density (-)')
    plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15), prop={'size':10})
    plt.savefig(ResultFolder + Variable + '_PermutationDistribution.png')
    plt.show()
    plt.close(Figure)

    EmpiricalQuantiles = np.arange(0.5, N_D + 0.5) / N_D
    MinValue = np.quantile(D,SignificanceLevel / 2)
    MaxValue = np.quantile(D,1 - SignificanceLevel / 2)
    RejectionRange = np.array([[-np.inf,MinValue],[MaxValue,np.inf]])

    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Histogram = Axes.hist(D, density=True, bins=20, edgecolor=(0, 0, 1), color=(1, 1, 1), label='Histogram')
    Axes.fill_between([min(D),MinValue], [max(Histogram[0]),max(Histogram[0])], color=(0, 0, 0), alpha=0.1)
    Axes.fill_between([max(D),MaxValue], [max(Histogram[0]),max(Histogram[0])], color=(0, 0, 0), alpha=0.1, label='Rejection range')
    Axes.plot([d,d], [0,max(Histogram[0])], color=(1, 0, 0), label='Actual difference')
    plt.xlabel('D values')
    plt.ylabel('Density (-)')
    plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15), prop={'size':10})
    plt.savefig(ResultFolder + Variable + '_PermutationResults.png')
    plt.show()
    plt.close(Figure)

    p = len(D[abs(D)>=abs(d)]) / len(D)

    # Z = (D - D_bar) / S_D
    # z_d = (d - D_bar) / S_D
    # TheoreticalQuantiles = norm.cdf(Z)
    #
    # # Compute range of Z values
    # D_zmin = D_bar - 10 * S_D
    # D_zmax = D_bar + 10 * S_D
    #
    # Step = 0.001
    # x = np.arange(D.min(), D.max(), Step)  # range of x in spec
    # y = norm.pdf(x, D_bar, S_D)
    #
    # x_all = np.arange(D_zmin, D_zmax, Step)  # entire range of x, both in and out of spec
    # # y_all = norm.pdf(x_all, D_bar, S_D)
    #
    # x_all = np.arange(-10, 10, Step)  # entire range of x, both in and out of spec
    # y_all = norm.pdf(x_all, 0, 1)
    # y_d = norm.pdf(z_d, 0, 1)
    #
    # y_sorted = np.zeros(len(y_all))
    # y_sorted += y_all
    # y_sorted.sort()
    #
    # CI = 0.95
    # y_area = 0
    # i = 1
    # while y_area / y_all.sum() < CI:
    #     y_area += y_sorted[-i]
    #     i += 1
    # z_CI = i / 2 * Step
    #
    # # Entire range of x, both in and out of spec
    # x_CI = np.arange(-z_CI, z_CI, Step)
    # y_CI = norm.pdf(x_CI, 0, 1)
    #
    # # Plot in data space
    # Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    # Axes.fill_between(x_CI, y_CI, 0, alpha=0.15, color=(0, 0, 0), label=str(int(0.95 * 100)) + '% CI')
    # Axes.plot([z_d,z_d], [0,y_d], color=(0, 0, 1), label='Difference Observed')
    # Axes.plot(x_all, y_all, color=(1, 0, 0), label='Normal distribution')
    # Axes.set_xlabel('Z values')
    # # plt.xlim([D_bar - 4.2 * S_D, D_bar + 4.2 * S_D])
    # plt.xlim([-5, 5])
    # plt.ylim([0, 0.45])
    # plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15))
    # # plt.show()
    # plt.close()
    #
    # # Plot in data space
    # d_CI = (z_CI + D_bar) * S_D
    # dx_CI = np.arange(-d_CI, d_CI, Step)
    # dy_CI = norm.pdf(dx_CI, D_bar, S_D)
    # d_y = norm.pdf(d, D_bar, S_D)
    #
    # Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    # Axes.fill_between(dx_CI, dy_CI, 0, alpha=0.15, color=(0, 0, 0), label=str(int(0.95 * 100)) + '% CI')
    # Axes.plot([d, d], [0, d_y], color=(0, 0, 1), label='Difference Observed')
    # Axes.plot(D, TheoreticalDistribution, color=(1, 0, 0), label='Normal distribution')
    # Axes.set_xlabel('D values')
    # plt.ylim([0,max(TheoreticalDistribution)*1.05])
    # plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15))
    # plt.show()

    return d, RejectionRange, p


# 01 Set path
WorkingDirectory = os.getcwd()
ResultFolder = os.path.join(WorkingDirectory, '04_Results/03_Morphometry_Statistics/')
NormalityCheck = pd.read_csv(ResultFolder + '01_NormalityCheck.csv')
ControlData = pd.read_csv(ResultFolder + '00_Healthy_Data.csv')
OIData = pd.read_csv(ResultFolder + '00_OI_Data.csv')

StatisticalResults = pd.DataFrame()

Variables = NormalityCheck['Variable'].unique()
for Variable in Variables:

    Filter = NormalityCheck['Variable'] == Variable
    NormalityData = NormalityCheck[Filter]
    p_Control = NormalityData[NormalityData['Group']=='Healthy']['p value'].values
    p_Test = NormalityData[NormalityData['Group'] == 'OI']['p value'].values

    if Variable[:3] == 'Log':
        x = np.log(ControlData.groupby('Scan')[Variable[4:]].median().values)
        y = np.log(OIData.groupby('Scan')[Variable[4:]].median().values)
    else:
        x = ControlData.groupby('Scan')[Variable].median().values
        y = OIData.groupby('Scan')[Variable].median().values

    if p_Control > 2.45 / 100 and p_Test > 2.45 / 100:
        Distributions = 'Normal'
        Test, pValue = BartlettTest(x, y)

    else:
        Distributions = 'Not Normal'
        Test, pValue = BrownForsytheTest(x, y)

    if pValue > 5/100:
        Variances = 'Equal'

        if Distributions == 'Normal':
            StatisticalTest = 't-test'
            T, p, RejectionRange, MeansInterval = TwoSamples_tTest(x,y)

            print('\n\nVariable: ' + Variable)
            print('Healthy group')
            print('Mean: ' + str(np.round(x.mean(), 3)))
            print('Std: ' + str(np.round(x.std(ddof=1), 3)))
            print('OI group')
            print('Mean: ' + str(np.round(y.mean(), 3)))
            print('Std: ' + str(np.round(y.std(ddof=1), 3)))
            print('\n' + StatisticalTest + ' statistic results')
            print('p value: ' + str(np.round(p, 9)))
            print('95% CI means differences : ['
                  + str(MeansInterval[0].round(3))
                  + ','
                  + str(MeansInterval[1].round(3)) + ']')

        elif Distributions == 'Not Normal':
            StatisticalTest = 'Mann-Whitney test'
            U, p = MannWhitneyUTest(x,y)

            print('\n\nVariable: ' + Variable)
            print('Healthy group')
            print('Median: ' + str(np.median(x).round(3)))
            print('IQR: ['
                  + str(np.quantile(x, 0.25).round(3))
                  + ','
                  + str(np.quantile(x, 0.75).round(3)) + ']')
            print('OI group')
            print('Median: ' + str(np.median(y).round(3)))
            print('IQR: ['
                  + str(np.quantile(y, 0.25).round(3)) + ','
                  + str(np.quantile(y, 0.75).round(3)) + ']')
            print('\n' + StatisticalTest + ' statistic results')
            print('p value: ' + str(np.round(p, 9)))
    else:
        Variances = 'Not Equal'
        StatisticalTest = 'Permutation test'
        d, RejectionRange, p = PermutationTest(x,y,Variable=Variable)

        print('\n\nVariable: ' + Variable)
        print('Healthy group')
        print('Mean: ' + str(np.round(x.mean(), 3)))
        print('Std: ' + str(np.round(x.std(ddof=1), 3)))
        print('OI group')
        print('Mean: ' + str(np.round(y.mean(), 3)))
        print('Std: ' + str(np.round(y.std(ddof=1), 3)))
        print('\n' + StatisticalTest + ' statistic results')
        print('p value: ' + str(np.round(p, 9)))
        print('95% CI rejection range : ('
              + str(RejectionRange[0].round(3))
              + '] U ['
              + str(RejectionRange[1].round(3)) + ')')


    Results = {'Variable':Variable,
               'Variance p value':pValue,
               'Statistical Test':StatisticalTest,
               'p value':p}

    StatisticalResults = StatisticalResults.append(Results,ignore_index=True)

StatisticalResults.to_csv(ResultFolder + '02_StatisticalTests.csv',index=False)
print(StatisticalResults)