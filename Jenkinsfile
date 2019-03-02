pipeline {
    agent { label 'node' }
    stages {
        stage('git') { 
            steps{
            // for display purposes
                    checkout scm
            }
        }
        stage('Sonarqube') {
            environment {
                scannerHome = tool 'sonarqube'
            }
            steps {
                    dir("/home/Nik/workspace/epam/") {
                        withSonarQubeEnv('sonarqube') {
                            sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=todo -Dsonar.projectName=todo -Dsonar.projectVersion=1.0 -Dsonar.sources=. -Dsonar.language=js -Dsonar.sourceEncoding=UTF-8"
                        }
                    }
                }
            }
        stage('Build image') {
            steps{
                script{
                    def app
                    app = docker.build("1545662258668/node1")
                    app.push()
                }
            }
        }
        stage('pull image') {
            steps{
                sh "docker pull 1545662258668/node1"
            }
        }
        stage('stop/delite all containers') {
            steps{
                sh "docker stop \$(docker ps -a -q) || true"
                sh "docker rm \$(docker ps -a -q) || true"
            }
        }
        stage('deploy') {
            steps{
                sh "docker-compose -f docker-compose.yaml up -d"
            }
        }
    }
}
