# 00 Initialization
import os
import numpy as np
import pandas as pd
import matplotlib
# matplotlib.use('WebAgg')
import matplotlib.pyplot as plt


desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)

# Define functions
def PlotValues(XYZ, Radii, NPoints=32):

    ## New coordinate system
    Q = np.eye(3)

    ## Build data for fabric plotting
    u = np.arange(0, 2 * np.pi + 2 * np.pi / NPoints, 2 * np.pi / NPoints)
    v = np.arange(0, np.pi + np.pi / NPoints, np.pi / NPoints)
    X1 = Radii[0][0] * np.outer(np.cos(u), np.sin(v)) + XYZ[0][0]
    Y1 = Radii[0][1] * np.outer(np.sin(u), np.sin(v)) + XYZ[0][1]
    Z1 = Radii[0][2] * np.outer(np.ones_like(u), np.cos(v)) + XYZ[0][2]
    X2 = Radii[1][0] * np.outer(np.cos(u), np.sin(v)) + XYZ[1][0]
    Y2 = Radii[1][1] * np.outer(np.sin(u), np.sin(v)) + XYZ[1][1]
    Z2 = Radii[1][2] * np.outer(np.ones_like(u), np.cos(v)) + XYZ[1][2]
    X3 = Radii[2][0] * np.outer(np.cos(u), np.sin(v)) + XYZ[2][0]
    Y3 = Radii[2][1] * np.outer(np.sin(u), np.sin(v)) + XYZ[2][1]
    Z3 = Radii[2][2] * np.outer(np.ones_like(u), np.cos(v)) + XYZ[2][2]

    for i in range(len(X1)):
        for j in range(len(X1)):
            [X1[i, j], Y1[i, j], Z1[i, j]] = np.dot([X1[i, j], Y1[i, j], Z1[i, j]], Q)
            [X2[i, j], Y2[i, j], Z2[i, j]] = np.dot([X2[i, j], Y2[i, j], Z2[i, j]], Q)
            [X3[i, j], Y3[i, j], Z3[i, j]] = np.dot([X3[i, j], Y3[i, j], Z3[i, j]], Q)

    Figure = plt.figure(figsize=(5.5, 4),dpi=100)
    Axe = Figure.add_subplot(111, projection='3d')
    Axe.plot_surface(X3, Y3, Z3, color=(0, 0, 0), rstride=1, cstride=1, alpha=0.2, shade=False)
    Axe.plot_wireframe(X3, Y3, Z3, color='k', rstride=1, cstride=1, linewidth=0.1)
    Axe.plot_surface(X1, Y1, Z1, color=(1,0,0), rstride=1, cstride=1, alpha=0.5, shade=False)
    Axe.plot_wireframe(X1, Y1, Z1, color='k', rstride=1, cstride=1, linewidth=0.1)
    Axe.plot_surface(X2, Y2, Z2, color=(0, 0, 1), rstride=1, cstride=1, alpha=0.5, shade=False)
    Axe.plot_wireframe(X2, Y2, Z2, color='k', rstride=1, cstride=1, linewidth=0.1)
    Axe.plot([], [], [], color=(0, 0, 0), linestyle='none', marker='s', alpha=0.2, label='Grouped')
    Axe.plot([], [], [], color=(1, 0, 0), linestyle='none', marker='s',label='Control')
    Axe.plot([], [], [], color=(0, 0, 1), linestyle='none', marker='s', label='Test')
    # make the panes transparent
    Axe.xaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axe.yaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axe.zaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    # make the grid lines transparent
    Axe.xaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axe.yaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axe.zaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    # modify ticks
    MaxX = max(1.05 * Radii[0][0] + XYZ[0][0], 1.05 * Radii[1][0] + XYZ[1][0], 1.05 * Radii[2][0] + XYZ[2][0])
    MaxY = max(1.05 * Radii[0][1] + XYZ[0][1], 1.05 * Radii[1][1] + XYZ[1][1], 1.05 * Radii[2][1] + XYZ[2][1])
    MaxZ = max(1.05 * Radii[0][2] + XYZ[0][2], 1.05 * Radii[1][2] + XYZ[1][2], 1.05 * Radii[2][2] + XYZ[2][2])
    MinX = min(-1.05 * Radii[0][0] + XYZ[0][0], -1.05 * Radii[1][0] + XYZ[1][0], -1.05 * Radii[2][0] + XYZ[2][0])
    MinY = min(-1.05 * Radii[0][1] + XYZ[0][1], -1.05 * Radii[1][1] + XYZ[1][1], -1.05 * Radii[2][1] + XYZ[2][1])
    MinZ = min(-1.05 * Radii[0][2] + XYZ[0][2], -1.05 * Radii[1][2] + XYZ[1][2], -1.05 * Radii[2][2] + XYZ[2][2])
    Axe.set_xticks([MinX, MaxX])
    Axe.set_yticks([MinY, MaxY])
    Axe.set_zticks([MinZ, MaxZ])
    Axe.xaxis.set_ticklabels([int(MinX), int(MaxX)])
    Axe.yaxis.set_ticklabels([int(MinY), int(MaxY)])
    Axe.zaxis.set_ticklabels([int(MinZ), int(MaxZ)])

    Axe.xaxis.set_rotate_label(False)
    Axe.set_xlabel(r'$\lambda_0$',rotation = 0)
    Axe.yaxis.set_rotate_label(False)
    Axe.set_ylabel(r'$\lambda_0\prime$',rotation = 0)
    Axe.zaxis.set_rotate_label(False)
    Axe.set_zlabel(r'$\mu_0$',rotation = 0)

    plt.legend(loc='upper left')
    # plt.tight_layout()
    plt.show()
    plt.close(Figure)

    return

