#!/usr/bin/env bash
set -ef -o pipefail

source ./activations/conda.sh
CONDA_ENV_NAME=py36-pt131-faiss140

echo "PYTHON_ENV_DIR: ${PYTHON_ENV_DIR}"

CONDA=${PYTHON_ENV_DIR}/bin/conda

conda create -n ${CONDA_ENV_NAME} python=3.6

${CONDA} install -n ${CONDA_ENV_NAME} -y virtualenv numba cython numpy mkl mkl-include setuptools uwsgi cmake scipy scikit-learn \
 pandas matplotlib protobuf jupyterlab jupyter pytorch=1.3.1 faiss-gpu=1.4.0 torchvision cudatoolkit=10.1 cudnn -c pytorch

# Install Essential Packages
${PYTHON_ENV_DIR}/bin/pip install awscli boto3 dvc pipenv docker-compose