# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})



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



# 02 Load Data
WorkingDirectory = os.getcwd()
DataFolder = os.path.join(WorkingDirectory,'02_Data')
ResultFolder = os.path.join(WorkingDirectory,'04_Results/03_Individuals_Matching')

ScanLists = [File for File in os.listdir(DataFolder) if File.endswith('.csv')]
ScanLists.sort()

HealthyGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[0]))
OIGroup = pd.read_csv(os.path.join(DataFolder,ScanLists[1]))

OIGroup = OIGroup.dropna()      # Filter patients without data
OIGroup['Sex'] = OIGroup['Sex'].replace(['Female','Male'],['F','M'])
OIGroup['Age'] = OIGroup['Age'].astype('int')


# 03 Group data and binarize sex values
HealthyGroup['Group'] = 0
OIGroup['Group'] = 1
Data = HealthyGroup[['Age','Sex','Group']].append(OIGroup[['Age','Sex','Group']],ignore_index=True)
Data['Sex'] = Data['Sex'].replace(['F','M'],[1,0])

# Compute covariance matrix
Covariables = ['Age','Sex']
Covariables = ['Age']
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

# Compute corresponding mean distance
BestMatches = SortedIndices[0, :]
BestMeanDistance = 0
for i in range(len(BestMatches)):
    BestMeanDistance += DistancesData[i].loc[BestMatches[i]]
BestMeanDistance = BestMeanDistance / len(BestMatches)


# If same control individual -> select next best match
ControlOccurrences = np.bincount(BestMatches)

NewMatches = np.zeros(BestMatches.shape).astype('int')
NewMatches += BestMatches

Iteration = 0
while max(ControlOccurrences) > 1:

    print('\nOptimization process...\n')

    ControlIndividual = 0
    for IndividualOccurrences in ControlOccurrences:

        print('\nControl individual n: %i'%ControlIndividual)
        print('Match with %i Test individual'%IndividualOccurrences)

        if IndividualOccurrences > 1:

            # Compute new distances values
            TestIndividuals, NextControlIndividuals, DistancesIncrease = ComputeNewDistances(DistancesData, SortedIndices, NewMatches, ControlIndividual)

            # Sort to minimize distance increase
            DistancesIncreaseData = pd.DataFrame(DistancesIncrease)
            MaxDistanceIncreaseIndex = DistancesIncreaseData.idxmax()

            DistancesIncreaseData = DistancesIncreaseData.drop(MaxDistanceIncreaseIndex)   # Get rid of attributed control
            DISIndices = DistancesIncreaseData.index                                       # Get the indices

            RemainingControls = NextControlIndividuals[DISIndices]
            RemainingTests    = TestIndividuals[DISIndices]

            # Replace in new matching result
            NewMatches[RemainingTests] = RemainingControls
            np.savetxt(os.path.join(ResultFolder+'/Matches', str("{:0>4d}".format(Iteration))+'Matches.txt'), NewMatches,'%i')

            break

        ControlIndividual += 1

    ControlOccurrences = np.bincount(NewMatches)
    Iteration += 1

print('\n\nFinal matching')
print(NewMatches)

# Compute new corresponding mean distance
NewMeanDistance = 0
for i in range(len(NewMatches)):
    NewMeanDistance += DistancesData[i].loc[NewMatches[i]]
NewMeanDistance = NewMeanDistance / len(NewMatches)

print('Best mean distance %f'%BestMeanDistance)
print('New mean distance %f'%NewMeanDistance)

# Save matching results to csv
MatchingResults = pd.DataFrame(NewMatches)

OIList = MatchingResults.index.values
MatchedOI = OIGroup.iloc[OIList]
ControlList = MatchingResults[0].values
MatchedControl = HealthyGroup.iloc[ControlList]

MatchedOI = MatchedOI.reset_index()
MatchedControl = MatchedControl.reset_index()

MatchedOI.to_csv(ResultFolder+'/Matched_OI.csv',index=False)
MatchedControl.to_csv(ResultFolder+'/Matched_Control.csv',index=False)
