#!/usr/bin/env bash
set -ef -o pipefail

source ./activations/conda.sh
CONDA_ENV_NAME=py36-pt101

echo "PYTHON_ENV_DIR: ${PYTHON_ENV_DIR}"

CONDA=${PYTHON_ENV_DIR}/bin/conda

conda create -n ${CONDA_ENV_NAME} python=3.6

${CONDA} install -n ${CONDA_ENV_NAME} -y virtualenv numba cython numpy mkl mkl-include setuptools cmake scipy scikit-learn  pandas matplotlib protobuf jupyterlab jupyter pytorch=1.0.1 torchvision cudatoolkit=9.0 -c pytorch
