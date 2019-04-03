#!/bin/bash
ENV_NAME=conda
export PYTHON_ENV_DIR=$HOME/devenv/conda
export PS1="(${ENV_NAME}) $PS1"
export PATH=${PYTHON_ENV_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PYTHON_ENV_DIR}/lib

