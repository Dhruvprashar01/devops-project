pipeline {
    agent any

    environment {
        // Reference the GitHub token you stored in Jenkins
        GITHUB_TOKEN = credentials('github-token') // Use the ID for GitHub token
        DOCKER_HUB_USERNAME = credentials('docker-hub-username') // Use the ID for Docker Hub username
        DOCKER_HUB_PASSWORD = credentials('docker-hub-password') // Use the ID for Docker Hub token
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub using the stored GitHub credentials
                git url: 'https://github.com/Dhruvprashar01/devops-project', credentialsId: 'github-token'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    def imageTag = "${DOCKER_HUB_USERNAME}/devops-project:latest"
                    // Build Docker image
                    sh "docker build -t ${imageTag} ."
                    // Docker login using Docker Hub credentials
                    sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
                    // Push the Docker image to Docker Hub
                    sh "docker push ${imageTag}"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and Docker push successful!'
        }
        failure {
            echo '❌ Something went wrong during the build or Docker push.'
        }
    }
}
