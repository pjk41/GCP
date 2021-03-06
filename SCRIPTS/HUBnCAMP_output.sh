#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_output.sh
#description     : Execute a BQL which generates final match and mismatch counts.
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------

##---------Log File Creation --------------------------------------------------------

CURR_DATE=`date "+%Y%m%d_%H%M"`
LOG_FILE=/home/koraviprashant811/GCP/LOGS/GCP_REPORT_$CURR_DATE
exec >> $LOG_FILE
exec 2>&1

##--------- PARAM file execution ----------------------------------------------------
. /home/koraviprashant811/GCP/PARAM/COMMON_PARAM

#####################################################################################

cat ${HOME_DIR}/GCP/BQLS/Final_counts.bql | bq query --destination_table=${DATASET_NAME}.fccr_uae_report
if [ $? -eq 0 ]
then
  	echo "Successfully Completed the Final transformation."
else
  	echo "failed with code $?, exiting the script ..!"
  	exit 1
fi
