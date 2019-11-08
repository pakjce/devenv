#!/bin/bash
ENV_NAME=conda-py36-pt130
CONDA_ENV_NAME=py36-pt130

export PYTHON_ENV_DIR=$HOME/devenv/conda/envs/${CONDA_ENV_NAME}
export PS1="(${ENV_NAME}) $PS1"
export PATH=${PYTHON_ENV_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PYTHON_ENV_DIR}/lib

