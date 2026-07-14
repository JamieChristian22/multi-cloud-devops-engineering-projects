PYTHON?=python3
VENV?=.venv
setup:
	$(PYTHON) -m venv $(VENV) && $(VENV)/bin/pip install -r requirements-dev.txt
lint:
	$(VENV)/bin/ruff check app tests && $(VENV)/bin/ruff format --check app tests
test:
	$(VENV)/bin/pytest -q --junitxml=test-results.xml
security:
	$(VENV)/bin/bandit -q -r app && $(VENV)/bin/pip-audit -r requirements.txt
docker-build:
	docker build --pull -t devops-api:local .
run:
	docker run --rm -p 8080:8080 -e ENVIRONMENT=local devops-api:local
