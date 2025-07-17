#/bin/bash

set -x

# Set the repository URL
REPO_URL="https://{PAT}@dev.azure.com/Practice-Proj/voting-app/_git/voting-app"

# clone the repo
git clone "REPO_URL" /tmp/temp_repo

# navigate to the cloned repo
cd /tmp/temp_repo

# make changes to the image tag in a deployment.yaml file
sed -i "s|image:.*|image: emanshahidazurecicd/$2:$3|g" k8s-specifications/$1-deployment.yaml

# add the changes

git add .

# commit the changes
git commit -m "Update kubernetes manifest"

# push the changes to repo
git push

# clean

rm -rf /tmp/temp_repo

