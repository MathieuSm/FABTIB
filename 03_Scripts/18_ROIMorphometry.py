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

# 01 Define functions
def Load_Itk(Filename):

    # Reads the image using SimpleITK
    Itkimage = sitk.ReadImage(Filename)

    # Convert the image to a  numpy array first and then shuffle the dimensions to get axis in the order z,y,x
    CT_Scan = sitk.GetArrayFromImage(Itkimage)

    # Read the origin of the ct_scan, will be used to convert the coordinates from world to voxel and vice versa.
    Origin = np.array(list(reversed(Itkimage.GetOrigin())))

    # Read the spacing along each dimension
    Spacing = np.array(list(reversed(Itkimage.GetSpacing())))

    # Read the dimension of the CT scan (in voxel)
    Size = np.array(list(reversed(Itkimage.GetSize())))

    return CT_Scan, Origin, Spacing, Size

# 02 Set variables
MatchingPath = '/home/mathieu/Documents/Post-Msc/04_Results/06_LinearRegression/'
ROIsPath = '/home/mathieu/Documents/Post-Msc/04_Results/'

# 03 Get matched individuals
MatchedList = pd.read_csv(MatchingPath+'Data.csv')
MatchedList = MatchedList[['ROI Number', 'Scan', 'Group', 'BVTV']]

# 04 Segment resized ROI
Index = 0

for Index in MatchedList[MatchedList['Group']=='Test'].index:

    ROI = MatchedList['ROI Number'].loc[Index]
    Scan = MatchedList['Scan'].loc[Index]
    Group = MatchedList['Group'].loc[Index]

    if Group == 'Control':
        GroupPath = os.path.join(ROIsPath,'01_HealthyTibiaXCT2Scans')
    elif Group == 'Test':
        GroupPath = os.path.join(ROIsPath, '02_OITibiaXCT2Scans')

    ResizedROIsPath = os.path.join(GroupPath,'00_ROI/02_Resized_ROI/')
    ResizedROI = str(ROI) + '_' + Scan + '_' + 'Resized.mhd'

    CT_Scan, Origin, Spacing, Size = Load_Itk(ResizedROIsPath+ResizedROI)

    Threshold = 50
    CT_Scan[CT_Scan < Threshold] = 1
    CT_Scan[CT_Scan > Threshold] = 2

    # Check BVTV
    BVTV = np.sum(CT_Scan-1) / (Size[0] * Size[1] * Size[2])

    if BVTV.round(4) == MatchedList['BVTV'].loc[Index]:

        Image = sitk.GetImageFromArray(CT_Scan)
        SEGImagesPath = os.path.join(GroupPath,'00_ROI/03_Binarized_ROI/')
        ImagePath = SEGImagesPath + str(ROI) + Scan + '_Binarized.mhd'
        sitk.WriteImage(Image,ImagePath)

    else:
        print('BV/TV incoherence for ROI: ' + str(ROI) + Scan)



