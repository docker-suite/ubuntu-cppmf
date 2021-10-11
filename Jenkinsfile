pipeline {

    agent { label 'docker-agent' }

    stages {
        stage ( "Building") {
            steps {
                script {
                    docker.withRegistry('', 'docker-hub-credentials') {
                        sh "make build"
                        sh "make push"
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'make remove'
            }
        }
        cleanup {
            cleanWs()
        }
    }
}
