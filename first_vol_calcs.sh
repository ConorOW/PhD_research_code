#!/bin/sh

#echo "subjid,L_caud_vol,R_caud_vol,L_puta_vol,R_puta_vol,L_thal_vol,R_thal_vol" >> ./first_volumes.csv ;

for j in $@ ; do

  subjid=${j} ;
  l_caud=`fslstats pd${j}_all_none_firstseg.nii.gz -l 10.5 -u 11.5 -V | awk '{print $2}'` ;
  r_caud=`fslstats pd${j}_all_none_firstseg.nii.gz -l 49.5 -u 50.5 -V | awk '{print $2}'` ;
  l_puta=`fslstats pd${j}_all_none_firstseg.nii.gz -l 11.5 -u 12.5 -V | awk '{print $2}'` ;
  r_puta=`fslstats pd${j}_all_none_firstseg.nii.gz -l 50.5 -u 51.5 -V | awk '{print $2}'` ;
  l_thal=`fslstats pd${j}_all_none_firstseg.nii.gz -l 9.5 -u 10.5 -V | awk '{print $2}'` ;
  r_thal=`fslstats pd${j}_all_none_firstseg.nii.gz -l 48.5 -u 49.5 -V | awk '{print $2}'` ;

 echo "${subjid},${l_caud},${r_caud},${l_puta},${r_puta},${l_thal},${r_thal}" >> first_volumes.csv ;

 shifts

done
