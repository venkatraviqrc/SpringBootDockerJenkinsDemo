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

        // 🔍 Debug stage to find jar file
        stage('Check Files') {
            steps {
                sh 'pwd'
                sh 'ls -l'
                sh 'ls -l target/'
            }
        }

        // 🚀 Run application
        stage('Run App') {
            steps {
                sh 'nohup java -jar target/*.jar &'
            }
        }

    }
}
