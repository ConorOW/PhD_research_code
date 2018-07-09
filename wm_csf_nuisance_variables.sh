# We used freesurfer segmentations from the recon-all command to extract wm and ventricles. 
# These were converted to fsl highres space and then aligned to functional space for 
# timeseries extraction. This was performed before I had knowledge of how to extract these masks from FSL.
# ${j} is the folder name for each participant (P001; P002; ...;)
# RAW_FUNC.ica is the name of the folder that has the preprocessing and ICA output from FSL.

# Extract the T1, wm and ventricles mask from participants freesurfer -recon all
# This is to be run from within each subjects working directory

  mri_binarize \
  --i $freesurfer_data/${j}/mri/aseg.mgz \
  --o ./wm_aseg.nii.gz \
  --wm ;

  mri_binarize \
  --i $freesurfer_data/${j}/mri/aseg.mgz \
  --o ./ventricles_aseg.nii.gz \
  --ventricles ;

  mri_convert $freesurfer_data/${j}/mri/T1.mgz ./T1.nii.gz ;

# Create a registration matrix to convert our wm
# and ventricle masks images to the highres space
  flirt \
  -in ./T1.nii.gz \
  -ref ./STRUC.nii.gz \
  -out ./T1_fsl_rego.nii.gz \
  -omat ./T1_fsl_rego.mat ;

  flirt \
  -in ./wm_aseg.nii.gz \
  -ref ./STRUC.nii.gz \
  -init ./T1_fsl_rego.mat \
  -out ./wm_highres.nii.gz \
  -applyxfm ;

  flirt \
  -in ./ventricles_aseg.nii.gz \
  -ref ./STRUC.nii.gz \
  -init ./T1_fsl_rego.mat \
  -out ./ventricles_highres.nii.gz \
  -applyxfm ;

# This step thresholds the images

  fslmaths \
  ./wm_highres.nii.gz \
  -thr 0.9 -bin \
  ./wm_highres_binary.nii.gz ;

  fslmaths \
  ./ventricles_highres.nii.gz \
  -thr 0.9 -bin \
  ./ventricles_highres_binary.nii.gz ;

# Register wm and ventricles masks to example_func space
  flirt \
  -in ./wm_highres_binary.nii.gz \
  -ref ./RAW_FUNC.ica/reg/example_func.nii.gz \
  -out ./wm_lowres \
  -init ./RAW_FUNC.ica/reg/highres2example_func.mat \
  -applyxfm ;

  flirt \
  -in ./ventricles_highres_binary.nii.gz \
  -ref ./RAW_FUNC.ica/reg/example_func.nii.gz \
  -out ./ventricles_lowres \
  -init ./RAW_FUNC.ica/reg/highres2example_func.mat \
  -applyxfm ;

# We also eroded the images to reduce partial volume effects 

  fslmaths \
  ./wm_lowres \
  -ero -bin \
  ./wm_lowres_ero ;

  fslmaths \
  ./ventricles_lowres \
  -ero -bin \
  ./ventricles_lowres_ero ;

# Extract timeseries from within ventricle and wm masks
# PROC_FUNC is the name of the preprocessed fMRI data

  fslmeants \
  -i ./PROC_FUNC.nii.gz \
  -m ./wm_lowres_ero.nii.gz \
  -o ./wm.txt ;

  fslmeants \
  -i ./PROC_FUNC.nii.gz \
  -m ./ventricles_lowres_ero.nii.gz \
  -o ./ventricles.txt ;
