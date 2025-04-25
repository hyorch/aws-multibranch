# AWS Multibranch Proyect

AWS Terraform Jenkins Multibranch


Develop branch is deployed on eu-west-1

Main branch is deployed on eu-south-2


```bash
tf init -backend-config=env/backend-dev.tfvars
tf plan -var-file=env/dev.tfvars
```