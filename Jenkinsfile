pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker rm -f springboot-container || true
                docker pull ravishekhar169/springboot-app
                docker run -d -p 9090:8080 --name springboot-container ravishekhar169/springboot-app
                '''
            }
        }

    }
}
