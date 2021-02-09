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
def DyadicProduct(A, B):
    if A.size == 3:

        if isinstance(A[0], np.float):
            C = np.zeros((3, 3))
        else:
            C = sp.zeros(3)

        for i in range(3):
            for j in range(3):
                C[i, j] = A[i] * B[j]

        if not isinstance(A[0], np.float):
            C = np.array(C)

    elif A.size == 9:

        if isinstance(A[0, 0], np.float):
            C = np.zeros((3, 3, 3, 3))
        else:
            C = sp.zeros(9)

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        if isinstance(A[0, 0], np.float):
                            C[i, j, k, l] = A[i, j] * B[k, l]
                        else:
                            C[3 * i + j, 3 * k + l] = A[i, j] * B[k, l]

        if not isinstance(A[0, 0], np.float):
            C = IsoMorphism99_3333(C)

    else:
        print('Matrices sizes mismatch')

    return C
def SymmetricProduct(A, B):
    if isinstance(A[0, 0], np.float):
        C = np.zeros((3, 3, 3, 3))
    else:
        C = sp.zeros(9)

    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    if isinstance(A[0, 0], np.float):
                        C[i, j, k, l] = (1 / 2) * (A[i, k] * B[j, l] + A[i, l] * B[j, k])
                    else:
                        C[3 * i + j, 3 * k + l] = (1 / 2) * (A[i, k] * B[j, l] + A[i, l] * B[j, k])

    if not isinstance(A[0, 0], np.float):
        C = IsoMorphism99_3333(C)

    return C
def CheckMinorSymmetry(A):
    MinorSymmetry = True
    for i in range(3):
        for j in range(3):
            PartialTensor = A[:, :, i, j]
            if PartialTensor[1, 0] == PartialTensor[0, 1] and PartialTensor[2, 0] == PartialTensor[0, 2] and \
                    PartialTensor[1, 2] == PartialTensor[2, 1]:
                MinorSymmetry = True
            else:
                MinorSymmetry = False
                break

    if MinorSymmetry == True:
        for i in range(3):
            for j in range(3):
                PartialTensor = np.squeeze(A[i, j, :, :])
                if PartialTensor[1, 0] == PartialTensor[0, 1] and PartialTensor[2, 0] == PartialTensor[0, 2] and \
                        PartialTensor[1, 2] == PartialTensor[2, 1]:
                    MinorSymmetry = True
                else:
                    MinorSymmetry = False
                    break

    return MinorSymmetry
def IsoMorphism3333_66(A):
    if CheckMinorSymmetry == False:
        print('Tensor does not present minor symmetry')
    else:

        if isinstance(A[0, 0, 0, 0], np.float):
            B = np.zeros((6, 6))
        else:
            B = sp.zeros(6)

        B[0, 0] = A[0, 0, 0, 0]
        B[0, 1] = A[0, 0, 1, 1]
        B[0, 2] = A[0, 0, 2, 2]
        B[0, 3] = np.sqrt(2) * A[0, 0, 1, 2]
        B[0, 4] = np.sqrt(2) * A[0, 0, 2, 0]
        B[0, 5] = np.sqrt(2) * A[0, 0, 0, 1]

        B[1, 0] = A[1, 1, 0, 0]
        B[1, 1] = A[1, 1, 1, 1]
        B[1, 2] = A[1, 1, 2, 2]
        B[1, 3] = np.sqrt(2) * A[1, 1, 1, 2]
        B[1, 4] = np.sqrt(2) * A[1, 1, 2, 0]
        B[1, 5] = np.sqrt(2) * A[1, 1, 0, 1]

        B[2, 0] = A[2, 2, 0, 0]
        B[2, 1] = A[2, 2, 1, 1]
        B[2, 2] = A[2, 2, 2, 2]
        B[2, 3] = np.sqrt(2) * A[2, 2, 1, 2]
        B[2, 4] = np.sqrt(2) * A[2, 2, 2, 0]
        B[2, 5] = np.sqrt(2) * A[2, 2, 0, 1]

        B[3, 0] = np.sqrt(2) * A[1, 2, 0, 0]
        B[3, 1] = np.sqrt(2) * A[1, 2, 1, 1]
        B[3, 2] = np.sqrt(2) * A[1, 2, 2, 2]
        B[3, 3] = 2 * A[1, 2, 1, 2]
        B[3, 4] = 2 * A[1, 2, 2, 0]
        B[3, 5] = 2 * A[1, 2, 0, 1]

        B[4, 0] = np.sqrt(2) * A[2, 0, 0, 0]
        B[4, 1] = np.sqrt(2) * A[2, 0, 1, 1]
        B[4, 2] = np.sqrt(2) * A[2, 0, 2, 2]
        B[4, 3] = 2 * A[2, 0, 1, 2]
        B[4, 4] = 2 * A[2, 0, 2, 0]
        B[4, 5] = 2 * A[2, 0, 0, 1]

        B[5, 0] = np.sqrt(2) * A[0, 1, 0, 0]
        B[5, 1] = np.sqrt(2) * A[0, 1, 1, 1]
        B[5, 2] = np.sqrt(2) * A[0, 1, 2, 2]
        B[5, 3] = 2 * A[0, 1, 1, 2]
        B[5, 4] = 2 * A[0, 1, 2, 0]
        B[5, 5] = 2 * A[0, 1, 0, 1]

        return B
