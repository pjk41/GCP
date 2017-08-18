#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_match.sh
#description     : Population of matched and mismatched records in respective tables of HUN and CAMP.
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------

##---------Log File Creation --------------------------------------------------------

CURR_DATE=`date "+%Y%m%d_%H%M"`
LOG_FILE=/home/koraviprashant811/GCP/LOGS/GCP_MATCH_$CURR_DATE
exec >> $LOG_FILE
exec 2>&1

##--------- PARAM file execution ----------------------------------------------------
. /home/koraviprashant811/GCP/PARAM/COMMON_PARAM

#####################################################################################

bq query --destination_table=fccr.hub_camp_match_transactions "
SELECT 
hub.tran_date,
hub.account_number, 
hub.tran_ammount,
hub.hub_occurances,
camp.rth_value_dt, 
camp.rth_lcy_tran_amount, 
camp.rth_account_number,
camp.camp_occurances
FROM 
[graceful-wall-175811:fccr.fccr_uae_hub_occurances] hub
JOIN 
[graceful-wall-175811:fccr.fccr_uae_camp_occurances] camp
ON
hub.tran_date=camp.rth_value_dt AND
hub.account_number=camp.rth_account_number AND
hub.tran_ammount=camp.rth_lcy_tran_amount AND
hub.hub_occurances=camp.camp_occurances"

bq query --destination_table=fccr.hub_camp_unmatch_transactions "
SELECT 
hub.tran_date,
hub.account_number, 
hub.tran_ammount,
hub.hub_occurances,
camp.rth_value_dt, 
camp.rth_lcy_tran_amount, 
camp.rth_account_number,
camp.camp_occurances
FROM 
[graceful-wall-175811:fccr.fccr_uae_hub_occurances] hub
JOIN 
[graceful-wall-175811:fccr.fccr_uae_camp_occurances] camp
ON
hub.tran_date=camp.rth_value_dt AND
hub.account_number=camp.rth_account_number AND
hub.tran_ammount=camp.rth_lcy_tran_amount 
where
hub.hub_occurances<>camp.camp_occurances"
