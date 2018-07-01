# Extract the T1, wm and ventricles mask from participants freesurfer -recon all
  mri_binarize \
  --i $lund_freesurfer_data/${F}/mri/aseg.mgz \
  --o ./wm_aseg.nii.gz \
  --wm ;

  mri_binarize \
  --i $lund_freesurfer_data/${F}/mri/aseg.mgz \
  --o ./ventricles_aseg.nii.gz \
  --ventricles ;

  mri_convert $lund_freesurfer_data/${F}/mri/T1.mgz ./T1.nii.gz ;

# Create a registration matrix to convert our wm
# and ventricles images to the highres space
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

  fslmaths \
  ./subj_motor_thalamus_lowres \
  -ero -bin \
  ./subj_motor_thalamus_lowres_ero ;

  fslmaths \
  ./subj_prefrontal_thalamus_lowres \
  -ero -bin \
  ./subj_prefrontal_thalamus_lowres_ero ;

  fslmaths \
  ./wm_lowres \
  -ero -bin \
  ./wm_lowres_ero ;

  fslmaths \
  ./ventricles_lowres \
  -ero -bin \
  ./ventricles_lowres_ero ;

# Extract timeseries from within thalamus masks, ventricles and wm

  fslmeants \
  -i ./PROC_FUNC.nii.gz \
  -m ./wm_lowres_ero.nii.gz \
  -o ./wm.txt ;

  fslmeants \
  -i ./PROC_FUNC.nii.gz \
  -m ./ventricles_lowres_ero.nii.gz \
  -o ./ventricles.txt ;
