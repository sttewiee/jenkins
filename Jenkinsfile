pipeline {
    agent any

    environment {
        APP_PORT = "5000"   // Указываем порт приложения
    }

    stages {
        // Этап 1: Клонирование репозитория
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sttewiee/jenkins.git'
            }
        }

        // Этап 2: Создание виртуального окружения и установка зависимостей
        stage('Setup Virtual Environment') {
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        // Этап 3: Запуск тестов
        stage('Test') {
            steps {
                sh '''
                    . venv/bin/activate
                    python -m unittest discover tests
                '''
            }
        }

        // Этап 4: Остановка предыдущего процесса (если он есть) и запуск нового
        stage('Deploy') {
            steps {
                sh '''
                    # Останавливаем старый процесс, если он запущен
                    if [ -f app.pid ]; then
                        kill $(cat app.pid) || true
                        rm app.pid
                    fi

                    # Активируем виртуальное окружение
                    . venv/bin/activate
                    
                    # Запускаем приложение в фоне и сохраняем PID
                    nohup python app.py > app.log 2>&1 &
                    echo $! > app.pid

                    # Проверяем, что процесс Flask действительно запущен
                    sleep 5
                    if ! ps -p $(cat app.pid) > /dev/null; then
                        echo "❌ Flask не запустился!"
                        exit 1
                    fi
                '''
            }
        }

        // Этап 5: Проверка доступности (Health Check)
        stage('Health Check') {
            steps {
                script {
                    def response = sh(script: "curl -s -o /dev/null -w '%{http_code}' http://localhost:${APP_PORT}", returnStdout: true).trim()
                    if (response != "200") {
                        error("❌ Flask app is not responding! Check logs.")
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully! Flask app is running on port 5000.'
        }
        failure {
            echo '❌ Pipeline failed! Check logs for details.'
        }
    }
}