def ComplianceTensor(EngineeringConstants, EigenValues=[1, 1, 1], Rho=0, EigenVectors=np.zeros(3)):
    if np.sum(EigenVectors).all() == 0:
        I = np.eye(3)
        EigenVectors = [I[:, 0], I[:, 1], I[:, 2]]

    ComplianceTensor = np.zeros((3, 3, 3, 3))

    if len(EngineeringConstants) == 9:

        E1, E2, E3 = EngineeringConstants[0:3]
        Mu23, Mu31, Mu12 = EngineeringConstants[3:6]
        Mu32, Mu13, Mu21 = Mu23, Mu31, Mu12
        Nu12, Nu13, Nu23 = EngineeringConstants[6:]
        Nu21 = Nu12 * E2 / E1
        Nu31 = Nu13 * E3 / E1
        Nu32 = Nu23 * E3 / E2

        E = E1, E2, E3
        Nu = np.array([[Nu13, Nu12], [Nu21, Nu23], [Nu32, Nu31]])
        Mu = np.array([[Mu13, Mu12], [Mu21, Mu23], [Mu32, Mu31]])

        for i in range(3):
            Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])

            Part1 = 1 / E[i] * DyadicProduct(Mi, Mi)

            ComplianceTensor += Part1

            for ii in range(3 - 1):
                j = i - ii - 1
                Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
                Part2 = -Nu[i, ii] / E[i] * DyadicProduct(Mi, Mj)
                Part3 = 1 / (2 * Mu[i, ii]) * SymmetricProduct(Mi, Mj)

                ComplianceTensor += Part2 + Part3

    elif len(EngineeringConstants) == 5:

        if Rho == 0:
            print('BV/TV is missing!')

        else:

            E0, Nu0, Mu0, k, l = EngineeringConstants

            for i in range(3):
                Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])

                Part1 = 1 / (E0 * Rho ** k * EigenValues[i] ** (2 * l)) * DyadicProduct(Mi, Mi)

                ComplianceTensor += Part1

                for ii in range(3 - 1):
                    j = i - ii - 1
                    Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
                    Part2 = -Nu0 / (E0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l) * DyadicProduct(Mi, Mj)
                    Part3 = 1 / (2 * Mu0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l) * SymmetricProduct(Mi,
                                                                                                                    Mj)

                    ComplianceTensor += Part2 + Part3

    ComplianceTensor = IsoMorphism3333_66(ComplianceTensor)

    return ComplianceTensor
