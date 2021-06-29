import sys
sys.path.insert(0, '//06_Problems/01_TensorTransformation/')
import os
import numpy as np
import pandas as pd
from ContinuumMechanics import *


desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

## Define function
def GetFabricInfos(FabricFile):
    FabricFile = open(FabricFile, 'r')
    FabricText = FabricFile.read()
    FabricLines = FabricText.split('\n')

    for Index in range(len(FabricLines)):

        if 'BV/TV' in FabricLines[Index]:
            BVTV = np.float(FabricLines[Index].split()[-1])

        if 'Eigen values' in FabricLines[Index]:
            m1 = np.float(FabricLines[Index].split()[5])
            m2 = np.float(FabricLines[Index].split()[6])
            m3 = np.float(FabricLines[Index].split()[7])

            DA = np.round(max(m1,m2,m3)/min(m1,m2,m3),3)

        if 'Eigen vector 1' in FabricLines[Index]:
            m1Vector = np.array([np.float(FabricLines[Index].split()[6]),
                                 np.float(FabricLines[Index].split()[7]),
                                 np.float(FabricLines[Index].split()[8])])

        if 'Eigen vector 2' in FabricLines[Index]:
            m2Vector = np.array([np.float(FabricLines[Index].split()[6]),
                                 np.float(FabricLines[Index].split()[7]),
                                 np.float(FabricLines[Index].split()[8])])

        if 'Eigen vector 3' in FabricLines[Index]:
            m3Vector = np.array([np.float(FabricLines[Index].split()[6]),
                                 np.float(FabricLines[Index].split()[7]),
                                 np.float(FabricLines[Index].split()[8])])

    FabricInfosData = pd.DataFrame()

    FabricInfos = {'BVTV':BVTV,'m1':m1,'m2':m2,'m3':m3,'DA':DA,
                   'm11':m1Vector[0],'m21':m1Vector[1],'m31':m1Vector[2],
                   'm12':m2Vector[0],'m22':m2Vector[1],'m32':m2Vector[2],
                   'm13':m3Vector[0],'m23':m3Vector[1],'m33':m3Vector[2]}

    FabricInfosData = FabricInfosData.append(FabricInfos,ignore_index=True)

    return FabricInfosData
def SortFabric(FabricData):

    ## Sort eigenvalues
    m1 = np.min(FabricData[['m1', 'm2', 'm3']].values)
    m2 = np.median(FabricData[['m1', 'm2', 'm3']].values)
    m3 = np.max(FabricData[['m1', 'm2', 'm3']].values)
    m = [m1, m2, m3]

    ## Sort eigenvectors according to the eigenvalues
    if m1 == FabricData['m1'].values[0]:
        m1v = FabricData[['m11', 'm21', 'm31']].values[0]
    elif m1 == FabricData['m2'].values[0]:
        m1v = FabricData[['m12', 'm22', 'm32']].values[0]
    elif m1 == FabricData['m3'].values[0]:
        m1v = FabricData[['m13', 'm23', 'm33']].values[0]

    if m2 == FabricData['m1'].values[0]:
        m2v = FabricData[['m11', 'm21', 'm31']].values[0]
    elif m2 == FabricData['m2'].values[0]:
        m2v = FabricData[['m12', 'm22', 'm32']].values[0]
    elif m2 == FabricData['m3'].values[0]:
        m2v = FabricData[['m13', 'm23', 'm33']].values[0]

    if m3 == FabricData['m1'].values[0]:
        m3v = FabricData[['m11', 'm21', 'm31']].values[0]
    elif m3 == FabricData['m2'].values[0]:
        m3v = FabricData[['m12', 'm22', 'm32']].values[0]
    elif m3 == FabricData['m3'].values[0]:
        m3v = FabricData[['m13', 'm23', 'm33']].values[0]

    mv = [m1v, m2v, m3v]

    return m, mv
def GetHomogenizedStrains(FUAnalyzedFile):

    File  = open(FUAnalyzedFile, 'r')
    Text  = File.read()
    Lines = Text.split('\n')

    Index = 0
    while 'Homogenized   STRAINS' not in Lines[Index]:
        Index += 1

    HomogenizedStrains = np.zeros((6,6))

    for i in range(6):
        for j in range(6):
            HomogenizedStrains[i,j] = np.float(Lines[Index + 4 + i].split()[j+1])

    return HomogenizedStrains
