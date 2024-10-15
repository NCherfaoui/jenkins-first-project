pipeline {
    agent any
    
    environment { 
        DOCKER_USERNAME = 'ncherfaoui' 
        GITHUB_TOKEN = credentials('github-token')
        GITHUB_REPO_URL = 'https://github.com/NCherfaoui/jenkins-first-project.git'
    }

    tools {
        maven 'Maven-3.9.8' 
    }

    stages {
       stage('Checkout') {
        steps {
            // Si c'est une PR, utilise la branche correspondante
            git branch: "${env.CHANGE_BRANCH ?: 'main'}", url: "${env.GITHUB_REPO_URL}"
        }
    }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Merge Pull Request') {
            when {
                expression {
                    // Ne fusionne que si le build est réussi et le PR est prêt à être fusionné
                    currentBuild.result == null || currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                script {
                    def prNumber = env.CHANGE_ID // Numéro de la Pull Request (dérivé de l'événement PR)
                    
                    // Fusionner la PR si toutes les étapes précédentes sont réussies
                    sh "gh pr merge $prNumber --repo $GITHUB_REPO_URL --merge --admin --delete-branch"
                    echo "Pull Request #${prNumber} has been merged."
                }
            }
        }

        // Commented out stages for Docker build and push (uncomment if needed)
        /*
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_USERNAME}/calculatrice:${env.BUILD_NUMBER}", '.')
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image("${env.DOCKER_USERNAME}/calculatrice:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
        */
    }
    
    post {
        always {
            // Notification ou actions à effectuer après la pipeline
            echo 'Pipeline completed.'
        }
    }
}
