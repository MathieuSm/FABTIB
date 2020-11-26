# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "524; 405; 406; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001950_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "295; 263; 395; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002141_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "380; 192; 393; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002141_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "359; 282; 355; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002147_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "394; 174; 353; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002147_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "453; 207; 367; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002147_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "451; 269; 407; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002147_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "497; 233; 383; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002147_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002147_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002147_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "400; 125; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002147_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002147_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002147_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002147_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002147_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002147_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002147_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002147_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002147_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002147_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002147_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "305; 368; 375; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002152_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sim





