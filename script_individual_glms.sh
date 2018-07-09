#!/bin/sh

# Perform FEAT GLM

# EXECUTIVE CAUDATE

for j in $@ ; do

cd ./${j} ;

  if [ -e ./glm_mo_executive_caudate.fsf ] ; then
    feat glm_mo_executive_caudate.fsf ;
  else
    feat glm_no_executive_caudate.fsf ;
  fi

# EXECUTIVE PUTAMEN

  if [ -e ./glm_mo_executive_putamen.fsf ] ; then
    feat glm_mo_executive_putamen.fsf ;
  else
    feat glm_no_executive_putamen.fsf ;
  fi

# PREFRONTAL THALAMUS

  if [ -e ./glm_mo_prefrontal_thalamus.fsf ] ; then
    feat glm_mo_prefrontal_thalamus.fsf ;
  else
    feat glm_no_prefrontal_thalamus.fsf ;
  fi

# TEMPORAL THALAMUS

  if [ -e ./glm_mo_temporal_thalamus.fsf ] ; then
    feat glm_mo_temporal_thalamus.fsf ;
  else
    feat glm_no_temporal_thalamus.fsf ;
  fi

# PARIETAL THALAMUS

  if [ -e ./glm_mo_parietal_thalamus.fsf ] ; then
    feat glm_mo_parietal_thalamus.fsf ;
  else
    feat glm_no_parietal_thalamus.fsf ;
  fi

  cd ../

  shift

done
