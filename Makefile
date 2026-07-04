VERSIONS = 3.11 3.12 3.13 3.14

build-%:
	docker build --build-arg PYTHON_VERSION=$* -t pico-cache-test:$* -f Dockerfile.test .

test-%: build-%
	docker run --rm pico-cache-test:$*

test-all: $(addprefix test-,$(VERSIONS))

.PHONY: build-% test-% test-all
