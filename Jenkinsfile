pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Directly clone the public repository
                git url: 'https://github.com/Dhruvprashar01/devops-project'
            }
        }

        stage('Build and Run with Docker Compose') {
            steps {
                script {
                    // Build and run Docker containers using Docker Compose
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }

    post {
        success {
            // Notify on successful build and deployment
            echo 'Build and deployment succeeded!'
        }
        failure {
            // Notify on failed build or deployment
            echo 'Build or deployment failed!'
        }
    }
}
