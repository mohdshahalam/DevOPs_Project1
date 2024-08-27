pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mohd-shahalam/DevOPs_Project1.git'
            }
        }
        stage('Sending Docker File to Ansible Server Over SSH') {
            steps {
                sshagent(['ansible-demo']) {
                    sh 'scp -o StrictHostKeyChecking=no Dockerfile ubuntu@172.31.31.93:/home/ubuntu/'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sshagent(['ansible-demo']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.31.93 "docker build -t nginx-image /home/ubuntu/"'
                }
            }
        }
        stage('Tag and Push Docker Image') {
            steps {
                sshagent(['ansible-demo']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.31.93 "docker tag nginx-image shahalam8535/nginx-image:latest && docker push shahalam8535/nginx-image:latest"'
                }
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
