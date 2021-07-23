# 00 Initialization
import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
import matplotlib.pyplot as plt


desired_width = 500
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', desired_width)
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:3}'.format})
plt.rc('font', size=12)


# 01 Set paths
WorkingDirectory = os.getcwd()
ScoutView_Path = os.path.join(WorkingDirectory,'10_Additionnal/03_ScoutView/')

Images = os.listdir(ScoutView_Path)


# 02 Load image
TIF_Scout = sitk.ReadImage(ScoutView_Path+Images[2])
Spacing = TIF_Scout.GetSpacing()
TIF_Array = sitk.GetArrayFromImage(TIF_Scout)


# Crop image
TIF_Cropped = TIF_Array[700:,1000:1800]
Size = TIF_Cropped.shape

# Plot control group protocol
ReferenceLine = 145
StackHeight = 0.0607 * 168 / Spacing[0] / 2.54
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=1000)
Axes.imshow(TIF_Cropped,cmap='bone')
Axes.plot([0,Size[1]-1],[ReferenceLine,ReferenceLine],color=(1,0,0),linestyle='--',linewidth=2)
for i in range(1,4):
    StackLine = ReferenceLine + i*StackHeight
    Axes.plot([0,Size[1]-1],[StackLine,StackLine],color=(0,0,1),linestyle='--',linewidth=2)
Axes.set_xlim([0,Size[1]])
Axes.set_ylim([0,Size[0]])
plt.axis('off')
plt.subplots_adjust(0,0,1,1)
plt.show()
plt.close(Figure)


# Plot OI group protocol
ReferenceLine2 = 95
Figure, Axes = plt.subplots(1, 1, figsize=(5.5, 4.5), dpi=1000)
Axes.imshow(TIF_Cropped,cmap='bone')
Axes.plot([0,Size[1]-1],[ReferenceLine2,ReferenceLine2],color=(1,0,0),linestyle='--',linewidth=2)
for i in range(2):
    StackLine = ReferenceLine + 22.5/Spacing[0]/2.54 + i*StackHeight
    Axes.plot([0,Size[1]-1],[StackLine,StackLine],color=(0,0,1),linestyle='--',linewidth=2)
Axes.plot([0,Size[1]-1],[StackLine-StackHeight/2,StackLine-StackHeight/2],color=(1,0,1),linestyle='--',linewidth=2)
Axes.set_xlim([0,Size[1]])
Axes.set_ylim([0,Size[0]])
plt.axis('off')
plt.subplots_adjust(0,0,1,1)
plt.show()
plt.close(Figure)