def StiffnessTensor(LaméConstants, EigenValues, Rho, EigenVectors=0):
    if EigenVectors == 0:
        I = np.eye(3)
        EigenVectors = [I[:, 0], I[:, 1], I[:, 2]]

    StiffnessTensor = np.zeros((3, 3, 3, 3))

    if len(LaméConstants) == 5:

        if Rho == 0:
            print('BV/TV is missing!')

        else:

            Lambda0, Lambda0p, Mu0, k, l = LaméConstants

            for i in range(3):
                Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])

                Part1 = (Lambda0 + 2 * Mu0) * Rho ** k * EigenValues[i] ** (2 * l) * DyadicProduct(Mi, Mi)

                StiffnessTensor += Part1

                for ii in range(3 - 1):
                    j = i - ii - 1
                    Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
                    Part2 = Lambda0p * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l * DyadicProduct(Mi, Mj)
                    Part3 = 2 * Mu0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l * SymmetricProduct(Mi, Mj)

                    StiffnessTensor += Part2 + Part3

    else:
        print('Wrong number of parameters: Lambda0, Lambdaop, Mu0, k, l')

    StiffnessTensor = IsoMorphism3333_66(StiffnessTensor)

    return StiffnessTensor
def CollectTensorData(Data2Eval):
    Eii123Data = pd.DataFrame()
    Eij123Data = pd.DataFrame()
    Eii456Data = pd.DataFrame()

    Sii123Data = pd.DataFrame()
    Sij123Data = pd.DataFrame()
    Sii456Data = pd.DataFrame()

    print('Collect tensors data...')
    for SampleNumber in Data2Eval.index:

        SampleData = Data2Eval.loc[SampleNumber]
        Group = SampleData['Group']
        OIType = SampleData['OI Type']
        EngineeringConstants = SampleData[['E1', 'E2', 'E3', 'Mu23', 'Mu31', 'Mu12', 'Nu12', 'Nu13', 'Nu23']].values
        Rho = SampleData['BVTV']
        m1, m2, m3 = SampleData[['m1', 'm2', 'm3']].values

        # Build tensors
        E = ComplianceTensor(EngineeringConstants, EigenValues=[m1, m2, m3], Rho=Rho)
        S = np.linalg.inv(E)

        # Get nonzero elements

        Eii123 = np.zeros(3)
        Eij123 = np.zeros(6)
        Eii456 = np.zeros(3)

        Sii123 = np.zeros(3)
        Sij123 = np.zeros(6)
        Sii456 = np.zeros(3)

        ii123 = 0
        ij123 = 0
        ii456 = 0

        for i in range(6):
            for j in range(6):
                if i < 3 and j < 3:
                    if i == j:
                        Eii123[ii123] = E[i, j]
                        Sii123[ii123] = S[i, j]
                        ii123 += 1
                    else:
                        Eij123[ij123] = E[i, j]
                        Sij123[ij123] = S[i, j]
                        ij123 += 1
                else:
                    if i == j:
                        Eii456[ii456] = E[i, j]
                        Sii456[ii456] = S[i, j]
                        ii456 += 1

        Group = SampleData['Group']
        OIType = SampleData['OI Type']

        Eii123Data = Eii123Data.append({'Group': Group,
                                        'OI Type': OIType,
                                        'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'E11': Eii123[0],
                                        'E22': Eii123[1],
                                        'E33': Eii123[2]}, ignore_index=True)
        Eij123Data = Eij123Data.append({'Group': Group,
                                        'OI Type': OIType,
                                        'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'E12': Eij123[0],
                                        'E13': Eij123[1],
                                        'E21': Eij123[2],
                                        'E23': Eij123[3],
                                        'E31': Eij123[4],
                                        'E32': Eij123[5]}, ignore_index=True)
        Eii456Data = Eii456Data.append({'Group': Group,
                                        'OI Type': OIType,
                                        'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'E44': Eii456[0],
                                        'E55': Eii456[1],
                                        'E66': Eii456[2]}, ignore_index=True)

        Sii123Data = Sii123Data.append({'Group': Group,
                                        'OI Type': OIType,
                                        'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'S11': Sii123[0],
                                        'S22': Sii123[1],
                                        'S33': Sii123[2]}, ignore_index=True)
        Sij123Data = Sij123Data.append({'Group': Group,
                                        'OI Type': OIType,
                                        'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'S12': Sij123[0],
                                        'S13': Sij123[1],
                                        'S21': Sij123[2],
                                        'S23': Sij123[3],
                                        'S31': Sij123[4],
                                        'S32': Sij123[5]}, ignore_index=True)
        Sii456Data = Sii456Data.append({'Group': Group,
                                        'OI Type': OIType,
                                        'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'S44': Sii456[0],
                                        'S55': Sii456[1],
                                        'S66': Sii456[2]}, ignore_index=True)

    print('Done')
    return Eii123Data, Eij123Data, Eii456Data, Sii123Data, Sij123Data, Sii456Data
