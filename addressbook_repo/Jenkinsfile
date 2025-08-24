pipeline {
    agent any

    environment {
        // Ansible installation configured in Jenkins
        ANSIBLE_INSTALL = 'ansible2'
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'master',
                    credentialsId: 'ansible-ssh',
                    url: 'git@github.com:NandaVamsi-ai/jenkins-ansible-book.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                ansiblePlaybook(
                    playbook: 'addressbook.yml',
                    inventory: 'inventory.ini',
                    credentialsId: 'ansible-ssh',
                    installation: "${ANSIBLE_INSTALL}",
                    colorized: true,
                    disableHostKeyChecking: true,
                    vaultTmpPath: ''
                )
            }
        }
    }

    post {
        success {
            echo "Deployment completed successfully ✅"
        }
        failure {
            echo "Deployment failed ❌"
        }
    }
}
