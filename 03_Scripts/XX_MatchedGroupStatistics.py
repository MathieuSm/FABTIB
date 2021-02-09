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
def NormalProbabilityDistribution(x,u=0,s=1):
    f = 1/(s*np.sqrt(2*np.pi)) * np.exp(-1/2 * ((x-u)/s)**2)
    return f
def ErrorFunction(x,N=100):

    ### Compute error function as Maclaurin series:
    ### https://mathworld.wolfram.com/Erf.html

    Ef_x = np.zeros(len(x))

    for i in range(len(x)):

        erf = 0
        for n in range(N):
            erf += (-1)**n * ( x[i] ** (2*n+1) ) / (np.math.factorial(n) * (2*n+1))
        erf = 2/np.sqrt(np.pi) * erf

        Ef_x[i] = erf

    return Ef_x
def InverseErrorFunction(x,N=100):

    ### Compute inverse error function as Maclaurin series:
    ### https://mathworld.wolfram.com/InverseErf.html

    InvEf_x = np.zeros(len(x))

    for i in range(len(x)):

        inv_erf = 0
        c = np.ones(N)

        for k in range(N):

            if k > 1:
                c[k] = 0

                for m in range(k - 1 + 1):
                    c[k] += (c[m] * c[k - 1 - m]) / ((m + 1) * (2 * m + 1))

            inv_erf += (c[k] / (2 * k + 1)) * (x[i] * np.sqrt(np.pi) / 2) ** (2 * k + 1)

        InvEf_x[i] = inv_erf

    return InvEf_x
def NormalCDF(x,u=0,s=1):

    ### Compute theoretical CDF for a Gaussian distribution:
    ### https://mathworld.wolfram.com/DistributionFunction.html

    CDF = 1/2 * (1+ErrorFunction((x-u)/(s*np.sqrt(2))))

    return CDF
def NormalQuantile(p,u=0,s=1):

    z_p = u + s * np.sqrt(2) * InverseErrorFunction(2*p-1)

    return z_p
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
    TheoreticalQuantiles = NormalQuantile(EmpiricalQuantiles, X_Bar, S_X)
    ZQuantiles = NormalQuantile(EmpiricalQuantiles,0,1)

    # Compute data variance
    DataIQR = np.quantile(DataValues, 0.75) - np.quantile(DataValues, 0.25)
    NormalIQR = np.sum(np.abs(NormalQuantile(np.array([0.25, 0.75]), 0, 1)))
    Variance = DataIQR / NormalIQR
    Z_Space = np.linspace(min(ZQuantiles), max(ZQuantiles), 100)
    Variance_Line = Z_Space * Variance + np.median(DataValues)

    # Compute alpha confidence interval (CI)
    Z_SE = np.sqrt(NormalCDF(Z_Space) * (1 - NormalCDF(Z_Space)) / N) / NormalProbabilityDistribution(Z_Space)
    Data_SE = Z_SE * Variance
    Z_CI_Quantile = NormalQuantile(np.array([(1 - Alpha_CI) / 2]), 0, 1)

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
def Covariance(x,y):

    if not len(x)==len(y):
        print('Covariables vectors not of equal lengths')
    else:
        x_bar, y_bar = x.mean(), y.mean()
        Cov = np.sum(((x - x_bar)*(y - y_bar))/(len(x) - 1))
        return Cov
