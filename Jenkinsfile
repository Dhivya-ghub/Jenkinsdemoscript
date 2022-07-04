def image = 'test-image'
def container = 'python-cont'
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
    stage('Build') {
         def testImage = docker.build("${image}:${env.BUILD_NUMBER}", ".")
    }    
    stage('Run a container') {
              sh 'docker run -d --name ${container} -p 5008:5000 ${testImage}:$BUILD_NUMBER'
    }
 }      
