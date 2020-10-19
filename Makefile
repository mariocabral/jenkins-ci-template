.PHONY: docker-lint docker-build docker-start

docker-lint:
	docker run --rm -i -v $(shell pwd)/.hadolint.yaml:/root/.config/hadolint.yaml hadolint/hadolint < Dockerfile

docker-build:
	docker build -t mcabral/jenkinsci-template:1.0.0 -t mcabral/jenkinsci-template:latest .

docker-start:
	docker run --name myjenkins -p 8080:8080 mcabral/jenkinsci-template:latest
