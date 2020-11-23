# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001566_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001566_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "352; 342; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001566_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001566_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001566_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001566_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001566_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001566_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001566_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001566_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001566_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001566_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001566_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "282; 236; 350; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001572_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "292; 242; 391; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001572_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "281; 214; 406; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001572_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001572_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001572_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "287; 331; 387; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001572_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001572_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001572_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001572_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001572_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001572_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001572_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001572_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001572_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001572_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001572_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "356; 303; 342; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001592_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "335; 297; 367; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001592_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "491; 335; 356; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001592_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "296; 333; 380; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001592_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "359; 363; 400; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001592_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001592_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001592_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "534; 318; 389; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001592_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001592_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001592_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001592_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001592_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001592_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001592_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001592_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001592_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001592_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001592_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001600_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001600_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "464; 339; 347; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001600_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001600_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001600_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001600_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001600_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001600_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001600_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001600_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001600_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001600_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001600_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001600_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "311; 202; 342; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001600_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001600_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001600_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001600_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001600_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001600_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001600_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001600_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001600_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001600_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001600_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001600_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "323; 331; 368; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001600_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001600_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001600_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001600_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001600_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001600_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001600_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001600_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001600_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001600_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001600_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001600_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "389; 244; 407; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001600_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001600_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001600_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001600_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001600_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001600_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001600_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001600_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001600_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001600_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001600_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001600_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "336; 349; 376; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001600_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001600_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001600_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001600_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001600_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001600_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001600_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001600_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001600_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001600_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001600_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001600_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "296; 304; 408; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001600_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001600_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001600_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001600_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001600_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001600_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001600_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001600_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001600_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001600_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001600_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001608_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001608_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 237; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001608_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001608_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001608_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001608_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001608_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001608_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001608_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001608_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001608_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001608_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001608_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001608_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "316; 97; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001608_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001608_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001608_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001608_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001608_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001608_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001608_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001608_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001608_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001608_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001608_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001608_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "407; 361; 342; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001608_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001608_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001608_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001608_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001608_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001608_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001608_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001608_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001608_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001608_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001608_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001608_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "453; 161; 377; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001608_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001608_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001608_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001608_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001608_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001608_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001608_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001608_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001608_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001608_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001608_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001608_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "334; 357; 388; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001608_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001608_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001608_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001608_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001608_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001608_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001608_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001608_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001608_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001608_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001608_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001608_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "246; 301; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001608_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001608_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001608_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001608_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001608_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001608_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001608_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001608_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001608_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001608_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001608_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001616_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001616_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "321; 193; 355; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001616_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001616_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001616_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001616_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001616_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001616_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001616_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001616_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001616_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001616_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001616_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001616_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "350; 126; 361; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001616_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001616_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001616_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001616_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001616_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001616_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001616_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001616_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001616_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001616_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001616_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001616_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "291; 141; 348; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001616_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001616_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001616_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001616_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001616_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001616_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001616_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001616_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001616_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001616_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001616_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001616_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "296; 288; 400; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001616_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001616_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001616_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001616_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001616_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001616_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001616_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001616_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001616_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001616_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001616_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001616_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "318; 144; 381; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001616_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001616_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001616_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001616_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001616_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001616_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001616_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001616_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001616_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001616_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001616_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001616_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "458; 223; 392; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001616_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001616_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001616_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001616_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001616_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001616_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001616_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001616_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001616_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001616_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001616_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "388; 283; 353; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001624_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "263; 267; 367; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001624_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "453; 336; 353; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001624_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "442; 258; 385; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001624_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "388; 322; 402; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001624_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001624_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001624_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "440; 336; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001624_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001624_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001624_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001624_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001624_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001624_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001624_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001624_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001624_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001624_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001624_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "364; 111; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001635_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "315; 282; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001635_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "328; 200; 343; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001635_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "326; 126; 398; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001635_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "323; 299; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001635_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001635_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001635_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "250; 333; 400; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001635_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001635_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001635_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001635_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001635_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001635_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001635_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001635_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001635_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001635_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001635_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "366; 206; 357; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001641_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "549; 432; 345; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001641_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "497; 458; 351; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001641_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "476; 361; 384; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001641_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "570; 446; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001641_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001641_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001641_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "573; 308; 391; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001641_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001641_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001641_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001641_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001641_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001641_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001641_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001641_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001641_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001641_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001641_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001648_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001648_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "405; 238; 346; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001648_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001648_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001648_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001648_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001648_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001648_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001648_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001648_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001648_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001648_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001648_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001648_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "464; 318; 361; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001648_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001648_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001648_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001648_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001648_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001648_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001648_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001648_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001648_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001648_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001648_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001648_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "332; 234; 361; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001648_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001648_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001648_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001648_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001648_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001648_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001648_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001648_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001648_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001648_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001648_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001648_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "465; 209; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001648_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001648_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001648_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001648_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001648_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001648_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001648_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001648_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001648_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001648_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001648_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001648_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "385; 290; 408; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001648_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001648_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001648_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001648_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001648_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001648_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001648_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001648_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001648_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001648_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001648_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001648_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "346; 151; 402; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001648_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001648_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001648_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001648_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001648_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001648_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001648_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001648_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001648_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001648_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001648_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001653_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001653_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "348; 313; 362; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001653_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001653_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001653_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001653_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001653_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001653_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001653_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001653_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001653_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001653_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001653_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001653_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "389; 110; 367; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001653_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001653_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001653_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001653_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001653_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001653_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001653_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001653_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001653_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001653_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001653_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001653_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "312; 100; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001653_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001653_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001653_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001653_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001653_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001653_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001653_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001653_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001653_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001653_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001653_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001653_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "225; 252; 376; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001653_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001653_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001653_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001653_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001653_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001653_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001653_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001653_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001653_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001653_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001653_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001653_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "338; 154; 410; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001653_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001653_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001653_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001653_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001653_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001653_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001653_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001653_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001653_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001653_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001653_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001653_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "340; 281; 380; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001653_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001653_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001653_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001653_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001653_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001653_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001653_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001653_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001653_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001653_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001653_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001657_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001657_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "352; 332; 374; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001657_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001657_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001657_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001657_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001657_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001657_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001657_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001657_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001657_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001657_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001657_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001657_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "301; 259; 365; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001657_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001657_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001657_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001657_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001657_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001657_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001657_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001657_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001657_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001657_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001657_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001657_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "410; 258; 349; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001657_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001657_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001657_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001657_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001657_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001657_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001657_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001657_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001657_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001657_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001657_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001657_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "427; 273; 399; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001657_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001657_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001657_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001657_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001657_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001657_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001657_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001657_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001657_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001657_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001657_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001657_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "298; 132; 392; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001657_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001657_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001657_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001657_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001657_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001657_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001657_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001657_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001657_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001657_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001657_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001657_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "347; 98; 384; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001657_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001657_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001657_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001657_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001657_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001657_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001657_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001657_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001657_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001657_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001657_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001662_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001662_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "426; 184; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001662_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001662_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001662_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001662_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001662_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001662_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001662_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001662_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001662_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001662_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001662_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001662_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "293; 277; 364; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001662_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001662_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001662_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001662_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001662_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001662_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001662_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001662_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001662_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001662_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001662_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001662_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "423; 319; 374; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001662_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001662_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001662_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001662_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001662_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001662_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001662_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001662_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001662_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001662_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001662_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001662_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "516; 361; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001662_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001662_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001662_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001662_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001662_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001662_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001662_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001662_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001662_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001662_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001662_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001662_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "482; 318; 388; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001662_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001662_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001662_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001662_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001662_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001662_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001662_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001662_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001662_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001662_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001662_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001662_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "489; 355; 381; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001662_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001662_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001662_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001662_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001662_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001662_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001662_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001662_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001662_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001662_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001662_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001667_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001667_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "271; 289; 344; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001667_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001667_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001667_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001667_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001667_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001667_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001667_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001667_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001667_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001667_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001667_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001667_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "399; 161; 357; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001667_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001667_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001667_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001667_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001667_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001667_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001667_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001667_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001667_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001667_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001667_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001667_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "273; 150; 348; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001667_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001667_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001667_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001667_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001667_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001667_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001667_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001667_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001667_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001667_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001667_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001667_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "314; 158; 397; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001667_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001667_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001667_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001667_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001667_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001667_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001667_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001667_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001667_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001667_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001667_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001667_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "263; 298; 386; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001667_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001667_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001667_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001667_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001667_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001667_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001667_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001667_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001667_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001667_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001667_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001667_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "236; 246; 395; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001667_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001667_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001667_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001667_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001667_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001667_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001667_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001667_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001667_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001667_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001667_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001674_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001674_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "254; 193; 375; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001674_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001674_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001674_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001674_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001674_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001674_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001674_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001674_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001674_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001674_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001674_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001674_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "478; 286; 360; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001674_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001674_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001674_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001674_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001674_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001674_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001674_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001674_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001674_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001674_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001674_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001674_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "254; 214; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001674_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001674_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001674_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001674_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001674_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001674_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001674_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001674_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001674_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001674_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001674_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001674_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "417; 327; 385; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001674_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001674_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001674_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001674_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001674_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001674_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001674_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001674_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001674_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001674_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001674_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001674_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "394; 206; 405; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001674_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001674_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001674_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001674_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001674_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001674_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001674_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001674_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001674_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001674_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001674_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001674_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "463; 318; 382; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001674_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001674_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001674_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001674_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001674_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001674_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001674_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001674_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001674_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001674_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001674_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001679_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001679_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "338; 382; 347; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001679_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001679_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001679_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001679_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001679_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001679_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001679_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001679_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001679_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001679_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001679_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001679_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "256; 283; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001679_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001679_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001679_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001679_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001679_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001679_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001679_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001679_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001679_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001679_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001679_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001679_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "220; 321; 364; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001679_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001679_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001679_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001679_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001679_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001679_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001679_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001679_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001679_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001679_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001679_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001679_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "392; 217; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001679_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001679_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001679_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001679_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001679_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001679_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001679_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001679_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001679_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001679_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001679_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001679_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "257; 313; 377; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001679_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001679_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001679_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001679_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001679_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001679_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001679_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001679_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001679_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001679_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001679_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001679_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "212; 334; 379; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001679_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001679_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001679_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001679_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001679_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001679_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001679_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001679_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001679_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001679_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001679_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001684_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001684_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "430; 318; 371; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001684_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001684_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001684_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001684_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001684_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001684_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001684_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001684_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001684_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001684_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001684_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001684_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "415; 175; 341; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001684_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001684_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001684_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001684_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001684_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001684_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001684_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001684_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001684_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001684_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001684_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001684_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "313; 171; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001684_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001684_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001684_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001684_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001684_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001684_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001684_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001684_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001684_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001684_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001684_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001684_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "267; 295; 397; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001684_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001684_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001684_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001684_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001684_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001684_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001684_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001684_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001684_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001684_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001684_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001684_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "323; 137; 380; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001684_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001684_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001684_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001684_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001684_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001684_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001684_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001684_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001684_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001684_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001684_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001684_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "526; 268; 395; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001684_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001684_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001684_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001684_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001684_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001684_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001684_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001684_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001684_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001684_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001684_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001691_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001691_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "314; 99; 342; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001691_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001691_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001691_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001691_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001691_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001691_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001691_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001691_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001691_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001691_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001691_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001691_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "259; 353; 362; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001691_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001691_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001691_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001691_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001691_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001691_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001691_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001691_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001691_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001691_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001691_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001691_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "344; 279; 359; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001691_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001691_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001691_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001691_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001691_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001691_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001691_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001691_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001691_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001691_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001691_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001691_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "395; 251; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001691_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001691_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001691_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001691_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001691_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001691_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001691_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001691_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001691_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001691_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001691_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001691_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "423; 304; 387; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001691_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001691_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001691_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001691_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001691_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001691_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001691_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001691_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001691_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001691_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001691_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001691_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "294; 143; 409; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001691_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001691_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001691_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001691_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001691_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001691_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001691_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001691_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001691_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001691_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001691_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "528; 253; 408; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001852_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "510; 215; 394; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001852_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001852_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001852_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "358; 112; 406; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001852_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001852_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001852_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001852_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001852_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001852_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001852_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001852_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001852_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001852_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001852_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "420; 255; 374; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001856_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "568; 295; 350; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001856_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "524; 260; 345; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001856_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "278; 155; 376; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001856_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "450; 332; 385; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001856_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001856_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001856_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "360; 290; 401; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001856_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001856_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001856_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001856_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001856_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001856_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001856_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001856_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001856_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001856_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001856_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "301; 192; 362; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001862_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "432; 381; 370; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001862_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "299; 251; 374; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001862_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "542; 311; 381; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001862_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "344; 174; 402; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001862_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001862_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001862_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "403; 261; 398; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001862_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001862_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001862_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001862_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001862_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001862_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001862_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001862_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001862_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001862_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001862_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "196; 310; 357; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001867_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "412; 375; 364; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001867_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "428; 364; 369; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001867_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "204; 300; 388; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001867_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "319; 390; 401; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001867_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001867_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001867_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "410; 332; 388; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001867_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001867_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001867_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001867_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001867_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001867_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001867_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001867_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001867_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001867_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001867_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001875_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001875_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "494; 330; 349; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001875_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001875_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001875_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001875_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001875_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001875_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001875_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001875_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001875_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001875_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001875_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001875_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "289; 348; 355; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001875_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001875_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001875_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001875_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001875_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001875_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001875_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001875_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001875_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001875_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001875_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001875_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "407; 155; 369; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001875_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001875_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001875_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001875_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001875_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001875_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001875_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001875_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001875_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001875_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001875_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001875_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "357; 135; 379; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001875_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001875_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001875_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001875_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001875_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001875_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001875_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001875_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001875_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001875_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001875_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001875_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "317; 278; 379; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001875_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001875_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001875_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001875_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001875_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001875_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001875_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001875_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001875_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001875_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001875_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001875_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "288; 359; 410; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001875_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001875_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001875_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001875_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001875_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001875_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001875_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001875_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001875_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001875_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001875_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001879_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001879_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "450; 175; 369; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001879_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001879_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001879_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001879_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001879_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001879_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001879_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001879_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001879_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001879_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001879_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001879_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "229; 296; 370; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001879_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001879_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001879_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001879_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001879_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001879_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001879_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001879_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001879_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001879_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001879_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001879_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "447; 174; 366; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001879_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001879_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001879_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001879_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001879_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001879_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001879_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001879_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001879_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001879_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001879_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001879_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "234; 341; 379; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001879_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001879_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001879_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001879_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001879_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001879_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001879_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001879_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001879_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001879_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001879_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001879_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "234; 185; 394; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001879_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001879_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001879_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001879_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001879_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001879_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001879_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001879_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001879_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001879_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001879_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001879_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "433; 256; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001879_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001879_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001879_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001879_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001879_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001879_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001879_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001879_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001879_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001879_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001879_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001885_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001885_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "255; 364; 362; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001885_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001885_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001885_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001885_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001885_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001885_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001885_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001885_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001885_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001885_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001885_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001885_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "281; 344; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001885_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001885_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001885_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001885_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001885_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001885_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001885_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001885_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001885_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001885_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001885_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001885_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "379; 120; 346; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001885_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001885_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001885_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001885_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001885_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001885_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001885_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001885_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001885_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001885_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001885_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001885_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "312; 248; 391; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001885_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001885_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001885_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001885_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001885_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001885_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001885_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001885_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001885_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001885_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001885_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001885_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "327; 375; 388; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001885_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001885_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001885_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001885_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001885_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001885_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001885_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001885_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001885_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001885_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001885_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001885_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "469; 425; 386; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001885_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001885_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001885_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001885_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001885_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001885_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001885_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001885_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001885_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001885_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001885_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "252; 274; 373; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001890_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "488; 386; 361; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001890_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "378; 363; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001890_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "455; 175; 397; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001890_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "520; 244; 395; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001890_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001890_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001890_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "324; 318; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001890_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001890_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001890_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001890_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001890_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001890_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001890_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001890_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001890_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001890_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001890_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "493; 310; 344; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001896_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "311; 102; 353; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001896_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "393; 135; 344; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001896_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "399; 368; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001896_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "264; 324; 392; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001896_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001896_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001896_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "464; 382; 403; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001896_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001896_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001896_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001896_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001896_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001896_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001896_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001896_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001896_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001896_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001896_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "216; 276; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001904_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "310; 282; 370; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001904_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 288; 344; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001904_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "289; 410; 398; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001904_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "184; 268; 380; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001904_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001904_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001904_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "204; 258; 404; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001904_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001904_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001904_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001904_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001904_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001904_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001904_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001904_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001904_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001904_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001904_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "419; 113; 350; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001911_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "302; 107; 359; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001911_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "303; 96; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001911_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "395; 299; 382; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001911_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "228; 242; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001911_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001911_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001911_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "247; 227; 379; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001911_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001911_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001911_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001911_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001911_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001911_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001911_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001911_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001911_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001911_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001911_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001922_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001922_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "329; 166; 357; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001922_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001922_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001922_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001922_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001922_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001922_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001922_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001922_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001922_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001922_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001922_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001922_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "206; 283; 351; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001922_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001922_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001922_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001922_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001922_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001922_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001922_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001922_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001922_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001922_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001922_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001922_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "406; 278; 345; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001922_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001922_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001922_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001922_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001922_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001922_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001922_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001922_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001922_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001922_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001922_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001922_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "322; 259; 399; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001922_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001922_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001922_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001922_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001922_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001922_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001922_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001922_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001922_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001922_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001922_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001922_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "349; 325; 376; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001922_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001922_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001922_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001922_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001922_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001922_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001922_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001922_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001922_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001922_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001922_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001922_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "334; 356; 391; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001922_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001922_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001922_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001922_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001922_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001922_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001922_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001922_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001922_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001922_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001922_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "392; 394; 361; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001927_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "592; 330; 367; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001927_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "371; 227; 349; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001927_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "354; 294; 392; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001927_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "376; 131; 407; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001927_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001927_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001927_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "364; 184; 405; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001927_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001927_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001927_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001927_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001927_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001927_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001927_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001927_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001927_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001927_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001927_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "244; 327; 369; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001934_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "474; 452; 373; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001934_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "234; 337; 344; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001934_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "577; 363; 376; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001934_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "539; 348; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001934_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001934_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001934_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "549; 341; 378; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001934_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001934_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001934_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001934_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001934_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001934_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001934_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001934_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001934_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001934_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001934_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "355; 437; 355; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001944_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "568; 404; 370; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001944_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "372; 226; 342; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001944_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "403; 348; 408; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001944_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "417; 274; 408; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0001944_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001944_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001944_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 273; 386; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001944_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001944_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001944_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001944_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001944_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001944_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001944_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001944_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001944_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001944_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001944_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "398; 396; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0001950_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "570; 373; 351; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0001950_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "533; 410; 348; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0001950_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "330; 195; 409; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0001950_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0001950_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0001950_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "509; 423; 390; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0001950_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0001950_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0001950_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0001950_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0001950_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0001950_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0001950_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0001950_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0001950_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0001950_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0001950_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002077_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002077_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "453; 263; 366; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002077_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002077_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002077_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002077_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002077_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002077_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002077_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002077_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002077_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002077_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002077_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002077_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "385; 245; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002077_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002077_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002077_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002077_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002077_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002077_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002077_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002077_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002077_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002077_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002077_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002077_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "386; 366; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002077_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002077_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002077_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002077_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002077_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002077_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002077_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002077_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002077_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002077_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002077_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002077_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "195; 236; 385; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002077_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002077_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002077_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002077_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002077_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002077_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002077_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002077_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002077_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002077_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002077_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002077_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "322; 309; 405; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002077_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002077_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002077_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002077_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002077_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002077_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002077_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002077_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002077_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002077_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002077_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002077_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 150; 394; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002077_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002077_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002077_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002077_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002077_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002077_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002077_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002077_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002077_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002077_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002077_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "503; 281; 373; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002087_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "183; 365; 370; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002087_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "505; 350; 350; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002087_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "511; 298; 399; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002087_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "546; 445; 377; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002087_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002087_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002087_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "234; 307; 399; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002087_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002087_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002087_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002087_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002087_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002087_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002087_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002087_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002087_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002087_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002087_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "214; 316; 373; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002094_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "459; 143; 369; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002094_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "401; 180; 348; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002094_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "366; 169; 388; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002094_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "329; 413; 377; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002094_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002094_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002094_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "432; 238; 394; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002094_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002094_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002094_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002094_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002094_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002094_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002094_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002094_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002094_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002094_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002094_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "402; 339; 361; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002099_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "342; 118; 359; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002099_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "311; 367; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002099_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "383; 318; 381; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002099_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "240; 336; 397; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002099_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002099_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002099_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "305; 121; 385; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002099_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002099_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002099_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002099_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002099_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002099_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002099_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002099_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002099_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002099_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002099_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "345; 286; 372; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002104_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "492; 332; 347; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002104_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "333; 374; 349; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002104_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "411; 272; 406; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002104_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "531; 269; 407; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002104_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002104_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002104_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "361; 277; 388; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002104_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002104_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002104_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002104_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002104_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002104_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002104_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002104_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002104_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002104_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002104_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002110_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002110_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "230; 321; 366; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002110_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002110_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002110_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002110_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002110_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002110_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002110_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002110_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002110_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002110_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002110_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002110_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "364; 270; 362; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002110_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002110_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002110_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002110_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002110_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002110_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002110_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002110_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002110_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002110_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002110_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002110_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "348; 337; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002110_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002110_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002110_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002110_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002110_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002110_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002110_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002110_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002110_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002110_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002110_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002110_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "213; 285; 409; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002110_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002110_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002110_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002110_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002110_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002110_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002110_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002110_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002110_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002110_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002110_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002110_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "443; 297; 410; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002110_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002110_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002110_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002110_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002110_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002110_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002110_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002110_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002110_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002110_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002110_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002110_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "262; 317; 394; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002110_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002110_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002110_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002110_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002110_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002110_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002110_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002110_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002110_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002110_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002110_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "428; 465; 356; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002122_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "415; 357; 371; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002122_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "417; 447; 369; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002122_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "469; 338; 396; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002122_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "316; 421; 380; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002122_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002122_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002122_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "279; 424; 405; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002122_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002122_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002122_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002122_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002122_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002122_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002122_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002122_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002122_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002122_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002122_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "471; 308; 343; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002129_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "403; 301; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002129_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "354; 111; 358; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002129_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "395; 404; 376; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002129_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "416; 256; 406; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002129_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002129_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002129_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "421; 246; 408; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002129_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002129_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002129_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002129_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002129_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002129_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002129_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002129_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002129_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002129_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002129_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002136_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002136_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "274; 194; 365; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002136_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002136_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002136_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002136_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002136_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002136_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002136_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002136_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002136_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002136_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002136_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002136_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "455; 383; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002136_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002136_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002136_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002136_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002136_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002136_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002136_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002136_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002136_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002136_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002136_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002136_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "426; 152; 371; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002136_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002136_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002136_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002136_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002136_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002136_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002136_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002136_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002136_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002136_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002136_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002136_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "439; 134; 405; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002136_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002136_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002136_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002136_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002136_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002136_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002136_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002136_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002136_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002136_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002136_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002136_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "211; 348; 383; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002136_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002136_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002136_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002136_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002136_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002136_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002136_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002136_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002136_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002136_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002136_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002136_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "505; 361; 398; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002136_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002136_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002136_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002136_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002136_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002136_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002136_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002136_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002136_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002136_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002136_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "258; 140; 371; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002141_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "420; 314; 347; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002141_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "273; 210; 359; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002141_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002141_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002141_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "349; 291; 381; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002141_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002141_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002141_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002141_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002141_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002141_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002141_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002141_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002141_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002141_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002141_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





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


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "277; 365; 352; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002152_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "465; 258; 375; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002152_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "354; 350; 386; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002152_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "364; 129; 407; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002152_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002152_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002152_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "282; 229; 376; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002152_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002152_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002152_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002152_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002152_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002152_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002152_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002152_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002152_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002152_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002152_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "534; 344; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002156_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "282; 393; 370; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002156_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 429; 356; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002156_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002156_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002156_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "410; 394; 397; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002156_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002156_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002156_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002156_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002156_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002156_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002156_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002156_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002156_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002156_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002156_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002163_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002163_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "305; 294; 348; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002163_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002163_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002163_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002163_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002163_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002163_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002163_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002163_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002163_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002163_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002163_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002163_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "356; 398; 365; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002163_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002163_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002163_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002163_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002163_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002163_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002163_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002163_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002163_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002163_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002163_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002163_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "400; 312; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002163_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002163_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002163_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002163_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002163_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002163_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002163_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002163_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002163_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002163_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002163_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002163_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "252; 184; 409; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002163_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002163_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002163_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002163_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002163_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002163_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002163_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002163_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002163_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002163_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002163_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002163_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "532; 353; 385; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002163_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002163_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002163_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002163_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002163_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002163_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002163_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002163_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002163_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002163_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002163_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002163_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "439; 352; 397; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002163_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002163_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002163_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002163_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002163_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002163_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002163_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002163_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002163_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002163_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002163_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002167_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002167_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "427; 204; 348; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002167_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002167_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002167_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002167_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002167_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002167_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002167_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002167_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002167_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002167_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002167_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002167_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "251; 173; 363; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002167_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002167_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002167_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002167_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002167_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002167_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002167_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002167_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002167_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002167_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002167_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002167_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "429; 324; 364; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002167_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002167_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002167_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002167_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002167_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002167_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002167_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002167_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002167_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002167_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002167_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002167_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "262; 163; 392; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002167_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002167_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002167_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002167_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002167_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002167_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002167_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002167_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002167_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002167_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002167_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002167_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "294; 166; 391; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002167_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002167_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002167_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002167_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002167_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002167_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002167_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002167_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002167_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002167_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002167_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002167_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "283; 177; 409; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002167_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002167_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002167_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002167_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002167_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002167_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002167_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002167_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002167_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002167_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002167_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "347; 360; 353; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002173_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "494; 191; 353; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002173_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/3_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "383; 335; 354; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/3_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/3_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/3_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/3_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/3_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/3_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "3_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/3_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/3_C0002173_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/3_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/3_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/4_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "313; 335; 389; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/4_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/4_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/4_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/4_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/4_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/4_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "4_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/4_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/4_C0002173_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/4_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/4_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/5_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "490; 330; 387; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/5_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/5_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/5_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/5_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/5_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/5_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "5_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/5_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/5_C0002173_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/5_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/5_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002173_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/6_C0002173_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "318; 137; 406; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/6_C0002173_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/6_C0002173_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/6_C0002173_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/6_C0002173_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/6_C0002173_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/6_C0002173_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "6_C0002173_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/6_C0002173_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/6_C0002173_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/6_C0002173_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/6_C0002173_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002177_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/1_C0002177_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "312; 321; 347; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/1_C0002177_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/1_C0002177_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002177_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/1_C0002177_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/1_C0002177_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/1_C0002177_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/1_C0002177_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "1_C0002177_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/1_C0002177_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/1_C0002177_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/1_C0002177_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/1_C0002177_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