def GetHomogenizedStresses(FUAnalyzedFile):

    File  = open(FUAnalyzedFile, 'r')
    Text  = File.read()
    Lines = Text.split('\n')

    Index = 0
    while 'Homogenized   STRESSES' not in Lines[Index]:
        Index += 1

    HomogenizedStresses = np.zeros((6,6))

    for i in range(6):
        for j in range(6):
            HomogenizedStresses[i,j] = np.float(Lines[Index + 4 + i].split()[j+1])

    HomogenizedStresses = np.round(HomogenizedStresses, 6)

    return HomogenizedStresses
def GetComplianceMatrix(FUAnalyzedFile):

    File  = open(FUAnalyzedFile, 'r')
    Text  = File.read()
    Lines = Text.split('\n')

    Index = 0
    while 'COMPLIANCE Matrix' not in Lines[Index]:
        Index += 1

    SymmetrizationFactor = np.float(Lines[Index+2][0])

    ComplianceMatrix = np.zeros((6,6))

    for i in range(6):
        for j in range(6):
            ComplianceMatrix[i,j] = np.float(Lines[Index + 4 + i].split()[j])

    return ComplianceMatrix

    # Compute the missing constants
    Nu21 = Nu12 * E2 / E1
    Nu31 = Nu13 * E3 / E1
    Nu32 = Nu23 * E3 / E2
    Mu21 = Mu12
    Mu31 = Mu13
    Mu32 = Mu23

    EngineeringConstants = {'E1': E1, 'E2': E2, 'E3': E3,
                            'Mu23': Mu23, 'Mu31': Mu31, 'Mu12': Mu12,
                            'Nu23': Nu23, 'Nu31': Nu31, 'Nu12': Nu12,
                            'Nu32': Nu32, 'Nu13': Nu13, 'Nu21': Nu21}

    return EngineeringConstants
def PlotFabricTensor(EigenValues, EigenVectors, NPoints):

    ## New coordinate system
    Q = np.array(EigenVectors)

    ## Build data for fabric plotting
    u = np.arange(0, 2 * np.pi + 2 * np.pi / NPoints, 2 * np.pi / NPoints)
    v = np.arange(0, np.pi + np.pi / NPoints, np.pi / NPoints)
    X = EigenValues[0] * np.outer(np.cos(u), np.sin(v))
    Y = EigenValues[1] * np.outer(np.sin(u), np.sin(v))
    Z = EigenValues[2] * np.outer(np.ones_like(u), np.cos(v))
    nNorm = np.zeros(X.shape)

    for i in range(len(X)):
        for j in range(len(X)):
            [X[i, j], Y[i, j], Z[i, j]] = np.dot([X[i, j], Y[i, j], Z[i, j]], Q)
            n = np.array([X[i, j], Y[i, j], Z[i, j]])
            nNorm[i, j] = np.linalg.norm(n)

    NormedColor = nNorm - nNorm.min()
    NormedColor = NormedColor / NormedColor.max()

    Figure = plt.figure(figsize=(5.5, 4))
    Axe = Figure.add_subplot(111, projection='3d')
    Axe.plot_surface(X, Y, Z, facecolors=plt.cm.jet(NormedColor), rstride=1, cstride=1, alpha=0.2, shade=False)
    Axe.plot_wireframe(X, Y, Z, color='k', rstride=1, cstride=1, linewidth=0.1)
    # scaling hack
    Bbox_min = np.min([X, Y, Z])
    Bbox_max = np.max([X, Y, Z])
    Axe.auto_scale_xyz([Bbox_min, Bbox_max], [Bbox_min, Bbox_max], [Bbox_min, Bbox_max])
    # make the panes transparent
    Axe.xaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axe.yaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axe.zaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    # make the grid lines transparent
    Axe.xaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axe.yaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axe.zaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    # modify ticks
    MinX, MaxX = -1, 1
    MinY, MaxY = -1, 1
    MinZ, MaxZ = -1, 1
    Axe.set_xticks([MinX, 0, MaxX])
    Axe.set_yticks([MinY, 0, MaxY])
    Axe.set_zticks([MinZ, 0, MaxZ])
    Axe.xaxis.set_ticklabels([MinX, 0, MaxX])
    Axe.yaxis.set_ticklabels([MinY, 0, MaxY])
    Axe.zaxis.set_ticklabels([MinZ, 0, MaxZ])

    Axe.set_xlabel('X')
    Axe.set_ylabel('Y')
    Axe.set_zlabel('Z')

    Axe.set_title('Fabric tensor')

    ColorMap = plt.cm.ScalarMappable(cmap=plt.cm.jet)
    ColorMap.set_array(nNorm)
    if not NormedColor.max() == 1:
        ColorBar = plt.colorbar(ColorMap, ticks=[int(Color.mean() - 1), int(Color.mean()), int(Color.mean() + 1)])
        plt.cm.ScalarMappable.set_clim(self=ColorMap, vmin=int(Color.mean() - 1), vmax=int(Color.mean() + 1))
    ColorBar = plt.colorbar(ColorMap)
    ColorBar.set_label('Vector norm (-)')

    plt.tight_layout()
    plt.show()
    plt.close(Figure)


    return
