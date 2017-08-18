#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_create_table.sh
#description     : Dataset and Table creation for HUB and CAMP
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------

##---------Log File Creation --------------------------------------------------------

CURR_DATE=`date "+%Y%m%d_%H%M"`
LOG_FILE=GCP_TABLE_CREATION_$CURR_DATE
exec >> $LOG_FILE
exec 2>&1

##--------- PARAM file execution ----------------------------------------------------
. /home/koraviprashant811/GCP/PARAM/COMMON_PARAM

#####################################################################################

# Create Dataset fccr
bq mk $DATASET_NAME
if [ $? -eq 0 ]
then
  	echo "Successfully created Dataset."
else
  	echo "Could not create Dataset, exiting the script ..!"
  	exit 1
fi

# Create table on top of HUB source data available in Google Storage.  
bq load --autodetect --source_format=CSV ${PROJECT_ID}:${DATASET_NAME}.fccr_uae_hub gs://${STORAGE_BUCKET_NAME}/FCCR/HUB/${DATA_FILE_HUB}
if [ $? -eq 0 ]
then
  	echo "Successfully created HUB source table."
else
  	echo "Could not create HUB Table , exiting the script."
	exit 1
fi

# Create table on top of HUB source data available in Google Storage.
bq load --autodetect --source_format=CSV ${PROJECT_ID}:${DATASET_NAME}.fccr_uae_camp gs://${STORAGE_BUCKET_NAME}/FCCR/CAMP/${DATA_FILE_CAMP}
if [ $? -eq 0 ]
then
  	echo "Successfully created CAMP source table."
else
  	echo "Could not create CAMP table , exiting the script."
	exit 1
fi
