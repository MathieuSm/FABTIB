import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
from scipy.stats import linregress
import matplotlib.pyplot as plt


# 00 Initialization
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


## Set variables
WorkingDirectory = os.getcwd()
MainFolder = os.path.join(WorkingDirectory,'04_Results')
SubFolders = [File for File in os.listdir(MainFolder) if os.path.isdir(os.path.join(MainFolder,File))]
SubFolders.sort()

DataGroup = 1   # 0 = Healthy sub group, 1 = OI sub group

DataFolder = os.path.join(MainFolder,SubFolders[DataGroup],'03_LinearRegression')
GroupFolder = os.path.join(MainFolder,SubFolders[DataGroup+2])



# 01 Load tensor data
SubGroup = pd.read_csv(GroupFolder + '/02_SubGroup.csv')
if DataGroup == 1:
    SubGroup.columns = ['Folder', 'Patient_ID', 'Sample Number', 'Age', 'Sex', 'OI_Type']

Data = pd.read_csv(os.path.join(DataFolder,'00_Data.csv'))

SubData = pd.DataFrame()
for Sample in SubGroup['Sample Number']:

    for Scan in Data['Scan']:

        if DataGroup == 0:
            ScanNumber = Scan[4:8]
            SampleNumber = Sample
        elif DataGroup == 1:
            ScanNumber = Scan[11:15]
            SampleNumber = Sample[-4:]

        if int(ScanNumber) == int(SampleNumber):

            SampleData = Data[Data['Scan']==Scan]
            SubData = SubData.append(SampleData,ignore_index=True)
            break
SubData.to_csv(GroupFolder + '/02_SubGroupData.csv',index=False)



# 02 Define filter parameter
Threshold = (Data.quantile(0.75)['Variation Coefficient']
             - Data.quantile(0.25)['Variation Coefficient']) * 1.5 \
             + Data.quantile(0.75)['Variation Coefficient']
MinBVTV = Data['BVTV'].min()
MaxBVTV = Data['BVTV'].max()

## Compare to actual filter parameter
Filter = pd.read_csv(os.path.join(MainFolder,SubFolders[DataGroup+2],'03_Filter.csv'))

if MinBVTV < Filter['Min BVTV'].values[0]:
    MinBVTV = Filter['Min BVTV'].values[0]
if MaxBVTV > Filter['Max BVTV'].values[0]:
    MaxBVTV = Filter['Max BVTV'].values[0]

if DataGroup == 1:
    Threshold = Filter['Threshold'].values[0]

FilterData = pd.DataFrame({'Threshold':Threshold,'Min BVTV':MinBVTV,'Max BVTV':MaxBVTV},index=[0])

## Save filter parameters for both group
for Group in range(2):
    FilterData.to_csv(os.path.join(MainFolder,SubFolders[Group+2],'03_Filter.csv'),index=False)



# 03 Filter data
Threshold, MinBVTV, MaxBVTV = Filter.values[0]

CVFilter = SubData['Variation Coefficient'] > Threshold
BFMaxFilter = SubData['BVTV'] > MaxBVTV
BFMinFilter = SubData['BVTV'] < MinBVTV

ExcludedData = SubData[BFMaxFilter|BFMinFilter]
# ExcludedData = Data[CVFilter|BFMaxFilter|BFMinFilter]


CVFilter = SubData['Variation Coefficient'] <= Threshold
BFMaxFilter = SubData['BVTV'] <= MaxBVTV
BFMinFilter = SubData['BVTV'] >= MinBVTV

WindowedData = SubData[BFMaxFilter&BFMinFilter]
FilteredData = SubData[CVFilter&BFMaxFilter&BFMinFilter]

ThresholdFilter = WindowedData['Variation Coefficient'] > Threshold
ThresholdData = WindowedData[ThresholdFilter]

