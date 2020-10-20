#!/bin/bash

set -e

if [ -z $PROJECT_ID ]
then
  echo "Please supply the 'PROJECT_ID' environment variable for your GCP Project ID"
  echo "e.g."
  echo "export PROJECT_ID=myproject"
  exit 1
fi

if [ -z $CLUSTER_NAME ]
then
  echo "Please supply the 'CLUSTER_NAME' environment variable for your GKE cluster name"
  echo "e.g."
  echo "export CLUSTER_NAME=mycluster"
  exit 1
fi

DIR2=dirname "$0"
DIR="$(dirname "${BASH_SOURCE[0]}")"

echo "this script modifies the ${DIR}/setenv.sh file..."

sed -i -e "s/PROJECT_ID=\".*\"/PROJECT_ID=\"${PROJECT_ID}\"/" ${DIR}/setenv.sh
sed -i -e "s/CLUSTER_NAME=\".*\"/CLUSTER_NAME=\"${CLUSTER_NAME}\"/" ${DIR}/setenv.sh


