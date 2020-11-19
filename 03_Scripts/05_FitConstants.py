import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
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

## Set variables
WorkingDirectory = os.getcwd()
ScanFolder = os.path.join(WorkingDirectory,'02_Data')
DataSubFolders = [File for File in os.listdir(ScanFolder) if os.path.isdir(os.path.join(ScanFolder,File))]
DataSubFolders.sort()

DataGroup = 0   # 0 = Healthy group, 1 = OI group

DataFolder = os.path.join(WorkingDirectory,'04_Results',DataSubFolders[DataGroup],'03_LinearRegression')
Data = pd.read_csv(os.path.join(DataFolder,'Data.csv'))
Filter = pd.read_csv(os.path.join(DataFolder,'Filter.csv'))



# 01 Filter data by variation coefficient and BVTV windowing
Threshold, MinBVTV, MaxBVTV = Filter.values[0]

CVFilter = Data['Variation Coefficient'] > Threshold
BFMaxFilter = Data['BVTV'] > MaxBVTV
BFMinFilter = Data['BVTV'] < MinBVTV

ExcludedData = Data[BFMaxFilter|BFMinFilter]
# ExcludedData = Data[CVFilter|BFMaxFilter|BFMinFilter]


CVFilter = Data['Variation Coefficient'] <= Threshold
BFMaxFilter = Data['BVTV'] < MaxBVTV
BFMinFilter = Data['BVTV'] > MinBVTV

WindowedData = Data[BFMaxFilter&BFMinFilter]
FilteredData = Data[CVFilter&BFMaxFilter&BFMinFilter]


ThresholdFilter = WindowedData['Variation Coefficient'] > Threshold
ThresholdData = WindowedData[ThresholdFilter]

## If necessary filter negative Poisson's ratio
Data = Data[Data['Nu12']>0]
Data = Data[Data['Nu13']>0]
Data = Data[Data['Nu23']>0]

## Plot BVTV vs CV
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.plot(Data['BVTV'],Data['Variation Coefficient'],linestyle='none',marker='o',color=(0,0,0),fillstyle='none',label='Data')
Axes.plot([MinBVTV,MinBVTV],[0,1],color=(0,0,1),linestyle='--',label='BV/TV window')
Axes.plot([MaxBVTV,MaxBVTV],[0,1],color=(0,0,1),linestyle='--')
Axes.plot(ExcludedData['BVTV'],ExcludedData['Variation Coefficient'],linestyle='none',marker='x',color=(0,0,1),label='BV/TV Windowing')
Axes.plot([0,0.7],[Threshold,Threshold],color=(1,0,0),linestyle='--',label='Threshold')
Axes.plot([0,0.7],[Threshold,Threshold],color=(1,0,0),linestyle='--')
Axes.plot(ThresholdData['BVTV'],ThresholdData['Variation Coefficient'],linestyle='none',marker='x',color=(1,0,0),label='CV Thresholding')
Axes.set_xlim([0,0.7])
Axes.set_ylim([0,1])
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right')
plt.savefig(os.path.join(DataFolder,'04_BVTV_CV_' + DataSubFolders[DataGroup][3:-14] + '.png'))
plt.show()
plt.close(Figure)

# 02 Perform the linear regression
FitResults = pd.DataFrame()
for Subset in range(3):

    if Subset == 0:
        Data2Fit = Data
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

# 03 Store results
FitResults = FitResults.round(3)
ColsToInt = ['Lambda0', 'Lambda0p', 'Mu0', 'NSamples']
FitResults[ColsToInt] = FitResults[ColsToInt].astype(int)
FitResults.to_csv(os.path.join(DataFolder,'02_FitResults.csv'),index=False)

LatexTable = FitResults.to_latex(index=False,caption='Fit Results')
LatexFile = open(os.path.join(DataFolder,'02_FitResults.tex'), 'w')
LatexFile.writelines(LatexTable)
LatexFile.close()