## Plot BVTV vs CV
plt.rc('font', size=12)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(SubData['BVTV'],SubData['Variation Coefficient'],linestyle='none',marker='o',color=(0,0,0),fillstyle='none',label='Data')
Axes.plot([MinBVTV,MinBVTV],[0,2],color=(0,0,1),linestyle='--',label='BV/TV window')
Axes.plot([MaxBVTV,MaxBVTV],[0,2],color=(0,0,1),linestyle='--')
Axes.plot(ExcludedData['BVTV'],ExcludedData['Variation Coefficient'],linestyle='none',marker='x',color=(0,0,1),label='BV/TV Windowing')
Axes.plot([0,0.7],[Threshold,Threshold],color=(1,0,0),linestyle='--',label='Threshold')
Axes.plot([0,0.7],[Threshold,Threshold],color=(1,0,0),linestyle='--')
Axes.plot(ThresholdData['BVTV'],ThresholdData['Variation Coefficient'],linestyle='none',marker='x',color=(1,0,0),label='CV Thresholding')
Axes.set_xlim([0,0.7])
Axes.set_ylim([0,1.85])
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right',framealpha=1)
plt.savefig(os.path.join(MainFolder,SubFolders[DataGroup+2],'04_CVVsBVTV.png'),dpi=1000)
plt.show()
plt.close(Figure)



# 04 Perform the linear regression
FitResults = pd.DataFrame()
for Subset in range(3):

    if Subset == 0:
        Data2Fit = SubData
        DataType = 'Complete'
    if Subset == 1:
        Data2Fit = WindowedData
        DataType = 'Windowed'
    if Subset == 2:
        Data2Fit = FilteredData
        DataType = 'Filtered'

    DOFs = 5
    Lambda0, Lambda0p, Mu0, k, l = LinearRegression(Data2Fit)
    FitResults = FitResults.append({'Data type':DataType,
                                    'NSamples':len(Data2Fit),
                                    'DOFs':DOFs,
                                    'Lambda0':Lambda0,
                                    'Lambda0p':Lambda0p,
                                    'Mu0':Mu0,
                                    'k':k,
                                    'l':l},
                                   ignore_index=True)
    if Subset == 0 or Subset == 1:
        DOFs = 3
        Lambda0, Lambda0p, Mu0, k, l = LinearRegression(Data2Fit,Exponents=[1.55,0.84])
        FitResults = FitResults.append({'Data type':DataType,
                                        'NSamples':len(Data2Fit),
                                        'DOFs':DOFs,
                                        'Lambda0':Lambda0,
                                        'Lambda0p':Lambda0p,
                                        'Mu0':Mu0,
                                        'k':k,
                                        'l':l},
                                       ignore_index=True)

    if Subset == 2:
        DOFs = 3
        Lambda0, Lambda0p, Mu0, k, l = LinearRegression(Data2Fit,Exponents=[1.55,0.82])
        FitResults = FitResults.append({'Data type':DataType,
                                        'NSamples':len(Data2Fit),
                                        'DOFs':DOFs,
                                        'Lambda0':Lambda0,
                                        'Lambda0p':Lambda0p,
                                        'Mu0':Mu0,
                                        'k':k,
                                        'l':l},
                                       ignore_index=True)

## Store results
FitResults = FitResults.round(3)
ColsToInt = ['Lambda0', 'Lambda0p', 'Mu0', 'NSamples']
FitResults[ColsToInt] = FitResults[ColsToInt].astype(int)
FitResults.to_csv(os.path.join(GroupFolder,'05_FitResults.csv'),index=False)

LatexTable = FitResults.to_latex(index=False,caption='Fit Results')
LatexFile = open(os.path.join(GroupFolder,'05_FitResults.tex'), 'w')
LatexFile.writelines(LatexTable)
LatexFile.close()


# 05 Evaluate fit
DataTypes = ['Complete', 'Windowed', 'Filtered']
DataType = DataTypes[2]
FitDOFs = [3, 5]
FitDOF = FitDOFs[0]
plt.rc('font', size=12)


Eii123Data = pd.DataFrame()
Eij123Data = pd.DataFrame()
Eii456Data = pd.DataFrame()

Sii123Data = pd.DataFrame()
Sij123Data = pd.DataFrame()
Sii456Data = pd.DataFrame()

