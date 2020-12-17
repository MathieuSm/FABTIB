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
def QQPlot(DataValues, Alpha_CI, DataLabel='Data'):

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
    Axes.plot(TheoreticalQuantiles, Data_Sorted, linestyle='none', marker='o', mew=0.5, fillstyle='none', color=(0, 0, 0), label=Label)
    Axes.plot(Data_Space, Variance_Line, linestyle='--', color=(1, 0, 0), label='Variance :' + str(format(np.round(Variance, 2),'.2f')))
    Axes.plot(Data_Space, Variance_Line + Z_CI_Quantile * Data_SE, linestyle='--', color=(0, 0, 1), label=str(int(100*Alpha_CI)) + '% CI')
    Axes.plot(Data_Space, Variance_Line - Z_CI_Quantile * Data_SE, linestyle='--', color=(0, 0, 1))
    plt.xlabel('Theoretical quantiles (-)')
    plt.ylabel('Empirical quantiles (-)')
    plt.ylim([Y_Min, Y_Max])
    plt.legend(loc='upper center', ncol=3, bbox_to_anchor=(0.5, 1.15))
    plt.show()
    plt.close(Figure)

    return Variance



# 01 Load Data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory, '02_Data')
MatchFolder = os.path.join(WorkingDirectory, '04_Results/00_Matching/Matches')
TensorFolder = os.path.join(WorkingDirectory, '04_Results/')
ResultFolder = os.path.join(WorkingDirectory, '04_Results/05_MatchedGroups')

## Load groups data
ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('Scans.csv')]
ScanLists.sort()

HealthyGroup = pd.read_csv(os.path.join(DataFolder, ScanLists[0]))
OIGroup = pd.read_csv(os.path.join(DataFolder, ScanLists[1]))

OIGroup = OIGroup.dropna()  # Filter patients without data
OIGroup = OIGroup.reset_index()
OIGroup = OIGroup[['Scan_ID_BSL', 'Sex', 'Age', 'OI_Type']]
OIGroup.columns = ['Sample Number', 'Sex', 'Age', 'OI Type']
OIGroup['Sex'] = OIGroup['Sex'].replace(['Female', 'Male'], ['F', 'M'])
OIGroup['OI Type'] = OIGroup['OI Type'].replace(['Type I', 'Type III', 'Type IV'], [1, 3, 4])
OIGroup['Age'] = OIGroup['Age'].astype('int')

## Load matching results
Matches = [File for File in os.listdir(MatchFolder) if File.endswith('.txt')]
Matches.sort()
Match = Matches[-1]
MatchingResults = pd.read_csv(os.path.join(MatchFolder, Match), header=None)

## Get matched samples
OIList = MatchingResults.index.values
MatchedOI = OIGroup.loc[OIList]
ControlList = MatchingResults[0].values
MatchedControl = HealthyGroup.loc[ControlList]

## Get tensor data
MatchedGroups = [MatchedControl, MatchedOI]
Groups = ['Control', 'Test']

for Group in Groups:

    if Group == Groups[0]:
        SubGroup = MatchedGroups[0]
        TensorData = os.path.join(TensorFolder, '01_HealthyTibiaXCT2Scans/03_LinearRegression/')
    elif Group == Groups[1]:
        SubGroup = MatchedGroups[1]
        TensorData = os.path.join(TensorFolder, '02_OITibiaXCT2Scans/03_LinearRegression/')

    Data = pd.read_csv(os.path.join(TensorData, '00_Data.csv'))

    SubData = pd.DataFrame()
    for Sample in SubGroup['Sample Number']:

        for Scan in Data['Scan']:

            if Group == Groups[0]:
                ScanNumber = Scan[4:8]
                SampleNumber = Sample
            elif Group == Groups[1]:
                ScanNumber = Scan[11:15]
                SampleNumber = Sample[-4:]

            if int(ScanNumber) == int(SampleNumber):
                SampleData = Data[Data['Scan'] == Scan]
                SubData = SubData.append(SampleData, ignore_index=True)
                break

    SubData.to_csv(ResultFolder + '/00_' + Group + '_Data.csv', index=False)

ControlData = pd.read_csv(ResultFolder + '/00_Control_Data.csv')
TestData = pd.read_csv(ResultFolder + '/00_Test_Data.csv')

## Merge the two groups
ControlData['Group'] = 'Control'
TestData['Group'] = 'Test'
TestData['OI Type'] = 0
for SampleNumber in MatchedOI['Sample Number']:

    for Scan in TestData['Scan']:

        if Scan[7:15] == SampleNumber:
            Filter = MatchedOI['Sample Number'] == SampleNumber
            OIType = MatchedOI[Filter]['OI Type'].values[0]

            Filter = TestData['Scan'] == Scan

            for Index in TestData[Filter]['OI Type'].index:
                TestData.loc[Index, 'OI Type'] = OIType

Data = ControlData.append(TestData, ignore_index=True)

Variables = ['BVTV', 'DA', 'Variation Coefficient']
Labels = ['BV/TV (-)', 'Degree of anisotropy (-)', 'Coefficient of variation (-)']

Variable = Variables[0]
Group = Groups[0]

GroupData = Data[Data.Group == Group][Variable]
Label = Labels[Variables.index(Variable)]


N = len(GroupData)
S_X = GroupData.std()
X_Bar = GroupData.mean()
M = GroupData.median()
X_Min = GroupData.min()
X_Max = GroupData.max()
SortedValues = GroupData.sort_values().values

# Kernel density estimation (Gaussian kernel)
KernelEstimator = np.zeros(N)
NormalIQR = np.sum(np.abs(NormalQuantile(np.array([0.25,0.75]), 0, 1)))
DataIQR = np.abs(GroupData.quantile(0.75)) - np.abs(GroupData.quantile(0.25))
KernelHalfWidth = 0.9*N**(-1/5) * min(S_X,DataIQR/NormalIQR)
for Value in SortedValues:
    KernelEstimator += NormalProbabilityDistribution(SortedValues-Value,0,KernelHalfWidth*2)
KernelEstimator = KernelEstimator/N

## Histogram and density distribution
TheoreticalDistribution = NormalProbabilityDistribution(SortedValues,X_Bar,S_X)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.hist(GroupData,density=True,bins=20,edgecolor=(0,0,1),color=(1,1,1),label='Histogram')
Axes.plot(SortedValues,KernelEstimator,color=(1,0,0),label='Kernel Density')
Axes.plot(SortedValues,TheoreticalDistribution,linestyle='--',color=(0,0,0),label='Normal Distribution')
plt.xlabel(Label)
plt.ylabel('Density (-)')
plt.legend(loc='upper center',ncol=3,bbox_to_anchor=(0.5,1.15))
plt.show()
plt.close(Figure)

## ECDF and Theoretical CDF
EmpiricalQuantiles = np.arange(0.5, N + 0.5) / N
TheoreticalQuantiles = NormalCDF(SortedValues,X_Bar,S_X)

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(SortedValues,EmpiricalQuantiles, linestyle='none', marker='o', fillstyle='none', color=(0, 0, 0), label='Data Distribution')
Axes.plot(SortedValues,TheoreticalQuantiles, linestyle='--', color=(1, 0, 0), label='Normal Distribution')
plt.xlabel(Label)
plt.ylabel('Quantile (-)')
plt.legend(loc='upper center',ncol=2,bbox_to_anchor=(0.5,1.15))
plt.show()
plt.close(Figure)

## QQ plot
Variance = QQPlot(SortedValues,0.95,Label)





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