#!/bin/bash

set -x
set -e

echo "promoting changes in jx3-gitops-template to downstream templates"

#declare -a repos=("jx3-gke-gcloud-vault" "jx3-gke-terraform-vault" "jx3-gke-gcloud-gsm")
declare -a repos=("jx3-gke-gcloud-vault")

export TMPDIR=/tmp/jx3-gitops-promote
mkdir -p $TMPDIR



export r="jx3-gke-gcloud-vault"
cd $TMPDIR
git clone https://github.com/jx3-gitops-repositories/$r.git
cd $r
rm -rf src

rm -rf bin src .jx/git-operator
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/infra/gcloud/bin@master bin
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/src@master src
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/git-operator@master .jx/git-operator
git add *
git commit -a -m "chore: latest from template"


cd $TMPDIR
export r="jx3-gke-terraform-vault"

cd $TMPDIR
git clone https://github.com/jx3-gitops-repositories/$r.git
cd $r
rm -rf src

rm -rf src .jx/git-operator
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/src@master src
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/git-operator@master .jx/git-operator
git add *
git commit -a -m "chore: latest from template"


#for r in "${repos[@]}"
#do
#  echo "upgrading repository https://github.com/jx3-gitops-repositories/$r"
#
#done

