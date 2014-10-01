#!/bin/bash

source common.hdr

docker build --rm=true -t $CDATA_NAME ./oc-data
docker build --rm=true -t $CNGINX_NAME ./oc-nginx

echo "--------------------------------"
echo "images built:"
docker images | grep "$CDATA_NAME\|$CNGINX_NAME"
