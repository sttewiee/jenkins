FROM python:3.12

WORKDIR /app

COPY . .

# Установка зависимостей из requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Проверка, установлен ли pytest
RUN pytest --version

# Запуск тестов, если pytest доступен
CMD ["pytest", "tests/test_myapp.py", "--maxfail=1", "--disable-warnings"]
