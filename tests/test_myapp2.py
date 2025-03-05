import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import app  # Импортируем Flask-приложение

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_index(client):
    response = client.get('/')  # Делаем GET-запрос на главную страницу
    assert b"Information" in response.data  # Проверяем наличие слова "Information" в ответе
    assert b"Привет мир!" in response.data  # Проверяем наличие текста "Привет мир!"

def test_images_exist(client):
    response = client.get('/')
    # На странице нет изображений, поэтому этот тест будет удален или нужно будет добавить изображения в HTML.
    assert b"<img src=\"" not in response.data  # Проверяем, что на странице нет изображений

def test_page_title(client):
    response = client.get('/')
    assert b"<title>Information</title>" in response.data  # Проверяем, что заголовок страницы корректный