def BuildFittedTensors(Data2Eval, FitResult):
    print('Build data with fitted parameter...')
    Lambda0, Lambda0p, Mu0, k, l = FitResult[['Lambda0', 'Lambda0p', 'Mu0', 'k', 'l']].values

    Eii123Fit = pd.DataFrame()
    Eij123Fit = pd.DataFrame()
    Eii456Fit = pd.DataFrame()

    Sii123Fit = pd.DataFrame()
    Sij123Fit = pd.DataFrame()
    Sii456Fit = pd.DataFrame()

    for SampleNumber in Data2Eval.index:

        SampleData = Data2Eval.loc[SampleNumber]
        Group = SampleData['Group']
        OIType = SampleData['OI Type']
        Rho = SampleData['BVTV']
        m1, m2, m3 = SampleData[['m1', 'm2', 'm3']].values

        # Build tensors
        S = StiffnessTensor([Lambda0, Lambda0p, Mu0, k, l], EigenValues=[m1, m2, m3], Rho=Rho)
        E = np.linalg.inv(S)

        # Get nonzero elements

        Eii123 = np.zeros(3)
        Eij123 = np.zeros(6)
        Eii456 = np.zeros(3)

        Sii123 = np.zeros(3)
        Sij123 = np.zeros(6)
        Sii456 = np.zeros(3)

        ii123 = 0
        ij123 = 0
        ii456 = 0

        for i in range(6):
            for j in range(6):
                if i < 3 and j < 3:
                    if i == j:
                        Eii123[ii123] = E[i, j]
                        Sii123[ii123] = S[i, j]
                        ii123 += 1
                    else:
                        Eij123[ij123] = E[i, j]
                        Sij123[ij123] = S[i, j]
                        ij123 += 1
                else:
                    if i == j:
                        Eii456[ii456] = E[i, j]
                        Sii456[ii456] = S[i, j]
                        ii456 += 1

        Eii123Fit = Eii123Fit.append({'Group': Group,
                                      'OI Type': OIType,
                                      'Sample': SampleData['Scan'],
                                      'ROI Number': SampleData['ROI Number'],
                                      'E11': Eii123[0],
                                      'E22': Eii123[1],
                                      'E33': Eii123[2]}, ignore_index=True)
        Eij123Fit = Eij123Fit.append({'Group': Group,
                                      'OI Type': OIType,
                                      'Sample': SampleData['Scan'],
                                      'ROI Number': SampleData['ROI Number'],
                                      'E12': Eij123[0],
                                      'E13': Eij123[1],
                                      'E21': Eij123[2],
                                      'E23': Eij123[3],
                                      'E31': Eij123[4],
                                      'E32': Eij123[5]}, ignore_index=True)
        Eii456Fit = Eii456Fit.append({'Group': Group,
                                      'OI Type': OIType,
                                      'Sample': SampleData['Scan'],
                                      'ROI Number': SampleData['ROI Number'],
                                      'E44': Eii456[0],
                                      'E55': Eii456[1],
                                      'E66': Eii456[2]}, ignore_index=True)

        Sii123Fit = Sii123Fit.append({'Group': Group,
                                      'OI Type': OIType,
                                      'Sample': SampleData['Scan'],
                                      'ROI Number': SampleData['ROI Number'],
                                      'S11': Sii123[0],
                                      'S22': Sii123[1],
                                      'S33': Sii123[2]}, ignore_index=True)
        Sij123Fit = Sij123Fit.append({'Group': Group,
                                      'OI Type': OIType,
                                      'Sample': SampleData['Scan'],
                                      'ROI Number': SampleData['ROI Number'],
                                      'S12': Sij123[0],
                                      'S13': Sij123[1],
                                      'S21': Sij123[2],
                                      'S23': Sij123[3],
                                      'S31': Sij123[4],
                                      'S32': Sij123[5]}, ignore_index=True)
        Sii456Fit = Sii456Fit.append({'Group': Group,
                                      'OI Type': OIType,
                                      'Sample': SampleData['Scan'],
                                      'ROI Number': SampleData['ROI Number'],
                                      'S44': Sii456[0],
                                      'S55': Sii456[1],
                                      'S66': Sii456[2]}, ignore_index=True)

    print('Done')
    return Eii123Fit, Eij123Fit, Eii456Fit, Sii123Fit, Sij123Fit, Sii456Fit
