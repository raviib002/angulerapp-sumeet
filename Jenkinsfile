pipeline {
    agent any
    stages {
        stage('Git Code Fetch') {
            steps {
                git branch: 'main', url: 'https://github.com/raviib002/angulerapp-sumeet.git'
            }
        }
        stage('Docker cleanup') {
            steps {
                //script {
                //    if (sh 'docker ps -a | grep "80"'){
                    sh 'docker stop angular_cont'
                    sh 'docker rm angular_cont'
                    sh 'docker rmi angularapp:latest'
                //    }
                //    else {
                //        echo "test1234567890"
                //    }
                //}
            }
        }
        stage('Docker Build stage') {
            steps {
                sh 'docker build -t angularapp:latest .'
            }
        }
        stage('Docker deployment') {
            steps {
                sh 'docker run -p 80:80 -d --name angular_cont angularapp:latest'
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
