# 00 Initialization
import os
import numpy as np
import pandas as pd
from scipy.stats import linregress
import matplotlib.pyplot as plt

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})
plt.rc('font', size=12)

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

        Eii123Data = Eii123Data.append({'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'E11': Eii123[0],
                                        'E22': Eii123[1],
                                        'E33': Eii123[2]}, ignore_index=True)
        Eij123Data = Eij123Data.append({'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'E12': Eij123[0],
                                        'E13': Eij123[1],
                                        'E21': Eij123[2],
                                        'E23': Eij123[3],
                                        'E31': Eij123[4],
                                        'E32': Eij123[5]}, ignore_index=True)
        Eii456Data = Eii456Data.append({'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'E44': Eii456[0],
                                        'E55': Eii456[1],
                                        'E66': Eii456[2]}, ignore_index=True)

        Sii123Data = Sii123Data.append({'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'S11': Sii123[0],
                                        'S22': Sii123[1],
                                        'S33': Sii123[2]}, ignore_index=True)
        Sij123Data = Sij123Data.append({'Sample': SampleData['Scan'],
                                        'ROI Number': SampleData['ROI Number'],
                                        'S12': Sij123[0],
                                        'S13': Sij123[1],
                                        'S21': Sij123[2],
                                        'S23': Sij123[3],
                                        'S31': Sij123[4],
                                        'S32': Sij123[5]}, ignore_index=True)
        Sii456Data = Sii456Data.append({'Sample': SampleData['Scan'],
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
    return Eii123Fit, Eij123Fit, Eii456Fit, Sii123Fit, Sij123Fit, Sii456Fit
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

    ComplianceFile = os.path.join(DataFolder, '03_Compliance_' + DataType + '_' + str(FitDOF) + 'DOFs.png')

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

    StiffnessFile = os.path.join(DataFolder, '04_Stiffness_' + DataType + '_' + str(FitDOF) + 'DOFs.png')

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
MatchFolder = os.path.join(WorkingDirectory,'04_Results/00_Matching/Matches')
TensorFolder = os.path.join(WorkingDirectory,'04_Results/')
ResultFolder = os.path.join(WorkingDirectory,'04_Results/05_MatchedGroups')

## Load groups data
ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('Scans.csv')]
ScanLists.sort()

HealthyGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[0]))
OIGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[1]))

OIGroup = OIGroup.dropna()     # Filter patients without data
OIGroup = OIGroup.reset_index()
OIGroup = OIGroup[['Scan_ID_BSL','Sex','Age','OI_Type']]
OIGroup.columns = ['Sample Number','Sex','Age','OI Type']
OIGroup['Sex'] = OIGroup['Sex'].replace(['Female','Male'],['F','M'])
OIGroup['OI Type'] = OIGroup['OI Type'].replace(['Type I','Type III','Type IV'],[1,3,4])
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
Groups = ['Control','Test']

for Group in Groups:

    if Group == Groups[0]:
        SubGroup = MatchedGroups[0]
        TensorData = os.path.join(TensorFolder,'01_HealthyTibiaXCT2Scans/03_LinearRegression/')
    elif Group == Groups[1]:
        SubGroup = MatchedGroups[1]
        TensorData = os.path.join(TensorFolder,'02_OITibiaXCT2Scans/03_LinearRegression/')

    Data = pd.read_csv(os.path.join(TensorData,'00_Data.csv'))

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

                SampleData = Data[Data['Scan']==Scan]
                SubData = SubData.append(SampleData,ignore_index=True)
                break

    SubData.to_csv(ResultFolder + '/00_' + Group + '_Data.csv',index=False)

ControlData = pd.read_csv(ResultFolder+'/00_Control_Data.csv')
TestData = pd.read_csv(ResultFolder+'/00_Test_Data.csv')

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
                TestData.loc[Index,'OI Type'] = OIType

Data = ControlData.append(TestData,ignore_index=True)



# 02 Define filter parameter
Threshold = (ControlData.quantile(0.75)['Variation Coefficient']
             - ControlData.quantile(0.25)['Variation Coefficient']) * 1.5 \
             + ControlData.quantile(0.75)['Variation Coefficient']
MinBVTV = 0.1/3*2

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot(TestData['BVTV'],TestData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(0, 0, 1),label='Test')
Axes.plot(ControlData['BVTV'],ControlData['Variation Coefficient'], linestyle='none', marker='o', fillstyle='none', color=(1, 0, 0),label='Control')
Axes.plot([MinBVTV,MinBVTV],[0,Data['Variation Coefficient'].max()], linestyle='--', color=(0.4, 0.4, 0.4), label='Windowing')
Axes.plot([0,Data['BVTV'].max()],[Threshold,Threshold], linestyle='dashdot', color=(0, 0, 0), label='Threshold')
Axes.set_xlabel('BV/TV (-)')
Axes.set_ylabel('Coefficient of Variation (-)')
plt.legend(loc='upper right')
plt.savefig(os.path.join(ResultFolder, '01_BVTV_CV.png'), dpi=1000)
plt.show()
plt.close(Figure)



# 03 Filter data
CVFilter = Data['Variation Coefficient'] < Threshold
Windowing = Data['BVTV'] > MinBVTV
FilteredData = Data[CVFilter&Windowing]



