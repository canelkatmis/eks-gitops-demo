# eks-demo
Create your EKS environment and deploy apps to it while using only GitHub.

GitOps as infra > create and update your whole EKS environment
GitOps as app mgmt > build and deploy applications to EKS

GitHub SCM > GitHub Actions > Terraform Cloud > AWS EKS > Apply application

Actions:


When any PR that has changes **infra/** folder created, it will (terraform) plan changes and output it to PR comments.
When a PR including **infra** change is merged, it will deploy latest changes to EKS infra.
When a PR changes **app** folder, it will build the app, push to Docker HUB and deploy to EKS.

|**Trigger**|**Path**|**Condition**|**Action**|
|-|-|-|-|
|Create PR|infra/|PR title is not 'terraform destroy'|terraform plan & output as PR comment|
|Merge PR|infra/|PR title is not 'terraform destroy'|terraform apply|
|Create PR|infra/|PR title is 'terraform destroy'|terraform plan -destroy & output as PR comment|
|Merge PR|infra/|PR title is 'terraform destroy'|terraform destroy|
|Push|app/| |build & push & deploy to EKS|

## Requirements
- GitHub account
- AWS account including enough permission and capability.
- Terraform Cloud account

## Installation

- Fork this repository

- Create a workspace on Terraform Cloud, change it to *manual execution mode* and modify infra/providers.tf according to your organization and workspace name

- Add below secrets to Github Secrets (settings>Secrets)
    - AWS_ACCESS_KEY_ID      #AWS Account access key
    - AWS_SECRET_ACCESS_KEY  #AWS Accoung secret key
    - DOCKER_USER            #Docker HUB account username
    - DOCKER_PASS            #Docker HUB account password
    - TF_ACTION_TFE_TOKEN    #Terraform Cloud Token

- Create a dummy PR inside **infra** folder, confirm terraform plan outputs inside PR comments and merge it. Creating whole EKS infrastructure may take 10-15 minutes.

## App deployment
- Push any changes to files including in **app** folder



