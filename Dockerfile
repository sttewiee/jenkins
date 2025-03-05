# Используем официальный образ Python
FROM python:3.12

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем все файлы проекта в контейнер
COPY . .

# Устанавливаем pip и pytest (и любые другие зависимости, если нужно)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install Flask pytest

# Проверяем установку pytest
RUN pytest --version

# Запускаем приложение, если требуется
CMD ["python", "app.py"]
