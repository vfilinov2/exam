pipeline {


   agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/vfilinov2/exam.git"
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'pwd;cd terraform/terraform ; terraform init -input=false'
                //sh 'pwd;cd terraform/terraform ; terraform workspace new ${environment}'
                //sh 'pwd;cd terraform/terraform ; terraform workspace select ${environment}'
                sh "pwd;cd terraform/terraform ;terraform plan -input=false -out tfplan "
                sh 'pwd;cd terraform/terraform ;terraform show -no-color tfplan > tfplan.txt'
            }
        }

    }

  }