# 04 Perform the linear regression
FitResults = pd.DataFrame()
DataSets = ['Grouped','Control','Test']
for DataSet in DataSets:

    if DataSet == DataSets[0]:
        Data2Fit = FilteredData
    if DataSet == DataSets[1]:
        Data2Fit = FilteredData[FilteredData['Group']=='Control']
    if DataSet == DataSets[2]:
        Data2Fit = FilteredData[FilteredData['Group']=='Test']

    DOFs = 5
    Lambda0, Lambda0p, Mu0, k, l = LinearRegression(Data2Fit)
    FitResults = FitResults.append({'Data type':DataSet,
                                    'NSamples':len(Data2Fit),
                                    'DOFs':DOFs,
                                    'Lambda0':Lambda0,
                                    'Lambda0p':Lambda0p,
                                    'Mu0':Mu0,
                                    'k':k,
                                    'l':l}, ignore_index=True)
    if DataSet == DataSets[1] or DataSet == DataSets[2]:
        DOFs = 3
        Exponents = FitResults.loc[0][['k','l']]
        Lambda0, Lambda0p, Mu0, k, l = LinearRegression(Data2Fit,Exponents=Exponents)
        FitResults = FitResults.append({'Data type':DataSet,
                                        'NSamples':len(Data2Fit),
                                        'DOFs':DOFs,
                                        'Lambda0':Lambda0,
                                        'Lambda0p':Lambda0p,
                                        'Mu0':Mu0,
                                        'k':k,
                                        'l':l}, ignore_index=True)

## Store results
FitResults = FitResults.reindex([0,2,4,1,3]).reset_index(drop=True)
FitResults = FitResults.round(3)
ColsToInt = ['Lambda0', 'Lambda0p', 'Mu0', 'NSamples']
FitResults[ColsToInt] = FitResults[ColsToInt].astype(int)
FitResults.to_csv(os.path.join(ResultFolder,'02_FitResults.csv'),index=False)

LatexTable = FitResults.to_latex(index=False,caption='Fit Results')
LatexFile = open(os.path.join(ResultFolder,'02_FitResults.tex'), 'w')
LatexFile.writelines(LatexTable)
LatexFile.close()



# 05 Evaluate fit
FitResults = pd.read_csv(os.path.join(ResultFolder,'02_FitResults.csv'))
FitResult = FitResults.loc[4]

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

## Perform linear regression of results
print('Perform linear regression of results')

## Analyze compliance
XData = pd.concat([Eii123Data[['E11','E22','E33']],
                   -Eij123Data[['E12','E13','E21','E23','E31','E32']],
                   Eii456Data[['E44', 'E55', 'E66']]],axis=1)
YData = pd.concat([Eii123Fit[['E11','E22','E33']],
                   -Eij123Fit[['E12','E13','E21','E23','E31','E32']],
                   Eii456Fit[['E44', 'E55', 'E66']]],axis=1)

RelativeNormError = ComputeRelativeNormError(XData, YData)
Data2Eval['Compliance Norm Error'] = RelativeNormError.values

XData = XData.values.reshape(XData.values.size)
YData = YData.values.reshape(YData.values.size)

Slope, Intercept, RValue, PValue, StdErr = ComplianceRegression(XData, YData, ResultFolder, DataType, FitDOF)
R2, R2adj = DeterminationCoefficients(XData, YData, NParameters=FitDOF, NSamples=NSamples)

## Store compliance results
ComplianceRegressionResults = pd.DataFrame({'Slope':Slope,
                                            'Interception':Intercept,
                                            'RValue':RValue,
                                            'PValue':PValue,
                                            'Standard Error':StdErr,
                                            'RSquare':R2,
                                            'RSquareAdj':R2adj,
                                            'Relative Norm Error':RelativeNormError.mean(),
                                            'Rel Norm Error Std':RelativeNormError.std()},index={0})
ComplianceFile = os.path.join(ResultFolder,'03_Compliance_' + DataType + '_' + str(FitDOF) + 'DOFs.csv')
ComplianceRegressionResults.to_csv(ComplianceFile,index=False)

## Analyze stiffness
XData = pd.concat([Sii123Data[['S11', 'S22', 'S33']],
                   Sij123Data[['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
                   Sii456Data[['S44', 'S55', 'S66']]], axis=1)
YData = pd.concat([Sii123Fit[['S11', 'S22', 'S33']],
                   Sij123Fit[['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
                   Sii456Fit[['S44', 'S55', 'S66']]], axis=1)

RelativeNormError = ComputeRelativeNormError(XData, YData)
Data2Eval['Stiffness Norm Error'] = RelativeNormError.values

XData = XData.values.reshape(XData.values.size)
YData = YData.values.reshape(YData.values.size)

Slope, Intercept, RValue, PValue, StdErr = StiffnessRegression(XData,YData, ResultFolder, DataType, FitDOF)
R2, R2adj = DeterminationCoefficients(XData, YData, NParameters=FitDOF, NSamples=NSamples)

## Store stiffness results
StiffnessRegressionResults = pd.DataFrame({'Slope':Slope,
                                            'Interception':Intercept,
                                            'RValue':RValue,
                                            'PValue':PValue,
                                            'Standard Error':StdErr,
                                            'RSquare':R2,
                                            'RSquareAdj':R2adj,
                                            'Relative Norm Error':RelativeNormError.mean(),
                                            'Rel Norm Error Std':RelativeNormError.std()},index={0})
StiffnessFile = os.path.join(ResultFolder,'04_Stiffness_' + DataType + '_' + str(FitDOF) + 'DOFs.csv')
StiffnessRegressionResults.to_csv(StiffnessFile,index=False)
print('Done')

## Store evaluation results
Data2Eval.to_csv(ResultFolder+'/05_'+DataType+'_Eval.csv')
