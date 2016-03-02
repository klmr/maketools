# Example makefile with some dummy rules

.PHONY: all
## Make ALL the things
all: test deploy

.PHONY: build
build:
	${MAKE} -C build all

.PHONY: test
## Run unit tests
test: build
	./run-tests .

.PHONY: deply
## Deploy to production server
deploy: build
	./upload-to-server . $$SERVER_NAME

.PHONY: clean
## Remove temporary build files
clean:
	${MAKE} -C build clean

# Plonk the following at the end of your Makefile
.DEFAULT_GOAL := show-help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
.PHONY: show-help
show-help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n "/^## / { \
		h; \
		n; \
		s/:.*//; \
		G; \
		s/^/$$(tput setaf 6)/; \
		s/\\n## /$$(tput sgr0)---/; \
		p; \
	}" ${MAKEFILE_LIST} \
	| sort --ignore-case \
	| awk 'BEGIN {FS = "---"} { printf "%-30s\t%s\n", $$1, $$2 }'