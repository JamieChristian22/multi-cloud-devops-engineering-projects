.PHONY: test run build validate deploy-dev destroy-dev
test:
	python3 -m pytest -q
run:
	docker build -t aws-cloud-native-stack:local app && docker run --rm -p 8080:8080 -e APP_ENV=local aws-cloud-native-stack:local
build:
	docker build -t aws-cloud-native-stack:local app
validate:
	./scripts/validate.sh
deploy-dev:
	./scripts/deploy.sh dev
destroy-dev:
	./scripts/destroy.sh dev