def Covariance(x,y):

    if not len(x)==len(y):
        print('Covariables vectors not of equal lengths')
    else:
        x_bar, y_bar = x.mean(), y.mean()
        Cov = np.sum(((x - x_bar)*(y - y_bar))/(len(x) - 1))
        return Cov
def FisherZTransformation(r):
    z = 1/2 * np.log((1+r)/(1-r))
    return z
def FillerStandardError(N):
    Sz = 1.03/np.sqrt(N-3)
    return Sz
def SpearmanCorrelation(x,y):

    # Compute Spearman correlation coefficient and it's corresponding 95% confidence interval
    # According to Bishara2017, doi:10.3758/s13428-016-0702-8
    # Should be use to show monotonic relation between two variables x and y

    x_Ranks = x.rank(method='average')
    y_Ranks = y.rank(method='average')
    Cov = Covariance(x_Ranks,y_Ranks)
    Rho = Cov / (x_Ranks.std()*y_Ranks.std())

    Z_f = FisherZTransformation(Rho)
    S_z = FillerStandardError(len(x))
    Z_CI = Z_f + 1.96 * np.array([S_z, -S_z])
    CI = (np.exp(2 * Z_CI) - 1) / (np.exp(2 * Z_CI) + 1)

    return Rho, CI


# 01 Load Data
WorkingDirectory = os.getcwd()
ResultFolder = os.path.join(WorkingDirectory, '04_Results/05_MatchedGroups')

ControlData = pd.read_csv(ResultFolder + '/00_Control_Data.csv')
TestData = pd.read_csv(ResultFolder + '/00_Test_Data.csv')

## Merge the two groups
Data = ControlData.append(TestData, ignore_index=True)

## Compute Spearman correlation coefficient
TestRho, TestCI = SpearmanCorrelation(TestData['BVTV'],TestData['Variation Coefficient'])
ControlRho, ControlCI = SpearmanCorrelation(ControlData['BVTV'],ControlData['Variation Coefficient'])
GroupedRho, GroupedCI = SpearmanCorrelation(Data['BVTV'],Data['Variation Coefficient'])

Threshold = (ControlData.quantile(0.75)['Variation Coefficient']
             - ControlData.quantile(0.25)['Variation Coefficient']) * 1.5 \
             + ControlData.quantile(0.75)['Variation Coefficient']
MinBVTV = 0.1/3*2

## Plot BVTV vs CV
TestLabel = 'Test, n:' + str(int(len(TestData))) + r', $\rho$:' + str(np.round(TestRho,2))
ControlLabel = 'Control, n:' + str(int(len(ControlData))) + r', $\rho$:' + str(np.round(ControlRho,2))
WLabel = r'Windowing: $[' + str(np.round(MinBVTV,3)) + ',\infty)$'
TLabel = 'Threshold: $' + str(np.round(Threshold,2)) + '$'

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(TestData['BVTV'],TestData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(0, 0, 1),label=TestLabel)
Axes.plot(ControlData['BVTV'],ControlData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0),label=ControlLabel)
Axes.plot([MinBVTV,MinBVTV],[0,Data['Variation Coefficient'].max()], linestyle='--', color=(0.4, 0.4, 0.4), label=WLabel)
Axes.plot([0,Data['BVTV'].max()],[Threshold,Threshold], linestyle='dashdot', color=(0, 0, 0), label=TLabel)
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
# Axes.annotate(r'Test $\rho$:' + str(np.round(TestRho,2)),(0.32,1.05))
# Axes.annotate(r'Control $\rho$:' + str(np.round(ControlRho,2)),(0.32,0.90))
# Axes.annotate(r'Grouped $\rho$:' + str(np.round(GroupedRho,2)),(0.32,0.75))
plt.legend(loc='upper right')
# plt.savefig(os.path.join(ResultFolder, '01_BVTV_CV.png'), dpi=1000)
plt.show()
plt.close(Figure)



