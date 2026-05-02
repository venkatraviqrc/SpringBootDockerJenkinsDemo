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
