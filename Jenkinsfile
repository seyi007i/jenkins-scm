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
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
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
