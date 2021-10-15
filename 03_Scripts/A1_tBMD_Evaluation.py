# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.formula.api as smf
from scipy.stats.distributions import norm, chi2, t, f
from scipy.stats import shapiro



desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)

## Define functions
def QQPlot(DataValues, Alpha_CI=0.95, DataLabel='Data', FigFile='QQPlot.png'):

    ### Based on: https://www.tjmahr.com/quantile-quantile-plots-from-scratch/
    ### Itself based on Fox book: Fox, J. (2015)
    ### Applied Regression Analysis and Generalized Linear Models.
    ### Sage Publications, Thousand Oaks, California.

    # Data analysis
    N = len(DataValues)
    X_Bar = np.mean(DataValues)
    S_X = np.std(DataValues,ddof=1)

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
    NormalIQR = np.sum(np.abs(norm.ppf(np.array([0.25, 0.75]), 0, 1)))
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
    plt.savefig(FigFile)
    plt.show()
    plt.close(Figure)

    return Variance
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
def PlotRegressionResults(Model, Data, Alpha=0.95, Random=True):

    ## Get data from the model
    Y_Obs = Model.model.endog
    Y_Fit = Model.fittedvalues
    if not Random:
        Y_Fit = Model.predict()
    N = int(Model.nobs)
    C = np.matrix(Model.cov_params())
    X = np.matrix(Model.model.exog)

    if not C.shape[0] == X.shape[1]:
        C = C[:-1,:-1]


    ## Compute R2 and standard error of the estimate
    E = Y_Obs - Y_Fit
    RSS = np.sum(E ** 2)
    SE = np.sqrt(RSS / Model.df_resid)
    TSS = np.sum((Model.model.endog - Model.model.endog.mean()) ** 2)
    RegSS = TSS - RSS
    R2 = RegSS / TSS

    ## Compute R2 adj and NE
    R2adj = 1 - RSS/TSS * (N-1)/(N-X.shape[1]-1)

    Line = Data['BVTV'] * Model.params['BVTV'] + Model.params['Intercept']

    B_0 = np.sqrt(np.diag(np.abs(X * C * X.T)))
    t_Alpha = t.interval(Alpha, N - X.shape[1] - 1)
    CI_Line_u = Line + t_Alpha[0] * SE * B_0
    CI_Line_o = Line + t_Alpha[1] * SE * B_0


    ## Plots
    DPI = 500
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=DPI)
    Axes.plot(Data['BVTV'], Data['tBMD'],
              linestyle='none', marker='o', color=(0, 0, 0), fillstyle='none', label='Data')
    Axes.plot(np.sort(Data['BVTV']), Line[Data['BVTV'].sort_values().index], linestyle='--', color=(1, 0, 0), label='Fit')
    Axes.plot(np.sort(Data['BVTV']), CI_Line_u[Data['BVTV'].sort_values().index], color=(0, 0, 1), linestyle='--', label= str(int(100*Alpha)) + '% CI')
    Axes.plot(np.sort(Data['BVTV']), CI_Line_o[Data['BVTV'].sort_values().index], color=(0, 0, 1), linestyle='--')
    Axes.set_xlabel('BV/TV (-)')
    Axes.set_ylabel('Tissue BMD (mgHA/cm$^3$)')
    plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15))
    plt.subplots_adjust(left=0.175)
    plt.show()
    plt.close(Figure)

    return R2adj, SE



# 01 Set paths
WorkingDirectory = os.getcwd()
OIDirectory = os.path.join(WorkingDirectory,'10_Additionnal/02_OI_BMD/02_ROIs/')
HealthyDirectory = os.path.join(WorkingDirectory,'10_Additionnal/01_Healthy_BMD/02_ROIs/')
ResultsDirectory = os.path.join(WorkingDirectory,'10_Additionnal/')


# 02 Load files
OI_Data = pd.read_csv(OIDirectory+'01_tBMD.csv')
Healthy_Data = pd.read_csv(HealthyDirectory+'01_tBMD.csv')


# 03 Histograms and kernel densities
X1 = Healthy_Data['Mean tBMD']
SortedValues1 = np.sort(X1.values)
N1 = len(X1)
X1_Bar = np.mean(X1)
S_X1 = np.std(X1, ddof=1)

X2 = OI_Data['Mean tBMD']
SortedValues2 = np.sort(X2.values)
N2 = len(X2)
X2_Bar = np.mean(X2)
S_X2 = np.std(X2, ddof=1)

## Kernel density estimation (Gaussian kernel)
NormalIQR = np.sum(np.abs(norm.ppf(np.array([0.25,0.75]), 0, 1)))

