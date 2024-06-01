pipeline {
    agent any

    environment {     
    DOCKERHUB_CREDENTIALS= credentials('docker')     
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
                     sh 'docker build -t seyiogunniran/seyirepo .'
                        }
                    }
            }
        stage('run our image') {
            steps{
                script {
                     sh 'docker run -it -p8082:80 -d webapp:1'
                        }
                    }
            }

        stage('Login to Docker Hub') {      	
            steps{                       	
	            // sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password' 
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'               		
	            echo 'Login Completed'      
                }           
            }   
        stage('Push Image to Docker Hub') {         
            steps{                            
                sh 'docker push seyiogunniran/seyirepo'           
                echo 'Push Image Completed'       
                 }            
            }  
    /*
    post{
        always {  
	        sh 'docker logout'     
         }      
        } 
        */
       
    }
}
