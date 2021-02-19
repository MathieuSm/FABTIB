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


# 01 Set path
WorkingDirectory = os.getcwd()
ResultFolder = os.path.join(WorkingDirectory, '04_Results/04_Morphometry_Statistics/')
Folders = ['BVTV',
           'SMI',
           'Tb Number',
           'Tb Thickness',
           'Tb Spacing',
           'Tb Inhomogeneity',
           'Coefficient of Variation',
           'Degree of Anisotropy']
Results = pd.DataFrame()


# 02 Set variable
Variables = ['BV/TV','SMI','Mean Tb N','Mean Tb Th','Mean Tb Sp','Std Tb Sp',
             'Coefficient of Variation','Degree of Anisotropy']
# Variable = Variables[5]
for Variable in Variables:

    Folder = Folders[Variables.index(Variable)]

    if not os.path.exists(os.path.join(ResultFolder,Folder)):
        os.mkdir(os.path.join(ResultFolder,Folder))

    Groups = ['Healthy', 'OI']
    for Group in Groups:

        if Group == 'Healthy':
            Data = pd.read_csv(ResultFolder + '00_Healthy_Data.csv')
        elif Group == 'OI':
            Data = pd.read_csv(ResultFolder + '00_OI_Data.csv')

        if Variable[:3] == 'Log':
            Data[Variable] = np.log(Data[Variable[4:]])

        print('\n\nAnalysis for ' + Variable + ' of ' + Group + ' group')



        # 03 Boxplot of the values by individuals
        Figure, Axes = plt.subplots(1, 1, figsize=(34, 17),dpi=200)
        Data.boxplot(Variable,by='Scan',grid=False,ax=Axes,rot=90,vert=True,
                     showmeans=True,
                     boxprops=dict(linestyle='-',color='b'),
                     medianprops=dict(linestyle='-',color='r'),
                     whiskerprops=dict(linestyle='--',color='k'),
                     meanprops=dict(marker='x',color='b'))
        plt.xlabel('Scan')
        plt.ylabel(Variable)
        plt.subplots_adjust(bottom=0.2)
        plt.savefig(os.path.join(ResultFolder,Folder, Group + '_Boxplot.png'))
        #plt.show()
        plt.close(Figure)



        # 04 Get data attributes
        X = Data.groupby(by='Scan').median()[Variable]
        SortedValues = np.sort(X.values)
        N = len(X)
        X_Bar = np.mean(X)
        S_X = np.std(X, ddof=1)



        # 05 Kernel density estimation (Gaussian kernel)
        KernelEstimator = np.zeros(N)
        NormalIQR = np.sum(np.abs(norm.ppf(np.array([0.25,0.75]), 0, 1)))
        DataIQR = np.abs(X.quantile(0.75)) - np.abs(X.quantile(0.25))
        KernelHalfWidth = 0.9*N**(-1/5) * min(S_X,DataIQR/NormalIQR)
        for Value in SortedValues:
            KernelEstimator += norm.pdf(SortedValues-Value,0,KernelHalfWidth*2)
        KernelEstimator = KernelEstimator/N

        ## Histogram and density distribution
        TheoreticalDistribution = norm.pdf(SortedValues,X_Bar,S_X)
        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Axes.hist(X,density=True,bins=20,edgecolor=(0,0,1),color=(1,1,1),label='Histogram')
        Axes.plot(SortedValues,KernelEstimator,color=(1,0,0),label='Kernel Density')
        Axes.plot(SortedValues,TheoreticalDistribution,linestyle='--',color=(0,0,0),label='Normal Distribution')
        plt.xlabel(Variable)
        plt.ylabel('Density (-)')
        plt.legend(loc='upper center',ncol=3,bbox_to_anchor=(0.5,1.15), prop={'size':10})
        plt.savefig(os.path.join(ResultFolder,Folder, Group + '_DensityDistribution.png'))
        #plt.show()
        plt.close(Figure)



        # 06 ECDF and Theoretical CDF
        EmpiricalQuantiles = np.arange(0.5, N + 0.5) / N
        Z = (SortedValues - X_Bar) / S_X
        TheoreticalQuantiles = norm.cdf(Z)

        Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
        Axes.plot(SortedValues,EmpiricalQuantiles, linestyle='none', marker='o', mew=0.5, fillstyle='none', color=(0, 0, 0), label='Data Distribution')
        Axes.plot(SortedValues,TheoreticalQuantiles, linestyle='--', color=(1, 0, 0), label='Normal Distribution')
        plt.xlabel(Variable)
        plt.ylabel('Quantile (-)')
        plt.legend(loc='upper center',ncol=2,bbox_to_anchor=(0.5,1.15), prop={'size':10})
        plt.savefig(os.path.join(ResultFolder,Folder, Group + '_ECDF.png'))
        #plt.show()
        plt.close(Figure)



        # 07 QQ plot
        FigFile = os.path.join(ResultFolder, Folder, Group + '_QQPlot.png')
        Variance = QQPlot(SortedValues,0.95,Variable,FigFile)


        ## 08 Shapiro-Wilk test for normality
        W, p = shapiro(SortedValues)
        print('Test statistics: %.3f'%W)
        print('p value        : %.3f'%p)


        ResultsParameter = {'Group':Group,
                            'Variable':Variable,
                            'Test statistics':W,
                            'p value':p}
        Results = Results.append(ResultsParameter,ignore_index=True)

        if Group == 'Healthy':
            p_Control = p
        elif Group == 'OI':
            p_Test = p

            if p_Control < 2.45/100 or p_Test < 2.45/100:
                if not Variable[:3] == 'Log':
                    list.append(Folders, 'Log ' + Folder)
                    list.append(Variables, 'Log ' + Variable)


Results.to_csv(ResultFolder + '/01_NormalityCheck.csv',index=False)
