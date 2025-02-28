pipeline {
    agent { label 'agent' }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sttewiee/jenkins.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                script {
                    sh '''
                    sudo apt update
                    sudo apt install -y python3-pip
                    pip3 install -r requirements.txt
                    '''
                }
            }
        }
        
        stage('Run Python Application') {
            steps {
                script {
                    sh 'nohup python3 app.py &'
                }
            }
        }
    }
}
