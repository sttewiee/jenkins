import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../')))

import pytest
from app import app  # Импортируем приложение Flask

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_home_page(client):
    response = client.get('/')
    assert response.status_code == 200
    assert "Information" in response.data.decode("utf-8")  # Проверяем, что строка "Information" присутствует
    assert "Привет мир!" in response.data.decode("utf-8")  # Проверяем, что строка "Привет мир!" присутствует
