pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning done by Jenkins automatically'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
