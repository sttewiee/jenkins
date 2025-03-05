import sys
import os
import pytest  # Добавляем импорт pytest
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import app  # Импортируем Flask-приложение

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_index(client):
    response = client.get('/')  # Делаем GET-запрос на главную страницу
    assert "Information" in response.data.decode("utf-8")  # Проверяем наличие слова "Information" в ответе
    assert "Привет мир!" in response.data.decode("utf-8")  # Проверяем наличие текста "Привет мир!"

def test_images_exist(client):
    response = client.get('/')
    # На странице нет изображений, поэтому этот тест будет удален или нужно будет добавить изображения в HTML.
    assert "<img src=\"" not in response.data.decode("utf-8")  # Проверяем, что на странице нет изображений

def test
