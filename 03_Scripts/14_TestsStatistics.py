# 00 Initialization
import os
import numpy as np
import pandas as pd
from scipy.stats import linregress
import matplotlib.pyplot as plt

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width, suppress=True, formatter={'float_kind': '{:f}'.format})
plt.rc('font', size=12)


## Define functions
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
    from scipy.stats.distributions import t
    if T >= 0:
        p = 2 * (1-t.cdf(T,DOFs))
    else:
        p = 2 * t.cdf(T, DOFs)

    # Compute confidence interval CI
    T_Interval = np.array(t.interval(1-SignificanceLevel/2,DOFs))

    # Compute CI for difference in means
    MeansInterval =  (x_bar-y_bar) + T_Interval * S_pool * np.sqrt(1/n + 1/m)

    return T, p, T_Interval, MeansInterval
def PermutationTest(x,y,NRepetition=len(x)*len(y),SignificanceLevel=0.05):

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
    from scipy.stats.distributions import norm
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


# 01 Load Data
WorkingDirectory = os.getcwd()
ResultFolder = os.path.join(WorkingDirectory, '04_Results/05_MatchedGroups')

ControlData = pd.read_csv(ResultFolder + '/00_Control_Data.csv')
TestData = pd.read_csv(ResultFolder + '/00_Test_Data.csv')

## Merge the two groups
Data = ControlData.append(TestData, ignore_index=True)

Groups = Data.Group.unique()
Variables = ['BVTV', 'DA', 'Variation Coefficient']
Labels = ['BV/TV (-)', 'Degree of anisotropy (-)', 'Coefficient of variation (-)']

Variable = Variables[1]
Label = Labels[Variables.index(Variable)]

GroupData = Data[Data.Group == Groups[0]]
x = GroupData.groupby('Scan')[Variable].median().values
GroupData = Data[Data.Group == Groups[1]]
y = GroupData.groupby('Scan')[Variable].median().values

if Variable == Variables[1] or Variable == Variables[2]:
    T, pValue, T_Interval, MeansInterval = TwoSamples_tTest(x,y)

if Variable == Variables[0]:
    from scipy.stats import brunnermunzel
    brunnermunzel(x,y)
