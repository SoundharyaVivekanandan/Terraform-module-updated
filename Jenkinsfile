pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Checkout') {
           steps {
                // Checkout your Git repository containing Terraform code
                script {
                    def gitUrl = 'https://github.com/SoundharyaVivekanandan/updated_Terraform-Module.git'
                    def gitBranch = 'main'
                    def gitCredentialsId = 'Git-Credentials' // Optional, if using credentials

 

 

                    checkout([$class: 'GitSCM', branches: [[name: gitBranch]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CloneOption', noTags: false, reference: '', shallow: true, timeout: 10]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: gitCredentialsId, url: gitUrl]]])
                }
        }
    }       

 

 

        stage('Terraform Init') {
    steps {
        // Initialize Terraform
        bat 'terraform init'
    }
}

 

 

stage('Terraform Plan') {
    steps {
        // Generate Terraform plan
        bat 'terraform plan -out=tfplan'
    }
}

 

 

stage('Terraform Apply') {
    steps {
        // Apply Terraform changes
        bat 'terraform apply -auto-approve tfplan'
    }
}

 

 

//stage('Terraform Destroy') {
    //steps {
        // Destroy resources if needed (optional)
        //bat 'terraform destroy -auto-approve'
    //}
//}

 

 

    }
}
