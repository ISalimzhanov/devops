# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build
PYTHON := python3
DOCKER_IMAGE := 41694/devops_lab1:latest

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

.PHONY: test
test:
	poetry run pytest

.PHONY: install
install:
	$(PYTHON) -m pip install wheel setuptools
	poetry export -f requirements.txt --output requirements.txt --without-hashes
	$(PYTHON) -m pip install -r requirements.txt

.PHONY: lint
lint:
	poetry run pre-commit run --all-files

.PHONY: docker-build
docker-build:
	docker build . -t $(DOCKER_IMAGE)

.PHONY: build
docker-build:
	poetry build

.PHONY: publish
docker-build:
	poetry publish


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
