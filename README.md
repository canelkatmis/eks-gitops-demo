# eks-gitops-demo

Create an EKS environment from scratch and build/deploy apps to it while using only GitHub.

GitHub SCM > GitHub Actions > Terraform Cloud > AWS EKS > Deploy apps

*GitOps for infra > create and update your whole EKS environment*

*GitOps for app > build and deploy applications to EKS*

- No 3rd party tools
- No webhook


|**Trigger**|**Path**|**Condition**|**Action**|
|-|-|-|-|
|Create PR|infra/|PR title is not 'terraform destroy'|terraform plan|
|Merge PR|infra/|PR title is not 'terraform destroy'|terraform apply|
|Create PR|infra/|PR title is 'terraform destroy'|terraform plan -destroy|
|Merge PR|infra/|PR title is 'terraform destroy'|terraform destroy|
|Push|app/| |build & push to docker hub & deploy to eks|

## Requirements
- GitHub account
- AWS account including enough permission and capability.
- Terraform Cloud account

## Installation

- Fork this repository

- Create a workspace on Terraform Cloud, change it to *manual execution mode* and modify infra/providers.tf according to your organization and workspace name

- Add below secrets to Github Secrets (settings>Secrets)
    - AWS_ACCESS_KEY_ID:  #AWS Account access key
    - AWS_SECRET_ACCESS_KEY: #AWS Accoung secret key
    - DOCKER_USER: #Docker HUB account username
    - DOCKER_PASS: #Docker HUB account password
    - TF_ACTION_TFE_TOKEN: #Terraform Cloud Token

- Create a dummy PR inside **infra** folder, confirm terraform plan outputs inside PR comments and merge it. Creating whole EKS infrastructure may take 10-15 minutes.

## App deployment
- Push any changes to files including in **app** folder

#### How to control EKS from another kubectl client?
- Install kubectl, awscli and aws-iam-authenticator to any supported OS
- Update kubeconfig via `aws eks --region eu-central-1 update-kubeconfig --name <<AWS_EKS_CLUSTER_NAME>>`
