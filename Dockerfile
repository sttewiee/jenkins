FROM python:3.12

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install Flask pytest

EXPOSE 5000

CMD ["python", "app.py"]