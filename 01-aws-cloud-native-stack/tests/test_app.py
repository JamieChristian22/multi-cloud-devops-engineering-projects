import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'app'))
from app import app

def test_health():
    client=app.test_client(); response=client.get('/health')
    assert response.status_code==200
    assert response.get_json()['status']=='healthy'

def test_home():
    assert app.test_client().get('/').status_code==200

def test_info():
    data=app.test_client().get('/api/info').get_json()
    assert data['platform']=='Amazon ECS Fargate'
