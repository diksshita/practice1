
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'diksshitat/abc'
        DOCKER_EXE = 'C:\\Users\\Deepak\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe'
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
                bat '''
                    "%DOCKER_EXE%" build -t %DOCKER_IMAGE%:v1 .
                    if errorlevel 1 exit /b 1
                '''
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(
                    credentialsId: 'dockerhub-PAT',
                    variable: 'DOCKER_PAT'
                )]) {
                    bat '''
                        @echo off
                        echo %DOCKER_PAT% | "%DOCKER_EXE%" login -u diksshitat --password-stdin
                        if errorlevel 1 exit /b 1
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat '''
                    "%DOCKER_EXE%" push %DOCKER_IMAGE%:v1
                    if errorlevel 1 exit /b 1
                    "%DOCKER_EXE%" logout
                '''
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}
