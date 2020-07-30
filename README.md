## Jenkins X 3 GitOps Template project 

This project contains reusable source code for creating different GitOps git repositories for different:

* cloud providers (e.g. AWS, Azure, GKE etc)
* tools for creating/upgrading cloud infrastructure (e.g. Terraform or the cloud providers CLI tools)
* secret management solutions (the cloud providers native solution or vault)

## Infrastructure folders

The [infra](infra) directory contains reusable folders for different infrastructure permutations for the different kinds of GitOps repository templates

* [gcloud](infra/gcloud) uses the `gcloud` CLI on GKE to create a cluster and the associated resources
* [terraform](infra/terraform) uses [Terraform]() to create/update the cluster and associated resources

## Source folder

The [src](src) folder contains the source and makefile resources