pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-creds') // Use the ID you gave while saving credentials
        IMAGE_NAME = "akaza04/devops-app"  // ✅ Change this
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo ${DOCKER_CREDENTIALS_PSW} | docker login -u ${DOCKER_CREDENTIALS_USR} --password-stdin"
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker push $IMAGE_NAME"
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