def ShapiroWilkTest(DataValues):

    print('!! Cross check results with scipy.stats.shapiro() !!')

    # Data analysis
    N = len(DataValues)
    X_Bar = np.mean(DataValues)
    S_X = np.std(DataValues,ddof=1)

    if N < 3:
        print('Sample vector must have at least 3 valid observations.')
        return

    elif N == 3:
        w = np.array([np.sqrt(0.5),0,-np.sqrt(0.5)])

    else:

        if N > 5000:
        print('Shapiro-Wilk statistic might be inaccurate due to large sample size ( > 5000).')

        # Sort data to get the rank
        Data_Sorted = np.zeros(N)
        Data_Sorted += DataValues
        Data_Sorted.sort()

        # Expected values
        m = NormalQuantile((np.arange(1,N+1) - 3/8) / (N + 0.25),0,1)

        # Compute coefficients according to: https://math.stackexchange.com/questions/625359/how-are-the-values-in-the-shapiro-wilk-weight-table-calculated
        C_N = m[-1]/np.sqrt(np.sum(m**2))
        C_N1 = m[-2]/np.sqrt(np.sum(m**2))

        # Polynomial vectors
        p1 = np.array([-2.706056,4.434685,-2.071190,-0.147981,0.221157,C_N])
        p2 = np.array([-3.582633,5.682633,-1.752461,-0.293762,0.042981,C_N1])

        # Compute weights
        u = 1/np.sqrt(N)
        w = np.zeros(N)

        for k in range(len(p1)):
            w[-1] += p1[k] * u ** (5 - k)
        w[0] = -w[-1]

        if N >= 6:

            for k in range(len(p1)):
                w[-2] += p2[k] * u ** (5 - k)
            w[1] = -w[-2]

            Phi = (np.sum(m ** 2) - 2*m[-1]**2 - 2*m[-2]**2)/(1 - 2*w[-1]**2 - 2*w[-2]**2)

            ct = 2
        else:
            Phi = (np.sum(m ** 2) - 2 * m[-1] ** 2) / (1 - 2 * w[-1] ** 2)
            ct = 1

        for k in range(ct,N-ct):
            w[k] = m[k] / np.sqrt(Phi)

    W = np.sum(w*Data_Sorted)**2 / np.sum((Data_Sorted-X_Bar)**2)

    # Compute p value

    res = 0
    pw = 0
    pi6 = 6 / np.pi

    G = np.array([-0.2273e1, 0.459e0])
    c3 = np.array([0.5440e0, -0.39978e0, 0.25054e-1, -0.6714e-3])
    c4 = np.array([0.13822e1, -0.77857e0, 0.62767e-1, -0.20322e-2])

    c5 = np.array([-0.15861e1, -0.31082e0, -0.83751e-1, 0.38915e-2])
    c6 = np.array([-0.4803e0, -0.82676e-1, 0.30302e-2])

    stqr = np.sqrt(0.75)

    y = np.log(1 - W)
    xx = np.log(N)
    m = 0
    s = 1

    if N == 3:

        pw = pi6 * (np.arcsin(np.sqrt(W)) - stqr)

        if pw < 0:
            pw = 0

    elif N <= 11:
        gma = (G[1] * N) + (G[0] * 1)

        if y > gma:
            pw = 1e-19
        else:
            y = -np.log(gma - y);
            m = c3[3] * N ** 3 + c3[2] * N ** 2 + c3[1] * N + c3[0]
            s = np.exp(c4[3] * N ^ 3 + c4[2] * N ** 2 + c4[1] * N + c4[0])
            pw = 1 - NormalCDF(np.array([(y - m) / s]),0,1)

    else:
        m = c5[3] * xx ** 3 + c5[2] * xx ** 2 + c5[1] * xx + c5[0]
        s = np.exp(c6[2] * xx ** 2 + c6[1] * xx + c6[0])
        pw = 1 - NormalCDF(np.array([(y - m) / s]),0,1)

    res = pw

    return W, res
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
    from scipy.stats.distributions import chi2
    pValue = 1-chi2.cdf(X2,k-1)

    return  X2, pValue
def BrownForsytheTest(x, y):

    from scipy.stats.distributions import f

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

Variable = Variables[2]
Group = Groups[0]

Label = Labels[Variables.index(Variable)]

GroupData = Data[Data.Group == Group]
X = GroupData.groupby('Scan')[Variable].median()


N = len(X)
S_X = X.std(ddof=1)
X_Bar = X.mean()
M = X.median()
X_Min = X.min()
X_Max = X.max()
SortedValues = X.sort_values().values

# for CV log transformation to reach normality
if Variable == Variables[2]:
    SortedValues = np.log(SortedValues)

# Kernel density estimation (Gaussian kernel)
KernelEstimator = np.zeros(N)
NormalIQR = np.sum(np.abs(NormalQuantile(np.array([0.25,0.75]), 0, 1)))
DataIQR = np.abs(X.quantile(0.75)) - np.abs(X.quantile(0.25))
KernelHalfWidth = 0.9*N**(-1/5) * min(S_X,DataIQR/NormalIQR)
for Value in SortedValues:
    KernelEstimator += NormalProbabilityDistribution(SortedValues-Value,0,KernelHalfWidth*2)
KernelEstimator = KernelEstimator/N

## Histogram and density distribution
TheoreticalDistribution = NormalProbabilityDistribution(SortedValues,X_Bar,S_X)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.hist(X,density=True,bins=20,edgecolor=(0,0,1),color=(1,1,1),label='Histogram')
Axes.plot(SortedValues,KernelEstimator,color=(1,0,0),label='Kernel Density')
Axes.plot(SortedValues,TheoreticalDistribution,linestyle='--',color=(0,0,0),label='Normal Distribution')
plt.xlabel(Label)
plt.ylabel('Density (-)')
plt.legend(loc='upper center',ncol=3,bbox_to_anchor=(0.5,1.15), prop={'size':10})
plt.show()
plt.close(Figure)