# 01 Load Data
WorkingDirectory = os.getcwd()
ResultFolder = os.path.join(WorkingDirectory, '04_Results/06_LinearRegression')

New = 'No' # If set to 'Yes' build new data frame

if New == 'Yes':
    Data = pd.DataFrame()

    DataSets = ['Filtered','Filtered','Filtered',
                'Filtered','Filtered','Filtered',
                'Filtered','Filtered','Filtered',
                'Complete','Complete','Complete',
                'Complete','Complete','Complete']
    Models = ['Individual fit','Individual fit','Individual fit',
             'Standard model','Standard model','Standard model',
             'Mixed-effect','Mixed-effect','Mixed-effect',
             'Mixed-effect','Mixed-effect','Mixed-effect',
             'Mixed-effect','Mixed-effect','Mixed-effect']
    DataTypes = ['Grouped','Control','Test',
                 'Grouped','Control','Test',
                 'Grouped','Control','Test',
                 'Grouped','Control','Test',
                 'Grouped','Control','Test']
    Factors = ['Group','Group','Group',
               'Group','Group','Group',
               'Group','Group','Group',
               'Group','Group','Group',
               'LogCV','LogCV','LogCV']
    L0s = [4437,4523,4332,
           4567,4672,4463,
           4371,4427,4316,
           3373,3321,3426,
           2967,3047,2888]
    L0_CIs = [[4242,4641],[4436,4612],[4247,4418],
              [4368,4775],[4450,4906],[4250,4686],
              [4318,4425],[4362,4494],[4252,4381],
              [3199,3557],[3106,3551],[3205,3663],
              [2691,3271],[2764,3359],[2620,3184]]
    L0ps = [2702,2845,2528,
            2767,2939,2605,
            2613,2736,2495,
            1987,2055,1922,
            1748,1822,1676]
    L0p_CIs = [[2621,2784],[2818,2873],[2503,2553],
               [2685,2851],[2524,2688],[2848,3033],
               [2472,2762],[2699,2774],[2461,2529],
               [1811,2180],[1941,2175],[1815,2035],
               [1636,1867],[1706,1947],[1569,1791]]
    M0s = [3540,3652,3404,
           3637,3772,3507,
           3465,3558,3375,
           2689,2682,2696,
           2365,2420,2310]
    M0_CIs = [[3430,3655],[3602,3703],[3356,3451],
              [3524,3753],[3388,3630],[3644,3905],
              [3312,3625],[3521,3596],[3339,3410],
              [2482,2913],[2557,2813],[2570,2828],
              [2207,2534],[2258,2593],[2156,2476]]
    ks = [1.898,1.898,1.898,
          1.918,1.918,1.918,
          1.885,1.885,1.885,
          1.716,1.716,1.716,
          1.641,1.641,1.641]
    k_CIs = [[1.879,1.916],[1.879,1.916],[1.879,1.916],
             [1.900,1.937],[1.900,1.937],[1.900,1.937],
             [1.864,1.906],[1.864,1.906],[1.864,1.906],
             [1.687,1.746],[1.687,1.746],[1.687,1.746],
             [1.604,1.678],[1.604,1.678],[1.604,1.678]]
    ls = [0.949,0.949,0.949,
          0.951,0.951,0.951,
          0.954,0.954,0.954,
          0.989,0.989,0.989,
          0.989,0.989,0.989,]
    l_CIs = [[0.931,0.968],[0.931,0.968],[0.931,0.968],
             [0.932,0.969],[0.932,0.969],[0.932,0.969],
             [0.940,0.968],[0.940,0.968],[0.940,0.968],
             [0.958,1.021],[0.958,1.021],[0.958,1.021],
             [0.958,1.020],[0.958,1.020],[0.958,1.020],]
    R2s = [0.937,0.843,0.850,
           0.939,0.939,0.939,
           0.966,0.966,0.966,
           0.883,0.883,0.883,
           0.884,0.884,0.884]
    SEs = [0.260,np.nan,np.nan,
           0.255,0.255,0.255,
           0.191,0.191,0.191,
           0.472,0.472,0.472,
           0.470,0.470,0.470]

    for i in range(len(DataSets)):
        Results = {'Data set': DataSets[i],
                   'Model':Models[i],
                   'Data type':DataTypes[i],
                   'Factor':Factors[i],
                   'L0':L0s[i],
                   'L0_CI':L0_CIs[i],
                   'L0p':L0ps[i],
                   'L0p_CI':L0p_CIs[i],
                   'Mu0':M0s[i],
                   'Mu0_CI':M0_CIs[i],
                   'k':ks[i],
                   'k_CI':k_CIs[i],
                   'l':ls[i],
                   'l_CI':l_CIs[i],
                   'R2':R2s[i],
                   'SE':SEs[i]}
        Data = Data.append(Results,ignore_index=True)

    Data.to_csv(ResultFolder + '/RegressionResults1.csv',index=False)

