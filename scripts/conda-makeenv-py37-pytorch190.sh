#!/usr/bin/env bash
set -ef -o pipefail

CONDA_ENV_NAME=py37-pt190
export PYTHON_ENV_DIR=$HOME/devenv/conda/envs/${CONDA_ENV_NAME}
export CONDA_ENV_DIR=$HOME/devenv/conda
export PATH=${CONDA_ENV_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${CONDA_ENV_DIR}/lib

echo "PYTHON_ENV_DIR: ${PYTHON_ENV_DIR}"

CONDA=${CONDA_ENV_DIR}/bin/conda

conda create -n ${CONDA_ENV_NAME} python=3.7

${CONDA} install -n ${CONDA_ENV_NAME} -y virtualenv numba cython numpy mkl mkl-include setuptools cmake scikit-learn \
 protobuf pytorch=1.9.0 torchvision==0.10.0 torchvision cudatoolkit=11.1 cudnn -c pytorch

# Install Essential Packages
${PYTHON_ENV_DIR}/bin/pip install awscli
${PYTHON_ENV_DIR}/bin/pip install dvc[s3]
${PYTHON_ENV_DIR}/bin/pip install pipenv
