node {
        stage('git clone') {
                // Get code from a GitHub repository
                git url: 'https://github.com/Dhivya-ghub/Jenkinsdemo.git', branch: 'main',
                 credentialsId: 'github_creds'
        }
         stage('Build') {
                bat 'docker build -t dhivyadhub/pythondoc:%BUILD_NUMBER% .'
        }
}
       
