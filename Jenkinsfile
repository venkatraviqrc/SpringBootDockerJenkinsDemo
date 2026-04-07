pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t springboot-app .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop springboot-container || true'
                sh 'docker rm springboot-container || true'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8081:8080 --name springboot-container springboot-app'
            }
        }
    }
}
