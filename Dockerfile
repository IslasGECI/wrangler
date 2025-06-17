FROM python:3.12
COPY . /workdir
WORKDIR /workdir
RUN pip install \
    autopep8 \
    black \
    codecov \
    flake8 \
    mutmut==2.5 \
    pylint \
    pylint-fail-under \
    pytest-cov \
    pytest
CMD make
