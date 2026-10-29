
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'diksshitat/abc'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/diksshita/practice1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:v1 .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'docker_hub',
                        variable: 'DOCKER_PAT'
                    )
                ]) {
                    sh '''
                        set +x
                        echo "$DOCKER_PAT" | docker login \
                            -u diksshitat \
                            --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push ${DOCKER_IMAGE}:v1'
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
        always {
            sh 'docker logout || true'
        }
    }
}
