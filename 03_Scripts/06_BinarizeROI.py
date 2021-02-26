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
Group = 'OI'   # Healthy or OI
WorkingDirectory = os.getcwd()
DataPath = os.path.join(WorkingDirectory,'04_Results/01_ROI_Analysis')
ROIsPath = os.path.join(DataPath,'01_' + Group + '_ROIs')
ResizedROIsPath = os.path.join(ROIsPath,'01_Resized_ROIs/')
BinarizedROIsPath = os.path.join(ROIsPath,'02_Binarized_ROIs/')



# 03 Binarized resized ROI and write file
Resized_ROIs = [File for File in os.listdir(ResizedROIsPath) if File.endswith('.mhd')]

for Resized_ROI in Resized_ROIs:

    CT_Scan, Origin, Spacing, Size = Load_Itk(ResizedROIsPath + Resized_ROI)

    Threshold = 50
    CT_Scan[CT_Scan < Threshold] = 1
    CT_Scan[CT_Scan > Threshold] = 2


    Image = sitk.GetImageFromArray(CT_Scan)
    ImagePath = BinarizedROIsPath + Resized_ROI[:-11] + 'Binarized.mhd'
    sitk.WriteImage(Image, ImagePath)



# 04 Create the .bash script
if Group == 'Healthy':
    BatchFile = open(os.path.join(DataPath, '02_ControlBatch.bash'),'w')
elif Group == 'OI':
    BatchFile = open(os.path.join(DataPath, '02_OIBatch.bash'),'w')

# 05 Write the analysis batch
Binarized_ROIs = [File for File in os.listdir(BinarizedROIsPath) if File.endswith('.mhd')]

PipelineFile  = open(os.path.join(WorkingDirectory, '03_Scripts', '06_ROIMorphometry.txt'), 'r')
PipelineText  = PipelineFile.read()

for Binarized_ROI in Binarized_ROIs:

    ROIText = PipelineText
    ROIText = ROIText.replace('$Scan',Binarized_ROI[:-4])

    BatchFile.write(ROIText+'\n\n')

BatchFile.close()
