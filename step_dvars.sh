for F in $@ ; do

  cd ./${F} ;

  fsl_motion_outliers \
  -i ./RAW_FUNC.nii.gz \
  -o ./dvars_matrix.txt \
  -s ./dvars_data.txt \
  --dvars \
  --dummy=6 ;

  mv ./dvars_data.txt ./preliminary_data/ ;

  cd ../ ;

  shift

done

exit