## If necessary filter data (variation coefficient)
if DataType == DataTypes[0]:
    Data2Eval = SubData
elif DataType == DataTypes[1]:
    Data2Eval = WindowedData
elif DataType == DataTypes[2]:
    Data2Eval = FilteredData

## Collect tensors data
print('Collect tensors data...')
for SampleNumber in Data2Eval.index:

    SampleData = Data2Eval.loc[SampleNumber]
    EngineeringConstants = SampleData[['E1', 'E2', 'E3', 'Mu23', 'Mu31', 'Mu12', 'Nu12', 'Nu13', 'Nu23']].values
    Rho = SampleData['BVTV']
    m1, m2, m3 = SampleData[['m1', 'm2', 'm3']].values

    # Build tensors
    E = ComplianceTensor(EngineeringConstants, EigenValues=[m1,m2,m3],Rho=Rho)
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
                    Eii123[ii123] = E[i,j]
                    Sii123[ii123] = S[i,j]
                    ii123 += 1
                else:
                    Eij123[ij123] = E[i,j]
                    Sij123[ij123] = S[i,j]
                    ij123 += 1
            else:
                if i == j:
                    Eii456[ii456] = E[i,j]
                    Sii456[ii456] = S[i,j]
                    ii456 += 1

    Eii123Data = Eii123Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'E11':Eii123[0],
                                    'E22':Eii123[1],
                                    'E33':Eii123[2]},ignore_index=True)
    Eij123Data = Eij123Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'E12':Eij123[0],
                                    'E13':Eij123[1],
                                    'E21':Eij123[2],
                                    'E23':Eij123[3],
                                    'E31':Eij123[4],
                                    'E32':Eij123[5]},ignore_index=True)
    Eii456Data = Eii456Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'E44':Eii456[0],
                                    'E55':Eii456[1],
                                    'E66':Eii456[2]},ignore_index=True)

    Sii123Data = Sii123Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'S11':Sii123[0],
                                    'S22':Sii123[1],
                                    'S33':Sii123[2]},ignore_index=True)
    Sij123Data = Sij123Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'S12':Sij123[0],
                                    'S13':Sij123[1],
                                    'S21':Sij123[2],
                                    'S23':Sij123[3],
                                    'S31':Sij123[4],
                                    'S32':Sij123[5]},ignore_index=True)
    Sii456Data = Sii456Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'S44':Sii456[0],
                                    'S55':Sii456[1],
                                    'S66':Sii456[2]},ignore_index=True)
print('Done')

## Build data with fitted parameter
print('Build data with fitted parameter...')
DOFFilter = FitResults['DOFs'] == FitDOF
DataFilter = FitResults['Data type'] == DataType
FitResult = FitResults[DOFFilter&DataFilter]

NSamples = FitResult['NSamples']
Lambda0, Lambda0p, Mu0, k, l = FitResult[['Lambda0', 'Lambda0p', 'Mu0', 'k', 'l']].values[0]

Eii123Fit = pd.DataFrame()
Eij123Fit = pd.DataFrame()
Eii456Fit = pd.DataFrame()

Sii123Fit = pd.DataFrame()
Sij123Fit = pd.DataFrame()
Sii456Fit = pd.DataFrame()

for SampleNumber in Data2Eval.index:

    SampleData = Data2Eval.loc[SampleNumber]
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

    Eii123Fit = Eii123Fit.append({'Sample': SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'E11': Eii123[0],
                                    'E22': Eii123[1],
                                    'E33': Eii123[2]}, ignore_index=True)
    Eij123Fit = Eij123Fit.append({'Sample': SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'E12': Eij123[0],
                                    'E13': Eij123[1],
                                    'E21': Eij123[2],
                                    'E23': Eij123[3],
                                    'E31': Eij123[4],
                                    'E32': Eij123[5]}, ignore_index=True)
    Eii456Fit = Eii456Fit.append({'Sample': SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'E44': Eii456[0],
                                    'E55': Eii456[1],
                                    'E66': Eii456[2]}, ignore_index=True)

    Sii123Fit = Sii123Fit.append({'Sample': SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'S11': Sii123[0],
                                    'S22': Sii123[1],
                                    'S33': Sii123[2]}, ignore_index=True)
    Sij123Fit = Sij123Fit.append({'Sample': SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'S12': Sij123[0],
                                    'S13': Sij123[1],
                                    'S21': Sij123[2],
                                    'S23': Sij123[3],
                                    'S31': Sij123[4],
                                    'S32': Sij123[5]}, ignore_index=True)
    Sii456Fit = Sii456Fit.append({'Sample': SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'S44': Sii456[0],
                                    'S55': Sii456[1],
                                    'S66': Sii456[2]}, ignore_index=True)