KernelEstimator1 = np.zeros(N1)
DataIQR1 = np.abs(X1.quantile(0.75)) - np.abs(X1.quantile(0.25))
KernelHalfWidth1 = 0.9*N1**(-1/5) * min(S_X1,DataIQR1/NormalIQR)
for Value in SortedValues1:
    KernelEstimator1 += norm.pdf(SortedValues1-Value,0,KernelHalfWidth1*2)
KernelEstimator1 = KernelEstimator1/KernelEstimator1.sum()

KernelEstimator2 = np.zeros(N2)
DataIQR2 = np.abs(X2.quantile(0.75)) - np.abs(X2.quantile(0.25))
KernelHalfWidth2 = 0.9*N2**(-1/5) * min(S_X2,DataIQR2/NormalIQR)
for Value in SortedValues2:
    KernelEstimator2 += norm.pdf(SortedValues2-Value,0,KernelHalfWidth2*2)
KernelEstimator2 = KernelEstimator2/KernelEstimator2.sum()

## Prepare histogram and store data
BinsValues = np.linspace(450,700,21)
Counts1, Bins = np.histogram(Healthy_Data['Mean tBMD'],BinsValues)
RelativeWeights1 = Counts1/Counts1.sum()
Counts2, Bins = np.histogram(OI_Data['Mean tBMD'],BinsValues)
RelativeWeights2 = Counts2/Counts2.sum()
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.hist(BinsValues[:-1], BinsValues, weights=RelativeWeights1,color=(0,0,1,0.5), edgecolor=(0,0,1,0.5),label='Healthy histogram')
Axes.hist(BinsValues[:-1], BinsValues, weights=RelativeWeights2,color=(1,0,0,0.5), edgecolor=(1,0,0,0.5),label='OI histogram')
Axes.plot(SortedValues1,KernelEstimator1*10,color=(0,0,1),label='Healthy kernel density')
Axes.plot(SortedValues2,KernelEstimator2*10,color=(1,0,0),label='OI kernel density')
Axes.set_xlim([450,700])
Axes.set_xlabel('Tissue BMD (mgHA/cm$^3$)')
Axes.set_ylabel('Relative density (-)')
plt.subplots_adjust(bottom=0.15,left=0.175)
plt.legend(loc='upper center',bbox_to_anchor=(0.5,1.25), ncol=2)
plt.subplots_adjust(top=0.8)
plt.show()
plt.close(Figure)


# 04 Check normality
x = Healthy_Data['Mean tBMD'].values
y = OI_Data['Mean tBMD'].values
QQPlot(x, Alpha_CI=0.95, DataLabel='Data', FigFile=HealthyDirectory+'02_QQPlot.png')
QQPlot(y, Alpha_CI=0.95, DataLabel='Data', FigFile=OIDirectory+'02_QQPlot.png')

W1, p1 = shapiro(SortedValues1)
print('Healthy Shapiro-Wilk test:')
print('Test statistics: %.3f'%W1)
print('p value        : %.3f'%p1)

W2, p2 = shapiro(SortedValues2)
print('OI Shapiro-Wilk test:')
print('Test statistics: %.3f'%W2)
print('p value        : %.3f'%p2)

if p1 > 5 / 100 and p2 > 5 / 100:
    Distributions = 'Normal'
    print('\nDistributions are normals')
    Test, pValue = BartlettTest(x, y)

else:
    Distributions = 'Not Normal'
    print('\nDistributions are not normals')
    Test, pValue = BrownForsytheTest(x, y)


if pValue > 5/100:

    print('Variances are equals')

    if Distributions == 'Normal':

        T, p, RejectionRange, MeansInterval = TwoSamples_tTest(x, y)

        print('\nHealthy group')
        print('Mean: ' + str(np.round(x.mean(), 3)))
        print('Std: ' + str(np.round(x.std(ddof=1), 3)))
        print('OI group')
        print('Mean: ' + str(np.round(y.mean(), 3)))
        print('Std: ' + str(np.round(y.std(ddof=1), 3)))
        print('\nt-test statistic results')
        print('p value: ' + str(np.round(p, 9)))
        print('95% CI means differences : ['
              + str(MeansInterval[0].round(3))
              + ','
              + str(MeansInterval[1].round(3)) + ']')

    elif Distributions == 'Not Normal':

        U, p = MannWhitneyUTest(x,y)

        print('\nHealthy group')
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
        print('\nMann-Whitney test statistic results')
        print('p value: ' + str(np.round(p, 9)))


