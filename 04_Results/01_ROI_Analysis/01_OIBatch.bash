# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350406_C0000147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "353; 405; 8; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350406_C0000147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350406_C0000147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350406_C0000147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350406_C0000147_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350406_C0000147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350406_C0000147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350406_C0000147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "155; 382; 2; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350406_C0000147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350406_C0000147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350406_C0000147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350406_C0000147_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350406_C0000147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350406_C0000147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350406_C0000147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "442; 278; 11; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350406_C0000147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350406_C0000147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350406_C0000147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350406_C0000147_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350406_C0000147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350406_C0000147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350406_C0000147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "203; 351; 75; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350406_C0000147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350406_C0000147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350406_C0000147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350406_C0000147_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350406_C0000147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350406_C0000147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350406_C0000147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "100; 236; 59; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350406_C0000147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350406_C0000147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350406_C0000147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350406_C0000147_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350406_C0000147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350406_C0000147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350406_C0000147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "93; 183; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350406_C0000147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350406_C0000147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350406_C0000147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350406_C0000147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350406_C0000147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350406_C0000147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350406_C0000147_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350406_C0000147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350406_C0000147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310101_C0000118_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "228; 208; 15; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_310101_C0000118_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_310101_C0000118_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_310101_C0000118_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_310101_C0000118_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_310101_C0000118_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_310101_C0000118_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310101_C0000118_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "194; 134; 9; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_310101_C0000118_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_310101_C0000118_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_310101_C0000118_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_310101_C0000118_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_310101_C0000118_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_310101_C0000118_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310101_C0000118_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "318; 219; 1; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_310101_C0000118_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_310101_C0000118_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_310101_C0000118_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_310101_C0000118_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_310101_C0000118_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_310101_C0000118_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310101_C0000118_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 142; 61; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_310101_C0000118_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_310101_C0000118_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_310101_C0000118_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_310101_C0000118_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_310101_C0000118_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_310101_C0000118_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310101_C0000118_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "230; 80; 69; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_310101_C0000118_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_310101_C0000118_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_310101_C0000118_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_310101_C0000118_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_310101_C0000118_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_310101_C0000118_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310101_C0000118_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "207; 221; 80; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_310101_C0000118_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_310101_C0000118_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_310101_C0000118_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_310101_C0000118_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_310101_C0000118_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_310101_C0000118_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_310101_C0000118_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_310101_C0000118_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_310101_C0000118_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310201_C0000160_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "326; 168; 15; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_310201_C0000160_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_310201_C0000160_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_310201_C0000160_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_310201_C0000160_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_310201_C0000160_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_310201_C0000160_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310201_C0000160_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "310; 231; 21; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_310201_C0000160_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_310201_C0000160_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_310201_C0000160_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_310201_C0000160_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_310201_C0000160_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_310201_C0000160_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310201_C0000160_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "227; 323; 25; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_310201_C0000160_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_310201_C0000160_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_310201_C0000160_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_310201_C0000160_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_310201_C0000160_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_310201_C0000160_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310201_C0000160_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "331; 209; 77; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_310201_C0000160_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_310201_C0000160_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_310201_C0000160_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_310201_C0000160_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_310201_C0000160_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_310201_C0000160_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310201_C0000160_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "318; 182; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_310201_C0000160_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_310201_C0000160_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_310201_C0000160_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_310201_C0000160_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_310201_C0000160_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_310201_C0000160_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/310201_C0000160_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "321; 233; 77; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_310201_C0000160_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_310201_C0000160_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_310201_C0000160_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_310201_C0000160_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_310201_C0000160_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_310201_C0000160_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_310201_C0000160_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_310201_C0000160_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_310201_C0000160_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350104_C0000094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "173; 330; 4; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350104_C0000094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350104_C0000094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350104_C0000094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350104_C0000094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350104_C0000094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350104_C0000094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350104_C0000094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "98; 319; 27; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350104_C0000094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350104_C0000094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350104_C0000094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350104_C0000094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350104_C0000094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350104_C0000094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350104_C0000094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "389; 322; 38; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350104_C0000094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350104_C0000094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350104_C0000094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350104_C0000094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350104_C0000094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350104_C0000094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350104_C0000094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "266; 277; 73; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350104_C0000094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350104_C0000094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350104_C0000094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350104_C0000094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350104_C0000094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350104_C0000094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350104_C0000094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "335; 236; 45; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350104_C0000094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350104_C0000094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350104_C0000094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350104_C0000094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350104_C0000094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350104_C0000094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350104_C0000094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "399; 275; 73; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350104_C0000094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350104_C0000094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350104_C0000094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350104_C0000094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350104_C0000094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350104_C0000094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350104_C0000094_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350104_C0000094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350104_C0000094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350201_C0000066_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "146; 362; 22; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350201_C0000066_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350201_C0000066_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350201_C0000066_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350201_C0000066_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350201_C0000066_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350201_C0000066_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350201_C0000066_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "127; 395; 24; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350201_C0000066_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350201_C0000066_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350201_C0000066_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350201_C0000066_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350201_C0000066_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350201_C0000066_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350201_C0000066_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "340; 201; 1; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350201_C0000066_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350201_C0000066_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350201_C0000066_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350201_C0000066_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350201_C0000066_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350201_C0000066_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350201_C0000066_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "218; 56; 42; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350201_C0000066_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350201_C0000066_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350201_C0000066_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350201_C0000066_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350201_C0000066_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350201_C0000066_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350201_C0000066_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "320; 410; 79; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350201_C0000066_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350201_C0000066_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350201_C0000066_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350201_C0000066_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350201_C0000066_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350201_C0000066_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350201_C0000066_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "92; 351; 47; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350201_C0000066_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350201_C0000066_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350201_C0000066_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350201_C0000066_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350201_C0000066_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350201_C0000066_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350201_C0000066_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350201_C0000066_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350201_C0000066_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350202_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "251; 337; 7; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350202_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350202_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350202_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350202_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350202_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350202_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350202_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "323; 242; 10; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350202_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350202_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350202_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350202_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350202_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350202_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350202_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "110; 163; 26; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350202_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350202_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350202_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350202_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350202_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350202_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350202_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "175; 214; 64; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350202_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350202_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350202_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350202_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350202_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350202_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350202_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "137; 61; 60; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350202_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350202_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350202_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350202_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350202_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350202_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350202_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "277; 306; 54; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350202_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350202_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350202_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350202_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350202_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350202_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350202_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350202_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350202_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350203_C0000099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "455; 418; 37; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350203_C0000099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350203_C0000099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350203_C0000099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350203_C0000099_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350203_C0000099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350203_C0000099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350203_C0000099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "489; 277; 26; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350203_C0000099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350203_C0000099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350203_C0000099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350203_C0000099_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350203_C0000099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350203_C0000099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350203_C0000099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "136; 221; 23; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350203_C0000099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350203_C0000099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350203_C0000099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350203_C0000099_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350203_C0000099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350203_C0000099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350203_C0000099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "122; 306; 43; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350203_C0000099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350203_C0000099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350203_C0000099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350203_C0000099_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350203_C0000099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350203_C0000099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350203_C0000099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "168; 336; 54; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350203_C0000099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350203_C0000099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350203_C0000099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350203_C0000099_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350203_C0000099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350203_C0000099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350203_C0000099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "329; 430; 67; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350203_C0000099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350203_C0000099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350203_C0000099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350203_C0000099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350203_C0000099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350203_C0000099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350203_C0000099_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350203_C0000099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350203_C0000099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350205_C0000112_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350205_C0000112_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350205_C0000112_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350205_C0000112_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350205_C0000112_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350205_C0000112_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP; 350205_C0000112_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350205_C0000112_SEG_UNCOMP_350205_C0000112_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350206_C0000126_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "105; 134; 5; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350206_C0000126_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350206_C0000126_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350206_C0000126_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350206_C0000126_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350206_C0000126_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350206_C0000126_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350206_C0000126_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "344; 202; 26; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350206_C0000126_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350206_C0000126_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350206_C0000126_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350206_C0000126_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350206_C0000126_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350206_C0000126_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350206_C0000126_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "92; 193; 21; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350206_C0000126_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350206_C0000126_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350206_C0000126_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350206_C0000126_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350206_C0000126_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350206_C0000126_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350206_C0000126_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "105; 198; 73; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350206_C0000126_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350206_C0000126_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350206_C0000126_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350206_C0000126_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350206_C0000126_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350206_C0000126_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350206_C0000126_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "229; 296; 46; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350206_C0000126_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350206_C0000126_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350206_C0000126_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350206_C0000126_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350206_C0000126_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350206_C0000126_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350206_C0000126_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "217; 256; 43; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350206_C0000126_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350206_C0000126_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350206_C0000126_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350206_C0000126_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350206_C0000126_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350206_C0000126_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350206_C0000126_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350206_C0000126_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350206_C0000126_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350208_C0000141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350208_C0000141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350208_C0000141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350208_C0000141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350208_C0000141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350208_C0000141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP; 350208_C0000141_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350208_C0000141_SEG_UNCOMP_350208_C0000141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350302_C0000111_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "247; 334; 10; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350302_C0000111_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350302_C0000111_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350302_C0000111_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350302_C0000111_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350302_C0000111_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350302_C0000111_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350302_C0000111_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "160; 259; 20; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350302_C0000111_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350302_C0000111_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350302_C0000111_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350302_C0000111_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350302_C0000111_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350302_C0000111_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350302_C0000111_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "390; 282; 18; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350302_C0000111_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350302_C0000111_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350302_C0000111_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350302_C0000111_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350302_C0000111_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350302_C0000111_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350302_C0000111_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "249; 309; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350302_C0000111_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350302_C0000111_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350302_C0000111_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350302_C0000111_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350302_C0000111_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350302_C0000111_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350302_C0000111_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "252; 147; 49; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350302_C0000111_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350302_C0000111_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350302_C0000111_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350302_C0000111_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350302_C0000111_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350302_C0000111_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350302_C0000111_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "418; 140; 48; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350302_C0000111_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350302_C0000111_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350302_C0000111_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350302_C0000111_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350302_C0000111_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350302_C0000111_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350302_C0000111_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350302_C0000111_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350302_C0000111_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350303_C0000153_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "286; 193; 13; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350303_C0000153_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350303_C0000153_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350303_C0000153_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350303_C0000153_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350303_C0000153_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350303_C0000153_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350303_C0000153_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "137; 227; 7; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350303_C0000153_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350303_C0000153_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350303_C0000153_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350303_C0000153_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350303_C0000153_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350303_C0000153_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350303_C0000153_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "82; 201; 29; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350303_C0000153_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350303_C0000153_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350303_C0000153_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350303_C0000153_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350303_C0000153_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350303_C0000153_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350303_C0000153_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "85; 193; 48; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350303_C0000153_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350303_C0000153_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350303_C0000153_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350303_C0000153_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350303_C0000153_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350303_C0000153_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350303_C0000153_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "136; 78; 71; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350303_C0000153_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350303_C0000153_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350303_C0000153_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350303_C0000153_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350303_C0000153_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350303_C0000153_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350303_C0000153_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "119; 294; 73; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350303_C0000153_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350303_C0000153_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350303_C0000153_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350303_C0000153_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350303_C0000153_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350303_C0000153_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350303_C0000153_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350303_C0000153_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350303_C0000153_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350402_C0000050_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "142; 222; 11; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350402_C0000050_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350402_C0000050_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350402_C0000050_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350402_C0000050_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350402_C0000050_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350402_C0000050_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350402_C0000050_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "160; 177; 15; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350402_C0000050_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350402_C0000050_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350402_C0000050_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350402_C0000050_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350402_C0000050_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350402_C0000050_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350402_C0000050_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "237; 226; 29; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350402_C0000050_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350402_C0000050_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350402_C0000050_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350402_C0000050_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350402_C0000050_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350402_C0000050_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350402_C0000050_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "141; 155; 51; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350402_C0000050_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350402_C0000050_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350402_C0000050_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350402_C0000050_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350402_C0000050_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350402_C0000050_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350402_C0000050_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "210; 239; 43; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350402_C0000050_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350402_C0000050_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350402_C0000050_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350402_C0000050_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350402_C0000050_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350402_C0000050_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350402_C0000050_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "262; 171; 69; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350402_C0000050_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350402_C0000050_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350402_C0000050_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350402_C0000050_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350402_C0000050_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350402_C0000050_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350402_C0000050_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350402_C0000050_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350402_C0000050_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350404_C0000120_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "148; 294; 11; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350404_C0000120_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350404_C0000120_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350404_C0000120_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350404_C0000120_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350404_C0000120_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350404_C0000120_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350404_C0000120_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "55; 171; 14; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350404_C0000120_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350404_C0000120_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350404_C0000120_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350404_C0000120_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350404_C0000120_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350404_C0000120_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350404_C0000120_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "168; 271; 18; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350404_C0000120_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350404_C0000120_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350404_C0000120_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350404_C0000120_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350404_C0000120_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350404_C0000120_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350404_C0000120_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "300; 219; 42; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350404_C0000120_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350404_C0000120_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350404_C0000120_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350404_C0000120_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350404_C0000120_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350404_C0000120_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350404_C0000120_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "111; 273; 71; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350404_C0000120_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350404_C0000120_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350404_C0000120_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350404_C0000120_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350404_C0000120_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350404_C0000120_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350404_C0000120_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "283; 209; 65; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350404_C0000120_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350404_C0000120_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350404_C0000120_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350404_C0000120_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350404_C0000120_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350404_C0000120_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350404_C0000120_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350404_C0000120_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350404_C0000120_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350405_C0000145_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "384; 153; 22; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350405_C0000145_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350405_C0000145_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350405_C0000145_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350405_C0000145_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350405_C0000145_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350405_C0000145_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350405_C0000145_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "128; 362; 29; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350405_C0000145_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350405_C0000145_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350405_C0000145_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350405_C0000145_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350405_C0000145_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350405_C0000145_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350405_C0000145_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "165; 307; 13; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350405_C0000145_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350405_C0000145_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350405_C0000145_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350405_C0000145_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350405_C0000145_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350405_C0000145_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350405_C0000145_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "186; 176; 75; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350405_C0000145_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350405_C0000145_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350405_C0000145_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350405_C0000145_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350405_C0000145_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350405_C0000145_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350405_C0000145_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "323; 126; 66; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350405_C0000145_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350405_C0000145_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350405_C0000145_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350405_C0000145_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350405_C0000145_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350405_C0000145_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350405_C0000145_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "184; 405; 43; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350405_C0000145_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350405_C0000145_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350405_C0000145_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350405_C0000145_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350405_C0000145_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350405_C0000145_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350405_C0000145_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350405_C0000145_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350405_C0000145_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350608_C0000085_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "246; 287; 22; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350608_C0000085_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350608_C0000085_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350608_C0000085_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350608_C0000085_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350608_C0000085_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350608_C0000085_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350608_C0000085_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "180; 282; 6; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350608_C0000085_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350608_C0000085_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350608_C0000085_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350608_C0000085_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350608_C0000085_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350608_C0000085_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350608_C0000085_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "177; 210; 10; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350608_C0000085_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350608_C0000085_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350608_C0000085_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350608_C0000085_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350608_C0000085_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350608_C0000085_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350608_C0000085_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "301; 146; 61; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350608_C0000085_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350608_C0000085_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350608_C0000085_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350608_C0000085_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350608_C0000085_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350608_C0000085_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350608_C0000085_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "267; 285; 59; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350608_C0000085_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350608_C0000085_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350608_C0000085_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350608_C0000085_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350608_C0000085_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350608_C0000085_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350608_C0000085_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "271; 223; 72; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350608_C0000085_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350608_C0000085_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350608_C0000085_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350608_C0000085_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350608_C0000085_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350608_C0000085_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350608_C0000085_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350608_C0000085_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350608_C0000085_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000082_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "394; 356; 2; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350701_C0000082_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350701_C0000082_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350701_C0000082_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350701_C0000082_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350701_C0000082_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350701_C0000082_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000082_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "403; 240; 7; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350701_C0000082_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350701_C0000082_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350701_C0000082_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350701_C0000082_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350701_C0000082_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350701_C0000082_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000082_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "73; 152; 8; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350701_C0000082_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350701_C0000082_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350701_C0000082_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350701_C0000082_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350701_C0000082_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350701_C0000082_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000082_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "186; 203; 61; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350701_C0000082_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350701_C0000082_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350701_C0000082_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350701_C0000082_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350701_C0000082_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350701_C0000082_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000082_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "250; 358; 45; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350701_C0000082_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350701_C0000082_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350701_C0000082_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350701_C0000082_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350701_C0000082_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350701_C0000082_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000082_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "338; 247; 68; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350701_C0000082_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350701_C0000082_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350701_C0000082_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350701_C0000082_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350701_C0000082_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350701_C0000082_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350701_C0000082_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350701_C0000082_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350701_C0000082_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000083_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "297; 228; 17; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350701_C0000083_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350701_C0000083_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350701_C0000083_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350701_C0000083_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350701_C0000083_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350701_C0000083_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000083_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "136; 192; 27; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350701_C0000083_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350701_C0000083_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350701_C0000083_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350701_C0000083_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350701_C0000083_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350701_C0000083_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000083_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "252; 240; 31; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350701_C0000083_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350701_C0000083_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350701_C0000083_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350701_C0000083_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350701_C0000083_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350701_C0000083_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000083_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "264; 253; 59; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350701_C0000083_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350701_C0000083_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350701_C0000083_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350701_C0000083_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350701_C0000083_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350701_C0000083_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000083_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "131; 216; 45; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350701_C0000083_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350701_C0000083_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350701_C0000083_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350701_C0000083_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350701_C0000083_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350701_C0000083_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350701_C0000083_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "186; 190; 59; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350701_C0000083_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350701_C0000083_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350701_C0000083_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350701_C0000083_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350701_C0000083_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350701_C0000083_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350701_C0000083_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350701_C0000083_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350701_C0000083_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350702_C0000096_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "86; 207; 36; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350702_C0000096_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350702_C0000096_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350702_C0000096_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350702_C0000096_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350702_C0000096_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350702_C0000096_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350702_C0000096_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "251; 229; 29; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350702_C0000096_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350702_C0000096_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350702_C0000096_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350702_C0000096_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350702_C0000096_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350702_C0000096_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350702_C0000096_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "131; 207; 22; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350702_C0000096_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350702_C0000096_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350702_C0000096_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350702_C0000096_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350702_C0000096_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350702_C0000096_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350702_C0000096_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "156; 276; 53; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350702_C0000096_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350702_C0000096_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350702_C0000096_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350702_C0000096_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350702_C0000096_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350702_C0000096_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350702_C0000096_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "270; 248; 60; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350702_C0000096_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350702_C0000096_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350702_C0000096_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350702_C0000096_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350702_C0000096_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350702_C0000096_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350702_C0000096_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "102; 246; 69; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350702_C0000096_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350702_C0000096_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350702_C0000096_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350702_C0000096_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350702_C0000096_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350702_C0000096_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350702_C0000096_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350702_C0000096_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350702_C0000096_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350704_C0000129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "183; 142; 39; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350704_C0000129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350704_C0000129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350704_C0000129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350704_C0000129_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350704_C0000129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350704_C0000129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350704_C0000129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "143; 168; 36; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350704_C0000129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350704_C0000129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350704_C0000129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350704_C0000129_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350704_C0000129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350704_C0000129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350704_C0000129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "227; 301; 4; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350704_C0000129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350704_C0000129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350704_C0000129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350704_C0000129_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350704_C0000129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350704_C0000129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350704_C0000129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "406; 134; 60; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350704_C0000129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350704_C0000129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350704_C0000129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350704_C0000129_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350704_C0000129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350704_C0000129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350704_C0000129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "97; 190; 75; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350704_C0000129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350704_C0000129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350704_C0000129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350704_C0000129_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350704_C0000129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350704_C0000129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350704_C0000129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "182; 117; 62; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350704_C0000129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350704_C0000129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350704_C0000129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350704_C0000129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350704_C0000129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350704_C0000129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350704_C0000129_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350704_C0000129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350704_C0000129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350901_C0000049_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "212; 204; 28; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350901_C0000049_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350901_C0000049_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350901_C0000049_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350901_C0000049_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350901_C0000049_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350901_C0000049_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350901_C0000049_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "87; 145; 6; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350901_C0000049_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350901_C0000049_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350901_C0000049_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350901_C0000049_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350901_C0000049_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350901_C0000049_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350901_C0000049_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "158; 224; 33; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350901_C0000049_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350901_C0000049_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350901_C0000049_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350901_C0000049_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350901_C0000049_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350901_C0000049_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350901_C0000049_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "257; 152; 70; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350901_C0000049_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350901_C0000049_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350901_C0000049_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350901_C0000049_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350901_C0000049_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350901_C0000049_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350901_C0000049_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "176; 246; 47; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350901_C0000049_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350901_C0000049_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350901_C0000049_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350901_C0000049_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350901_C0000049_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350901_C0000049_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350901_C0000049_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "214; 204; 49; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350901_C0000049_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350901_C0000049_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350901_C0000049_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350901_C0000049_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350901_C0000049_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350901_C0000049_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350901_C0000049_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350901_C0000049_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350901_C0000049_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350902_C0000057_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "237; 322; 36; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350902_C0000057_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350902_C0000057_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350902_C0000057_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350902_C0000057_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350902_C0000057_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350902_C0000057_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350902_C0000057_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "366; 295; 14; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350902_C0000057_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350902_C0000057_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350902_C0000057_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350902_C0000057_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350902_C0000057_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350902_C0000057_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350902_C0000057_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "294; 154; 16; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350902_C0000057_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350902_C0000057_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350902_C0000057_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350902_C0000057_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350902_C0000057_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350902_C0000057_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350902_C0000057_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "246; 323; 52; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350902_C0000057_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350902_C0000057_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350902_C0000057_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350902_C0000057_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350902_C0000057_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350902_C0000057_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350902_C0000057_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "205; 126; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350902_C0000057_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350902_C0000057_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350902_C0000057_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350902_C0000057_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350902_C0000057_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350902_C0000057_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350902_C0000057_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "96; 292; 56; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350902_C0000057_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350902_C0000057_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350902_C0000057_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350902_C0000057_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350902_C0000057_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350902_C0000057_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350902_C0000057_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350902_C0000057_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350902_C0000057_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350903_C0000061_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "225; 131; 25; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350903_C0000061_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350903_C0000061_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350903_C0000061_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350903_C0000061_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350903_C0000061_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350903_C0000061_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350903_C0000061_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "119; 218; 17; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350903_C0000061_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350903_C0000061_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350903_C0000061_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350903_C0000061_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350903_C0000061_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350903_C0000061_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350903_C0000061_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "178; 171; 2; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350903_C0000061_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350903_C0000061_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350903_C0000061_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350903_C0000061_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350903_C0000061_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350903_C0000061_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350903_C0000061_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "89; 123; 53; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350903_C0000061_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350903_C0000061_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350903_C0000061_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350903_C0000061_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350903_C0000061_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350903_C0000061_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350903_C0000061_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "223; 193; 68; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350903_C0000061_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350903_C0000061_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350903_C0000061_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350903_C0000061_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350903_C0000061_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350903_C0000061_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350903_C0000061_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "261; 195; 62; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350903_C0000061_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350903_C0000061_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350903_C0000061_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350903_C0000061_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350903_C0000061_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350903_C0000061_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350903_C0000061_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350903_C0000061_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350903_C0000061_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350908_C0000201_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "230; 302; 5; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350908_C0000201_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350908_C0000201_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350908_C0000201_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350908_C0000201_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350908_C0000201_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350908_C0000201_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350908_C0000201_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "172; 312; 27; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350908_C0000201_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350908_C0000201_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350908_C0000201_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350908_C0000201_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350908_C0000201_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350908_C0000201_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350908_C0000201_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "228; 308; 11; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350908_C0000201_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350908_C0000201_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350908_C0000201_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350908_C0000201_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350908_C0000201_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350908_C0000201_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350908_C0000201_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "110; 238; 50; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350908_C0000201_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350908_C0000201_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350908_C0000201_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350908_C0000201_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350908_C0000201_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350908_C0000201_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350908_C0000201_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "191; 152; 47; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350908_C0000201_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350908_C0000201_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350908_C0000201_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350908_C0000201_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350908_C0000201_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350908_C0000201_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350908_C0000201_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "98; 178; 46; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350908_C0000201_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350908_C0000201_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350908_C0000201_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350908_C0000201_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350908_C0000201_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350908_C0000201_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350908_C0000201_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350908_C0000201_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350908_C0000201_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350910_C0000231_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "120; 286; 5; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350910_C0000231_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350910_C0000231_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350910_C0000231_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350910_C0000231_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350910_C0000231_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350910_C0000231_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350910_C0000231_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "84; 227; 37; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350910_C0000231_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350910_C0000231_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350910_C0000231_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350910_C0000231_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350910_C0000231_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350910_C0000231_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350910_C0000231_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "82; 215; 28; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350910_C0000231_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350910_C0000231_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350910_C0000231_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350910_C0000231_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350910_C0000231_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350910_C0000231_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350910_C0000231_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "84; 167; 48; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350910_C0000231_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350910_C0000231_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350910_C0000231_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350910_C0000231_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350910_C0000231_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350910_C0000231_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350910_C0000231_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "132; 193; 57; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350910_C0000231_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350910_C0000231_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350910_C0000231_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350910_C0000231_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350910_C0000231_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350910_C0000231_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350910_C0000231_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "94; 177; 58; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350910_C0000231_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350910_C0000231_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350910_C0000231_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350910_C0000231_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350910_C0000231_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350910_C0000231_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350910_C0000231_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350910_C0000231_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350910_C0000231_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350912_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "396; 164; 13; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350912_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350912_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350912_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350912_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350912_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350912_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350912_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "145; 158; 5; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350912_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350912_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350912_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350912_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350912_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350912_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350912_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "317; 93; 5; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350912_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350912_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350912_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350912_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350912_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350912_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350912_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "138; 146; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350912_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350912_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350912_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350912_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350912_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350912_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350912_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "269; 297; 75; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350912_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350912_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350912_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350912_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350912_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350912_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350912_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "241; 307; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350912_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350912_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350912_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350912_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350912_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350912_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350912_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350912_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350912_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350913_C0000239_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350913_C0000239_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350913_C0000239_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350913_C0000239_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350913_C0000239_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350913_C0000239_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP; 350913_C0000239_SEG_UNCOMP"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/350913_C0000239_SEG_UNCOMP_350913_C0000239_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350914_C0000261_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "331; 186; 36; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350914_C0000261_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350914_C0000261_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350914_C0000261_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350914_C0000261_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350914_C0000261_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350914_C0000261_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350914_C0000261_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "196; 414; 20; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350914_C0000261_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350914_C0000261_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350914_C0000261_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350914_C0000261_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350914_C0000261_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350914_C0000261_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350914_C0000261_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "307; 137; 26; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350914_C0000261_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350914_C0000261_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350914_C0000261_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350914_C0000261_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350914_C0000261_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350914_C0000261_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350914_C0000261_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "210; 388; 80; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350914_C0000261_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350914_C0000261_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350914_C0000261_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350914_C0000261_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350914_C0000261_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350914_C0000261_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350914_C0000261_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "320; 369; 75; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350914_C0000261_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350914_C0000261_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350914_C0000261_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350914_C0000261_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350914_C0000261_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350914_C0000261_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350914_C0000261_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "310; 305; 54; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350914_C0000261_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350914_C0000261_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350914_C0000261_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350914_C0000261_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350914_C0000261_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350914_C0000261_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350914_C0000261_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350914_C0000261_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350914_C0000261_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350915_C0000250_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "195; 274; 11; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350915_C0000250_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350915_C0000250_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350915_C0000250_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350915_C0000250_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350915_C0000250_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350915_C0000250_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350915_C0000250_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "285; 141; 13; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350915_C0000250_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350915_C0000250_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350915_C0000250_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350915_C0000250_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350915_C0000250_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350915_C0000250_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350915_C0000250_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "126; 96; 15; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350915_C0000250_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350915_C0000250_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350915_C0000250_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350915_C0000250_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350915_C0000250_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350915_C0000250_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350915_C0000250_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "296; 210; 76; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350915_C0000250_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350915_C0000250_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350915_C0000250_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350915_C0000250_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350915_C0000250_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350915_C0000250_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350915_C0000250_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "185; 175; 69; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350915_C0000250_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350915_C0000250_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350915_C0000250_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350915_C0000250_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350915_C0000250_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350915_C0000250_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350915_C0000250_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "240; 218; 51; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350915_C0000250_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350915_C0000250_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350915_C0000250_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350915_C0000250_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350915_C0000250_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350915_C0000250_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350915_C0000250_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350915_C0000250_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350915_C0000250_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351002_C0000151_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "210; 311; 23; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351002_C0000151_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351002_C0000151_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351002_C0000151_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351002_C0000151_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351002_C0000151_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351002_C0000151_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351002_C0000151_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "303; 245; 11; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351002_C0000151_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351002_C0000151_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351002_C0000151_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351002_C0000151_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351002_C0000151_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351002_C0000151_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351002_C0000151_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "385; 314; 14; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351002_C0000151_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351002_C0000151_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351002_C0000151_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351002_C0000151_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351002_C0000151_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351002_C0000151_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351002_C0000151_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "306; 273; 77; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351002_C0000151_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351002_C0000151_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351002_C0000151_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351002_C0000151_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351002_C0000151_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351002_C0000151_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351002_C0000151_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "173; 252; 73; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351002_C0000151_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351002_C0000151_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351002_C0000151_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351002_C0000151_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351002_C0000151_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351002_C0000151_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351002_C0000151_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "396; 259; 68; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351002_C0000151_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351002_C0000151_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351002_C0000151_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351002_C0000151_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351002_C0000151_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351002_C0000151_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351002_C0000151_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351002_C0000151_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351002_C0000151_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351302_C0000051_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "144; 195; 15; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351302_C0000051_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351302_C0000051_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351302_C0000051_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351302_C0000051_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351302_C0000051_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351302_C0000051_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351302_C0000051_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "461; 146; 15; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351302_C0000051_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351302_C0000051_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351302_C0000051_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351302_C0000051_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351302_C0000051_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351302_C0000051_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351302_C0000051_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "224; 204; 26; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351302_C0000051_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351302_C0000051_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351302_C0000051_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351302_C0000051_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351302_C0000051_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351302_C0000051_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351302_C0000051_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "394; 44; 41; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351302_C0000051_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351302_C0000051_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351302_C0000051_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351302_C0000051_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351302_C0000051_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351302_C0000051_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351302_C0000051_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "210; 236; 44; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351302_C0000051_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351302_C0000051_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351302_C0000051_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351302_C0000051_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351302_C0000051_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351302_C0000051_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351302_C0000051_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "420; 240; 44; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351302_C0000051_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351302_C0000051_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351302_C0000051_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351302_C0000051_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351302_C0000051_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351302_C0000051_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351302_C0000051_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351302_C0000051_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351302_C0000051_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351303_C0000072_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "73; 126; 10; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351303_C0000072_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351303_C0000072_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351303_C0000072_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351303_C0000072_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351303_C0000072_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351303_C0000072_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351303_C0000072_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "375; 264; 14; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351303_C0000072_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351303_C0000072_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351303_C0000072_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351303_C0000072_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351303_C0000072_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351303_C0000072_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351303_C0000072_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "365; 256; 11; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351303_C0000072_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351303_C0000072_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351303_C0000072_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351303_C0000072_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351303_C0000072_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351303_C0000072_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351303_C0000072_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "83; 184; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351303_C0000072_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351303_C0000072_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351303_C0000072_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351303_C0000072_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351303_C0000072_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351303_C0000072_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351303_C0000072_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "69; 172; 57; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351303_C0000072_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351303_C0000072_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351303_C0000072_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351303_C0000072_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351303_C0000072_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351303_C0000072_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351303_C0000072_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "380; 222; 47; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351303_C0000072_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351303_C0000072_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351303_C0000072_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351303_C0000072_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351303_C0000072_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351303_C0000072_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351303_C0000072_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351303_C0000072_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351303_C0000072_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000089_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "248; 276; 5; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351304_C0000089_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351304_C0000089_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351304_C0000089_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351304_C0000089_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351304_C0000089_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351304_C0000089_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000089_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "296; 321; 27; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351304_C0000089_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351304_C0000089_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351304_C0000089_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351304_C0000089_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351304_C0000089_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351304_C0000089_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000089_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "337; 172; 25; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351304_C0000089_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351304_C0000089_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351304_C0000089_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351304_C0000089_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351304_C0000089_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351304_C0000089_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000089_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "319; 245; 54; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351304_C0000089_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351304_C0000089_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351304_C0000089_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351304_C0000089_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351304_C0000089_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351304_C0000089_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000089_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "193; 68; 42; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351304_C0000089_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351304_C0000089_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351304_C0000089_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351304_C0000089_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351304_C0000089_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351304_C0000089_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000089_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "96; 274; 65; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351304_C0000089_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351304_C0000089_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351304_C0000089_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351304_C0000089_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351304_C0000089_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351304_C0000089_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351304_C0000089_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351304_C0000089_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351304_C0000089_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000091_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "108; 235; 35; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351304_C0000091_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351304_C0000091_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351304_C0000091_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351304_C0000091_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351304_C0000091_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351304_C0000091_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000091_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "307; 326; 7; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351304_C0000091_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351304_C0000091_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351304_C0000091_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351304_C0000091_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351304_C0000091_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351304_C0000091_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000091_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "149; 204; 30; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351304_C0000091_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351304_C0000091_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351304_C0000091_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351304_C0000091_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351304_C0000091_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351304_C0000091_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000091_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "101; 173; 74; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351304_C0000091_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351304_C0000091_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351304_C0000091_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351304_C0000091_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351304_C0000091_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351304_C0000091_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000091_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "275; 292; 60; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351304_C0000091_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351304_C0000091_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351304_C0000091_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351304_C0000091_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351304_C0000091_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351304_C0000091_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351304_C0000091_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "316; 146; 73; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351304_C0000091_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351304_C0000091_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351304_C0000091_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351304_C0000091_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351304_C0000091_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351304_C0000091_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351304_C0000091_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351304_C0000091_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351304_C0000091_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351305_C0000122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "358; 131; 3; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351305_C0000122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351305_C0000122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351305_C0000122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351305_C0000122_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351305_C0000122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351305_C0000122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351305_C0000122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "87; 270; 3; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351305_C0000122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351305_C0000122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351305_C0000122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351305_C0000122_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351305_C0000122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351305_C0000122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351305_C0000122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "149; 353; 20; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351305_C0000122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351305_C0000122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351305_C0000122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351305_C0000122_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351305_C0000122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351305_C0000122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351305_C0000122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "98; 213; 42; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351305_C0000122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351305_C0000122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351305_C0000122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351305_C0000122_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351305_C0000122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351305_C0000122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351305_C0000122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "137; 309; 80; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351305_C0000122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351305_C0000122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351305_C0000122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351305_C0000122_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351305_C0000122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351305_C0000122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351305_C0000122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "252; 291; 57; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351305_C0000122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351305_C0000122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351305_C0000122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351305_C0000122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351305_C0000122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351305_C0000122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351305_C0000122_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351305_C0000122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351305_C0000122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351308_C0000194_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "196; 303; 2; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351308_C0000194_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351308_C0000194_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351308_C0000194_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351308_C0000194_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351308_C0000194_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351308_C0000194_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351308_C0000194_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "109; 163; 21; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351308_C0000194_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351308_C0000194_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351308_C0000194_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351308_C0000194_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351308_C0000194_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351308_C0000194_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351308_C0000194_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "114; 315; 29; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351308_C0000194_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351308_C0000194_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351308_C0000194_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351308_C0000194_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351308_C0000194_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351308_C0000194_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351308_C0000194_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "153; 197; 42; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351308_C0000194_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351308_C0000194_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351308_C0000194_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351308_C0000194_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351308_C0000194_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351308_C0000194_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351308_C0000194_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "159; 255; 76; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351308_C0000194_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351308_C0000194_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351308_C0000194_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351308_C0000194_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351308_C0000194_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351308_C0000194_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351308_C0000194_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "94; 222; 72; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351308_C0000194_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351308_C0000194_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351308_C0000194_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351308_C0000194_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351308_C0000194_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351308_C0000194_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351308_C0000194_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351308_C0000194_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351308_C0000194_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351301_C0000034_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "255; 248; 22; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351301_C0000034_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351301_C0000034_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351301_C0000034_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351301_C0000034_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351301_C0000034_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351301_C0000034_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351301_C0000034_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "275; 239; 32; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351301_C0000034_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351301_C0000034_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351301_C0000034_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351301_C0000034_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351301_C0000034_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351301_C0000034_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351301_C0000034_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "115; 155; 36; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351301_C0000034_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351301_C0000034_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351301_C0000034_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351301_C0000034_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351301_C0000034_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351301_C0000034_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351301_C0000034_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "102; 189; 51; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351301_C0000034_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351301_C0000034_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351301_C0000034_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351301_C0000034_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351301_C0000034_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351301_C0000034_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351301_C0000034_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "333; 94; 52; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351301_C0000034_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351301_C0000034_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351301_C0000034_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351301_C0000034_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351301_C0000034_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351301_C0000034_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351301_C0000034_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "305; 163; 43; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351301_C0000034_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351301_C0000034_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351301_C0000034_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351301_C0000034_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351301_C0000034_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351301_C0000034_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351301_C0000034_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351301_C0000034_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351301_C0000034_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351001_C0000037_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "219; 222; 1; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351001_C0000037_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351001_C0000037_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351001_C0000037_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351001_C0000037_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351001_C0000037_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351001_C0000037_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351001_C0000037_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "151; 230; 16; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351001_C0000037_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351001_C0000037_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351001_C0000037_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351001_C0000037_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351001_C0000037_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351001_C0000037_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351001_C0000037_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "361; 348; 14; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351001_C0000037_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351001_C0000037_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351001_C0000037_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351001_C0000037_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351001_C0000037_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351001_C0000037_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351001_C0000037_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "185; 142; 53; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351001_C0000037_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351001_C0000037_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351001_C0000037_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351001_C0000037_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351001_C0000037_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351001_C0000037_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351001_C0000037_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "145; 350; 52; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351001_C0000037_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351001_C0000037_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351001_C0000037_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351001_C0000037_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351001_C0000037_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351001_C0000037_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351001_C0000037_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "172; 152; 61; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351001_C0000037_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351001_C0000037_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351001_C0000037_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351001_C0000037_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351001_C0000037_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351001_C0000037_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351001_C0000037_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351001_C0000037_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351001_C0000037_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/999998_C0000220_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "139; 159; 24; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_999998_C0000220_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_999998_C0000220_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_999998_C0000220_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_999998_C0000220_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_999998_C0000220_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_999998_C0000220_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/999998_C0000220_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "149; 137; 33; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_999998_C0000220_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_999998_C0000220_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_999998_C0000220_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_999998_C0000220_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_999998_C0000220_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_999998_C0000220_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/999998_C0000220_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "161; 383; 21; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_999998_C0000220_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_999998_C0000220_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_999998_C0000220_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_999998_C0000220_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_999998_C0000220_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_999998_C0000220_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/999998_C0000220_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "190; 83; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_999998_C0000220_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_999998_C0000220_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_999998_C0000220_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_999998_C0000220_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_999998_C0000220_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_999998_C0000220_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/999998_C0000220_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "435; 308; 71; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_999998_C0000220_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_999998_C0000220_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_999998_C0000220_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_999998_C0000220_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_999998_C0000220_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_999998_C0000220_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/999998_C0000220_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "226; 98; 44; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_999998_C0000220_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_999998_C0000220_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_999998_C0000220_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_999998_C0000220_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_999998_C0000220_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_999998_C0000220_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_999998_C0000220_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_999998_C0000220_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_999998_C0000220_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351102_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "385; 179; 34; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351102_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351102_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351102_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351102_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351102_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351102_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351102_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "161; 129; 3; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351102_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351102_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351102_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351102_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351102_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351102_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351102_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "167; 216; 35; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351102_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351102_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351102_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351102_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351102_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351102_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351102_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "227; 150; 55; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351102_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351102_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351102_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351102_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351102_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351102_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351102_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "85; 236; 42; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351102_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351102_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351102_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351102_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351102_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351102_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351102_C0000226_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "317; 310; 50; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351102_C0000226_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351102_C0000226_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351102_C0000226_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351102_C0000226_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351102_C0000226_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351102_C0000226_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351102_C0000226_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351102_C0000226_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351102_C0000226_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350107_C0000104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "214; 132; 17; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350107_C0000104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350107_C0000104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350107_C0000104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350107_C0000104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350107_C0000104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350107_C0000104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350107_C0000104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "168; 240; 6; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350107_C0000104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350107_C0000104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350107_C0000104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350107_C0000104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350107_C0000104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350107_C0000104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350107_C0000104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "82; 186; 12; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350107_C0000104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350107_C0000104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350107_C0000104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350107_C0000104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350107_C0000104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350107_C0000104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350107_C0000104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "190; 108; 57; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350107_C0000104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350107_C0000104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350107_C0000104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350107_C0000104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350107_C0000104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350107_C0000104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350107_C0000104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "166; 144; 70; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350107_C0000104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350107_C0000104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350107_C0000104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350107_C0000104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350107_C0000104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350107_C0000104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350107_C0000104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "105; 155; 58; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350107_C0000104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350107_C0000104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350107_C0000104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350107_C0000104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350107_C0000104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350107_C0000104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350107_C0000104_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350107_C0000104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350107_C0000104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350108_C0000130_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "203; 182; 15; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350108_C0000130_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350108_C0000130_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350108_C0000130_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350108_C0000130_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350108_C0000130_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350108_C0000130_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350108_C0000130_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "400; 279; 35; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350108_C0000130_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350108_C0000130_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350108_C0000130_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350108_C0000130_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350108_C0000130_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350108_C0000130_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350108_C0000130_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "290; 123; 39; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350108_C0000130_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350108_C0000130_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350108_C0000130_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350108_C0000130_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350108_C0000130_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350108_C0000130_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350108_C0000130_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "198; 312; 58; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350108_C0000130_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350108_C0000130_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350108_C0000130_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350108_C0000130_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350108_C0000130_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350108_C0000130_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350108_C0000130_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "328; 84; 54; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350108_C0000130_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350108_C0000130_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350108_C0000130_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350108_C0000130_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350108_C0000130_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350108_C0000130_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350108_C0000130_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "319; 109; 57; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350108_C0000130_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350108_C0000130_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350108_C0000130_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350108_C0000130_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350108_C0000130_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350108_C0000130_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350108_C0000130_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350108_C0000130_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350108_C0000130_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350207_C0000137_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "88; 188; 12; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350207_C0000137_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350207_C0000137_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350207_C0000137_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350207_C0000137_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350207_C0000137_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350207_C0000137_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350207_C0000137_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "220; 270; 18; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350207_C0000137_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350207_C0000137_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350207_C0000137_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350207_C0000137_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350207_C0000137_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350207_C0000137_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350207_C0000137_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "133; 199; 39; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350207_C0000137_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350207_C0000137_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350207_C0000137_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350207_C0000137_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350207_C0000137_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350207_C0000137_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350207_C0000137_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "243; 341; 78; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350207_C0000137_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350207_C0000137_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350207_C0000137_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350207_C0000137_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350207_C0000137_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350207_C0000137_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350207_C0000137_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "210; 323; 63; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350207_C0000137_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350207_C0000137_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350207_C0000137_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350207_C0000137_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350207_C0000137_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350207_C0000137_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350207_C0000137_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "130; 342; 45; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350207_C0000137_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350207_C0000137_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350207_C0000137_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350207_C0000137_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350207_C0000137_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350207_C0000137_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350207_C0000137_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350207_C0000137_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350207_C0000137_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350304_C0000179_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "85; 282; 35; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350304_C0000179_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350304_C0000179_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350304_C0000179_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350304_C0000179_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350304_C0000179_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350304_C0000179_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350304_C0000179_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "247; 106; 8; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350304_C0000179_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350304_C0000179_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350304_C0000179_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350304_C0000179_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350304_C0000179_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350304_C0000179_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350304_C0000179_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "74; 242; 14; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350304_C0000179_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350304_C0000179_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350304_C0000179_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350304_C0000179_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350304_C0000179_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350304_C0000179_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350304_C0000179_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "362; 136; 67; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350304_C0000179_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350304_C0000179_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350304_C0000179_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350304_C0000179_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350304_C0000179_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350304_C0000179_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350304_C0000179_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "136; 303; 64; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350304_C0000179_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350304_C0000179_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350304_C0000179_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350304_C0000179_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350304_C0000179_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350304_C0000179_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350304_C0000179_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "64; 238; 66; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350304_C0000179_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350304_C0000179_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350304_C0000179_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350304_C0000179_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350304_C0000179_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350304_C0000179_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350304_C0000179_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350304_C0000179_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350304_C0000179_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350407_C0000158_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "207; 302; 3; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350407_C0000158_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350407_C0000158_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350407_C0000158_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350407_C0000158_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350407_C0000158_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350407_C0000158_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350407_C0000158_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "534; 276; 33; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350407_C0000158_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350407_C0000158_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350407_C0000158_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350407_C0000158_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350407_C0000158_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350407_C0000158_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350407_C0000158_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "522; 288; 28; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350407_C0000158_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350407_C0000158_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350407_C0000158_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350407_C0000158_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350407_C0000158_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350407_C0000158_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350407_C0000158_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "152; 283; 80; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350407_C0000158_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350407_C0000158_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350407_C0000158_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350407_C0000158_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350407_C0000158_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350407_C0000158_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350407_C0000158_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "199; 236; 41; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350407_C0000158_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350407_C0000158_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350407_C0000158_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350407_C0000158_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350407_C0000158_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350407_C0000158_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350407_C0000158_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "508; 271; 76; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350407_C0000158_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350407_C0000158_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350407_C0000158_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350407_C0000158_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350407_C0000158_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350407_C0000158_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350407_C0000158_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350407_C0000158_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350407_C0000158_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350606_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "360; 344; 21; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350606_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350606_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350606_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350606_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350606_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350606_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350606_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "501; 225; 22; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350606_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350606_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350606_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350606_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350606_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350606_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350606_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "329; 271; 27; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350606_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350606_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350606_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350606_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350606_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350606_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350606_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "396; 338; 69; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350606_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350606_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350606_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350606_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350606_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350606_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350606_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "460; 285; 49; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350606_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350606_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350606_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350606_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350606_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350606_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350606_C0000070_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "230; 292; 71; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350606_C0000070_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350606_C0000070_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350606_C0000070_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350606_C0000070_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350606_C0000070_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350606_C0000070_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350606_C0000070_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350606_C0000070_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350606_C0000070_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350703_C0000117_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "260; 286; 7; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350703_C0000117_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350703_C0000117_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350703_C0000117_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350703_C0000117_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350703_C0000117_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350703_C0000117_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.odb





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350703_C0000117_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "228; 243; 30; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350703_C0000117_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350703_C0000117_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350703_C0000117_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350703_C0000117_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350703_C0000117_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350703_C0000117_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.odb





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350703_C0000117_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "109; 156; 20; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350703_C0000117_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350703_C0000117_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350703_C0000117_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350703_C0000117_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350703_C0000117_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350703_C0000117_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.odb





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350703_C0000117_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "233; 313; 55; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350703_C0000117_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350703_C0000117_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350703_C0000117_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350703_C0000117_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350703_C0000117_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350703_C0000117_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.odb





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350703_C0000117_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "179; 252; 72; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350703_C0000117_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350703_C0000117_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350703_C0000117_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350703_C0000117_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350703_C0000117_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350703_C0000117_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.odb





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350703_C0000117_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "368; 265; 47; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350703_C0000117_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350703_C0000117_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350703_C0000117_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350703_C0000117_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350703_C0000117_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350703_C0000117_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350703_C0000117_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350703_C0000117_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350703_C0000117_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.odb






# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350705_C0000245_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "212; 335; 22; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_350705_C0000245_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_350705_C0000245_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_350705_C0000245_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_350705_C0000245_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_350705_C0000245_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_350705_C0000245_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350705_C0000245_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "322; 227; 29; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_350705_C0000245_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_350705_C0000245_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_350705_C0000245_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_350705_C0000245_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_350705_C0000245_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_350705_C0000245_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350705_C0000245_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "307; 308; 12; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_350705_C0000245_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_350705_C0000245_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_350705_C0000245_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_350705_C0000245_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_350705_C0000245_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_350705_C0000245_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350705_C0000245_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "256; 185; 41; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_350705_C0000245_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_350705_C0000245_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_350705_C0000245_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_350705_C0000245_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_350705_C0000245_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_350705_C0000245_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350705_C0000245_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "173; 273; 63; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_350705_C0000245_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_350705_C0000245_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_350705_C0000245_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_350705_C0000245_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_350705_C0000245_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_350705_C0000245_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/350705_C0000245_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "219; 296; 48; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_350705_C0000245_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_350705_C0000245_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_350705_C0000245_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_350705_C0000245_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_350705_C0000245_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_350705_C0000245_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_350705_C0000245_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_350705_C0000245_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_350705_C0000245_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351310_C0000159_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "151; 290; 2; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/1_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_351310_C0000159_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "1_351310_C0000159_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/1_351310_C0000159_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_351310_C0000159_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_351310_C0000159_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_351310_C0000159_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351310_C0000159_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "176; 140; 37; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/2_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_351310_C0000159_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "2_351310_C0000159_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/2_351310_C0000159_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_351310_C0000159_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_351310_C0000159_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_351310_C0000159_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351310_C0000159_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "142; 255; 10; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/3_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_351310_C0000159_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "3_351310_C0000159_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/3_351310_C0000159_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_351310_C0000159_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_351310_C0000159_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_351310_C0000159_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351310_C0000159_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "137; 137; 45; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/4_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_351310_C0000159_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "4_351310_C0000159_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/4_351310_C0000159_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_351310_C0000159_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_351310_C0000159_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_351310_C0000159_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351310_C0000159_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "294; 101; 43; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/5_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_351310_C0000159_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "5_351310_C0000159_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/5_351310_C0000159_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_351310_C0000159_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_351310_C0000159_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_351310_C0000159_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "B_Edit"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/01_MHDFile/351310_C0000159_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "99; 225; 43; 87; 87; 87"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/02_RawROI/6_351310_C0000159_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_351310_C0000159_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_351310_C0000159_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "C_FEA"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_351310_C0000159_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/root/medtool45_SL77/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abaqus"  -job "6_351310_C0000159_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/info.py" -txt "D_PostProcess"
abaqus python "/root/medtool45_SL77/bin/abqFuReader2.py" -odb "C_FEA/03_JobResults/6_351310_C0000159_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_351310_C0000159_SEG_UNCOMP.dat"  -exe "abaqus;python"
"/root/medtool45_SL77/Python27/bin/python" "/root/medtool45_SL77/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_351310_C0000159_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_351310_C0000159_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.sim





