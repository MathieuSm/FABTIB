# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

## Define functions
def DyadicProduct(A,B):

    if A.size == 3:

        if isinstance(A[0], np.float):
            C = np.zeros((3,3))
        else:
            C = sp.zeros(3)

        for i in range(3):
            for j in range(3):
                C[i,j] = A[i]*B[j]

        if not isinstance(A[0], np.float):
            C = np.array(C)

    elif A.size == 9:

        if isinstance(A[0,0], np.float):
            C = np.zeros((3,3,3,3))
        else:
            C = sp.zeros(9)

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        if isinstance(A[0, 0], np.float):
                            C[i,j,k,l] = A[i,j] * B[k,l]
                        else:
                            C[3*i+j,3*k+l] = A[i,j] * B[k,l]

        if not isinstance(A[0,0], np.float):
            C = IsoMorphism99_3333(C)

    else:
        print('Matrices sizes mismatch')

    return C
def SymmetricProduct(A,B):

    if isinstance(A[0, 0], np.float):
        C = np.zeros((3, 3, 3, 3))
    else:
        C = sp.zeros(9)

    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    if isinstance(A[0, 0], np.float):
                        C[i,j,k,l] = (1/2)*(A[i,k]*B[j,l]+A[i,l]*B[j,k])
                    else:
                        C[3*i+j,3*k+l] = (1/2)*(A[i,k]*B[j,l]+A[i,l]*B[j,k])

    if not isinstance(A[0,0], np.float):
        C = IsoMorphism99_3333(C)

    return C
def CheckMinorSymmetry(A):
    MinorSymmetry = True
    for i in range(3):
        for j in range(3):
            PartialTensor = A[:,:, i, j]
            if PartialTensor[1, 0] == PartialTensor[0, 1] and PartialTensor[2, 0] == PartialTensor[0, 2] and PartialTensor[1, 2] == PartialTensor[2, 1]:
                MinorSymmetry = True
            else:
                MinorSymmetry = False
                break

    if MinorSymmetry == True:
        for i in range(3):
            for j in range(3):
                PartialTensor = np.squeeze(A[i, j,:,:])
                if PartialTensor[1, 0] == PartialTensor[0, 1] and PartialTensor[2, 0] == PartialTensor[0, 2] and PartialTensor[1, 2] == PartialTensor[2, 1]:
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
            B = np.zeros((6,6))
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
def ComplianceTensor(EngineeringConstants, EigenValues=[1,1,1], Rho=0, EigenVectors=np.zeros(3)):

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
def LinearRegression(Data,Exponents=[0,0]):

    if Exponents[0] == 0 and Exponents[1] == 0:

        for Index in Data.index:

            SampleData = Data.loc[Index]
            EngineeringConstants = SampleData[['E1','E2','E3','Mu23','Mu31','Mu12','Nu12','Nu13','Nu23']].values
            Rho = SampleData['BVTV']
            m1, m2, m3 = SampleData[['m1', 'm2', 'm3']].values

            # Build Compliance Tensors
            E = ComplianceTensor(EngineeringConstants)
            S = np.linalg.inv(E)

            y = np.array(np.log([S[0, 0], S[1, 1], S[2, 2],
                                 S[2, 1], S[0, 2], S[1, 0],
                                 S[3, 3] / 2, S[4, 4] / 2, S[5, 5] / 2,
                                 S[1, 2], S[2, 0], S[0, 1]]))

            X = np.array([[1, 0, 0, np.log(Rho), np.log(m1 ** 2)],
                          [1, 0, 0, np.log(Rho), np.log(m2 ** 2)],
                          [1, 0, 0, np.log(Rho), np.log(m3 ** 2)],
                          [0, 1, 0, np.log(Rho), np.log(m3 * m2)],
                          [0, 1, 0, np.log(Rho), np.log(m1 * m3)],
                          [0, 1, 0, np.log(Rho), np.log(m2 * m1)],
                          [0, 0, 1, np.log(Rho), np.log(m2 * m3)],
                          [0, 0, 1, np.log(Rho), np.log(m3 * m1)],
                          [0, 0, 1, np.log(Rho), np.log(m1 * m2)],
                          [0, 1, 0, np.log(Rho), np.log(m2 * m3)],
                          [0, 1, 0, np.log(Rho), np.log(m3 * m1)],
                          [0, 1, 0, np.log(Rho), np.log(m1 * m2)]])

            y = np.matrix(y).T
            X = np.matrix(X)

            if Index == Data.index[0]:
                ytot = y
                Xtot = X
            else:
                ytot = np.append(ytot, y, 0)
                Xtot = np.append(Xtot, X, 0)

        LHS = Xtot.T * Xtot
        RHS = Xtot.T * ytot
        Solution = np.linalg.solve(LHS, RHS)

        l = Solution[4, 0]
        k = Solution[3, 0]
        Mu0 = np.exp(Solution[2, 0])
        Lambda0p = np.exp(Solution[1, 0])
        Lambda0 = np.exp(Solution[0, 0]) - 2 * Mu0

    else:

        k, l = Exponents

        for Index in Data.index:

            SampleData = Data.loc[Index]
            EngineeringConstants = SampleData[['E1','E2','E3','Mu23','Mu31','Mu12','Nu12','Nu13','Nu23']].values
            Rho = SampleData['BVTV']
            m1, m2, m3 = SampleData[['m1', 'm2', 'm3']].values

            # Build Compliance Tensors
            E = ComplianceTensor(EngineeringConstants)
            S = np.linalg.inv(E)

            y = np.array(np.log([S[0, 0], S[1, 1], S[2, 2],
                                 S[2, 1], S[0, 2], S[1, 0],
                                 S[3, 3] / 2, S[4, 4] / 2, S[5, 5] / 2,
                                 S[1, 2], S[2, 0], S[0, 1]]))

            X1 = np.array([[1, 0, 0],
                           [1, 0, 0],
                           [1, 0, 0],
                           [0, 1, 0],
                           [0, 1, 0],
                           [0, 1, 0],
                           [0, 0, 1],
                           [0, 0, 1],
                           [0, 0, 1],
                           [0, 1, 0],
                           [0, 1, 0],
                           [0, 1, 0]])

            X2 = np.array([[np.log(Rho), np.log(m1 ** 2)],
                           [np.log(Rho), np.log(m2 ** 2)],
                           [np.log(Rho), np.log(m3 ** 2)],
                           [np.log(Rho), np.log(m3 * m2)],
                           [np.log(Rho), np.log(m1 * m3)],
                           [np.log(Rho), np.log(m2 * m1)],
                           [np.log(Rho), np.log(m2 * m3)],
                           [np.log(Rho), np.log(m3 * m1)],
                           [np.log(Rho), np.log(m1 * m2)],
                           [np.log(Rho), np.log(m2 * m3)],
                           [np.log(Rho), np.log(m3 * m1)],
                           [np.log(Rho), np.log(m1 * m2)]])

            y = np.matrix(y).T
            X1 = np.matrix(X1)
            X2 = np.matrix(X2)

            if Index == Data.index[0]:
                ytot = y
                X1tot = X1
                X2tot = X2

            else:
                ytot = np.append(ytot, y, 0)
                X1tot = np.append(X1tot, X1, 0)
                X2tot = np.append(X2tot, X2, 0)

        LHS = X1tot.T * X1tot
        RHS = X1tot.T * (ytot - X2tot * np.matrix([k, l]).T)
        Solution = np.linalg.solve(LHS, RHS)

        Mu0 = np.exp(Solution[2, 0])
        Lambda0p = np.exp(Solution[1, 0])
        Lambda0 = np.exp(Solution[0, 0]) - 2 * Mu0


    return Lambda0, Lambda0p, Mu0, k, l
