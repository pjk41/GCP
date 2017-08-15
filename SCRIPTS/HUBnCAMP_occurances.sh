#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_occurances.sh
#description     : Execute intermediate Transformation and occurance calculator BQL's .
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------



# Execution of HUB and CAMP staging transformations  
cat /home/koraviprashant811/GCP/BQLS/hub_stg.bql | bq query --destination_table=fccr.fccr_uae_hub_stg
cat /home/koraviprashant811/GCP/BQLS/camp_stg.bql | bq query --destination_table=fccr.fccr_uae_camp_stg

# Execution of HUB and CAMP occurances transformations
cat /home/koraviprashant811/GCP/BQLS/occurances_hub.bql | bq query --destination_table=fccr.fccr_uae_hub_occurances
cat /home/koraviprashant811/GCP/BQLS/occurances_camp.bql | bq query --destination_table=fccr.fccr_uae_camp_occurances
