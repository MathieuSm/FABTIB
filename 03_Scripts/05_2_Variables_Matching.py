# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)

# 01 Define covariance functions (NB: called variance if x = y)
def Covariance(x,y):

    if not len(x)==len(y):
        print('Covariables vectors not of equal lengths')
    else:
        x_bar, y_bar = x.mean(), y.mean()
        Cov = np.sum(((x - x_bar)*(y - y_bar))/(len(x) - 1))
        return Cov
def CovarianceMatrix(Data, Covariables):
    C = np.zeros((len(Covariables), len(Covariables)))
    for i in range(len(Covariables)):
        for j in range(len(Covariables)):
            x = Data[Covariables[i]].values
            y = Data[Covariables[j]].values
            C[i, j] = Covariance(x, y)

    return C
def MahalanobisDistance(x,y,C):

    XY = x-y
    C_inv = np.linalg.inv(C)
    Distance = np.sqrt(XY.T.dot(C_inv.dot(XY)))

    return Distance
def ComputeNewDistances(DistancesData, SortedIndices, Matches, ControlIndividual):

    TestIndividuals = np.where(Matches == ControlIndividual)[0]
    print('Match with test individuals n:')
    print(TestIndividuals)

    print('\nCompute new distances...\n')
    DistancesIncrease = np.zeros(len(TestIndividuals))
    NewControlIndividuals = np.zeros(len(TestIndividuals))
    Index = 0
    for TestIndividual in TestIndividuals:
        print('Control individual n: %i' % ControlIndividual)
        print('Test individual n: %i' % TestIndividual)

        ControlIndividualIndex = np.where(SortedIndices[:, TestIndividual] == ControlIndividual)[0]
        NewControlIndividual = SortedIndices[ControlIndividualIndex + 1, TestIndividual]
        NewControlIndividuals[Index] = NewControlIndividual

        print('New control individual n: %i' % NewControlIndividual)

        Distance = DistancesData[TestIndividual].loc[ControlIndividual]
        NewDistance = DistancesData[TestIndividual].loc[NewControlIndividual]
        DistanceIncrease = NewDistance - Distance
        DistancesIncrease[Index] = DistanceIncrease
        Index += 1

        print('Distance increase: %f\n' % DistanceIncrease)

    return TestIndividuals, NewControlIndividuals.astype('int'), DistancesIncrease



# 02 Set path and load data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory, '04_Results/05_Variables_Matching/')

HealthyData = pd.read_csv(DataFolder + '00_Healthy_Data.csv')
OIData = pd.read_csv(DataFolder + '00_OI_Data.csv')

## Filter data for matching only "good" ROI
CVLimit = 0.263
HealthyData = HealthyData[HealthyData['Variation Coefficient']<CVLimit]
OIData = OIData[OIData['Variation Coefficient']<CVLimit]

## append data together keeping group
HealthyData['Group'] = 0
OIData['Group'] = 1
Data = HealthyData.append(OIData,ignore_index=True)


# Compute covariance matrix
Covariables = ['BV/TV', 'Degree of Anisotropy']
ControlCovariables = Data[Data['Group']==0][Covariables]
TestCovariables = Data[Data['Group']==1][Covariables]

C = CovarianceMatrix(Data,Covariables)

# Compute distances between each individual
Distances = np.zeros((len(ControlCovariables),len(TestCovariables)))
for i in range(len(ControlCovariables)):
    for j in range(len(TestCovariables)):
        x = ControlCovariables.values[i]
        y = TestCovariables.values[j]
        Distances[i,j] = MahalanobisDistance(x,y,C)
DistancesData = pd.DataFrame(Distances)

# Compute sorted indices (1st row = best matches)
SortedIndices = np.zeros(DistancesData.shape)
for i in DistancesData.columns:
    TestIndividualDistances = DistancesData[i]
    SortedIndices[:,i] = TestIndividualDistances.sort_values().index
SortedIndices = SortedIndices.astype('int')

# Get best matches into data frame
BestMatches = SortedIndices[0, :]
MatchingResults = pd.DataFrame(BestMatches)

OIList = MatchingResults.index.values
MatchedOI = OIData.iloc[OIList]
ControlList = MatchingResults[0].values
MatchedControl = HealthyData.iloc[ControlList]

MatchedOI = MatchedOI.reset_index()
MatchedControl = MatchedControl.reset_index()

MatchedControl = MatchedControl.drop_duplicates('index')
MatchedOI = MatchedOI.loc[MatchedControl.index]

# Save to .csv file
MatchedOI.to_csv(DataFolder+'01_Matched_OI.csv',index=False)
MatchedControl.to_csv(DataFolder+'01_Matched_Healthy.csv',index=False)