def ComputeRelativeNormError(XData, YData):

    # Compute Relative Error (Euclidian distance) in log space
    TensorDiff = (np.log(XData) - np.log(YData))**2
    Error = TensorDiff.sum(axis=1)

    # Compute denominator to normalize the error
    LogTensor = np.log(XData)**2
    Denominator = LogTensor.sum(axis=1)

    RelativeNormError = np.sqrt(Error/Denominator)

    return RelativeNormError
def ComplianceRegression(XData, YData, DataFolder, DataType, FitDOF):

    ComplianceFile = os.path.join(DataFolder, '06_Compliance_' + DataType + '_' + str(FitDOF) + 'DOFs.png')

    Slope, Intercept, RValue, PValue, StdErr = linregress(np.log(XData), np.log(YData))
    XArray = np.array([XData.min(), XData.max()])
    YArray = XArray * Slope

    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
    Axes.plot([1e1, 1e-5], [1e1, 1e-5], linestyle='--', linewidth=2, color=(0, 0, 0), label='Diagonal')
    Axes.plot(Eii123Data[['E11', 'E22', 'E33']],
              Eii123Fit[['E11', 'E22', 'E33']],
              linestyle='none', marker='o', color=(0, 0, 1))
    Axes.plot([], linestyle='none', marker='o', color=(0, 0, 1), label='$\epsilon_{ii}^{-1}$')
    Axes.plot(-Eij123Data[['E12', 'E13', 'E21', 'E23', 'E31', 'E32']],
              -Eij123Fit[['E12', 'E13', 'E21', 'E23', 'E31', 'E32']],
              linestyle='none', marker='o', color=(0, 1, 0))
    Axes.plot([], linestyle='none', marker='o', color=(0, 1, 0), label=r'$-\nu_{ij}/\epsilon_{ij}$')
    Axes.plot(Eii456Data[['E44', 'E55', 'E66']],
              Eii456Fit[['E44', 'E55', 'E66']],
              linestyle='none', marker='o', color=(1, 0, 0))
    Axes.plot([], linestyle='none', marker='o', color=(1, 0, 0), label='$\mu_{ij}^{-1}$')
    Axes.plot(XArray, YArray, color=(0, 0, 0), linewidth=0.75, label='Fit results')
    Axes.set_xlim([1e1, 1e-5])
    Axes.set_ylim([1e1, 1e-5])
    Axes.annotate('Number of sample : %i' % NSamples, (1e-2, 3e0))
    Axes.annotate('R$^{2}$ : %.2f' % (RValue ** 2), (1e-2, 7e0))
    Axes.set_xlabel('Observed compliance (MPa$^{-1}$)')
    Axes.set_ylabel('Fitted compliance (MPa$^{-1}$)')
    plt.legend(loc='upper left')
    plt.xscale('log')
    plt.yscale('log')
    plt.savefig(ComplianceFile,dpi=1000)
    plt.show()
    plt.close(Figure)

    return Slope, Intercept, RValue, PValue, StdErr
