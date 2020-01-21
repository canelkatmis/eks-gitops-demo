# eks-demo
create a sample app and eks environment using github actions and terraform cloud with one click way

GitHub SCM > GitHub Actions > Terraform Cloud > AWS EKS

When a PR changes **infra** folder, it will (terraform) plan changes and output it to PR comments.

When a PR including **infra** change is merged, it will deploy latest changes to EKS infra.

When a PR changes **app** folder, it will build the app, push to Docker HUB and deploy to EKS.

## Requirements
- AWS account including enough permissions and capability.
- Terraform Cloud account

## Installation

- Fork this repository

- Create a workspace on Terraform Cloud, change it to manual execution mode and modify infra/variables.tf according to your organization and workspace name

- Add below secrets to Github Secrets (settings>Secrets)
 AWS_ACCESS_KEY_ID      #AWS Account access key
 AWS_SECRET_ACCESS_KEY  #AWS Accoung secret key
 DOCKER_USER            #Docker HUB account username
 DOCKER_PASS            #Docker HUB account password
 TF_ACTION_TFE_TOKEN    #Terraform Cloud Token

- Create a dummy PR inside **infra** folder, confirm terraform plan outputs inside PR comments and merge it. Creating whole EKS infrastructure may take 10-15 minutes.

- Go to TF Cloud, copy kubeconfig from output and insert to GitHub Secrets with the config name: KUBECONFIG

## App deployment
- Push any changes to files including in **app** folder



