FROM python:3.10-slim

# Устанавливаем зависимости
RUN pip install --upgrade pip
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

# Открываем порт 80
EXPOSE 80

# Запускаем приложение
CMD ["python", "app.py"]
