pipeline {
    agent any

    environment {
        GITHUB_TOKEN = credentials('github-token')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Dhruvprashar01/devops-project', credentialsId: 'github-token'
            }
        }

        stage('Build and Run') {
            steps {
                script {
                    // If you want to run npm commands in a Linux environment
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}
