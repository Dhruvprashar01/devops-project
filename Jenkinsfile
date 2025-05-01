pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Use SCM to clone your Git repository
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Example: Building the project
                echo "Building the project..."
                // Your build commands go here
            }
        }
        stage('Test') {
            steps {
                // Example: Running tests
                echo "Running tests..."
                // Your test commands go here
            }
        }
        stage('Deploy') {
            steps {
                // Example: Deploying the project
                echo "Deploying the project..."
                // Your deploy commands go here
            }
        }
    }
}
