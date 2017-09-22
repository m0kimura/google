#!/bin/bash
null=
##
  if [[ $GCP = "$null" ]]; then
    GCPLIB=gcplib
  fi
  if [[ -e $GCPLIB ]]; then
    cd gcplib
  else
    mkdir $GCPLIB
    cd $GCPLIB
    cp /usr/src/terraform terraform
  fi
  /bin/bash
##
