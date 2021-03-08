# 00 Initialization
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)


DataFrame = pd.DataFrame()
NewData = {'CV Limit':0.2,
           'N':50,
          'Grouped L0 m':3744,
          'Grouped L0 u':3098,
          'Grouped L0 o':4525,
          'Healthy L0 m': 3584,
          'Healthy L0 u': 3152,
          'Healthy L0 o': 4075,
          'OI L0 m': 3851,
          'OI L0 u': 3363,
          'OI L0 o': 4410}
DataFrame = DataFrame.append(NewData,ignore_index=True)
NewData = {'CV Limit':0.25,
           'N':76,
          'Grouped L0 m':4205,
          'Grouped L0 u':3563,
          'Grouped L0 o':4963,
          'Healthy L0 m': 3934,
          'Healthy L0 u': 3463,
          'Healthy L0 o': 4468,
          'OI L0 m': 4496,
          'OI L0 u': 3997,
          'OI L0 o': 5056}
DataFrame = DataFrame.append(NewData,ignore_index=True)
NewData = {'CV Limit':0.3,
           'N':96,
          'Grouped L0 m':4298,
          'Grouped L0 u':3706,
          'Grouped L0 o':4986,
          'Healthy L0 m': 3969,
          'Healthy L0 u': 3563,
          'Healthy L0 o': 4421,
          'OI L0 m': 4704,
          'OI L0 u': 4153,
          'OI L0 o': 5329}
DataFrame = DataFrame.append(NewData,ignore_index=True)
NewData = {'CV Limit':0.35,
           'N':109,
          'Grouped L0 m':4160,
          'Grouped L0 u':3622,
          'Grouped L0 o':4777,
          'Healthy L0 m': 3858,
          'Healthy L0 u': 3468,
          'Healthy L0 o': 4293,
          'OI L0 m': 4553,
          'OI L0 u': 4054,
          'OI L0 o': 5114}
DataFrame = DataFrame.append(NewData,ignore_index=True)
NewData = {'CV Limit':0.4,
           'N':118,
          'Grouped L0 m':4127,
          'Grouped L0 u':3622,
          'Grouped L0 o':4702,
          'Healthy L0 m': 3831,
          'Healthy L0 u': 3457,
          'Healthy L0 o': 4244,
          'OI L0 m': 4522,
          'OI L0 u': 4034,
          'OI L0 o': 5068}
DataFrame = DataFrame.append(NewData,ignore_index=True)

G_ErrorBar = np.zeros((2,len(DataFrame)))
G_ErrorBar[0,:] = DataFrame['Grouped L0 m'] - DataFrame['Grouped L0 u']
G_ErrorBar[1,:] = DataFrame['Grouped L0 o'] - DataFrame['Grouped L0 m']

C_ErrorBar = np.zeros((2,len(DataFrame)))
C_ErrorBar[0,:] = DataFrame['Healthy L0 m'] - DataFrame['Healthy L0 u']
C_ErrorBar[1,:] = DataFrame['Healthy L0 o'] - DataFrame['Healthy L0 m']

T_ErrorBar = np.zeros((2,len(DataFrame)))
T_ErrorBar[0,:] = DataFrame['OI L0 m'] - DataFrame['OI L0 u']
T_ErrorBar[1,:] = DataFrame['OI L0 o'] - DataFrame['OI L0 m']

Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5),dpi=100)
Axes.errorbar(DataFrame['CV Limit'],DataFrame['Grouped L0 m'],G_ErrorBar,marker='o',color=(0,1,0),label='Grouped')
Axes.errorbar(DataFrame['CV Limit']-0.005,DataFrame['Healthy L0 m'],C_ErrorBar,marker='o',color=(0,0,1),label='Healthy')
Axes.errorbar(DataFrame['CV Limit']+0.005,DataFrame['OI L0 m'],T_ErrorBar,marker='o',color=(1,0,0),label='OI')
i = 0
for x,y in zip(DataFrame['CV Limit'],DataFrame['Grouped L0 m']):
    label = str(int(DataFrame['N'].loc[i]))
    plt.annotate(label, # this is the text
                 (x,y), # this is the point to label
                 textcoords="offset points", # how to position the text
                 xytext=(0,100), # distance from text to points (x,y)
                 ha='center') # horizontal alignment can be left, right or center
    i += 1
plt.ylim([3000,5700])
plt.legend(loc='upper center',bbox_to_anchor=(0.5,1.15),ncol=3)
plt.xlabel('CV Threshold (-)')
plt.ylabel('$\lambda_0$ (MPa)')
plt.subplots_adjust(left=0.175)
plt.show()
plt.close(Figure)
