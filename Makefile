all: mutants

repo = metadata_wrangler
codecov_token = 92c09c8a-f80e-4220-af6d-1b8bb79be8f1

.PHONY: all clean format install lint mutants tests

clean:
	rm --force .mutmut-cache
	rm --recursive --force ${repo}.egg-info
	rm --recursive --force ${repo}/__pycache__
	rm --recursive --force ${repo}/**/__pycache__
	rm --recursive --force tests/__pycache__

check:
	black --check --line-length 100 ${repo}
	black --check --line-length 100 tests
	flake8 --max-line-length 100 ${repo}
	flake8 --max-line-length 100 tests

format:
	black --line-length 100 ${repo}
	black --line-length 100 tests

init: init_git setup tests
	
init_git:
	git config --global --add safe.directory /workdir
	git config --global user.name "Ciencia de Datos • GECI"
	git config --global user.email "ciencia.datos@islas.org.mx"

install:
	pip install --editable .

lint:
	flake8 --max-line-length 100 ${repo}
	flake8 --max-line-length 100 tests
	pylint ${repo}
	pylint tests

mutants: install
	mutmut run --paths-to-mutate ${repo}

coverage: install
	pytest --cov=${repo} --cov-report=xml --verbose && \
	codecov --token=${codecov_token}

setup: clean install

tests:
	pytest --verbose

red: format
	pytest --verbose \
	&& git restore tests/*.py \
	|| (git add tests/*.py && git commit -m "🛑🧪 Fail tests")
	chmod g+w -R .

green: format
	pytest --verbose \
	&& (git add ${repo}/*.py && git commit -m "✅ Pass tests") \
	|| git restore ${repo}/*.py
	chmod g+w -R .

refactor: format
	pytest --verbose \
	&& (git add ${repo}/*.py tests/*.py && git commit -m "♻️ Refactor ${message}") \
	|| git restore ${repo}/*.py tests/*.py
	chmod g+w -R .

import: install
	python -c "import metadata_wrangler" && printf "\n\nÉXITO: Sí pude importar datatools\n\n" || { printf "\n\nERROR: No pude importar datatools\n\n"; exit 1; }