def PlotStiffnessTensor(S4, NPoints):

    I = np.eye(3)

    ## Build data for plotting tensor
    u = np.arange(0, 2 * np.pi + 2 * np.pi / NPoints, 2 * np.pi / NPoints)
    v = np.arange(0, np.pi + np.pi / NPoints, np.pi / NPoints)
    X = np.outer(np.cos(u), np.sin(v))
    Y = np.outer(np.sin(u), np.sin(v))
    Z = np.outer(np.ones_like(u), np.cos(v))
    Color = np.zeros(X.shape)
    for i in range(len(X)):
        for j in range(len(X)):
            n = np.array([X[i, j], Y[i, j], Z[i, j]])
            N = DyadicProduct(n, n)

            Elongation = FrobeniusProduct(N, Transform(S4, N))
            X[i, j], Y[i, j], Z[i, j] = np.array([X[i, j], Y[i, j], Z[i, j]]) * Elongation

            BulkModulus = FrobeniusProduct(I, Transform(S4, N))
            Color[i, j] = BulkModulus

    MinX, MaxX = int(X.min()), int(X.max())
    MinY, MaxY = int(Y.min()), int(Y.max())
    MinZ, MaxZ = int(Z.min()), int(Z.max())

    if Color.max() - Color.min() > 1:
        NormedColor = Color - Color.min()
        NormedColor = NormedColor / NormedColor.max()
    else:
        NormedColor = np.round(Color / Color.max()) / 2

    ## Plot tensor in image coordinate system
    Figure = plt.figure(figsize=(5.5, 4))
    Axe = Figure.add_subplot(111, projection='3d')
    Axe.plot_surface(X, Y, Z, facecolors=plt.cm.jet(NormedColor), rstride=1, cstride=1, alpha=0.2, shade=False)
    Axe.plot_wireframe(X, Y, Z, color='k', rstride=1, cstride=1, linewidth=0.2)
    # scaling hack
    Bbox_min = np.min([X, Y, Z])
    Bbox_max = np.max([X, Y, Z])
    Axe.auto_scale_xyz([Bbox_min, Bbox_max], [Bbox_min, Bbox_max], [Bbox_min, Bbox_max])
    # make the panes transparent
    Axe.xaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axe.yaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axe.zaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    # make the grid lines transparent
    Axe.xaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axe.yaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axe.zaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    # modify ticks
    Axe.set_xticks([MinX, 0, MaxX])
    Axe.set_yticks([MinY, 0, MaxY])
    Axe.set_zticks([MinZ, 0, MaxZ])
    Axe.xaxis.set_ticklabels([MinX, 0, MaxX])
    Axe.yaxis.set_ticklabels([MinY, 0, MaxY])
    Axe.zaxis.set_ticklabels([MinZ, 0, MaxZ])

    Axe.xaxis.set_rotate_label(False)
    Axe.set_xlabel('X (MPa)', rotation=0)
    Axe.yaxis.set_rotate_label(False)
    Axe.set_ylabel('Y (MPa)', rotation=0)
    Axe.zaxis.set_rotate_label(False)
    Axe.set_zlabel('Z (MPa)', rotation=90)

    Axe.set_title('Elasticity tensor')

    ColorMap = plt.cm.ScalarMappable(cmap=plt.cm.jet)
    ColorMap.set_array(Color)
    if not NormedColor.max() == 1:
        ColorBar = plt.colorbar(ColorMap, ticks=[int(Color.mean() - 1), int(Color.mean()), int(Color.mean() + 1)])
        plt.cm.ScalarMappable.set_clim(self=ColorMap, vmin=int(Color.mean() - 1), vmax=int(Color.mean() + 1))
    else:
        ColorBar = plt.colorbar(ColorMap)
    ColorBar.set_label('Bulk modulus (MPa)')
    plt.tight_layout()
    plt.show()
    plt.close(Figure)

    return

