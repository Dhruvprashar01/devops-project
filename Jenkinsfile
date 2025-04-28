pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "urbanstyle-frontend"  // Replace with your container image name
        DOCKER_REGISTRY = "docker.io"  // Optional, if pushing to a Docker registry like Docker Hub
    }

    stages {
        // Stage 1: Checkout the code from GitHub
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Dhruvprashar01/devops-project.git'
            }
        }

        // Stage 2: Build the Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    // Make sure Docker is installed and running on Jenkins machine
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        // Stage 3: Run the Docker container
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container and map port 3000 to 3000 on the host machine
                    sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
