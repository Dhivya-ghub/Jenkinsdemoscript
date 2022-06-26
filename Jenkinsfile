pipeline {
    agent any
    //environment {
         // registry = "dhivyadhub/pythondoc" 
          //registryCredential = 'dockerhub'
          //DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    //}
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
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                }
                bat "docker login -u %env.dockerHubUser% -p %env.dockerHubPassword%"
                
            }
        }

        stage('Push') {

            steps {
                bat 'docker push dhivyadhub/pythondoc:%BUILD_NUMBER%'
            }
        }
    }

}