def StiffnessRegression(XData, YData, DataFolder, DataType, FitDOF):

    StiffnessFile = os.path.join(DataFolder, '07_Stiffness_' + DataType + '_' + str(FitDOF) + 'DOFs.png')

    Slope, Intercept, RValue, PValue, StdErr = linregress(np.log(XData), np.log(YData))
    XArray = np.array([XData.min(), XData.max()])
    YArray = XArray * Slope + Intercept

    Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
    Axes.plot([1e-2, 1e4], [1e-2, 1e4], linestyle='--', linewidth=2, color=(0, 0, 0), label='Diagonal')
    Axes.plot(Sii123Data[['S11', 'S22', 'S33']],
              Sii123Fit[['S11', 'S22', 'S33']],
              linestyle='none', marker='o', color=(0, 0, 1))
    Axes.plot([], linestyle='none', marker='o', color=(0, 0, 1), label='$\lambda_{ii}$')
    Axes.plot(Sij123Data[['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
              Sij123Fit[['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
              linestyle='none', marker='o', color=(0, 1, 0))
    Axes.plot([], linestyle='none', marker='o', color=(0, 1, 0), label=r'$\lambda_{ij}$')
    Axes.plot(Sii456Data[['S44', 'S55', 'S66']],
              Sii456Fit[['S44', 'S55', 'S66']],
              linestyle='none', marker='o', color=(1, 0, 0))
    Axes.plot([], linestyle='none', marker='o', color=(1, 0, 0), label='$\mu_{ij}$')
    Axes.plot(XArray, YArray, color=(0, 0, 0), linewidth=0.75, label='Fit results')
    Axes.set_xlim([1e-2, 1e4])
    Axes.set_ylim([1e-2, 1e4])
    Axes.annotate('Number of sample : %i' % NSamples, (1e1, 4e-2))
    Axes.annotate('R$^{2}$ : %.2f' % (RValue ** 2), (1e1, 1.5e-2))
    Axes.set_xlabel('Observed stiffness (MPa)')
    Axes.set_ylabel('Fitted stiffness (MPa)')
    plt.legend(loc='upper left')
    plt.yscale('log')
    plt.xscale('log')
    plt.savefig(StiffnessFile,dpi=1000)
    plt.show()
    plt.close(Figure)

    return Slope, Intercept, RValue, PValue, StdErr
def DeterminationCoefficients(XData, YData, NParameters, NSamples):

    # Sum of the square of the residuals
    Residuals = (np.log(YData) - np.log(XData))**2
    SCE = Residuals.sum()

    # Sum of the square of the observation
    Mean = np.mean(np.log(XData))
    TotalSum = np.sum(np.log(XData) ** 2)
    SCT = TotalSum - 12 * NSamples * Mean ** 2

    R2    = 1 - SCE / SCT
    R2adj = 1 - SCE / SCT * (12 * NSamples - 1) / (12 * NSamples - NParameters - 1)

    return R2, R2adj


# 01 Load Data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')
ResultFolder = os.path.join(WorkingDirectory,'04_Results/00_Matching/Matches')

## Load groups data
ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('Scans.csv')]
ScanLists.sort()

HealthyGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[0]))
OIGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[1]))

OIGroup = OIGroup.dropna()     # Filter patients without data
OIGroup = OIGroup.reset_index()
OIGroup['Sex'] = OIGroup['Sex'].replace(['Female','Male'],['F','M'])
OIGroup = OIGroup[['Scan_ID_BSL','Sex','Age']]
OIGroup.columns = ['Sample Number','Sex','Age']
OIGroup['Age'] = OIGroup['Age'].astype('int')

## Load matching results
Matches = [File for File in os.listdir(ResultFolder) if File.endswith('.txt')]
Matches.sort()
Match = Matches[-1]
MatchingResults = pd.read_csv(os.path.join(ResultFolder, Match), header=None)

## Get matched samples
OIList = MatchingResults.index.values
MatchedOI = OIGroup.loc[OIList]
ControlList = MatchingResults[0].values
MatchedControl = HealthyGroup.loc[ControlList]