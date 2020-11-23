import pandas as pd

MissingData = pd.read_csv(DataFolder+'/MissingROIAnalysis.csv',header=None)
MissingData.columns = ['$ROINumber','$Scan']

MOrdered = MissingData.sort_values(by=['$Scan','$ROINumber'])
MOrdered = MOrdered.reset_index()
del MOrdered['index']

MOrdered2 = MedtoolParametersData.sort_values(by=['$Scan','$ROINumber'])
MOrdered2 = MOrdered2.reset_index()
del MOrdered2['index']


Test = pd.DataFrame()
for i in MOrdered.index:

    ROINumber = MOrdered.loc[i]['$ROINumber']
    Scan = MOrdered.loc[i]['$Scan']

    Filter1 = MOrdered2['$ROINumber'] == ROINumber
    Filter2 = MOrdered2['$Scan'] == Scan

    XPos = MOrdered2[Filter1 & Filter2]['$XPos'].values[0]
    XRange = MOrdered2[Filter1 & Filter2]['$XRange'].values[0]
    YPos = MOrdered2[Filter1 & Filter2]['$YPos'].values[0]
    YRange = MOrdered2[Filter1 & Filter2]['$YRange'].values[0]
    ZPos = MOrdered2[Filter1 & Filter2]['$ZPos'].values[0]
    ZRange = MOrdered2[Filter1 & Filter2]['$ZRange'].values[0]

    Data = {'$ROINumber':ROINumber,
            '$Scan':Scan,
            '$XPos':XPos,
            '$XRange':XRange,
            '$YPos':YPos,
            '$YRange':YRange,
            '$ZPos':ZPos,
            '$ZRange':ZRange}

    Test = Test.append(Data,ignore_index=True)

ColsToInt = ['$XPos', '$YPos', '$ZPos', '$XRange', '$YRange', '$ZRange', '$ROINumber']
Test[ColsToInt] = Test[ColsToInt].astype(int)