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

        stage('Check Node.js and npm versions') {
            steps {
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('Install Node.js and npm') {
            steps {
                sh '''
                curl -sL https://deb.nodesource.com/setup_16.x | bash -
                apt-get install -y nodejs
                '''
            }
        }

        stage('Clean Workspace') {
            steps {
                deleteDir()  // Clean the workspace
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install --verbose'
            }
        }

        stage('Build and Run') {
            steps {
                script {
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