BoxData = pd.concat([Healthy_Data['Mean tBMD'],OI_Data['Mean tBMD']],axis=1)
BoxData.columns = ['Healthy','OI']
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 3.5),dpi=100)
BoxData.boxplot(['Healthy','OI'],ax=Axes,grid=False,widths=(0.5,0.5),vert=False,
                    boxprops=dict(linestyle='-',color=(0,0,1)),
                    medianprops=dict(linestyle='-',color=(1,0,0)),
                    whiskerprops=dict(linestyle='--'))
Axes.set_xlabel('Tissue BMD (mgHA/cm$^3$)')
plt.subplots_adjust(bottom=0.2,left=0.15)
plt.show()
plt.close(Figure)



## BV/TV vs tBMD
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=500)
Axes.plot(Healthy_Data['BV/TV'],
          Healthy_Data['Mean tBMD'],
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='Healthy Data')
Axes.plot(OI_Data['BV/TV'],
          OI_Data['Mean tBMD'],
          linestyle='none',marker='^',color=(1,0,0),fillstyle='none',label='OI Data')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Tissue BMD (mgHA/cm$^3$)')
plt.legend(loc='upper center',ncol=2,bbox_to_anchor=(0.5,1.15))
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)


## Linear mixed-effect models
Healthy_Data.columns = ['tBMD', 'Scan', 'X Shift', 'Y Shift', 'Z Shift', 'BVTV']
Healthy_LM = smf.ols("tBMD ~ BVTV", data=Healthy_Data).fit()
Healthy_LMM = smf.mixedlm("tBMD ~ BVTV", data=Healthy_Data, groups=Healthy_Data['Scan']).fit(reml=True)

H_R2, H_SE = PlotRegressionResults(Healthy_LMM, Healthy_Data, Alpha=0.90, Random=False)

OI_Data.columns = ['tBMD', 'Scan', 'X Shift', 'Y Shift', 'Z Shift', 'BVTV']
OI_LM = smf.ols("tBMD ~ BVTV", data=OI_Data).fit()
OI_LMM = smf.mixedlm("tBMD ~ BVTV", data=OI_Data, groups=OI_Data['Scan']).fit(reml=True)

OI_R2, OI_SE = PlotRegressionResults(OI_LMM, OI_Data, Alpha=0.90, Random=False)


Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=500)
Axes.plot(Healthy_Data['BVTV'], Healthy_Data['tBMD'],
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='Healthy Data')
Axes.plot(OI_Data['BVTV'], OI_Data['tBMD'],
          linestyle='none',marker='^',color=(1,0,0),fillstyle='none',label='OI Data')
Axes.plot(np.sort(Healthy_Data['BVTV']),
          np.sort(Healthy_Data['BVTV']) * Healthy_LMM.params['BVTV'] + Healthy_LMM.params['Intercept'],
          linestyle='--',color=(0,0,1),label='Healthy Fit')
Axes.plot(np.sort(OI_Data['BVTV']),
          np.sort(OI_Data['BVTV']) * OI_LMM.params['BVTV'] + OI_LMM.params['Intercept'],
          linestyle='--',color=(1,0,0),label='OI Fit')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('TMD (mgHA/cm$^3$)')
plt.legend(loc='upper center',ncol=2,bbox_to_anchor=(0.5,1.25))
plt.subplots_adjust(left=0.175,top=0.8)
plt.show()
plt.close(Figure)


MeansInterval.sum()/2
Healthy_LMM.params['Intercept'] - OI_LMM.params['Intercept']

Healthy_LMM.conf_int()
OI_LMM.conf_int()


## Look at group influence
Healthy_Data['Group'] = -1
OI_Data['Group'] = 1
Data = Healthy_Data.append(OI_Data)
Data_LMM = smf.mixedlm("tBMD ~ BVTV + Group", data=Data, groups=Data['Scan']).fit(reml=True)
Data_LMM_2 = smf.mixedlm("tBMD ~ BVTV + Group + BVTV*Group", data=Data, groups=Data['Scan']).fit(reml=True)

HealthyFitLine = np.sort(Healthy_Data['BVTV']) * Data_LMM_2.params['BVTV'] \
                 + Data_LMM_2.params['Intercept'] \
                 + Healthy_Data['Group'] * Data_LMM_2.params['Group'] \
                 + np.sort(Healthy_Data['BVTV']) * Healthy_Data['Group'] * Data_LMM_2.params['BVTV:Group']

OIFitLine = np.sort(OI_Data['BVTV']) * Data_LMM_2.params['BVTV'] \
            + Data_LMM_2.params['Intercept'] \
            + OI_Data['Group'] * Data_LMM_2.params['Group'] \
            + np.sort(OI_Data['BVTV']) * OI_Data['Group'] * Data_LMM_2.params['BVTV:Group']

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=500)
Axes.plot(Healthy_Data['BVTV'], Healthy_Data['tBMD'],
          linestyle='none',marker='o',color=(0,0,1),fillstyle='none',label='Healthy Data')
