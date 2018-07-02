#/bin/sh

# conpd = Controls vs PD
# pdmci = PD vs PD MCI
# demmci = MCI vs PDD

# The first step here is to concatenise the bvars files for each pairwise
# comparison. We have 18 analyses: Three structures (caudate, putamen and thalamus)
# three pairwise comparisons (Controls vs PD; PD vs MCI; MCI vs PDD) and analyses
# of both the right and left hemispheres
# bvars files are saved in folders tmp_<left/right>_<structure>_<comparison>_bvars

# Controls vs PD

concat_bvars ./tmp_concat_bvars/L_Caud_conpd.bvars ./tmp_L_Caud_conpd_bvars/*L_Caud*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Caud_conpd.bvars ./tmp_R_Caud_conpd_bvars/*R_Caud*.bvars ;

concat_bvars ./tmp_concat_bvars/L_Puta_conpd.bvars ./tmp_L_Puta_conpd_bvars/*L_Puta*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Puta_conpd.bvars ./tmp_R_Puta_conpd_bvars/*R_Puta*.bvars ;

concat_bvars ./tmp_concat_bvars/L_Thal_conpd.bvars ./tmp_L_Thal_conpd_bvars/*L_Thal*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Thal_conpd.bvars ./tmp_R_Thal_conpd_bvars/*R_Thal*.bvars ;

# PD vs MCI

concat_bvars ./tmp_concat_bvars/L_Caud_mcipd.bvars ./tmp_L_Caud_mcipd_bvars/*L_Caud*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Caud_mcipd.bvars ./tmp_R_Caud_mcipd_bvars/*R_Caud*.bvars ;

concat_bvars ./tmp_concat_bvars/L_Puta_mcipd.bvars ./tmp_L_Puta_mcipd_bvars/*L_Puta*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Puta_mcipd.bvars ./tmp_R_Puta_mcipd_bvars/*R_Puta*.bvars ;

concat_bvars ./tmp_concat_bvars/L_Thal_mcipd.bvars ./tmp_L_Thal_mcipd_bvars/*L_Thal*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Thal_mcipd.bvars ./tmp_R_Thal_mcipd_bvars/*R_Thal*.bvars ;

# MCI vs PDD

concat_bvars ./tmp_concat_bvars/L_Caud_demmci.bvars ./tmp_L_Caud_demmci_bvars/*L_Caud*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Caud_demmci.bvars ./tmp_R_Caud_demmci_bvars/*R_Caud*.bvars ;

concat_bvars ./tmp_concat_bvars/L_Puta_demmci.bvars ./tmp_L_Puta_demmci_bvars/*L_Puta*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Puta_demmci.bvars ./tmp_R_Puta_demmci_bvars/*R_Puta*.bvars ;

concat_bvars ./tmp_concat_bvars/L_Thal_demmci.bvars ./tmp_L_Thal_demmci_bvars/*L_Thal*.bvars ;

concat_bvars ./tmp_concat_bvars/R_Thal_demmci.bvars ./tmp_R_Thal_demmci_bvars/*R_Thal*.bvars ;

# We now run first_utils using the combined bvars input with our design matrices
# and contrast files. We also want to do this in standard space (--useReconMNI)

# Controls vs PD

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Caud_conpd.bvars \
-o ./tmp_concat_bvars/diff_L_Caud_conpd_mni \
-d ./vertex_design_files/conpd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Caud_conpd.bvars \
-o ./tmp_concat_bvars/diff_R_Caud_conpd_mni \
-d ./vertex_design_files/conpd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Puta_conpd.bvars \
-o ./tmp_concat_bvars/diff_L_Puta_conpd_mni \
-d ./vertex_design_files/conpd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Puta_conpd.bvars \
-o ./tmp_concat_bvars/diff_R_Puta_conpd_mni \
-d ./vertex_design_files/conpd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Thal_conpd.bvars \
-o ./tmp_concat_bvars/diff_L_Thal_conpd_mni \
-d ./vertex_design_files/conpd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Thal_conpd.bvars \
-o ./tmp_concat_bvars/diff_R_Thal_conpd_mni \
-d ./vertex_design_files/conpd.mat --useReconMNI ;

# PD vs MCI

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Caud_mcipd.bvars \
-o ./tmp_concat_bvars/diff_L_Caud_mcipd_mni \
-d ./vertex_design_files/mcipd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Caud_mcipd.bvars \
-o ./tmp_concat_bvars/diff_R_Caud_mcipd_mni \
-d ./vertex_design_files/mcipd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Puta_mcipd.bvars \
-o ./tmp_concat_bvars/diff_L_Puta_mcipd_mni \
-d ./vertex_design_files/mcipd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Puta_mcipd.bvars \
-o ./tmp_concat_bvars/diff_R_Puta_mcipd_mni \
-d ./vertex_design_files/mcipd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Thal_mcipd.bvars \
-o ./tmp_concat_bvars/diff_L_Thal_mcipd_mni \
-d ./vertex_design_files/mcipd.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Thal_mcipd.bvars \
-o ./tmp_concat_bvars/diff_R_Thal_mcipd_mni \
-d ./vertex_design_files/mcipd.mat --useReconMNI ;

# MCI vs PDD

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Caud_demmci.bvars \
-o ./tmp_concat_bvars/diff_L_Caud_demmci_mni \
-d ./vertex_design_files/demmci.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Caud_demmci.bvars \
-o ./tmp_concat_bvars/diff_R_Caud_demmci_mni \
-d ./vertex_design_files/demmci.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Puta_demmci.bvars \
-o ./tmp_concat_bvars/diff_L_Puta_demmci_mni \
-d ./vertex_design_files/demmci.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Puta_demmci.bvars \
-o ./tmp_concat_bvars/diff_R_Puta_demmci_mni \
-d ./vertex_design_files/demmci.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/L_Thal_demmci.bvars \
-o ./tmp_concat_bvars/diff_L_Thal_demmci_mni \
-d ./vertex_design_files/demmci.mat --useReconMNI ;

first_utils \
--usebvars --vertexAnalysis -i ./tmp_concat_bvars/R_Thal_demmci.bvars \
-o ./tmp_concat_bvars/diff_R_Thal_demmci_mni \
-d ./vertex_design_files/demmci.mat --useReconMNI ;

# We can now carry out cross-subject statistics using FSL's randomise
# with a cluster-based approach (-F)

# Controls vs PD

randomise \
-i ./tmp_concat_bvars/diff_L_Caud_conpd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Caud_conpd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Caud_diff_conpd_rand \
-d ./vertex_design_files/conpd.mat \
-t ./vertex_design_files/conpd.con \
-f vertex_design_files/conpd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Caud_conpd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Caud_conpd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Caud_diff_conpd_rand \
-d ./vertex_design_files/conpd.mat \
-t ./vertex_design_files/conpd.con \
-f vertex_design_files/conpd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_L_Puta_conpd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Puta_conpd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Puta_diff_conpd_rand \
-d ./vertex_design_files/conpd.mat \
-t ./vertex_design_files/conpd.con \
-f vertex_design_files/conpd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Puta_conpd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Puta_conpd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Puta_diff_conpd_rand \
-d ./vertex_design_files/conpd.mat \
-t ./vertex_design_files/conpd.con \
-f vertex_design_files/conpd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_L_Thal_conpd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Thal_conpd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Thal_diff_conpd_rand \
-d ./vertex_design_files/conpd.mat \
-t ./vertex_design_files/conpd.con \
-f vertex_design_files/conpd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Thal_conpd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Thal_conpd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Thal_diff_conpd_rand \
-d ./vertex_design_files/conpd.mat \
-t ./vertex_design_files/conpd.con \
-f vertex_design_files/conpd.fts --fonly -D -F 3 ;

# PD vs MCI

randomise \
-i ./tmp_concat_bvars/diff_L_Caud_mcipd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Caud_mcipd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Caud_diff_mcipd_rand \
-d ./vertex_design_files/mcipd.mat \
-t ./vertex_design_files/mcipd.con \
-f vertex_design_files/mcipd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Caud_mcipd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Caud_mcipd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Caud_diff_mcipd_rand \
-d ./vertex_design_files/mcipd.mat \
-t ./vertex_design_files/mcipd.con \
-f vertex_design_files/mcipd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_L_Puta_mcipd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Puta_mcipd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Puta_diff_mcipd_rand \
-d ./vertex_design_files/mcipd.mat \
-t ./vertex_design_files/mcipd.con \
-f vertex_design_files/mcipd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Puta_mcipd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Puta_mcipd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Puta_diff_mcipd_rand \
-d ./vertex_design_files/mcipd.mat \
-t ./vertex_design_files/mcipd.con \
-f vertex_design_files/mcipd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_L_Thal_mcipd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Thal_mcipd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Thal_diff_mcipd_rand \
-d ./vertex_design_files/mcipd.mat \
-t ./vertex_design_files/mcipd.con \
-f vertex_design_files/mcipd.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Thal_mcipd_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Thal_mcipd_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Thal_diff_mcipd_rand \
-d ./vertex_design_files/mcipd.mat \
-t ./vertex_design_files/mcipd.con \
-f vertex_design_files/mcipd.fts --fonly -D -F 3 ;

# MCI vs PDD

randomise \
-i ./tmp_concat_bvars/diff_L_Caud_demmci_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Caud_demmci_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Caud_diff_demmci_rand \
-d ./vertex_design_files/demmci.mat \
-t ./vertex_design_files/demmci.con \
-f vertex_design_files/demmci.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Caud_demmci_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Caud_demmci_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Caud_diff_demmci_rand \
-d ./vertex_design_files/demmci.mat \
-t ./vertex_design_files/demmci.con \
-f vertex_design_files/demmci.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_L_Puta_demmci_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Puta_demmci_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Puta_diff_demmci_rand \
-d ./vertex_design_files/demmci.mat \
-t ./vertex_design_files/demmci.con \
-f vertex_design_files/demmci.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Puta_demmci_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Puta_demmci_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Puta_diff_demmci_rand \
-d ./vertex_design_files/demmci.mat \
-t ./vertex_design_files/demmci.con \
-f vertex_design_files/demmci.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_L_Thal_demmci_mni.nii.gz \
-m ./tmp_concat_bvars/diff_L_Thal_demmci_mni_mask.nii.gz \
-o ./tmp_concat_bvars/L_Thal_diff_demmci_rand \
-d ./vertex_design_files/demmci.mat \
-t ./vertex_design_files/demmci.con \
-f vertex_design_files/demmci.fts --fonly -D -F 3 ;

randomise \
-i ./tmp_concat_bvars/diff_R_Thal_demmci_mni.nii.gz \
-m ./tmp_concat_bvars/diff_R_Thal_demmci_mni_mask.nii.gz \
-o ./tmp_concat_bvars/R_Thal_diff_demmci_rand \
-d ./vertex_design_files/demmci.mat \
-t ./vertex_design_files/demmci.con \
-f vertex_design_files/demmci.fts --fonly -D -F 3 ;
