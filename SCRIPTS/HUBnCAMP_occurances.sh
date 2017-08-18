#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_occurances.sh
#description     : Execute intermediate Transformation and occurance calculator BQL's .
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------

##---------Log File Creation --------------------------------------------------------

CURR_DATE=`date "+%Y%m%d_%H%M"`
LOG_FILE=/home/koraviprashant811/GCP/LOGS/GCP_OCCURANCES_$CURR_DATE
exec >> $LOG_FILE
exec 2>&1

##--------- PARAM file execution ----------------------------------------------------
. /home/koraviprashant811/GCP/PARAM/COMMON_PARAM

#####################################################################################

# Execution of HUB and CAMP staging transformations  
cat ${HOME_DIR}/GCP/BQLS/hub_stg.bql | bq query --destination_table=${DATASET_NAME}.fccr_uae_hub_stg
if [ $? -eq 0 ]
then
  	echo "Successfully Completed the staging transformation for HUB."
else
  	echo "failed with code $?, exiting the script ..!"
  	exit 1
fi

cat ${HOME_DIR}/GCP/BQLS/camp_stg.bql | bq query --destination_table=${DATASET_NAME}.fccr_uae_camp_stg
if [ $? -eq 0 ]
then
  	echo "Successfully Completed the staging transformation for CAMP."
else
  	echo "failed with code $?, exiting the script ..!"
  	exit 1
fi

# Execution of HUB and CAMP occurances transformations
cat ${HOME_DIR}/GCP/BQLS/occurances_hub.bql | bq query --destination_table=${DATASET_NAME}.fccr_uae_hub_occurances
if [ $? -eq 0 ]
then
  	echo "HUB occurance calculation Successful."
else
  	echo "failed with code $?, exiting the script ..!"
  	exit 1
fi

cat ${HOME_DIR}/GCP/BQLS/occurances_camp.bql | bq query --destination_table=${DATASET_NAME}.fccr_uae_camp_occurances
if [ $? -eq 0 ]
then
  	echo "CAMP occurance calculation Successful."
else
  	echo "failed with code $?, exiting the script ..!"
  	exit 1
fi
