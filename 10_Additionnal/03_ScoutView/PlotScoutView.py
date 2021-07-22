# 00 Initialization
import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
import matplotlib.pyplot as plt
import struct
import re
import statsmodels.formula.api as smf
from scipy.stats.distributions import norm, chi2, t, f
from scipy.stats import shapiro



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

sitk.ReadImage(ScoutView_Path+Images[2])