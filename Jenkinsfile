pipeline {
    agent any
    environment {
        registry = "dhivyadhub/pythondoc" 
        registryCredential = 'dockerhub'    
    }
    stages {
        stage('git clone') {
            steps {
                // Get code from a GitHub repository
                git url: 'https://github.com/Dhivya-ghub/Jenkinsdemo.git', branch: 'main',
                 credentialsId: 'github_creds'
            }
        }
         stage('Build') {
            steps {
                bat 'docker build -t dhivyadhub/pythondoc:%BUILD_NUMBER% .'
            }
        }

        stage('Login') {

            steps {
                bat 'echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin'
            }
        }

        stage('Push') {

            steps {
                bat 'docker push dhivyadhub/pythondoc:%BUILD_NUMBER%'
            }
        }
    }

}