# 02 Filter data
CVFilter = Data['Variation Coefficient'] < Threshold
Windowing = Data['BVTV'] > MinBVTV
FilteredData = Data[CVFilter & Windowing]



# 04 Fit results
FitResults = pd.read_csv(ResultFolder+'/02_FitResults.csv')
FitResult = FitResults.loc[0]

DataType = FitResult['Data type']
FitDOF    = FitResult['DOFs'].astype('int')
NSamples = FitResult['NSamples']

if DataType == 'Grouped':
    Data2Eval = FilteredData
if DataType == 'Control':
    Data2Eval = FilteredData[FilteredData['Group']=='Control']
if DataType == 'Test':
    Data2Eval = FilteredData[FilteredData['Group']=='Test']

## Collect tensors data
TensorData = CollectTensorData(Data2Eval)
Eii123Data, Eij123Data, Eii456Data, Sii123Data, Sij123Data, Sii456Data = TensorData

## Build data with fitted parameter
TensorData = BuildFittedTensors(Data2Eval,FitResult)
Eii123Fit, Eij123Fit, Eii456Fit, Sii123Fit, Sij123Fit, Sii456Fit = TensorData


## 05 Plot
Colors = [(0,0,1),(1,0,0),(0,1,0)]
Groups = ['Test','Control']
Datasets = [Sii123Data, Sij123Data, Sii456Data]
Fits = [Sii123Fit, Sij123Fit, Sii456Fit]
Plots = ['Sii','Sij','Muii']
for j in range(3) :
    Dataset = Datasets[j]
    Fit = Fits[j]
    Columns = Dataset.columns[3:-1]
    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
    Axes.plot([1e-2, 1e4], [1e-2, 1e4], linestyle='--', linewidth=2, color=(0, 0, 0), label='Diagonal')
    for i in range(2):
        Axes.plot(np.abs(Dataset[Dataset['Group']==Groups[i]][Columns]),
                  np.abs(Fit[Fit['Group']==Groups[i]][Columns]),
                  linestyle='none', marker='o', fillstyle='none', color=Colors[i])
        Axes.plot([], linestyle='none', marker='o', fillstyle='none', color=Colors[i], label=Groups[i])
    Axes.set_xlim([1e-2, 1e4])
    Axes.set_ylim([1e-2, 1e4])
    Axes.set_xlabel('Observed stiffness (MPa)')
    Axes.set_ylabel('Fitted stiffness (MPa)')
    plt.legend(loc='upper left')
    plt.xscale('log')
    plt.yscale('log')
    plt.savefig(ResultFolder+'/06_'+Plots[j]+'_Plot.png', dpi=1000)
    plt.show()
    plt.close(Figure)



# 06 Find outliers
Group = Groups[1]
Labels = [r'$\lambda_{ii}$', r'$\lambda_{ij}$', r'$\mu_{ij}$']
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot([1e-2, 1e4], [1e-2, 1e4], linestyle='--', linewidth=2, color=(0, 0, 0), label='Diagonal')
for i in range(3) :
    Dataset = Datasets[i]
    Fit = Fits[i]
    Columns = Dataset.columns[3:-1]
    Axes.plot(np.abs(Dataset[Dataset['Group']==Group][Columns]),
              np.abs(Fit[Fit['Group']==Group][Columns]),
              linestyle='none', marker='o', color=Colors[i])
    Axes.plot([], linestyle='none', marker='o', color=Colors[i], label=Labels[i])
    Axes.plot(np.abs(Dataset[Dataset['Group'] == Group][Columns].loc[67]),
              np.abs(Fit[Fit['Group'] == Group][Columns].loc[67]),
              linestyle='none', marker='x', color=(0,0,0))
