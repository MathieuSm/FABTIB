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
Path = '/home/mathieu/Documents/MscThesis/02_Data/FabricElasticityRelationship/1_ControlGroupNodaratis/B_Edit/04_ResizedROI/'
File = '1C0001679_SEG_UNCOMPResized.mhd'

# 03 Get matched individuals



CT_Scan, Origin, Spacing, Size = Load_Itk(Path+File)
np.unique(CT_Scan)

Threshold = 50
CT_Scan[CT_Scan < Threshold] = 1
CT_Scan[CT_Scan > Threshold] = 2

Image = sitk.GetImageFromArray(CT_Scan)
sitk.WriteImage(Image,'Image.mhd')



