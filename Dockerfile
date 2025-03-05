FROM python:3.12

WORKDIR /app

# Копируем файлы проекта и requirements.txt
COPY . .

# Устанавливаем зависимости из requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Запускаем приложение, если требуется
CMD ["python", "app.py"]
