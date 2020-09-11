#!/bin/bash

set -x
set -e


rm -rf jx3-gitops-repositories
mkdir jx3-gitops-repositories
cd jx3-gitops-repositories

echo "cloning all of the git repositories in: jx3-gitops-template to: jx3-gitops-repositories"

curl -s -u $GIT_USERNAME:$GIT_TOKEN https://api.github.com/orgs/jx3-gitops-repositories/repos?per_page=200 | jq '.[].clone_url' | xargs -n 1 git clone

