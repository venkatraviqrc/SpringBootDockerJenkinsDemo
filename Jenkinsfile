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

    stage('Clean Workspace') {
        steps {
            deleteDir()
        }
    }

    stage('Checkout Code') {
        steps {
            checkout scm
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
            sh '''
            docker rm -f $CONTAINER_NAME || true
            docker run -d -p 9000:8080 \
            --name $CONTAINER_NAME \
            $DOCKERHUB_REPO:latest
            '''
        }
    }

    stage('Test') {
        steps {
            sh 'sleep 15'
            sh 'curl -f http://localhost:9000'
        }
    }
}

post {
    success {
        echo 'Pipeline Success ✅'
    }
    failure {
        echo 'Pipeline Failed ❌'
    }
}
```

}

