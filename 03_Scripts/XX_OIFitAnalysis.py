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


## Set variables
WorkingDirectory = os.getcwd()
MainFolder = os.path.join(WorkingDirectory,'04_Results')
SubFolders = [File for File in os.listdir(MainFolder) if os.path.isdir(os.path.join(MainFolder,File))]
SubFolders.sort()

DataGroup = 1   # 0 = Healthy sub group, 1 = OI sub group

GroupFolder = os.path.join(MainFolder,SubFolders[DataGroup+2])
OITypesFolder = os.path.join(WorkingDirectory,'02_Data')



# 01 Load tensor data
SubData = pd.read_csv(GroupFolder + '/02_SubGroupData.csv')
FitResults = pd.read_csv(GroupFolder + '/05_FitResults.csv')
OITypesData = pd.read_csv(os.path.join(OITypesFolder,'02_OITibiaXCT2Scans.csv'))

OITypes = pd.DataFrame()
for Scan in SubData['Scan']:
    ScanNumber = int(Scan[11:15])

    for PatientID in OITypesData['Scan_ID_BSL']:
        PatientNumber = int(PatientID[-4:])

        if ScanNumber == PatientNumber:

            Filter = OITypesData['Scan_ID_BSL']==PatientID
            OIType = OITypesData[Filter]['OI_Type'].values[0]
            OITypes = OITypes.append({'OI Type':OIType},ignore_index=True)
            break

SubData['OI Type'] = OITypes['OI Type']



# 02 Collect tensors elements
Sii123Data = pd.DataFrame()
Sij123Data = pd.DataFrame()
Sii456Data = pd.DataFrame()

print('Collect tensors data...')
for SampleNumber in SubData.index:

    SampleData = SubData.loc[SampleNumber]
    EngineeringConstants = SampleData[['E1', 'E2', 'E3', 'Mu23', 'Mu31', 'Mu12', 'Nu12', 'Nu13', 'Nu23']].values
    Rho = SampleData['BVTV']
    m1, m2, m3 = SampleData[['m1', 'm2', 'm3']].values

    # Build tensors
    E = ComplianceTensor(EngineeringConstants, EigenValues=[m1,m2,m3],Rho=Rho)
    S = np.linalg.inv(E)

    # Get nonzero elements
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
                    Sii123[ii123] = S[i,j]
                    ii123 += 1
                else:
                    Sij123[ij123] = S[i,j]
                    ij123 += 1
            else:
                if i == j:
                    Sii456[ii456] = S[i,j]
                    ii456 += 1

    Sii123Data = Sii123Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'OI Type':SampleData['OI Type'],
                                    'S11':Sii123[0],
                                    'S22':Sii123[1],
                                    'S33':Sii123[2]},ignore_index=True)
    Sij123Data = Sij123Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'OI Type': SampleData['OI Type'],
                                    'S12':Sij123[0],
                                    'S13':Sij123[1],
                                    'S21':Sij123[2],
                                    'S23':Sij123[3],
                                    'S31':Sij123[4],
                                    'S32':Sij123[5]},ignore_index=True)
    Sii456Data = Sii456Data.append({'Sample':SampleData['Scan'],
                                    'ROI Number': SampleData['ROI Number'],
                                    'OI Type': SampleData['OI Type'],
                                    'S44':Sii456[0],
                                    'S55':Sii456[1],
                                    'S66':Sii456[2]},ignore_index=True)
print('Done')



# 03 Build data with fitted parameter
print('Build data with fitted parameter...')
DOFFilter = FitResults['DOFs'] == 5
DataFilter = FitResults['Data type'] == 'Complete'
FitResult = FitResults[DOFFilter&DataFilter]

NSamples = FitResult['NSamples']
Lambda0, Lambda0p, Mu0, k, l = FitResult[['Lambda0', 'Lambda0p', 'Mu0', 'k', 'l']].values[0]

Sii123Fit = pd.DataFrame()
Sij123Fit = pd.DataFrame()
Sii456Fit = pd.DataFrame()

