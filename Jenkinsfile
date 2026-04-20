pipeline {
    agent any

    stages {

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

        stage('Check Files') {
            steps {
                sh 'echo "Listing target folder..."'
                sh 'ls -l target/'
            }
        }

        stage('Run App') {
            steps {
                sh 'nohup java -jar target/*.war &'
            }
        }
    }
}
