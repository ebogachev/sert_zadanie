pipeline {
    agent any
    stages {
        stage('Git checkout') {
           steps{
                git 'https://github.com/ebogachev/sert_zadanie.git'
                  }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
        stage('Deploy') {
            steps {
                ansiblePlaybook playbook: 'ansible.yml'
            }
        }
    }
}