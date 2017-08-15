#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_output.sh
#description     : Execute a BQL which generates final match and mismatch counts.
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------


cat /home/koraviprashant811/GCP/BQLS/Final_counts.bql | bq query --destination_table=fccr.fccr_uae_report