Axes.set_xlim([1e-2, 1e4])
Axes.set_ylim([1e-2, 1e4])
Axes.set_xlabel('Observed stiffness (MPa)')
Axes.set_ylabel('Fitted stiffness (MPa)')
plt.legend(loc='upper left')
plt.xscale('log')
plt.yscale('log')
plt.show()
plt.close(Figure)

## Find outlier
Dataset[Dataset['Group'] == Group][Columns].idxmin()

## Test outlier
Scan = '350208_C0000141_SEG_UNCOMP'
ROI  = 1
ScanFilter = Data['Scan'] == Scan
ROIFilter = Data['ROI Number'] == ROI
TestOutlier = Data[ScanFilter&ROIFilter]

## Control outlier
Scan = 'C0001566_SEG_UNCOMP'
ROI  = 3
ScanFilter = Data['Scan'] == Scan
ROIFilter = Data['ROI Number'] == ROI
ControlOutlier = Data[ScanFilter&ROIFilter]


Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(TestData['BVTV'],TestData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(0, 0, 1),label=TestLabel)
Axes.plot(ControlData['BVTV'],ControlData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0),label=ControlLabel)
Axes.plot(TestOutlier['BVTV'],TestOutlier['Variation Coefficient'], linestyle='none', marker='+', markersize=8, mew=2, color=(0, 0, 0),label='Test outlier BV/TV: 0.064')
Axes.plot(ControlOutlier['BVTV'],ControlOutlier['Variation Coefficient'], linestyle='none', marker='x', markersize=8, mew=2, color=(0, 0, 0),label='Control outlier BV/TV: 0.065')
Axes.plot([MinBVTV,MinBVTV],[0,Data['Variation Coefficient'].max()], linestyle='--', color=(0.4, 0.4, 0.4), label=WLabel)
Axes.plot([0,Data['BVTV'].max()],[Threshold,Threshold], linestyle='dashdot', color=(0, 0, 0), label=TLabel)
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
# Axes.annotate(r'Test $\rho$:' + str(np.round(TestRho,2)),(0.32,1.05))
# Axes.annotate(r'Control $\rho$:' + str(np.round(ControlRho,2)),(0.32,0.90))
# Axes.annotate(r'Grouped $\rho$:' + str(np.round(GroupedRho,2)),(0.32,0.75))
plt.legend(loc='upper right')
# plt.savefig(os.path.join(ResultFolder, '01_BVTV_CV.png'), dpi=1000)
plt.show()
plt.close(Figure)


Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(TestData['BVTV'],TestData['DA'], linestyle='none', marker='o', fillstyle='none', color=(0, 0, 1),label=TestLabel)
Axes.plot(ControlData['BVTV'],ControlData['DA'], linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0),label=ControlLabel)
Axes.plot(TestOutlier['BVTV'],TestOutlier['DA'], linestyle='none', marker='+', markersize=8, mew=2, color=(0, 0, 0),label='Test outlier')
Axes.plot(ControlOutlier['BVTV'],ControlOutlier['DA'], linestyle='none', marker='x', markersize=8, mew=2, color=(0, 0, 0),label='Control outlier')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Degree of Anisotropy (-)')
plt.legend(loc='upper right')
plt.savefig(os.path.join(ResultFolder, '01_BVTV_DA.png'), dpi=1000)
plt.show()
plt.close(Figure)

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(TestData['Variation Coefficient'],TestData['DA'], linestyle='none', marker='o', fillstyle='none', color=(0, 0, 1),label=TestLabel)
Axes.plot(ControlData['Variation Coefficient'],ControlData['DA'], linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0),label=ControlLabel)
Axes.plot(TestOutlier['Variation Coefficient'],TestOutlier['DA'], linestyle='none', marker='+', markersize=8, mew=2, color=(0, 0, 0),label='Test outlier')
Axes.plot(ControlOutlier['Variation Coefficient'],ControlOutlier['DA'], linestyle='none', marker='x', markersize=8, mew=2, color=(0, 0, 0),label='Control outlier')
Axes.set_xlabel('Variation Coefficient (-)')
Axes.set_ylabel('Degree of Anisotropy (-)')
plt.legend(loc='upper right')
plt.savefig(os.path.join(ResultFolder, '01_CV_DA.png'), dpi=1000)
plt.show()
plt.close(Figure)

