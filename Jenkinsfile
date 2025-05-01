pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-creds') // Your Docker Hub credentials ID
        IMAGE_NAME = "akaza04/devops-app"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Docker Build') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                bat """
                echo %DOCKER_CREDENTIALS_PSW% | docker login -u %DOCKER_CREDENTIALS_USR% --password-stdin
                """
            }
        }
        stage('Push to Docker Hub') {
            steps {
                bat 'docker push %IMAGE_NAME%'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
