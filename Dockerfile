FROM python:3.10-slim

# Устанавливаем зависимости
RUN pip install Flask>=3.0.0

# Копируем файлы приложения в контейнер
WORKDIR /app
COPY . /app

# Открываем порт 80
EXPOSE 80

# Запускаем Flask приложение
CMD ["python", "app.py"]
