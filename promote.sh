#!/bin/bash

set -x
set -e

echo "promoting changes in jx3-gitops-template to downstream templates"

#declare -a repos=("jx3-gke-gcloud-vault" "jx3-gke-terraform-vault" "jx3-gke-gcloud-gsm")
declare -a repos=("jx3-gke-gcloud-vault")

export TMPDIR=/tmp/jx3-gitops-promote
rm -rf $TMPDIR
mkdir -p $TMPDIR



export r="jx3-gke-gcloud-vault"
cd $TMPDIR
git clone https://github.com/jx3-gitops-repositories/$r.git
cd $r

rm -rf bin src .jx/git-operator .jx/gitops
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/gitops/vault/gitops@master .jx/gitops
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/git-operator@master .jx/git-operator
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/src@master src
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/infra/gcloud/bin@master bin
git add .jx src *
git commit -a -m "chore: latest from template"
git push


cd $TMPDIR
export r="jx3-gke-terraform-vault"

cd $TMPDIR
git clone https://github.com/jx3-gitops-repositories/$r.git
cd $r

rm -rf src .jx/git-operator .jx/gitops
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/gitops/vault/gitops@master .jx/gitops
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/git-operator@master .jx/git-operator
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/src@master src
git add .jx src *
git commit -a -m "chore: latest from template"
git push


cd $TMPDIR
export r="jx3-kind-vault"

cd $TMPDIR
git clone https://github.com/jx3-gitops-repositories/$r.git
cd $r

rm -rf src .jx/git-operator .jx/gitops
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/git-operator@master .jx/git-operator
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/.jx/gitops/vault/gitops@master .jx/gitops
kpt pkg get https://github.com/jenkins-x/jx3-gitops-template.git/src@master src
git add .jx src *
git commit -a -m "chore: latest from template"
git push


#for r in "${repos[@]}"
#do
#  echo "upgrading repository https://github.com/jx3-gitops-repositories/$r"
#
#done

