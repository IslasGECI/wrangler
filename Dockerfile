FROM python:3.7
COPY . /workdir
WORKDIR /workdir
RUN pip install \
    autopep8 \
    black \
    codecov \
    flake8 \
    git+https://git@github.com/islasgeci/geoambiental@v0.1.0 \
    mutmut \
    numpy \
    pandas \
    pylint \
    pylint-fail-under \
    pytest-cov \
    pytest==5.0.1 \
    rope \
    scipy \
    utm
CMD make