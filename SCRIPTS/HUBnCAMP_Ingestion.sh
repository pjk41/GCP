#!/bin/bash

#------------------------------------------------------------------------------------
#title           : HUBnCAMP_Ingestion.sh
#description     : Data Movement from Local to Gogle Storage
#author		 : Prashant
#date            : 10/08/2017
#version         : 0.1    
#------------------------------------------------------------------------------------


# HUB source data Ingestion using gsutil Google Cloud Platform 
gsutil cp /home/koraviprashant811/GCP/DATA/*HUB* gs://elegant-abode-4476/FCCR/HUB/

# CAMP source data Ingestion using gsutil Google Cloud Platform
gsutil cp /home/koraviprashant811/GCP/DATA/*CAMP* gs://elegant-abode-4476/FCCR/CAMP/