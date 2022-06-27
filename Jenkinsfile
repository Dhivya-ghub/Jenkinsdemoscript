pipeline {
    agent any
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
                bat 'docker build -t %registry%:%BUILD_NUMBER% .'
            }
        }

        stage('Login') {

            steps {
                   withDockerRegistry(credentialsId: 'dockerHub', url: '') {

}
            }
        }

        stage('Push') {

            steps {
                bat 'docker push %registry%:%BUILD_NUMBER%'
            }
        }
    }

}
