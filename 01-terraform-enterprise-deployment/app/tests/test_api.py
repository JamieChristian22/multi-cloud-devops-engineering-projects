from fastapi.testclient import TestClient
from app.main import app
c=TestClient(app)
def test_root(): assert c.get("/").json()["status"]=="running"
def test_health(): assert c.get("/healthz").json()=={"status":"ok"}
def test_ready(): assert c.get("/readyz").status_code==200
def test_echo(): assert c.post("/api/v1/echo",json={"message":"hello"}).json()["message"]=="hello"
def test_header(): assert c.get("/").headers["x-content-type-options"]=="nosniff"
