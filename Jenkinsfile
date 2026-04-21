pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
        DOCKERHUB_REPO = "ravishekhar169/springboot-docker"
        CONTAINER_NAME = "springboot-container"
    }

    stages {

        stage('Clone') {
            steps {
                git credentialsId: 'github-creds',
    url: 'https://github.com/venkatraviqrc/SpringBootDockerJenkinsDemo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $DOCKERHUB_REPO:latest .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $DOCKERHUB_REPO:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker stop $CONTAINER_NAME || true'
                sh 'docker rm $CONTAINER_NAME || true'
                sh 'docker run -d -p 9000:9000 --name $CONTAINER_NAME $DOCKERHUB_REPO:latest'
            }
        }
stage('Test') {
            steps {
                sh 'sleep 10'
                sh 'curl http://localhost:9000'
            }
        }
    }
}
