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
                curl -sL https://deb.nodesource.com/setup_18.x | bash -
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
                sh '''
                npm config set registry https://registry.npmjs.org/
                npm install --verbose
                '''
            }
        }

        stage('Build React App') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Docker Build and Run') {
            steps {
                sh '''
                docker-compose down || true
                docker-compose build
                docker-compose up -d
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build, Docker Compose up, and deployment succeeded!'
        }
        failure {
            echo '❌ Build or deployment failed. Please check the console logs.'
        }
    }
}
