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

    stage('Build Docker Image') {
        steps {
            script {
                sh 'docker build -t devops-app .'
            }
        }
    }

    stage('Run Docker Image') {
        steps {
            script {
                sh 'docker run -d -p 8085:8080 devops-app'
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
