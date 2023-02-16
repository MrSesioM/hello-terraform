pipeline {
    agent any

    stages {

        stage('Docker-login') {
            steps {
                withCredentials([string(credentialsId: 'docker-login', variable: 'CR_PAT')]) {
                    sh 'echo $CR_PAT | docker login ghcr.io -u mrsesiom --password-stdin'
                }
            }
        }
        
        stage('Build and Push') {
            steps {
                sh 'docker-compose build'
		sh 'docker-compose push'
            }
        }

	

#        stage('ssh-connection') {
#            steps {
#                sshagent(['d89380b3-eee1-48ad-b34f-5ab73318ad48']) {
#                    sh '''
#                    ssh -o "StrictHostKeyChecking no" ec2-user@52.211.227.27 "docker pull ghcr.io/mrsesiom/2048:latest && docker pull ghcr.io/mrsesiom/2048:1.0.${BUILD_NUMBER}"
#                    '''
#                }
#            }
#        }
    }
}
