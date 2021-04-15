#!/usr/bin/env bash
set -ef -o pipefail

source ./activations/conda.sh
CONDA_ENV_NAME=py37-lens-index-builder
FAISS_VERSION=1.6.3

echo "PYTHON_ENV_DIR: ${PYTHON_ENV_DIR}"

CONDA=${PYTHON_ENV_DIR}/bin/conda

conda create -n ${CONDA_ENV_NAME} python=3.7

${CONDA} install -n ${CONDA_ENV_NAME} -y uwsgi -c conda-forge
${CONDA} install -n ${CONDA_ENV_NAME} -y virtualenv numba cython numpy \
    mkl mkl-include setuptools \
    matplotlib protobuf faiss-gpu=${FAISS_VERSION} cudatoolkit=10.1 cudnn wheel -c pytorch 

# Install Essential Packages
${PYTHON_ENV_DIR}/bin/pip install awscli
${PYTHON_ENV_DIR}/bin/pip install dvc[s3]
${PYTHON_ENV_DIR}/bin/pip install pipenv
