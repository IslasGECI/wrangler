all: README.html

README.html: README.md
	pandoc README.md -o README.html
	start "" /max "README.html"

.PHONY: import install tests

tests:
	coverage run -m unittest discover -s tests -v
	coverage html
	start "" /max "htmlcov/index.html"

import: install
	python -c "import datatools" && printf "\n\nÉXITO: Sí pude importar datatools\n\n" || { printf "\n\nERROR: No pude importar datatools\n\n"; exit 1; }

install:
	pip install .
