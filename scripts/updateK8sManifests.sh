#!/bin/bash
set -xe

PAT=$4

REPO_URL="https://$PAT@dev.azure.com/Practice-Proj/voting-app/_git/voting-app"

git clone "$REPO_URL" /tmp/temp_repo

cd /tmp/temp_repo

# Update image tag
sed -i "s|image:.*|image: emanshahidazurecicd/$2:$3|g" k8s-specifications/$1-deployment.yaml

git add .
git commit -m "Update kubernetes manifest with new image tag"
git push

rm -rf /tmp/temp_repo
