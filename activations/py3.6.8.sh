#!/bin/bash
ENV_NAME=py3.6.8
export PYTHON_ENV_DIR=$HOME/devenv/pyenv/versions/3.6.8
export PS1="(${ENV_NAME}) $PS1"
export PATH=${PYTHON_ENV_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PYTHON_ENV_DIR}/lib

