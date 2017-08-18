#!/bin/bash


#------------------------------------------------------------------------------------
#title           : HUBnCAMP_Ingestion.sh
#description     : Data Movement from Local to Gogle Storage
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------

##--------- PARAM file execution ----------------------------------------------------
. /home/koraviprashant811/GCP/PARAM/COMMON_PARAM

#####################################################################################

# HUB source data Ingestion using gsutil Google Cloud Platform 
gsutil cp ${HOME_DIR}/GCP/DATA/*HUB* gs://${STORAGE_BUCKET_NAME}/FCCR/HUB/
if [ $? -eq 0 ]
then
  	echo "Successfully ingested HUB file to bucket ${STORAGE_BUCKET_NAME}."
else
  	echo "Could not ingest HUB data, exiting the script ..!"
  	exit 1
fi

# CAMP source data Ingestion using gsutil Google Cloud Platform
gsutil cp ${HOME_DIR}/GCP/DATA/*CAMP* gs://${STORAGE_BUCKET_NAME}/FCCR/CAMP/
if [ $? -eq 0 ]
then
  	echo "Successfully ingested CAMP file to bucket ${STORAGE_BUCKET_NAME}."
else
  	echo "Could not ingest CAMP data, exiting the script ..!"
  	exit 1
fi