## Set variables
DataPath = '/home/mathieu/Documents/FABTIB/06_Problems/01_TensorTransformation/Data/'
Samples = ['Control1','Control2','OI1','OI2']
SampleNumber = 2
Sample = Samples[SampleNumber]

FabricFile = DataPath+Sample+'.fab'
FUAnalyzedFile = DataPath+Sample+'.dat'

## Get Data
FabricData = GetFabricInfos(FabricFile)
EigenValues, EigenVectors = SortFabric(FabricData)
ComplianceMatrix = GetComplianceMatrix(FUAnalyzedFile)




# 01 Fabric and Elasticity tensor initialization
print('\n\nFabric eigenvalues:\n')
print(EigenValues)
print('\n\nFabric eigenvectors:\n')
print(EigenVectors)
print('\n\nCompliance matrix:\n')
print(ComplianceMatrix)

## Symmetrize the matrix
ComplianceMatrix = (ComplianceMatrix+ComplianceMatrix.T)/2
print('\n\nCompliance matrix symmetrized:\n')
print(ComplianceMatrix)

## Check engineering constants
print('\n\nCheck engineering constants:\n')
print('E1   = %.3f\n'%(1/ComplianceMatrix[0,0]))
print('E2   = %.3f\n'%(1/ComplianceMatrix[1,1]))
print('E3   = %.3f\n'%(1/ComplianceMatrix[2,2]))
print('Mu23 = %.3f\n'%(1/ComplianceMatrix[3,3]))
print('Mu31 = %.3f\n'%(1/ComplianceMatrix[4,4]))
print('Mu12 = %.3f\n'%(1/ComplianceMatrix[5,5]))
print('Nu12 = %.6f\n'%(-ComplianceMatrix[0,1]/ComplianceMatrix[0,0]))
print('Nu13 = %.6f\n'%(-ComplianceMatrix[0,2]/ComplianceMatrix[0,0]))
print('Nu23 = %.6f\n'%(-ComplianceMatrix[1,2]/ComplianceMatrix[1,1]))

## Compute stiffness matrix
StiffnessMatrix = np.linalg.inv(ComplianceMatrix)
## Symmetrize matrix (rounding errors due to inversion)
StiffnessMatrix = (StiffnessMatrix+StiffnessMatrix.T)/2
print('\n\nStiffness matrix:\n')
print(StiffnessMatrix)

## Verify hooke's law
ES = ComplianceMatrix.dot(StiffnessMatrix)
print('\n\nCheck Hooke\'s Law relation matrix :\n')
print(ES)




# 02 Fabric tensor
Q = np.array(EigenVectors)

# ## Control orthonormal basis
# print(Q.dot(Q.T))
#
# ## Normalize fabric
# FabricBase0 = np.zeros((3,3))
# for i in range(3):
#     FabricBase0 += EigenValues[i] * DyadicProduct(Q[i],Q[i])
# print(FabricBase0)
#
# FabricBase1 = np.zeros((3,3))
# EigenValues0, EigenVectors0 = np.linalg.eig(FabricBase0)
# for i in range(3):
#     FabricBase1 += EigenValues0[i] * DyadicProduct(EigenVectors0.T[i],EigenVectors0.T[i])
# print(FabricBase1)
#
# ## Control
# print(FabricBase0-FabricBase1)
#
# ## Normalize
# FabricBase = 3 * FabricBase1 / np.trace(FabricBase1)
# print(FabricBase)
# print(np.trace(FabricBase))
#
# # Attribute new values and control
# EigenValues, EigenVectors = np.linalg.eigh(FabricBase)
# EigenVectors = EigenVectors.T
# print(EigenVectors.dot(EigenVectors.T))




# 03 Stiffness tensor analysis
MandelStiffness = Engineering2MandelNotation(StiffnessMatrix)
MandelCompliance = np.linalg.inv(MandelStiffness)
## Symmetrize matrix (rounding errors due to inversion)
MandelCompliance = 1/2 * (MandelCompliance+MandelCompliance.T)
print('\n\nStiffness in Mandel notation:\n')
print(MandelStiffness)

## Compute tensor and verify hooke's law
StiffnessTensor = IsoMorphism66_3333(MandelStiffness)
ComplianceTensor = IsoMorphism66_3333(MandelCompliance)
ES = Composition(ComplianceTensor,StiffnessTensor)
print('\n\nCheck Hooke\'s Law relation matrix :\n')
print(IsoMorphism3333_66(ES))

# 03 Transformation of stiffness tensor into fabric coordinate system
I = np.eye(3)
Q = np.array(EigenVectors).T

