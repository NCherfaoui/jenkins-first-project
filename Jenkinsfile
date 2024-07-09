pipeline {
    agent any

    environment {
        // Référence à l'ID des credentials via une variable d'environnement
        GIT_CREDENTIALS_ID = credentials('GIT_CREDENTIALS_ID')
         DOCKERHUB_CREDENTIALS = credentials('DOCKERHUB_CREDENTIALS')
    }

    /* stages {
        stage('Checkout') {
            steps {
                // Utilisation de la variable d'environnement pour les credentials
                git branch: 'main', credentialsId: "${env.GIT_CREDENTIALS_ID}", url: 'https://github.com/NCherfaoui/jenkins-first-project.git'
            }
        }

        stage('Prepare') {
            steps {
                // Rendre le script Maven Wrapper exécutable
                sh 'chmod a+x ./mvnw'
            }
        }

        stage('Build') {
            steps {
                // Build the Spring Boot application
                sh './mvnw clean install'
            }
        }

        stage('Test') {
            steps {
                // Run the tests
                sh './mvnw test'
            }
        }

        stage('Package') {
            steps {
                // Package the application
                sh './mvnw package'
            }
        }
    } */
        stage('Build Docker Image') {
                steps {
                    script {
                        // Construire l'image Docker
                        docker.build("monapp:${env.BUILD_ID}")
                    }
                }
            }

            stage('Push Docker Image') {
                steps {
                    script {
                        // Se connecter à Docker Hub
                        docker.withRegistry('https://index.docker.io/v1/', "${env.DOCKERHUB_CREDENTIALS}") {
                            // Pousser l'image Docker
                            docker.image("monapp:${env.BUILD_ID}").push()
                        }
                    }
                }
            }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}