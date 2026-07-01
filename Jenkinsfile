pipeline {

    agent any

    environment {
        IMAGE_NAME = "gaurav0426/employee-management"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build \
                        -t ${IMAGE_NAME}:${IMAGE_TAG} \
                        -t ${IMAGE_NAME}:latest .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                        docker push ${IMAGE_NAME}:latest

                        docker logout
                    '''
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh '''
                    echo "===== Workspace ====="
                    pwd

                    echo "===== Project Files ====="
                    ls -R

                    ansible --version

                    ansible-playbook \
                        -i ansible/inventory.ini \
                        ansible/deploy.yml
                '''
            }
        }
    }

    post {
        success {
            echo '================================='
            echo 'Pipeline completed successfully!'
            echo '================================='
        }

        failure {
            echo '================================='
            echo 'Pipeline failed!'
            echo '================================='
        }
    }
}