else:
    Data = pd.read_csv(ResultFolder + '/RegressionResults.csv')


Models = Data['Model'].unique()
DataSets = Data['Data set'].unique()
Factors = Data['Factor'].unique()

Model = Models[2]
DataSet = DataSets[1]
Factor = Factors[1]

Filter1 = Data['Model'] == Model
Filter2 = Data['Data set'] == DataSet
Filter3 = Data['Factor'] == Factor

Indices = Data[Filter1&Filter2&Filter3].index

L0_CI = Data[Filter1&Filter2&Filter3]['L0_CI'].loc[Indices[1]].strip('][').split(', ')
L0p_CI = Data[Filter1&Filter2&Filter3]['L0p_CI'].loc[Indices[1]].strip('][').split(', ')
M0_CI = Data[Filter1&Filter2&Filter3]['Mu0_CI'].loc[Indices[1]].strip('][').split(', ')

R11 = (int(L0_CI[1]) - int(L0_CI[0])) / 2
R21 = (int(L0p_CI[1]) - int(L0p_CI[0])) / 2
R31 = (int(M0_CI[1]) - int(M0_CI[0])) / 2

X1 = Data[Filter1&Filter2&Filter3]['L0'].loc[Indices[1]]
Y1 = Data[Filter1&Filter2&Filter3]['L0p'].loc[Indices[1]]
Z1 = Data[Filter1&Filter2&Filter3]['Mu0'].loc[Indices[1]]

L0_CI = Data[Filter1&Filter2&Filter3]['L0_CI'].loc[Indices[2]].strip('][').split(', ')
L0p_CI = Data[Filter1&Filter2&Filter3]['L0p_CI'].loc[Indices[2]].strip('][').split(', ')
M0_CI = Data[Filter1&Filter2&Filter3]['Mu0_CI'].loc[Indices[2]].strip('][').split(', ')

R12 = (int(L0_CI[1]) - int(L0_CI[0])) / 2
R22 = (int(L0p_CI[1]) - int(L0p_CI[0])) / 2
R32 = (int(M0_CI[1]) - int(M0_CI[0])) / 2

X2 = Data[Filter1&Filter2&Filter3]['L0'].loc[Indices[2]]
Y2 = Data[Filter1&Filter2&Filter3]['L0p'].loc[Indices[2]]
Z2 = Data[Filter1&Filter2&Filter3]['Mu0'].loc[Indices[2]]

L0_CI = Data[Filter1&Filter2&Filter3]['L0_CI'].loc[Indices[0]].strip('][').split(', ')
L0p_CI = Data[Filter1&Filter2&Filter3]['L0p_CI'].loc[Indices[0]].strip('][').split(', ')
M0_CI = Data[Filter1&Filter2&Filter3]['Mu0_CI'].loc[Indices[0]].strip('][').split(', ')

R13 = (int(L0_CI[1]) - int(L0_CI[0])) / 2
R23 = (int(L0p_CI[1]) - int(L0p_CI[0])) / 2
R33 = (int(M0_CI[1]) - int(M0_CI[0])) / 2

X3 = Data[Filter1&Filter2&Filter3]['L0'].loc[Indices[0]]
Y3 = Data[Filter1&Filter2&Filter3]['L0p'].loc[Indices[0]]
Z3 = Data[Filter1&Filter2&Filter3]['Mu0'].loc[Indices[0]]


Radii = [[R11,R21,R31],[R12,R22,R32],[R13,R23,R33]]
XYZ = [[X1,Y1,Z1],[X2,Y2,Z2],[X3,Y3,Z3]]
PlotValues(XYZ, Radii)