import os
import numpy as np
import pandas as pd
import SimpleITK as sitk
import matplotlib.pyplot as plt

# 00 Initialization
desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width,suppress=True,formatter={'float_kind':'{:f}'.format})

## Define functions
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
def ROIAnalysis(ROIFilePath):

    # Load ROI
    ImageArray, Origin, Spacing, Size = Load_Itk(ROIFilePath+'_Cleaned.mhd')

    # Compute BV/TV for each subcube
    RhoSub = np.zeros((2, 2, 2))
    Indices = [0, np.int(Size[0] / 2), Size[0]]

    for i in range(2):
        for j in range(2):
            for k in range(2):
                ii = [Indices[i], Indices[i + 1]]
                jj = [Indices[j], Indices[j + 1]]
                kk = [Indices[k], Indices[k + 1]]

                SubCube = ImageArray[ii[0]:ii[1], jj[0]:jj[1], kk[0]:kk[1]]

                BV = np.sum(SubCube)
                TV = SubCube.shape[0] * SubCube.shape[1] * SubCube.shape[2]
                RhoSub[i, j, k] = BV / TV

    return np.std(RhoSub) / np.mean(RhoSub)


## Set variables
WorkingDirectory = os.getcwd()
ProblemFolder = os.path.join(WorkingDirectory,'06_Problems/02_ROIAnalysis/')

DataFolder = os.path.join(ProblemFolder,'02_TransformedTensors')
ROIFolder = os.path.join(ProblemFolder,'00_ROI')
FitFolder = os.path.join(ProblemFolder,'03_LinearRegression')

Samples = os.listdir(DataFolder)
Samples.sort()



# 01 Compute ROI coefficient of variation
Data = pd.DataFrame()

for Sample in Samples:

    SampleData = pd.read_csv(os.path.join(DataFolder,Sample))
    SampleData = SampleData.sort_values(by='ROI Number',ignore_index=True)

    VariationCoefficientData = pd.DataFrame()
    for ROI in SampleData['ROI Number']:
        VariationCoefficient = ROIAnalysis(os.path.join(ROIFolder,str(ROI)+'_'+Sample[:-4]))
        VariationCoefficientData = VariationCoefficientData.append({'CV':VariationCoefficient},
                                                                   ignore_index=True)
    SampleData['Variation Coefficient'] = VariationCoefficientData['CV']

    Data = Data.append(SampleData,ignore_index=True)

Data.to_csv(os.path.join(FitFolder,'00_Data.csv'),index=False)



# 02 Define filter parameter
Threshold = (Data.quantile(0.75)['Variation Coefficient']
             - Data.quantile(0.25)['Variation Coefficient']) * 1.5 \
             + Data.quantile(0.75)['Variation Coefficient']
MinBVTV = Data['BVTV'].min()
MaxBVTV = Data['BVTV'].max()

FilterData = pd.DataFrame({'Threshold':Threshold,'Min BVTV':MinBVTV,'Max BVTV':MaxBVTV},index=[0])

## Save filter parameters for both group
FilterFolder = os.path.join(ProblemFolder,'03_LinearRegression')
FilterData.to_csv(os.path.join(FilterFolder,'01_Filter.csv'),index=False)