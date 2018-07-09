#!/bin/bash

for j in $@ ; do

  cd ./${j} ;

# GLM setup for the executive caudate

if [ -e ./motion_outliers.txt ] ; then
  cp ../glm_files/glm_mo.fsf ./glm_mo_executive_caudate.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_mo_executive_caudate.fsf ;
  rm ./glm_mo_executive_caudate.fsf-e ;
else
  cp ../glm_files/glm_no.fsf ./glm_no_executive_caudate.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_no_executive_caudate.fsf ;
  rm ./glm_no_executive_caudate.fsf-e ;
fi

# GLM setup for the executive putamen

if [ -e ./motion_outliers.txt ] ; then
  cp ../glm_files/glm_mo.fsf ./glm_mo_executive_putamen.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_mo_executive_putamen.fsf ;
  sed -i -e "s/executive_caudate/executive_putamen/g" ./glm_mo_executive_putamen.fsf ;
  rm ./glm_mo_executive_putamen.fsf-e ;
else
  cp ../glm_files/glm_no.fsf ./glm_no_executive_putamen.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_no_executive_putamen.fsf ;
  sed -i -e "s/executive_caudate/executive_putamen/g" ./glm_no_executive_putamen.fsf
  rm ./glm_no_executive_putamen.fsf-e ;
fi

# GLM setup for the prefrontal thalamus

if [ -e ./motion_outliers.txt ] ; then
  cp ../glm_files/glm_mo.fsf ./glm_mo_prefrontal_thalamus.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_mo_prefrontal_thalamus.fsf ;
  sed -i -e "s/executive_caudate/prefrontal_thalamus/g" ./glm_mo_prefrontal_thalamus.fsf ;
  rm ./glm_mo_prefrontal_thalamus.fsf-e ;
else
  cp ../glm_files/glm_no.fsf ./glm_no_prefrontal_thalamus.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_no_prefrontal_thalamus.fsf ;
  sed -i -e "s/executive_caudate/prefrontal_thalamus/g" ./glm_no_prefrontal_thalamus.fsf
  rm ./glm_no_prefrontal_thalamus.fsf-e ;
fi

# GLM setup for the temporal thalamus

if [ -e ./motion_outliers.txt ] ; then
  cp ../glm_files/glm_mo.fsf ./glm_mo_temporal_thalamus.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_mo_temporal_thalamus.fsf ;
  sed -i -e "s/executive_caudate/temporal_thalamus/g" ./glm_mo_temporal_thalamus.fsf ;
  rm ./glm_mo_temporal_thalamus.fsf-e ;
else
  cp ../glm_files/glm_no.fsf ./glm_no_temporal_thalamus.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_no_temporal_thalamus.fsf ;
  sed -i -e "s/executive_caudate/temporal_thalamus/g" ./glm_no_temporal_thalamus.fsf
  rm ./glm_no_temporal_thalamus.fsf-e ;
fi

# GLM setup for the parietal_thalamus

if [ -e ./motion_outliers.txt ] ; then
  cp ../glm_files/glm_mo.fsf ./glm_mo_parietal_thalamus.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_mo_parietal_thalamus.fsf ;
  sed -i -e "s/executive_caudate/parietal_thalamus/g" ./glm_mo_parietal_thalamus.fsf ;
  rm ./glm_mo_parietal_thalamus.fsf-e ;
else
  cp ../glm_files/glm_no.fsf ./glm_no_parietal_thalamus.fsf ;
  sed -i -e "s/P001/${j}/g" ./glm_no_parietal_thalamus.fsf ;
  sed -i -e "s/executive_caudate/parietal_thalamus/g" ./glm_no_parietal_thalamus.fsf
  rm ./glm_no_parietal_thalamus.fsf-e ;
fi

  cd ../ ;

  shift

done

exit
