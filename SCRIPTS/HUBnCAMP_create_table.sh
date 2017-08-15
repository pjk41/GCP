#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_create_table.sh
#description     : Dataset and Table creation for HUB and CAMP
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------

# Create Dataset fccr
bq mk fccr

# Create table on top of HUB source data available in Google Storage.  
bq load --autodetect --source_format=CSV graceful-wall-175811:fccr.fccr_uae_hub gs://elegant-abode-4476/FCCR/HUB/Sample_Test_data_HUB.csv

# Create table on top of HUB source data available in Google Storage.
bq load --autodetect --source_format=CSV graceful-wall-175811:fccr.fccr_uae_camp gs://elegant-abode-4476/FCCR/CAMP/Sample_Test_data_CAMP.csv

