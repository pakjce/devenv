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
$HOME/devenv/conda/envs/${CONDA_ENV_NAME}/bin/pip install awscli dvc[s3] pipenv
