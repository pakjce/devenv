TMP_DIR=/tmp/conda-install
TARGET_DIR=${HOME}/devenv/conda

rm -rf ${TMP_DIR}
#rm -rf ${TARGET_DIR}
mkdir -p ${TMP_DIR}

wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ${TMP_DIR}/miniconda.sh && \
/bin/bash ${TMP_DIR}/miniconda.sh -b -p ${TARGET_DIR} && \
rm ${TMP_DIR}/miniconda.sh

CONDA=${TARGET_DIR}/bin/conda
${CONDA} install -y -p ${TARGET_DIR} python=3.6 && ${CONDA} clean -a -y