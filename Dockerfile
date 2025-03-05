FROM python:3.12

WORKDIR /app

# Копируем все файлы проекта
COPY . .

# Устанавливаем зависимости
RUN pip install --no-cache-dir --upgrade pip && \
    pip install Flask pytest

# Запускаем приложение, если потребуется
CMD ["python", "app.py"]
