pipeline {
    agent any
    environment {
        registry = "dhivyadhub/pythondoc" 
        registryCredential = 'dockerhub'
        DOCKERHUB_CREDENTIALS_USR = 'dhivyadhub'
        DOCKERHUB_CREDENTIALS_PSW = 'T3rr@F0rm'
        
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
                bat docker login -u ${env.DOCKERHUB_CREDENTIALS_USR} -p ${env.DOCKERHUB_CREDENTIALS_PSW}'
            }
        }

        stage('Push') {

            steps {
                bat 'docker push dhivyadhub/pythondoc:%BUILD_NUMBER%'
            }
        }
    }

}
