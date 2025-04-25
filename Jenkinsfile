// Execute Terraform Format

def environment = ""

if (env.BRANCH_NAME == "main") {
    environment = "pro"
}
else if (env.BRANCH_NAME == "develop") {
    environment = "dev"
} else {
    environment = "test"
}  



pipeline{
    agent{
        label "jenkins"
    }
    stages{
        stage("Terraform Version"){
            steps{
                echo "========executing terraform version========"
                sh "terraform version"
            }           
        }
    
        stage("Terraform Init"){
            steps{
                echo "========executing terraform init========"
                sh "terraform init --backend-config=env/backend-${environment}.tfvars"
            }           
        }
        stage("Terraform Format"){
            steps{
                echo "========executing terraform format========"
                sh "terraform fmt -check"
            }           
        }
        stage("Terraform Validate"){
            steps{
                echo "========executing terraform validate========"
                sh "terraform validate"
            }           
        }
        stage("Terraform Plan"){
            steps{
                echo "========executing terraform plan========"
                sh "terraform plan -var-file=env/${environment}.tfvars -var-file=env/no-aws-profile.tfvars -out=tfplan"
            }           
        }   
        stage('Terraform Apply Approval') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                input(message: 'Do you want to apply Terraform changes?', ok: 'Proceed')
                }
            }
        }
        stage("Terraform Apply"){
            steps{
                echo "========executing terraform apply========"
                sh "terraform apply -auto-approve -var-file=env/${environment}.tfvars -var-file=env/no-aws-profile.tfvars tfplan"
            }           
        }
    }
}