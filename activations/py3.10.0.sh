#!/bin/bash
ENV_NAME=py3.10.0
export PYTHON_ENV_DIR=$HOME/devenv/pyenv/versions/3.10.0
export PATH=${PYTHON_ENV_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PYTHON_ENV_DIR}/lib