## Rotation of the fabric tensor
print(Q)
print(Q.dot(Q.T))
print(Composition(Q.T,Composition(FabricBase,Q)))

## Rotation of the stiffness tensor
TS4 = Composition(TensorProduct(Q,Q).transpose((2,3,0,1)),Composition(StiffnessTensor,TensorProduct(Q,Q)))
TransformedStiffness = IsoMorphism3333_66(TS4)
print('\n\nStiffness in fabric coordinate system:\n')
print(TransformedStiffness)
# or with
I = np.eye(3)
TS4 = TransformTensor(StiffnessTensor, I, Q.T)
TransformedStiffness = IsoMorphism3333_66(TS4)
print('\n\nStiffness in fabric coordinate system:\n')
print(TransformedStiffness)

# Plot Stiffness tensor in fabric coordinate system
# PlotStiffnessTensor(IsoMorphism66_3333(TransformedStiffness),NPoints=32)


# 04 Projection on orthotropy
OrthotropicTransformedStiffness = np.zeros(TransformedStiffness.shape)
for i in range(OrthotropicTransformedStiffness.shape[0]):
    for j in range(OrthotropicTransformedStiffness.shape[1]):
        if i < 3 and j < 3:
            OrthotropicTransformedStiffness[i,j] = TransformedStiffness[i,j]
        elif i == j:
            OrthotropicTransformedStiffness[i, j] = TransformedStiffness[i, j]
print('\n\nProject on orthotropy:\n')
print(OrthotropicTransformedStiffness)




# 05 Engineering constants in fabric coordinate system
TransformedCompliance = np.linalg.inv(Mandel2EngineeringNotation(OrthotropicTransformedStiffness))
print('\n\nCheck engineering constants:\n')
print('E1   = %.3f\n'%(1/TransformedCompliance[0,0]))
print('E2   = %.3f\n'%(1/TransformedCompliance[1,1]))
print('E3   = %.3f\n'%(1/TransformedCompliance[2,2]))
print('Mu23 = %.3f\n'%(1/TransformedCompliance[3,3]))
print('Mu31 = %.3f\n'%(1/TransformedCompliance[4,4]))
print('Mu12 = %.3f\n'%(1/TransformedCompliance[5,5]))
print('Nu12 = %.6f\n'%(-TransformedCompliance[0,1]/TransformedCompliance[0,0]))
print('Nu13 = %.6f\n'%(-TransformedCompliance[0,2]/TransformedCompliance[0,0]))
print('Nu23 = %.6f\n'%(-TransformedCompliance[1,2]/TransformedCompliance[1,1]))


# Reference values
E1 = [183.792, 383.569, 98.0127, 522.017]
E2 = [206.502, 461.289, 85.8753, 751.164]
E3 = [757.909, 1229.68, 501.849, 2152.56]
Mu23 = [128.616, 237.273, 66.3159, 427.53]
Mu31 = [110.785, 185.404, 68.592, 306.373]
Mu12 = [88.5012, 173.469, 34.0509, 258.143]
Nu23 = [0.31406, 0.284283, 0.224864, 0.226078]
Nu31 = [0.0693851, 0.0686095, 0.0707728, 0.0660663]
Nu12 = [0.0745457, 0.0936873, 0.0857634, 0.102632]

# Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
# Axes.bar(1,1/TransformedCompliance[0,0]/E1[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(2,1/TransformedCompliance[1,1]/E2[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(3,1/TransformedCompliance[2,2]/E3[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(4,1/TransformedCompliance[3,3]/Mu23[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(5,1/TransformedCompliance[4,4]/Mu31[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(6,1/TransformedCompliance[5,5]/Mu12[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(7,-TransformedCompliance[0,1]/TransformedCompliance[0,0]/Nu23[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(8,-TransformedCompliance[0,2]/TransformedCompliance[0,0]/Nu31[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.bar(9,-TransformedCompliance[1,2]/TransformedCompliance[1,1]/Nu12[SampleNumber]-1,color=(1,1,1),edgecolor=(0,0,0))
# Axes.set_xlabel('Constant Computed')
# Axes.set_ylabel('Own value / reference deviation')
# Axes.set_ylim([-0.05,0.05])
# plt.xticks(np.arange(1,10),['E$_1$','E$_2$','E$_3$','$\mu_{23}$','$\mu_{31}$','$\mu_{12}$',r'$\nu_{23}$',r'$\nu_{31}$',r'$\nu_{12}$'])
# plt.show()
# plt.close(Figure)

