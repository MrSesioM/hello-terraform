pipeline {
    agent any

    stages{
	stage('Create instance and install app'){
		step{
			withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
				sh 'terraform apply'
			}
		}
	}
    }
}
