#  Sample Web Application Deployment with CI/CD, Kubernetes Infrastructure, and Monitoring

## Overview

- ***Web Application Development*** : Created a sample Python Flask web application as the base project.
- ***Dockerization***: Containerized the web application using Docker for platform independence and scalability.
- ***CI/CD with GitLab***: Configured GitLab in Docker image, and implmented CI/CD pipeline using .gitlab-ci.yml to automate build, test, and deployment processes.
- ***Container Registry***: Build and pushed Docker images to a self-hosted GitLab container registry.
- ***Infrastructure Provisioning***: Leveraged Terraform, Terragrunt to provision Kubernetes infrastructure, networking, and DNS in an Azure environment.
- ***GitOps Deployment***: Deployment of the web application via ArgoCD using a custom Helm chart for declarative and automated application delivery.
- ***Monitoring***: Prometheus for monitoring Kubernetes services and ensuring application health and performance visibility

## Folder Structure
- `terraform/`: Contains modules and sub-modules for installing:
  - Azure Resources
    - Kubernetes Cluster (AKS)
    - Virtual Network
    - DNS
    - Application Gateway
    - KeyVault
  - Kubernetes Resources
    - External DNS
    - Hashicorp Vault
    - ArgoCD
    - Prometheus
  - Monitoring
    - Grafana Dashboard json files
- `terragrunt/`: Contains configurations for global providers, subscriptions, regions, and environment variables. 
  - `regions/`: Contains environment input files (`prod`, `develop`, `test`) with configurations specific to each environment. (Optional)

## Components
1. Terraform used to provision infrastructure components.
2. Terragrunt used for managing global configurations, subscriptions, regions, and environment-specific variables.
3. Deploying applications to the K8s cluster.
4. Network infrastructure
5. DNS and External-DNS
6. Prometheus
7. Configuration to create projects within ArgoCD 
8. Helm chart for onboarding applications to the K8s cluster
9. Hashicorp vault
9. Gitlab using Docker image. 

**Proposal**: Deployment of Terraform Modules using Atlantis and Terragrunt

1. Make changes to the Terraform or Terragrunt configurations in feature branches.
2. A new merge request (MR) is created to propose the changes.
3. Atlantis automatically runs terragrunt plan with the help of repository side atlantis.yaml (pre-workflowHooks and post-workflowHooks)
4. Review the plan , MR 
5. Once the MR is approved and Atlantis automatically executes terragrunt apply
6. The changes are merged into the master branch.
 

**Proposal**: Backup and Restore: Implement a cron job in Kubernetes to periodically backup the Vault data and store it in storage account (Azure StorageAccount, Amazon S3 bucket). 