## ECDF and Theoretical CDF
EmpiricalQuantiles = np.arange(0.5, N + 0.5) / N
Z = (SortedValues - X_Bar) / S_X
TheoreticalQuantiles = NormalCDF(Z)

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(SortedValues,EmpiricalQuantiles, linestyle='none', marker='o', mew=0.5, fillstyle='none', color=(0, 0, 0), label='Data Distribution')
Axes.plot(SortedValues,TheoreticalQuantiles, linestyle='--', color=(1, 0, 0), label='Normal Distribution')
plt.xlabel(Label)
plt.ylabel('Quantile (-)')
plt.legend(loc='upper center',ncol=2,bbox_to_anchor=(0.5,1.15), prop={'size':10})
plt.show()
plt.close(Figure)

## QQ plot
Variance = QQPlot(SortedValues,0.95,Label)

## Shapiro-Wilk test for normality
W_test, p_test = ShapiroWilkTest(SortedValues)
print('Test statistics: %.3f'%W_test)
print('p value        : %.3f'%p_test)


from scipy.stats import shapiro
W, p = shapiro(SortedValues)

print('Self-build test / scipy test values')
print(W_test/W)
print(p_test/p)

## Brown-Forsythe test for equal variance (Levene test using median) or Bartlett if normal distribution
GroupData = Data[Data.Group == Groups[0]]
x = GroupData.groupby('Scan')[Variable].median().values
GroupData = Data[Data.Group == Groups[1]]
y = GroupData.groupby('Scan')[Variable].median().values

# for CV log transformation to reach normality
if Variable == Variables[2]:
    x,y = np.log(x), np.log(y)

W, p = BrownForsytheTest(x, y)
W, p = BartlettTest(x,y)














# z transform
z1 = (X_Min - X_Bar) / S_X
z2 = (X_Max - X_Bar) / S_X


Step = 0.001
x = np.arange(z1, z2, Step) # range of x in spec
x_all = np.arange(-10, 10, Step) # entire range of x, both in and out of spec
# mean = 0, stddev = 1, since Z-transform was calculated
y = NormalProbabilityDistribution(x,0,1)
y_all = NormalProbabilityDistribution(x_all,0,1)

y_sorted = np.zeros(len(y_all))
y_sorted += y_all
y_sorted.sort()

CI = 0.95
y_area = 0
i = 1
while y_area/y_all.sum() < CI:
    y_area += y_sorted[-i]
    i += 1
z_CI = i/2 * Step

x_CI = np.arange(-z_CI, z_CI, Step)
y_CI = NormalProbabilityDistribution(x_CI,0,1)

# Plot in the z-space
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(x_all,y_all,color=(1,0,0),label='Normal distribution')
Axes.fill_between(x,y,0, alpha=0.2, color=(0,0,0),label='Data range')
Axes.fill_between(x_all,y_all,0, alpha=0.1, color=(0,0,0))
Axes.fill_between(x_CI,y_CI,0, alpha=0.3, color=(0,0,1),label= str(int(0.95*100))+'% CI')
Axes.set_xlabel('# of Standard Deviations Outside the Mean')
plt.xlim([-4.2,4.2])
plt.legend(loc='upper center',ncol=3,bbox_to_anchor=(0.5,1.15))
plt.show()



x_zmin = x_bar - 10 * s_x
x_zmax = x_bar + 10 * s_x

x = np.arange(x_min, x_max, 0.001) # range of x in spec
y = NormalProbabilityDistribution(x,X_Bar,S_X)

x_all = np.arange(x_zmin, x_zmax, 0.001) # entire range of x, both in and out of spec
y_all = NormalProbabilityDistribution(x_all,X_Bar,S_X)

x1_CI = x_bar - z_CI * s_x
x2_CI = x_bar + z_CI * s_x

x_CI = np.arange(x1_CI, x2_CI, 0.001) # entire range of x, both in and out of spec
y_CI = NormalProbabilityDistribution(x_CI,X_Bar,S_X)

# Plot in data space
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(x_all,y_all,color=(1,0,0),label='Normal distribution')
Axes.fill_between(x,y,0, alpha=0.2, color=(0,0,0),label='Data range')
Axes.fill_between(x_all,y_all,0, alpha=0.1, color=(0,0,0))
Axes.fill_between(x_CI,y_CI,0, alpha=0.3, color=(0,0,1),label= str(int(0.95*100))+'% CI')
Axes.set_xlabel(Label)
plt.xlim([x_bar - 4.2 * s_x,x_bar + 4.2 * s_x])
plt.legend(loc='upper center',ncol=3,bbox_to_anchor=(0.5,1.15))
plt.show()