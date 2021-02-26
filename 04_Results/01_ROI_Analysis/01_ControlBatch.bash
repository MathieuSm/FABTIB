# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001406_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001406_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "250; 78; 362; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001406_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001406_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001406_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001406_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001406_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001406_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001406_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001406_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001406_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001406_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001406_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001406_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "322; 221; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001406_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001406_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001406_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001406_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001406_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001406_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001406_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001406_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001406_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001406_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001406_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001406_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350; 140; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001406_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001406_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001406_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001406_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001406_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001406_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001406_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001406_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001406_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001406_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001406_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001406_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "226; 235; 380; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001406_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001406_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001406_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001406_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001406_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001406_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001406_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001406_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001406_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001406_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001406_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001406_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "238; 270; 395; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001406_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001406_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001406_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001406_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001406_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001406_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001406_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001406_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001406_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001406_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001406_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001406_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "328; 264; 384; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001406_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001406_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001406_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001406_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001406_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001406_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001406_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001406_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001406_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001406_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001406_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001421_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001421_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "574; 164; 345; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001421_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001421_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001421_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001421_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001421_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001421_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001421_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001421_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001421_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001421_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001421_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001421_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "284; 332; 373; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001421_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001421_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001421_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001421_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001421_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001421_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001421_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001421_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001421_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001421_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001421_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001421_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "228; 159; 356; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001421_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001421_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001421_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001421_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001421_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001421_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001421_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001421_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001421_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001421_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001421_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001421_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "395; 16; 390; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001421_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001421_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001421_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001421_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001421_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001421_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001421_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001421_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001421_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001421_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001421_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001421_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "458; 51; 384; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001421_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001421_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001421_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001421_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001421_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001421_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001421_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001421_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001421_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001421_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001421_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001421_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "274; 224; 391; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001421_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001421_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001421_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001421_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001421_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001421_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001421_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001421_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001421_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001421_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001421_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001511_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001511_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "593; 249; 347; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001511_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001511_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001511_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001511_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001511_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001511_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001511_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001511_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001511_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001511_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001511_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001511_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "659; 232; 372; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001511_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001511_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001511_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001511_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001511_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001511_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001511_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001511_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001511_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001511_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001511_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001511_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "592; 158; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001511_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001511_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001511_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001511_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001511_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001511_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001511_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001511_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001511_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001511_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001511_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001511_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "475; 329; 378; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001511_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001511_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001511_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001511_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001511_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001511_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001511_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001511_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001511_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001511_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001511_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001511_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "339; 444; 377; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001511_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001511_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001511_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001511_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001511_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001511_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001511_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001511_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001511_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001511_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001511_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001511_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "592; 303; 406; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001511_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001511_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001511_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001511_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001511_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001511_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001511_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001511_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001511_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001511_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001511_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001534_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001534_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "318; 319; 345; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001534_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001534_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001534_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001534_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001534_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001534_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001534_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001534_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001534_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001534_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001534_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001534_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "540; 261; 341; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001534_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001534_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001534_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001534_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001534_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001534_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001534_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001534_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001534_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001534_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001534_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001534_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "376; 196; 361; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001534_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001534_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001534_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001534_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001534_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001534_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001534_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001534_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001534_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001534_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001534_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001534_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "236; 283; 377; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001534_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001534_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001534_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001534_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001534_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001534_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001534_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001534_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001534_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001534_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001534_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001534_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "365; 218; 401; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001534_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001534_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001534_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001534_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001534_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001534_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001534_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001534_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001534_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001534_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001534_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001534_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "261; 229; 399; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001534_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001534_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001534_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001534_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001534_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001534_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001534_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001534_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001534_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001534_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001534_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001546_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001546_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "361; 113; 346; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001546_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001546_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001546_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001546_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001546_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001546_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001546_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001546_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001546_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001546_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001546_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001546_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "441; 162; 363; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001546_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001546_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001546_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001546_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001546_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001546_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001546_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001546_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001546_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001546_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001546_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001546_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "297; 140; 344; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001546_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001546_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001546_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001546_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001546_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001546_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001546_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001546_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001546_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001546_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001546_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001546_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "352; 153; 398; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001546_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001546_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001546_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001546_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001546_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001546_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001546_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001546_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001546_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001546_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001546_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001546_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "326; 322; 402; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001546_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001546_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001546_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001546_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001546_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001546_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001546_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001546_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001546_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001546_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001546_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001546_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "353; 174; 399; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001546_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001546_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001546_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001546_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001546_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001546_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001546_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001546_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001546_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001546_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001546_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001552_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001552_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "268; 311; 355; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001552_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001552_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001552_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001552_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001552_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001552_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001552_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001552_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001552_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001552_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001552_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001552_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "461; 224; 362; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001552_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001552_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001552_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001552_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001552_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001552_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001552_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001552_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001552_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001552_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001552_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001552_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "305; 271; 357; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001552_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001552_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001552_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001552_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001552_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001552_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001552_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001552_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001552_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001552_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001552_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001552_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "413; 316; 392; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001552_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001552_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001552_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001552_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001552_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001552_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001552_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001552_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001552_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001552_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001552_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001552_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "365; 206; 392; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001552_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001552_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001552_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001552_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001552_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001552_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001552_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001552_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001552_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001552_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001552_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001552_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "448; 189; 394; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001552_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001552_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001552_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001552_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001552_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001552_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001552_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001552_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001552_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001552_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001552_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001560_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001560_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "529; 477; 361; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001560_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001560_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001560_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001560_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001560_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001560_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001560_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001560_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001560_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001560_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001560_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001560_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "523; 243; 341; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001560_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001560_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001560_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001560_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001560_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001560_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001560_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001560_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001560_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001560_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001560_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001560_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "390; 279; 369; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001560_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001560_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001560_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001560_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001560_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001560_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001560_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001560_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001560_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001560_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001560_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001560_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "664; 369; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001560_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001560_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001560_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001560_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001560_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001560_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001560_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001560_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001560_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001560_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001560_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001560_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "278; 375; 378; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001560_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001560_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001560_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001560_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001560_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001560_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001560_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001560_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001560_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001560_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001560_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001560_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "289; 399; 406; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001560_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001560_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001560_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001560_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001560_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001560_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001560_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001560_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001560_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001560_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001560_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001566_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001566_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "397; 128; 342; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001566_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001566_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001566_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001566_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001566_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001566_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001566_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001566_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001566_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001566_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001566_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001566_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "475; 405; 356; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001566_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001566_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001566_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001566_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001566_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001566_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001566_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001566_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001566_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001566_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001566_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001566_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "352; 269; 369; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001566_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001566_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001566_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001566_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001566_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001566_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001566_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001566_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001566_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001566_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001566_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001566_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "593; 376; 392; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001566_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001566_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001566_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001566_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001566_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001566_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001566_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001566_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001566_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001566_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001566_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001566_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "500; 116; 395; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001566_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001566_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001566_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001566_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001566_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001566_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001566_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001566_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001566_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001566_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001566_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001566_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "264; 334; 381; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001566_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001566_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001566_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001566_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001566_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001566_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001566_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001566_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001566_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001566_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "268; 251; 348; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001572_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "353; 285; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001572_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "282; 236; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001572_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "292; 242; 391; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001572_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "281; 214; 406; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001572_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "287; 331; 387; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001572_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001585_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001585_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "237; 313; 354; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001585_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001585_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001585_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001585_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001585_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001585_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001585_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001585_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001585_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001585_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001585_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001585_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "422; 323; 352; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001585_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001585_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001585_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001585_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001585_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001585_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001585_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001585_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001585_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001585_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001585_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001585_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "303; 156; 366; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001585_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001585_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001585_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001585_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001585_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001585_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001585_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001585_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001585_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001585_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001585_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001585_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "357; 266; 397; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001585_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001585_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001585_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001585_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001585_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001585_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001585_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001585_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001585_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001585_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001585_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001585_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "257; 336; 385; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001585_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001585_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001585_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001585_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001585_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001585_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001585_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001585_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001585_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001585_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001585_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001585_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "315; 179; 403; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001585_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001585_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001585_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001585_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001585_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001585_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001585_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001585_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001585_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001585_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001585_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "356; 303; 342; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001592_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "335; 297; 367; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001592_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "491; 335; 356; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001592_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "296; 333; 380; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001592_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "359; 363; 400; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001592_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "534; 318; 389; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001592_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "388; 283; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001624_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "263; 267; 367; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001624_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "453; 336; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001624_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "442; 258; 385; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001624_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "388; 322; 402; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001624_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "440; 336; 396; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001624_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "364; 111; 363; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001635_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "315; 282; 354; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001635_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "328; 200; 343; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001635_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "326; 126; 398; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001635_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "323; 299; 390; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001635_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "250; 333; 400; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001635_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "366; 206; 357; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001641_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "549; 432; 345; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001641_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "497; 458; 351; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001641_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "476; 361; 384; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001641_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "570; 446; 396; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001641_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "573; 308; 391; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001641_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001696_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001696_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "318; 281; 346; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001696_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001696_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001696_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001696_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001696_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001696_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001696_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001696_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001696_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001696_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001696_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001696_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "301; 286; 363; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001696_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001696_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001696_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001696_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001696_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001696_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001696_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001696_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001696_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001696_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001696_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001696_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "291; 373; 371; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001696_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001696_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001696_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001696_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001696_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001696_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001696_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001696_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001696_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001696_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001696_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001696_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "464; 297; 406; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001696_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001696_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001696_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001696_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001696_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001696_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001696_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001696_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001696_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001696_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001696_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001696_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "234; 380; 376; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001696_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001696_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001696_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001696_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001696_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001696_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001696_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001696_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001696_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001696_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001696_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001696_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "244; 319; 403; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001696_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001696_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001696_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001696_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001696_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001696_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001696_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001696_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001696_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001696_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001696_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001735_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001735_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "570; 256; 362; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001735_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001735_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001735_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001735_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001735_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001735_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001735_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001735_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001735_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001735_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001735_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001735_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "335; 126; 371; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001735_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001735_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001735_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001735_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001735_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001735_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001735_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001735_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001735_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001735_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001735_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001735_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "564; 333; 369; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001735_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001735_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001735_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001735_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001735_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001735_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001735_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001735_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001735_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001735_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001735_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001735_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "433; 265; 379; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001735_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001735_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001735_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001735_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001735_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001735_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001735_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001735_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001735_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001735_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001735_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001735_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "504; 192; 379; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001735_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001735_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001735_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001735_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001735_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001735_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001735_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001735_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001735_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001735_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001735_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001735_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "518; 347; 410; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001735_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001735_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001735_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001735_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001735_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001735_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001735_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001735_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001735_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001735_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001735_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001753_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001753_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "598; 282; 375; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001753_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001753_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001753_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001753_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001753_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001753_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001753_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001753_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001753_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001753_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001753_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001753_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "356; 224; 368; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001753_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001753_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001753_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001753_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001753_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001753_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001753_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001753_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001753_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001753_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001753_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001753_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "615; 274; 362; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001753_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001753_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001753_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001753_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001753_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001753_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001753_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001753_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001753_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001753_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001753_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001753_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "345; 145; 392; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001753_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001753_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001753_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001753_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001753_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001753_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001753_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001753_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001753_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001753_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001753_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001753_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "549; 245; 386; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001753_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001753_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001753_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001753_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001753_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001753_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001753_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001753_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001753_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001753_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001753_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001753_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "414; 133; 403; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001753_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001753_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001753_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001753_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001753_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001753_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001753_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001753_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001753_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001753_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001753_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001758_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001758_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "359; 206; 373; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001758_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001758_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001758_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001758_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001758_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001758_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001758_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001758_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001758_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001758_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001758_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001758_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "336; 233; 368; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001758_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001758_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001758_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001758_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001758_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001758_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001758_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001758_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001758_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001758_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001758_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001758_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "402; 430; 359; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001758_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001758_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001758_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001758_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001758_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001758_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001758_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001758_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001758_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001758_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001758_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001758_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "408; 320; 391; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001758_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001758_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001758_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001758_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001758_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001758_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001758_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001758_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001758_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001758_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001758_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001758_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "329; 396; 382; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001758_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001758_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001758_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001758_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001758_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001758_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001758_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001758_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001758_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001758_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001758_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001758_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "407; 136; 379; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001758_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001758_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001758_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001758_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001758_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001758_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001758_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001758_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001758_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001758_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001758_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001785_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001785_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "277; 226; 355; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001785_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001785_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001785_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001785_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001785_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001785_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001785_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001785_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001785_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001785_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001785_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001785_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "368; 357; 359; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001785_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001785_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001785_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001785_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001785_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001785_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001785_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001785_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001785_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001785_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001785_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001785_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "314; 277; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001785_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001785_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001785_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001785_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001785_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001785_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001785_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001785_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001785_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001785_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001785_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001785_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "269; 288; 389; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001785_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001785_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001785_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001785_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001785_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001785_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001785_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001785_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001785_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001785_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001785_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001785_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "397; 176; 381; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001785_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001785_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001785_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001785_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001785_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001785_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001785_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001785_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001785_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001785_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001785_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001785_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "365; 355; 391; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001785_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001785_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001785_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001785_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001785_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001785_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001785_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001785_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001785_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001785_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001785_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001792_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001792_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "295; 215; 367; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001792_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001792_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001792_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001792_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001792_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001792_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001792_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001792_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001792_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001792_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001792_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001792_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "418; 189; 363; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001792_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001792_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001792_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001792_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001792_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001792_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001792_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001792_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001792_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001792_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001792_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001792_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "451; 221; 371; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001792_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001792_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001792_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001792_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001792_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001792_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001792_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001792_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001792_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001792_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001792_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001792_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "360; 249; 391; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001792_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001792_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001792_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001792_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001792_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001792_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001792_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001792_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001792_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001792_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001792_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001792_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "425; 124; 400; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001792_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001792_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001792_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001792_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001792_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001792_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001792_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001792_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001792_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001792_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001792_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001792_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "347; 318; 387; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001792_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001792_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001792_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001792_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001792_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001792_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001792_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001792_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001792_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001792_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001792_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001808_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001808_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "588; 298; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001808_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001808_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001808_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001808_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001808_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001808_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001808_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001808_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001808_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001808_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001808_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001808_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "457; 268; 345; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001808_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001808_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001808_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001808_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001808_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001808_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001808_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001808_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001808_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001808_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001808_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001808_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "281; 302; 362; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001808_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001808_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001808_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001808_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001808_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001808_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001808_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001808_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001808_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001808_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001808_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001808_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "455; 427; 399; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001808_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001808_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001808_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001808_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001808_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001808_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001808_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001808_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001808_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001808_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001808_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001808_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "410; 373; 376; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001808_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001808_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001808_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001808_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001808_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001808_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001808_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001808_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001808_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001808_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001808_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001808_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "409; 140; 386; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001808_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001808_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001808_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001808_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001808_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001808_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001808_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001808_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001808_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001808_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001808_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001821_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001821_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "466; 264; 367; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001821_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001821_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001821_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001821_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001821_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001821_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001821_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001821_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001821_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001821_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001821_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001821_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "283; 283; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001821_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001821_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001821_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001821_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001821_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001821_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001821_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001821_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001821_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001821_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001821_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001821_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "556; 236; 344; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001821_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001821_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001821_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001821_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001821_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001821_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001821_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001821_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001821_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001821_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001821_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001821_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "528; 233; 383; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001821_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001821_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001821_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001821_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001821_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001821_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001821_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001821_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001821_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001821_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001821_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001821_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "347; 115; 381; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001821_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001821_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001821_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001821_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001821_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001821_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001821_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001821_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001821_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001821_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001821_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001821_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "389; 349; 383; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001821_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001821_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001821_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001821_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001821_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001821_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001821_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001821_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001821_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001821_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001821_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001831_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001831_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "270; 140; 342; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001831_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001831_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001831_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001831_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001831_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001831_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001831_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001831_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001831_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001831_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001831_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001831_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "331; 227; 342; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001831_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001831_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001831_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001831_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001831_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001831_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001831_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001831_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001831_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001831_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001831_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001831_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "256; 245; 349; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001831_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001831_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001831_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001831_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001831_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001831_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001831_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001831_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001831_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001831_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001831_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001831_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "305; 157; 380; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001831_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001831_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001831_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001831_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001831_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001831_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001831_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001831_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001831_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001831_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001831_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001831_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "324; 262; 384; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001831_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001831_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001831_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001831_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001831_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001831_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001831_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001831_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001831_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001831_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001831_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001831_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "455; 170; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001831_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001831_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001831_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001831_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001831_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001831_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001831_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001831_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001831_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001831_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001831_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001839_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001839_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "357; 175; 360; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001839_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001839_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001839_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001839_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001839_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001839_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001839_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001839_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001839_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001839_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001839_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001839_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "383; 391; 343; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001839_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001839_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001839_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001839_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001839_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001839_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001839_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001839_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001839_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001839_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001839_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001839_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "489; 193; 375; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001839_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001839_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001839_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001839_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001839_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001839_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001839_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001839_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001839_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001839_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001839_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001839_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "394; 266; 392; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001839_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001839_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001839_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001839_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001839_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001839_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001839_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001839_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001839_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001839_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001839_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001839_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "432; 221; 397; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001839_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001839_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001839_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001839_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001839_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001839_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001839_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001839_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001839_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001839_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001839_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001839_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "444; 262; 409; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001839_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001839_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001839_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001839_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001839_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001839_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001839_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001839_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001839_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001839_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001839_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001844_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001844_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "348; 304; 374; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001844_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001844_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001844_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001844_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001844_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001844_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001844_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001844_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001844_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001844_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001844_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001844_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "306; 347; 360; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001844_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001844_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001844_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001844_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001844_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001844_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001844_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001844_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001844_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001844_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001844_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001844_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "514; 321; 341; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001844_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001844_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001844_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001844_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001844_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001844_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001844_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001844_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001844_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001844_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001844_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001844_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "376; 410; 408; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001844_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001844_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001844_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001844_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001844_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001844_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001844_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001844_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001844_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001844_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001844_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001844_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "333; 155; 405; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001844_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001844_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001844_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001844_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001844_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001844_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001844_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001844_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001844_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001844_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001844_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001844_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "523; 364; 376; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001844_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001844_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001844_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001844_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001844_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001844_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001844_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001844_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001844_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001844_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001844_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "291; 208; 363; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001852_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "356; 157; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001852_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "261; 229; 360; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001852_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "528; 253; 408; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001852_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "510; 215; 394; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001852_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "358; 112; 406; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001852_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "420; 255; 374; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001856_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "568; 295; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001856_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "524; 260; 345; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001856_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "278; 155; 376; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001856_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "450; 332; 385; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001856_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "360; 290; 401; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001856_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "301; 192; 362; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001862_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "432; 381; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001862_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "299; 251; 374; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001862_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "542; 311; 381; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001862_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "344; 174; 402; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001862_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "403; 261; 398; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001862_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "196; 310; 357; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001867_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "412; 375; 364; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001867_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "428; 364; 369; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001867_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "204; 300; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001867_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "319; 390; 401; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001867_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "410; 332; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001867_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "252; 274; 373; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001890_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "488; 386; 361; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001890_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "378; 363; 363; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001890_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "455; 175; 397; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001890_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "520; 244; 395; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001890_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "324; 318; 390; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001890_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "493; 310; 344; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001896_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "311; 102; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001896_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "393; 135; 344; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001896_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "399; 368; 396; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001896_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "264; 324; 392; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001896_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "464; 382; 403; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001896_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "216; 276; 354; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001904_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "310; 282; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001904_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 288; 344; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001904_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "289; 410; 398; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001904_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "184; 268; 380; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001904_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "204; 258; 404; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001904_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "419; 113; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001911_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "302; 107; 359; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001911_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "303; 96; 358; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001911_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "395; 299; 382; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001911_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "228; 242; 390; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001911_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "247; 227; 379; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001911_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "392; 394; 361; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001927_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "592; 330; 367; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001927_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "371; 227; 349; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001927_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "354; 294; 392; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001927_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "376; 131; 407; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001927_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "364; 184; 405; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001927_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "244; 327; 369; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001934_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "474; 452; 373; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001934_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "234; 337; 344; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001934_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "577; 363; 376; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001934_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "539; 348; 396; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001934_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "549; 341; 378; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001934_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "355; 437; 355; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001944_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "568; 404; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001944_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "372; 226; 342; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001944_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "403; 348; 408; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001944_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "417; 274; 408; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001944_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 273; 386; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001944_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "398; 396; 358; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001950_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "570; 373; 351; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001950_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "533; 410; 348; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001950_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "330; 195; 409; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001950_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "314; 367; 387; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001950_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "509; 423; 390; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001950_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001982_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001982_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "324; 387; 347; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001982_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001982_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001982_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001982_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001982_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0001982_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0001982_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001982_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001982_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001982_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001982_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001982_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "321; 288; 362; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001982_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001982_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001982_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001982_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001982_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0001982_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0001982_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001982_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001982_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001982_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001982_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001982_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "274; 365; 346; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001982_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001982_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001982_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001982_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001982_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0001982_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0001982_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001982_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001982_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001982_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001982_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001982_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "450; 199; 408; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001982_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001982_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001982_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001982_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001982_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0001982_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0001982_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001982_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001982_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001982_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001982_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001982_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "409; 219; 383; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001982_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001982_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001982_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001982_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001982_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0001982_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0001982_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001982_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001982_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001982_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001982_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001982_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "477; 197; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001982_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001982_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001982_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001982_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001982_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001982_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0001982_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0001982_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001982_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001982_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001982_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002033_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002033_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "538; 210; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002033_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002033_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002033_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002033_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002033_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002033_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002033_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002033_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002033_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002033_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002033_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002033_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "299; 223; 348; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002033_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002033_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002033_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002033_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002033_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002033_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002033_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002033_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002033_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002033_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002033_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002033_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "330; 283; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002033_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002033_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002033_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002033_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002033_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002033_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002033_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002033_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002033_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002033_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002033_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002033_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "634; 391; 401; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002033_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002033_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002033_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002033_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002033_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002033_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002033_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002033_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002033_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002033_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002033_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002033_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "520; 226; 382; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002033_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002033_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002033_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002033_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002033_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002033_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002033_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002033_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002033_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002033_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002033_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002033_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "580; 182; 393; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002033_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002033_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002033_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002033_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002033_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002033_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002033_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002033_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002033_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002033_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002033_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002046_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002046_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "237; 191; 368; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002046_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002046_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002046_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002046_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002046_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002046_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002046_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002046_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002046_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002046_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002046_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002046_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "207; 256; 357; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002046_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002046_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002046_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002046_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002046_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002046_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002046_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002046_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002046_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002046_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002046_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002046_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "374; 227; 357; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002046_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002046_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002046_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002046_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002046_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002046_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002046_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002046_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002046_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002046_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002046_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002046_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "420; 332; 405; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002046_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002046_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002046_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002046_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002046_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002046_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002046_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002046_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002046_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002046_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002046_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002046_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "441; 283; 396; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002046_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002046_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002046_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002046_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002046_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002046_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002046_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002046_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002046_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002046_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002046_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002046_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "371; 205; 400; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002046_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002046_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002046_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002046_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002046_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002046_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002046_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002046_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002046_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002046_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002046_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "503; 281; 373; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002087_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "183; 365; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002087_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "505; 350; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002087_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "511; 298; 399; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002087_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "546; 445; 377; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002087_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "234; 307; 399; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002087_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "214; 316; 373; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "459; 143; 369; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "401; 180; 348; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "366; 169; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "329; 413; 377; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "432; 238; 394; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "345; 286; 372; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "492; 332; 347; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "333; 374; 349; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "411; 272; 406; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "531; 269; 407; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "361; 277; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "305; 368; 375; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002152_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "277; 365; 352; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002152_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "465; 258; 375; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002152_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "354; 350; 386; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002152_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "364; 129; 407; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002152_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "282; 229; 376; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002152_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "534; 344; 363; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002156_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "282; 393; 370; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002156_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 429; 356; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002156_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "536; 250; 384; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002156_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "466; 346; 385; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002156_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "410; 394; 397; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002156_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "347; 360; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002173_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "494; 191; 353; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002173_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "383; 335; 354; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002173_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "313; 335; 389; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002173_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "490; 330; 387; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002173_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "318; 137; 406; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002173_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002184_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002184_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "258; 153; 371; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002184_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002184_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002184_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002184_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002184_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002184_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002184_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002184_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002184_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002184_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002184_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002184_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "442; 315; 354; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002184_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002184_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002184_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002184_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002184_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002184_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002184_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002184_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002184_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002184_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002184_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002184_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "307; 124; 354; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002184_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002184_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002184_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002184_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002184_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002184_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002184_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002184_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002184_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002184_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002184_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002184_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "325; 113; 385; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002184_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002184_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002184_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002184_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002184_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002184_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002184_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002184_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002184_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002184_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002184_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002184_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "498; 282; 395; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002184_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002184_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002184_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002184_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002184_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002184_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002184_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002184_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002184_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002184_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002184_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002184_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "260; 208; 400; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002184_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002184_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002184_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002184_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002184_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002184_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002184_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002184_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002184_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002184_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002184_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002187_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002187_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "303; 198; 350; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002187_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002187_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002187_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002187_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002187_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002187_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002187_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002187_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002187_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002187_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002187_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002187_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "370; 145; 354; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002187_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002187_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002187_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002187_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002187_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002187_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002187_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002187_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002187_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002187_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002187_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002187_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "300; 112; 361; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002187_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002187_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002187_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002187_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002187_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002187_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002187_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002187_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002187_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002187_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002187_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002187_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "262; 209; 400; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002187_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002187_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002187_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002187_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002187_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002187_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002187_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002187_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002187_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002187_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002187_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002187_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "214; 229; 388; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002187_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002187_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002187_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002187_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002187_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002187_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002187_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002187_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002187_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002187_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002187_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002187_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "387; 137; 376; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002187_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002187_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002187_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002187_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002187_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002187_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002187_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002187_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002187_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002187_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002187_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002198_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002198_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "447; 325; 364; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002198_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002198_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002198_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002198_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002198_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002198_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002198_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002198_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002198_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002198_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002198_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002198_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "362; 215; 347; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002198_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002198_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002198_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002198_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002198_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002198_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002198_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002198_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002198_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002198_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002198_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002198_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "440; 275; 375; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002198_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002198_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002198_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002198_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002198_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002198_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002198_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002198_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002198_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002198_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002198_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002198_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "394; 91; 379; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002198_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002198_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002198_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002198_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002198_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002198_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002198_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002198_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002198_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002198_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002198_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002198_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "407; 272; 383; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002198_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002198_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002198_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002198_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002198_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002198_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002198_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002198_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002198_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002198_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002198_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002198_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "227; 213; 378; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002198_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002198_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002198_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002198_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002198_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002198_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002198_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002198_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002198_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002198_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002198_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002215_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002215_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "250; 374; 343; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002215_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002215_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002215_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002215_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002215_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_C0002215_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_C0002215_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002215_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002215_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002215_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002215_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002215_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "392; 153; 374; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002215_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002215_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002215_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002215_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002215_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_C0002215_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_C0002215_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002215_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002215_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002215_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002215_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002215_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "330; 386; 344; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002215_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002215_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002215_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002215_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002215_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_C0002215_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_C0002215_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002215_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002215_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002215_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002215_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002215_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "289; 353; 378; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002215_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002215_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002215_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002215_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002215_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_C0002215_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_C0002215_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002215_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002215_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002215_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002215_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002215_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "414; 371; 401; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002215_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002215_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002215_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002215_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002215_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_C0002215_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_C0002215_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002215_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002215_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002215_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002215_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002215_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "316; 326; 379; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002215_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002215_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002215_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002215_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002215_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002215_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_C0002215_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_C0002215_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002215_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002215_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002215_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim





