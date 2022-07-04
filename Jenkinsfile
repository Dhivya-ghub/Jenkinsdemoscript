def container-name = 'python-container'
def image-name = 'python-image'
node {
     checkout scm 
     environment {
        http_proxy = 'http://127.0.0.1:3128/'
        https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/'
     } 
    stage ('Cleaning Local Images and Containers') {
                 sh 'docker stop $(docker ps -a -q) || true && docker rm $(docker ps -a -q) || true && docker rmi -f $(docker images -a -q) || true' 
    }     
    stage('git clone') {
                // Get code from a GitHub repository
                git url: 'https://github.com/Dhivya-ghub/Jenkinsdemo.git', branch: 'main',
                 credentialsId: 'github_creds'
    }
    stage('Build') {
                 def testImage = docker.build(":${env.BUILD_NUMBER}", ".")  
                 testImage.inside {
                   sh 'docker run -d -p 5001:5000 --name ${container-name} ${image-name}:${env.BUILD_NUMBER}'
                 }
                 
    }
 }      