for SampleNumber in SubData.index:

    SampleData = SubData.loc[SampleNumber]
    Rho = SampleData['BVTV']
    m1, m2, m3 = SampleData[['m1', 'm2', 'm3']].values

    # Build tensors
    S = StiffnessTensor([Lambda0, Lambda0p, Mu0, k, l], EigenValues=[m1, m2, m3], Rho=Rho)

    # Get nonzero elements

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
                    Sii123[ii123] = S[i, j]
                    ii123 += 1
                else:
                    Sij123[ij123] = S[i, j]
                    ij123 += 1
            else:
                if i == j:
                    Sii456[ii456] = S[i, j]
                    ii456 += 1

    Sii123Fit = Sii123Fit.append({'Sample': SampleData['Scan'],
                                  'ROI Number': SampleData['ROI Number'],
                                  'OI Type': SampleData['OI Type'],
                                  'S11': Sii123[0],
                                  'S22': Sii123[1],
                                  'S33': Sii123[2]}, ignore_index=True)
    Sij123Fit = Sij123Fit.append({'Sample': SampleData['Scan'],
                                  'ROI Number': SampleData['ROI Number'],
                                  'OI Type': SampleData['OI Type'],
                                  'S12': Sij123[0],
                                  'S13': Sij123[1],
                                  'S21': Sij123[2],
                                  'S23': Sij123[3],
                                  'S31': Sij123[4],
                                  'S32': Sij123[5]}, ignore_index=True)
    Sii456Fit = Sii456Fit.append({'Sample': SampleData['Scan'],
                                  'ROI Number': SampleData['ROI Number'],
                                  'OI Type': SampleData['OI Type'],
                                  'S44': Sii456[0],
                                  'S55': Sii456[1],
                                  'S66': Sii456[2]}, ignore_index=True)
print('Done')


OITypes = SubData['OI Type'].unique()
Colors = [(0, 0, 1),(1, 0, 0),(0, 1, 0)]

plt.rc('font', size=12)
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot([1e-2, 1e4], [1e-2, 1e4], linestyle='--', linewidth=2, color=(0, 0, 0), label='Diagonal')
for i in range(len(OITypes)):
    FilterData = Sii123Data['OI Type'] == OITypes[i]
    FilterFit = Sii123Data['OI Type'] == OITypes[i]
    Axes.plot(Sii123Data[FilterData][['S11', 'S22', 'S33']],
              Sii123Fit[FilterFit][['S11', 'S22', 'S33']],
              linestyle='none', marker='o', color=Colors[i])
    Axes.plot([], linestyle='none', marker='o', color=Colors[i], label=OITypes[i])
Axes.set_xlim([1e-2, 1e4])
Axes.set_ylim([1e-2, 1e4])
Axes.annotate('Number of sample : %i' % NSamples, (1e1, 4e-2))
Axes.set_xlabel('Observed stiffness (MPa)')
Axes.set_ylabel('Fitted stiffness (MPa)')
plt.legend(loc='upper left')
plt.yscale('log')
plt.xscale('log')
plt.savefig(os.path.join(GroupFolder,'08_OITypes_Fit_Sii123.png'),dpi=1000)
plt.show()
plt.close(Figure)


Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot([1e-2, 1e4], [1e-2, 1e4], linestyle='--', linewidth=2, color=(0, 0, 0), label='Diagonal')
for i in range(len(OITypes)):
    FilterData = Sij123Data['OI Type'] == OITypes[i]
    FilterFit = Sij123Fit['OI Type'] == OITypes[i]
    Axes.plot(Sij123Data[FilterData][['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
              Sij123Fit[FilterFit][['S12', 'S13', 'S21', 'S23', 'S31', 'S32']],
              linestyle='none', marker='o', color=Colors[i])
    Axes.plot([], linestyle='none', marker='o', color=Colors[i], label=OITypes[i])
Axes.set_xlim([1e-2, 1e4])
Axes.set_ylim([1e-2, 1e4])
Axes.annotate('Number of sample : %i' % NSamples, (1e1, 4e-2))
Axes.set_xlabel('Observed stiffness (MPa)')
Axes.set_ylabel('Fitted stiffness (MPa)')
plt.legend(loc='upper left')
plt.yscale('log')
plt.xscale('log')
plt.savefig(os.path.join(GroupFolder,'08_OITypes_Fit_Sij123.png'),dpi=1000)
plt.show()
plt.close(Figure)

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=100)
Axes.plot([1e-2, 1e4], [1e-2, 1e4], linestyle='--', linewidth=2, color=(0, 0, 0), label='Diagonal')
for i in range(len(OITypes)):
    FilterData = Sii456Data['OI Type'] == OITypes[i]
    FilterFit = Sii456Data['OI Type'] == OITypes[i]
    Axes.plot(Sii456Data[FilterData][['S44', 'S55', 'S66']],
              Sii456Fit[FilterFit][['S44', 'S55', 'S66']],
              linestyle='none', marker='o', color=Colors[i])
    Axes.plot([], linestyle='none', marker='o', color=Colors[i], label=OITypes[i])
Axes.set_xlim([1e-2, 1e4])
Axes.set_ylim([1e-2, 1e4])
Axes.annotate('Number of sample : %i' % NSamples, (1e1, 4e-2))
Axes.set_xlabel('Observed stiffness (MPa)')
Axes.set_ylabel('Fitted stiffness (MPa)')
plt.legend(loc='upper left')
plt.yscale('log')
plt.xscale('log')
plt.savefig(os.path.join(GroupFolder,'08_OITypes_Fit_Sii456.png'),dpi=1000)
plt.show()
plt.close(Figure)