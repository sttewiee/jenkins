FROM python:3.12

WORKDIR /app

# Копируем проект и устанавливаем зависимости
COPY . .

# Устанавливаем зависимости, включая pytest
RUN pip install --no-cache-dir -r requirements.txt

# Проверяем, доступен ли pytest
RUN which pytest

# Запускаем приложение или тесты по умолчанию
CMD ["/usr/local/bin/pytest", "tests/test_myapp.py", "--maxfail=1", "--disable-warnings"]

