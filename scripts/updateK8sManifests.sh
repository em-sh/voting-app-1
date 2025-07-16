#!/bin/bash
set -xe

DEPLOYMENT=$1
IMAGENAME=$2
TAG=$3
PAT=$4

REPO_URL="https://$PAT@dev.azure.com/Practice-Proj/voting-app/_git/voting-app"

git clone "$REPO_URL" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|image:.*|image: emanshahidazurecicd/$IMAGENAME:$TAG|g" k8s-specifications/${DEPLOYMENT}-deployment.yaml

git add .
git commit -m "Update image tag to $IMAGENAME:$TAG"
git push

rm -rf /tmp/temp_repo
