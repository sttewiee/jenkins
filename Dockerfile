# Используем официальный Python-образ
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь исходный код в контейнер
COPY . .

# Открываем порт 5000 для Flask приложения
EXPOSE 5000

# Запускаем приложение
CMD ["python", "app.py"]
