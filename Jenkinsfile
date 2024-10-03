pipeline {
    agent any
    environment { 
        DOCKER_USERNAME = 'ncherfaoui' 
        GITHUB_REPO_URL = 'https://github.com/NCherfaoui/jenkins-first-project.git'
        APP_NAME = 'calculatrice'
    }

    tools {
        maven 'Maven-3.9.8' 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: "${env.GITHUB_REPO_URL}"
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_USERNAME}/${env.APP_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image("${env.DOCKER_USERNAME}/${env.APP_NAME}:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
        
        stage('Deploy to Docker-out') {
            steps {
                script {
                    sh """
                        docker stop ${env.APP_NAME} || true
                        docker rm ${env.APP_NAME} || true
                        docker run -d --name ${env.APP_NAME} -p 8081:8080 ${env.DOCKER_USERNAME}/${env.APP_NAME}:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }
}