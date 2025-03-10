# Jenkins CI/CD Pipeline for Python Application

Этот репозиторий содержит пример Jenkins pipeline для автоматизации сборки, тестирования и запуска Python-приложения внутри Docker-контейнера. Ниже приведено подробное описание этапов (stages) конвейера.

## Описание Pipeline

Pipeline состоит из следующих основных этапов:

1. **Clone Repository**  
   - Очищает рабочую директорию.
   - Клонирует указанный репозиторий из GitHub (в данном примере репозиторий `https://github.com/sttewiee/jenkins.git` и ветка `main`).

2. **Install Dependencies**  
   - Загружает базовый образ Python (`python:3.12`).
   - Устанавливает зависимости, указанные в файле `requirements.txt`, в локальную папку `vendor` с использованием Docker-контейнера.

3. **Run Tests**  
   - Параллельное выполнение двух этапов тестирования:
     - **Run test_myapp.py**: Запускает тесты из файла `tests/test_myapp.py`.
     - **Run test_myapp2.py**: Запускает тесты из файла `tests/test_myapp2.py`.
   - Тесты выполняются внутри Docker-контейнера с установленными зависимостями (используется переменная `PYTHONPATH` для указания папки `vendor`).

4. **Stop and Remove Old Container**  
   - Останавливает и удаляет предыдущую версию запущенного контейнера (если он существует) с именем `myapp-docker`.

5. **Run Application**  
   - Запускает приложение в Docker-контейнере на порту `5000`.
   - Приложение ожидается в файле `app.py`, который слушает порт `5000`.

## Переменные окружения

- `REPO_URL` - URL репозитория с исходным кодом.
- `BRANCH_NAME` - Ветка репозитория, из которой будут браться исходники.
- `PYTHON_IMAGE` - Базовый образ Docker для Python (в примере используется `python:3.12`).
- `CONTAINER_NAME` - Имя контейнера, в котором будет запущено приложение (в примере `myapp-docker`).

## Уведомления

В разделе `post` определены действия для отправки уведомлений по электронной почте:
- **При успешном завершении сборки**: Отправляется сообщение с информацией о успешном выполнении сборки.
- **При ошибке сборки**: Отправляется сообщение с информацией о сбое сборки.

Электронные уведомления отправляются на адрес `plapikovv@gmail.com` с использованием плагина `emailext`.

## Как использовать

1. **Настройка Jenkins**  
   - Убедитесь, что Jenkins настроен для работы с Docker.
   - Создайте новый Pipeline проект и укажите данный скрипт в качестве Jenkinsfile.

2. **Запуск сборки**  
   - Запустите сборку через Jenkins UI.  
   - Jenkins автоматически выполнит все этапы: клонирование репозитория, установку зависимостей, запуск тестов, остановку старого контейнера и запуск приложения.

3. **Проверка работы**  
   - Приложение будет доступно на порту `5000` вашего хоста.
   - Результаты тестов можно увидеть в логах сборки.

## Требования

- Jenkins с установленными плагинами для работы с Docker.
- Docker, настроенный для работы с Jenkins-агентами.
- Правильная конфигурация сети для доступа к порту `5000` (если требуется).

## Пример использования

Примерный скрипт для Pipeline приведен в файле `Jenkinsfile` в корне репозитория.

---

Этот pipeline является хорошей отправной точкой для автоматизации CI/CD процессов для Python-приложений с использованием Docker. При необходимости, вы можете адаптировать его под свои нужды.