print('Done')



# 05 Perform linear regression of results
print('Perform linear regression of results')
XData = pd.concat([Eii123Data[['E11','E22','E33']],
                   -Eij123Data[['E12','E13','E21','E23','E31','E32']],
                   Eii456Data[['E44', 'E55', 'E66']]],axis=1)
YData = pd.concat([Eii123Fit[['E11','E22','E33']],
                   -Eij123Fit[['E12','E13','E21','E23','E31','E32']],
                   Eii456Fit[['E44', 'E55', 'E66']]],axis=1)

RelativeNormError = ComputeRelativeNormError(XData, YData)
Data['Compliance Norm Error'] = RelativeNormError

XData = XData.values.reshape(XData.values.size)
YData = YData.values.reshape(YData.values.size)

Slope, Intercept, RValue, PValue, StdErr = ComplianceRegression(XData, YData, GroupFolder, DataType, FitDOF)
R2, R2adj = DeterminationCoefficients(XData, YData, NParameters=FitDOF, NSamples=NSamples)

ComplianceRegressionResults = pd.DataFrame({'Slope':Slope,
                                            'Interception':Intercept,
                                            'RValue':RValue,
                                            'PValue':PValue,
                                            'Standard Error':StdErr,
                                            'RSquare':R2.values[0],
                                            'RSquareAdj':R2adj.values[0],
                                            'Relative Norm Error':RelativeNormError.mean(),
                                            'Rel Norm Error Std':RelativeNormError.std()},index={0})
ComplianceFile = os.path.join(GroupFolder,'04_Compliance_' + DataType + '_' + str(FitDOF) + 'DOFs.csv')
ComplianceRegressionResults.to_csv(ComplianceFile,index=False)

XData = pd.concat([Sii123Data[['S11', 'S22', 'S33']],
                   Sij123Data[['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
                   Sii456Data[['S44', 'S55', 'S66']]], axis=1)
YData = pd.concat([Sii123Fit[['S11', 'S22', 'S33']],
                   Sij123Fit[['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
                   Sii456Fit[['S44', 'S55', 'S66']]], axis=1)

RelativeNormError = ComputeRelativeNormError(XData, YData)
Data['Stiffness Norm Error'] = RelativeNormError

XData = XData.values.reshape(XData.values.size)
YData = YData.values.reshape(YData.values.size)

Slope, Intercept, RValue, PValue, StdErr = StiffnessRegression(XData,YData, GroupFolder, DataType, FitDOF)
R2, R2adj = DeterminationCoefficients(XData, YData, NParameters=FitDOF, NSamples=NSamples)

StiffnessRegressionResults = pd.DataFrame({'Slope':Slope,
                                            'Interception':Intercept,
                                            'RValue':RValue,
                                            'PValue':PValue,
                                            'Standard Error':StdErr,
                                            'RSquare':R2.values[0],
                                            'RSquareAdj':R2adj.values[0],
                                            'Relative Norm Error':RelativeNormError.mean(),
                                            'Rel Norm Error Std':RelativeNormError.std()},index={0})
StiffnessFile = os.path.join(GroupFolder,'05_Stiffness_' + DataType + '_' + str(FitDOF) + 'DOFs.csv')
StiffnessRegressionResults.to_csv(StiffnessFile,index=False)
print('Done')
