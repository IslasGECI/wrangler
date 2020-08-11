FROM python:3.7
COPY . /workdir
WORKDIR /workdir
RUN pip install \
    autopep8 \
    black \
    codecov \
    flake8 \
    git+https://github.com/IslasGECI/descarga_datos.git@v0.1.0-beta \
    git+https://git@github.com/islasgeci/geoambiental@v0.1.0 \
    git+https://github.com/IslasGECI/toolboxes.git@8cc31845123eff4d30e37eb570f1adbabffdab96 \
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