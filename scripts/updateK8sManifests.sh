#!/bin/bash
set -x

# Input parameters
DEPLOYMENT=$1
IMAGENAME=$2
TAG=$3
PAT=$4

# Repository URL
REPO_URL="https://${PAT}@dev.azure.com/Practice-Proj/voting-app/_git/voting-app"

# Clone repository
git clone "$REPO_URL" /tmp/temp_repo || { echo "Error: Git clone failed"; exit 1; }

# Navigate to repository
cd /tmp/temp_repo || { echo "Error: Cannot cd to /tmp/temp_repo"; exit 1; }

# Check if deployment file exists
if [ ! -f "k8s-specifications/${DEPLOYMENT}-deployment.yaml" ]; then
  echo "Error: k8s-specifications/${DEPLOYMENT}-deployment.yaml does not exist"
  exit 1
fi

# Update image tag in deployment file
sed -i "s|image:.*|image: emanshahidazurecicd/$IMAGENAME:$TAG|g" k8s-specifications/${DEPLOYMENT}-deployment.yaml

# Check for changes
if git diff --quiet; then
  echo "No changes to commit"
  rm -rf /tmp/temp_repo
  exit 0
fi

# Commit and push changes
git add .
git commit -m "Update image tag to $IMAGENAME:$TAG"
git push origin main || { echo "Error: Git push failed"; exit 1; }

# Clean up
[ -d /tmp/temp_repo ] && rm -rf /tmp/temp_repo