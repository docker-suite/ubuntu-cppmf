## Meta data about the image
DOCKER_IMAGE=dsuite/ubuntu-cppmf
DOCKER_IMAGE_CREATED=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')
DOCKER_IMAGE_REVISION=$(shell git rev-parse --short HEAD)

## Current directory
DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

##
latest=20.04

## Config
.DEFAULT_GOAL := help
.PHONY: *

help: ## This help!
	@printf "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

all: ## Build all supported node_versions
	@$(MAKE) build v=20.04

build: ## Build ( usage : make build v=20.04 )
	$(eval ubuntu_version := $(or $(v),$(latest)))
	@docker run --rm \
		-e UBUNTU_VERSION=$(ubuntu_version) \
		-e DOCKER_IMAGE_CREATED=$(DOCKER_IMAGE_CREATED) \
		-e DOCKER_IMAGE_REVISION=$(DOCKER_IMAGE_REVISION) \
		-v $(DIR)/Dockerfiles:/data \
		dsuite/alpine-data \
		sh -c "templater Dockerfile.template > Dockerfile-$(ubuntu_version)"
	@docker build --force-rm \
		--file $(DIR)/Dockerfiles/Dockerfile-$(ubuntu_version) \
		--tag $(DOCKER_IMAGE):$(ubuntu_version)\
		$(DIR)/Dockerfiles

test: ## Test ( usage : make test v=20.04 )
	$(eval ubuntu_version := $(or $(v),$(latest)))
	@$(MAKE) run_test v=$(ubuntu_version) cmd="rm -rf  build"
	# g++ tests
	@$(MAKE) run_test v=$(ubuntu_version) cmd="mkdir -p build/g++"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/g++ && g++ ../../test.cpp -o test && ./test >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/g++ && g++ -std=c++11 ../../test_cpp11.cpp -o test_cpp11 && ./test_cpp11 >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/g++ && g++ -std=c++17 ../../test_cpp17_if.cpp -o test_cpp17_if  && ./test_cpp17_if >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/g++ && g++ -std=c++17 ../../test_cpp17_fs.cpp -o test_cpp17_fs  && ./test_cpp17_fs >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/g++ && g++ -std=c++17 ../../test_cpp17_optional.cpp -o test_cpp17_optional  && ./test_cpp17_optional >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/g++ && g++ -std=c++20 ../../test_cpp20.cpp -o test_cpp20  && ./test_cpp20 >> /dev/null"
	# clang++ tests
	@$(MAKE) run_test v=$(ubuntu_version) cmd="mkdir -p build/clang++"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/clang++ && clang++ ../../test.cpp -o test && ./test >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/clang++ && clang++ -std=c++11 ../../test_cpp11.cpp -o test_cpp11 && ./test_cpp11 >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/clang++ && clang++ -std=c++17 ../../test_cpp17_if.cpp -o test_cpp17_if  && ./test_cpp17_if >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/clang++ && clang++ -std=c++17 ../../test_cpp17_fs.cpp -o test_cpp17_fs  && ./test_cpp17_fs >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/clang++ && clang++ -std=c++17 ../../test_cpp17_optional.cpp -o test_cpp17_optional  && ./test_cpp17_optional >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/clang++ && clang++ -std=c++20 ../../test_cpp20.cpp -o test_cpp20  && ./test_cpp20 >> /dev/null"
	# ccache g++ tests
	@$(MAKE) run_test v=$(ubuntu_version) cmd="mkdir -p build/ccache"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ccache && ccache g++ ../../test.cpp -o test && ./test >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ccache && ccache g++ -std=c++11 ../../test_cpp11.cpp -o test_cpp11 && ./test_cpp11 >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ccache && ccache g++ -std=c++17 ../../test_cpp17_if.cpp -o test_cpp17_if  && ./test_cpp17_if >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ccache && ccache g++ -std=c++17 ../../test_cpp17_fs.cpp -o test_cpp17_fs  && ./test_cpp17_fs >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ccache && ccache g++ -std=c++17 ../../test_cpp17_optional.cpp -o test_cpp17_optional  && ./test_cpp17_optional >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ccache && ccache g++ -std=c++20 ../../test_cpp20.cpp -o test_cpp20  && ./test_cpp20 >> /dev/null"
	# cmake
	@$(MAKE) run_test v=$(ubuntu_version) cmd="mkdir -p build/cmake"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/cmake && cmake -DCMAKE_BUILD_TYPE=Release ../.. && cmake --build . --target TestCpp && ./TestCpp >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/cmake && cmake -DCMAKE_BUILD_TYPE=Release ../.. && cmake --build . --target TestCpp11 && ./TestCpp11 >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/cmake && cmake -DCMAKE_BUILD_TYPE=Release ../.. && cmake --build . --target TestCpp17_if && ./TestCpp17_if >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/cmake && cmake -DCMAKE_BUILD_TYPE=Release ../.. && cmake --build . --target TestCpp17_fs && ./TestCpp17_fs >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/cmake && cmake -DCMAKE_BUILD_TYPE=Release ../.. && cmake --build . --target TestCpp17_opt && ./TestCpp17_opt >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/cmake && cmake -DCMAKE_BUILD_TYPE=Release ../.. && cmake --build . --target TestCpp20 && ./TestCpp20 >> /dev/null"
	# ninja
	@$(MAKE) run_test v=$(ubuntu_version) cmd="mkdir -p build/ninja"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ninja && cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../.. && ninja TestCpp && ./TestCpp >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ninja && cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../.. && ninja TestCpp11 && ./TestCpp11 >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ninja && cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../.. && ninja TestCpp17_if && ./TestCpp17_if >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ninja && cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../.. && ninja TestCpp17_fs && ./TestCpp17_fs >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ninja && cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../.. && ninja TestCpp17_opt && ./TestCpp17_opt >> /dev/null"
	@$(MAKE) run_test v=$(ubuntu_version) cmd="cd build/ninja && cmake -GNinja -DCMAKE_BUILD_TYPE=Release ../.. && ninja TestCpp20 && ./TestCpp20 >> /dev/null"

run_test: ## Run command from the data folder ( usage : make run_test v=20.04 cmd="" )
	$(eval ubuntu_version := $(or $(v),$(latest)))
	$(eval cmd := $(cmd))
	@docker run --rm -t \
		-v $(DIR)/tests:/data \
		$(DOCKER_IMAGE):$(ubuntu_version) \
		bash -c "${cmd}"

push: ## Push ( usage : make push v=20.04 )
	$(eval ubuntu_version := $(or $(v),$(latest)))
	@$(MAKE) build v=$(node_version)
	@docker push $(DOCKER_IMAGE):$(ubuntu_version)

shell: ## Run shell ( usage : make shell v=20.04 )
	$(eval ubuntu_version := $(or $(v),$(latest)))
	@$(MAKE) build v=$(node_version)
	@docker run -it --rm \
		-v $(DIR)/tests:/data \
		$(DOCKER_IMAGE):$(ubuntu_version) \
		bash

remove: ## Remove all generated images
	@docker images | grep $(DOCKER_IMAGE) | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi $(DOCKER_IMAGE):{} || true
	@docker images | grep $(DOCKER_IMAGE) | tr -s ' ' | cut -d ' ' -f 3 | xargs -I {} docker rmi {} || true

readme: ## Generate docker hub full description
	@docker run -t --rm \
		-e DOCKER_USERNAME=${DOCKER_USERNAME} \
		-e DOCKER_PASSWORD=${DOCKER_PASSWORD} \
		-e DOCKER_IMAGE=${DOCKER_IMAGE} \
		-v $(DIR):/data \
		dsuite/hub-updater
