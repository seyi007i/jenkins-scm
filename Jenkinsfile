pipeline {
    agent any

    environment {
    registry = "YourDockerhubAccount/YourRepository"
    registryCredential = 'dockerhub_id'
    dockerImage = ''
    }
    
    stages {
        stage ('fetch code') {
            steps {
                script {
                    echo "Pull source code from Git"
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/seyi007i/jenkins-scm.git']])
                }
            }
        }
        
        stage('Building our image') {
            steps{
                script {
                     sh 'docker build -t dockerfile .'
                        }
                    }
            }
        stage('run our image') {
            steps{
                script {
                     sh 'docker run -it -p8081:80 -d dockerfile'
                        }
                    }
            }
        stage ('Test') {
            steps {
                sh 'node --version'
                sh 'svn --version'
                }
            }
        
       
    }
}
