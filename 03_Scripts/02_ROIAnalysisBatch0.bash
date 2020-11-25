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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





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


rm C_FEA/03_JobResults/*.par
rm C_FEA/03_JobResults/*.sim
rm C_FEA/03_JobResults/*.com
rm C_FEA/03_JobResults/*.dat
rm C_FEA/03_JobResults/*.odb
rm C_FEA/03_JobResults/*.pes
rm C_FEA/03_JobResults/*.pmg
rm C_FEA/03_JobResults/*.msg
rm C_FEA/03_JobResults/*.prt
rm C_FEA/03_JobResults/*.sta





