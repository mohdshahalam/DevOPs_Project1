pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mohd-shahalam/DevOPs_Project1.git'
            }
        }
        stage('Sending docker file to Ansible server over ssh') {
            steps {
                sshagent(['ansible-demo']) {
                    sh 'scp -o StrictHostKeyChecking=no Dockerfile ubuntu@172.31.31.93:/home/ubuntu/'
                    sh 'scp /var/lib/jenkins/workspace/pipeline-test/* ubuntu@172.31.31.93:/home/ubuntu/'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t nginx-image .'  // Ensure the build context is defined as the current directory
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker run -d -p 8080:80 --name nginx-container nginx-image'
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
