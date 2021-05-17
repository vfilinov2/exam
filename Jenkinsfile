pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('c2f129aa-6182-4544-8947-6f2532dddeed')
        AWS_SECRET_ACCESS_KEY = credentials('d8d32e46-4a16-4b78-881c-9529cac8e0bb')
    }

   agent  any
//        options {
//                timestamps ()
//ansiColor('xterm')
 //           }
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
        
        stage('Apply') {
            steps {
                sh "pwd;cd terraform/terraform ; terraform apply -input=false tfplan"
            }
        }
     }

  }