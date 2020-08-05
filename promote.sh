#!/bin/bash

set -x
set -e

echo "promoting changes in jx3-gitops-template to downstream templates"

declare -a repos=("jx3-gke-gcloud-vault" "jx3-gke-terraform-vault" "jx3-gke-gcloud-gsm")

for r in "${repos[@]}"
do
  echo "upgrading repository https://github.com/jx3-gitops-repositories/$r"

  git clone https://github.com/jx3-gitops-repositories/$r.git
  cd "$r"
  jx gitops kpt upgrade || true
  git push || true
done

