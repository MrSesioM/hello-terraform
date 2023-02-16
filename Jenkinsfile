pipeline {
    agent any

    stages {

        stage('Docker-login and tags') {
            steps {
                withCredentials([string(credentialsId: 'docker-login', variable: 'CR_PAT')]) {
                    sh 'echo $CR_PAT | docker login ghcr.io -u mrsesiom --password-stdin'
                }
                    sh 'git tag 1.0.${BUILD_NUMBER}'
                    sshagent(['git-login']) {
                        sh 'git push git@github.com:MrSesioM/hello-2048.git --tags'
                    }
                }
        }
        
        stage('Push') {
            steps {
                sh 'VERSION=1.0.${BUILD_NUMBER} docker-compose build'
	        sh 'VERSION=1.0.${BUILD_NUMBER} docker-compose push'
            }
        }
        stage('Create instance and install app'){
    		steps{
    			withAWS(credentials:'AWS Credentials'){
    			    sh 'terraform destroy -lock=false -auto-approve'
    				sh 'terraform apply -auto-approve'
    				ansiblePlaybook credentialsId: 'Ansible', inventory: 'aws_ec2.yml', playbook: 'httpd.yml'
    			}
    		}
    	}
    }
}
