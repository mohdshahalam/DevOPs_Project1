pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mohd-shahalam/DevOPs_Project1.git'
            }
        }

        stage('Send Files to Ansible Server') {
            steps {
                sshagent(['ansible-demo']) {  // Using the credentials with ID 'ansible-demo'
                    // Send the required files to the Ansible server
                    sh 'scp -o StrictHostKeyChecking=no Dockerfile ubuntu@172.31.31.93:/home/ubuntu/'
                    sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/pipeline-test/* ubuntu@172.31.31.93:/home/ubuntu/'
                }
            }
        }

        stage('Build on Ansible Server') {
            steps {
                sshagent(['ansible-demo']) {
                    // Execute the Docker build command remotely on the Ansible server
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.31.93 "cd /home/ubuntu && docker build -t nginx-image ."'
                }
            }
        }

        stage('Run Docker Container on Ansible Server') {
            steps {
                sshagent(['ansible-demo']) {
                    // Run the Docker container on the Ansible server
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.31.93 "docker run -d -p 8080:80 --name nginx-container nginx-image"'
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