Axes.plot(OI_Data['BVTV'], OI_Data['tBMD'],
          linestyle='none',marker='^',color=(1,0,0),fillstyle='none',label='OI Data')
Axes.plot(np.sort(Healthy_Data['BVTV']), HealthyFitLine,
          linestyle='--',color=(0,0,1),label='Healthy Fit')
Axes.plot(np.sort(OI_Data['BVTV']), OIFitLine,
          linestyle='--',color=(1,0,0),label='OI Fit')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('TMD (mgHA/cm$^3$)')
plt.legend(loc='upper center',ncol=2,bbox_to_anchor=(0.5,1.25))
plt.subplots_adjust(left=0.175,top=0.8)
plt.show()
plt.close(Figure)


## For review 01
Range = [min(OI_Data['BVTV'].min(),Healthy_Data['BVTV'].min()),
         max(OI_Data['BVTV'].max(),Healthy_Data['BVTV'].max())]
MidRange = np.mean(Range)

Healthy_MidTMD = MidRange * Data_LMM_2.params['BVTV'] \
                 + Data_LMM_2.params['Intercept'] \
                 + (-1) * Data_LMM_2.params['Group'] \
                 + MidRange * (-1) * Data_LMM_2.params['BVTV:Group']

OI_MidTMD = MidRange * Data_LMM_2.params['BVTV'] \
                 + Data_LMM_2.params['Intercept'] \
                 + 1 * Data_LMM_2.params['Group'] \
                 + MidRange * 1 * Data_LMM_2.params['BVTV:Group']
# Michi work
y1 = (-0.4 + (0.0011*Healthy_MidTMD))*1000
y2 = (-0.4 + (0.0011*OI_MidTMD))*1000
(y2-y1)/y1*100


Data_LMM.params
Data_LMM.conf_int(0.05)

R2, SE = PlotRegressionResults(Data_LMM, Data, Alpha=0.95, Random=False)


## ANCOVA
def ANCOVA(Data,Models,Random):

    ModelsResults = pd.DataFrame()
    for i in range(len(Models)):

        Model = Models[i]

        ## Get data from the model
        Y_Obs = Model.model.endog
        Y_Fit = Model.fittedvalues
        if not Random:
            Y_Fit = Model.predict()
        X = np.matrix(Model.model.exog)


        ## Compute R2 and standard error of the estimate
        E = Y_Obs - Y_Fit
        RSS = np.sum(E ** 2)
        SE = np.sqrt(RSS / Model.df_resid)
        TSS = np.sum((Model.model.endog - Model.model.endog.mean()) ** 2)
        RegSS = TSS - RSS
        R2 = RegSS / TSS

        ModelResults = {'Model': str(i + 1),
                        'Parameters n': X.shape[1],
                        'Regression SS': RegSS,
                        'Residual SS': RSS,
                        'df': X.shape[1] - 1,
                        'R2': round(R2, 3)}
        ModelsResults = ModelsResults.append(ModelResults, ignore_index=True)

    ANCOVA = pd.DataFrame()
    Models0 = np.array([1,2]) - 1
    Models1 = np.array([2,3]) - 1
    Sources = ['BV/TV x Group','Group']

    for i in range(len(Models0)):

        RegSS_Diff = abs(ModelsResults['Regression SS'].loc[Models0[i]] - ModelsResults['Regression SS'].loc[Models1[i]])
        df = ModelsResults['df'].loc[Models0[i]] - ModelsResults['df'].loc[Models1[i]]
        k = (len(Data) - ModelsResults['df'].loc[Models0[i]] - 1)
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

    return ModelsResults, ANCOVA

Data_LM_1 = smf.ols("tBMD ~ BVTV + Group + BVTV*Group", data=Data).fit()
Data_LM_2 = smf.ols("tBMD ~ BVTV + Group", data=Data).fit()
Data_LM_3 = smf.ols("tBMD ~ BVTV", data=Data).fit()

Models = [Data_LM_1,Data_LM_2,Data_LM_3]
ModelsResults, ANCOVATable = ANCOVA(Data,Models,Random=False)

Data_LMM_2 = smf.mixedlm("tBMD ~ BVTV + Group + BVTV*Group", data=Data, groups=Data['Scan']).fit(reml=True)
Data_LMM_2.params
Data_LMM_2.conf_int(0.05)
Data_LMM_2.summary()