# Print the current script operation (B_Edit) and perform ROI extraction
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "B_Edit"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/01_MHDFile/C0002177_SEG_UNCOMP.mhd"  -out "B_Edit/02_RawROI/2_C0002177_SEG_UNCOMP_ROI.mhd"  -form "B"  -cut "309; 113; 345; 87; 87; 87"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/02_RawROI/2_C0002177_SEG_UNCOMP_ROI.mhd"  -out "B_Edit/03_CleanROI/2_C0002177_SEG_UNCOMP_Cleaned.mhd"  -form "B"  -arith "?<1=0;?>1=1"  -clean "FAST"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002177_SEG_UNCOMP_Cleaned.mhd"  -out "B_Edit/04_ResizedROI/2_C0002177_SEG_UNCOMP_Resized.mhd"  -form "B"  -arith "*100"  -res4 "0.0607;0.0607;0.0607"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mia.pyc" -in "B_Edit/04_ResizedROI/2_C0002177_SEG_UNCOMP_Resized.mhd"  -out "D_PostProcess/03_Fabric/2_C0002177_SEG_UNCOMP.fab"  -dtype "MIL"  -ftype "1"  -thres "50"


# Print the current script operation (C_FEA), and perform the Abaqus simulations
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "C_FEA"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/mic.pyc" -in "B_Edit/03_CleanROI/2_C0002177_SEG_UNCOMP_Cleaned.mhd"  -out "C_FEA/01_Mesh/Mesh.inp"  -temp "Z_MedTool/MeshTemplate.inp"
"/opt/Medtool/medtool43/bin/cbc" -in "C_FEA/01_Mesh/Mesh.inp"  -out "C_FEA/02_BoundaryConditions/BCs.inp"  -bcid "CK3"  -code "abaqus"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/abqRun.pyc" -inp "MainFEA.inp"  -exe "/bin/abq6141"  -job "2_C0002177_SEG_UNCOMP"  -dir "C_FEA/03_JobResults/"  -par "interactive;cpus=4"


# Print the current script operation (D_PostProcess) and extract the necessary data for analysis
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/info.py" -txt "D_PostProcess"
abq6141 python "/opt/Medtool/medtool43/bin/abqFuReader.py" -odb "C_FEA/03_JobResults/2_C0002177_SEG_UNCOMP.odb"  -rpt "D_PostProcess/01_FURead/2_C0002177_SEG_UNCOMP.dat"  -exe "abq6141;python"
"/opt/Medtool/medtool43/Python27/bin/python" "/opt/Medtool/medtool43/bin/FuAnalyzer.pyc" -rpt "D_PostProcess/01_FURead/2_C0002177_SEG_UNCOMP.dat"  -out "D_PostProcess/02_FUAnalyzed/2_C0002177_SEG_UNCOMP.dat"  -type "spatial"


rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sta
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.dat





