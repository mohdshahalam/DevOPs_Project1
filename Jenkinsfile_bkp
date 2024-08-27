pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                git 'https://github.com/mohd-shahalam/DevOPs_Project1.git'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
        success {
            echo 'Pipeline succeeded'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}
 
