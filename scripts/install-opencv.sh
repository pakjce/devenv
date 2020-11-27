#!/usr/bin/env bash
set -ef -o pipefail

if [[ -z ${PYTHON_ENV_DIR} ]]; then
    echo "Please activate PYTHON_ENV_DIR!"
    exit 1
fi

OPENCV_VERSION=3.4.5

TMP_DIR=/tmp/opencv-install
TARGET_DIR=${PYTHON_ENV_DIR}

rm -rf ${TMP_DIR}
mkdir -p ${TMP_DIR}

cd ${TMP_DIR} && wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && unzip -q ${OPENCV_VERSION}.zip
cd ${TMP_DIR}/opencv-${OPENCV_VERSION} && mkdir build && cd build

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${TARGET_DIR}/lib
export LIBRARY_PATH=${LIBRARY_PATH}:${TARGET_DIR}/lib

cmake \
 -DCMAKE_CXX_FLAGS="-I ${TARGET_DIR}/lib/python3.6/site-packages/numpy/core/include -I ${TARGET_DIR}/include/python3.6m" \
 -D BUILD_NEW_PYTHON_SUPPORT=ON \
 -D BUILD_PROTOBUF=OFF \
 -D BUILD_opencv_dnn=OFF \
 -D BUILD_PYTHON_SUPPORT=ON \
 -D CMAKE_BUILD_TYPE=RELEASE \
 -D BUILD_PERF_TESTS=OFF \
 -D BUILD_TESTS=OFF \
 -D INSTALL_C_EXAMPLES=OFF \
 -D INSTALL_PYTHON_EXAMPLES=OFF \
 -D BUILD_EXAMPLES=OFF \
 -D CMAKE_INSTALL_PREFIX=${TARGET_DIR} \
 -D PYTHON_DEFAULT_EXECUTABLE=${TARGET_DIR}/bin/python3 \
 -D WITH_CUDA=OFF \
 -D WITH_EIGEN=ON \
 -D PYTHON_INCLUDE_DIR=${TARGET_DIR}/include:${TARGET_DIR}/include/python3.6m \
 -D PYTHON3_EXECUTABLE=${TARGET_DIR}/bin/python3 \
 -D PYTHON3_LIBRARY=${TARGET_DIR}/lib \
 -D PYTHON3_INCLUDE_DIR=${TARGET_DIR}/include/python3.6m \
 -D PYTHON3_NUMPY_INCLUDE_DIRS=${TARGET_DIR}/lib/python3.6/site-packages/numpy/core/include:${TARGET_DIR}/lib/python3.6/site-packages/numpy/core/include/numpy \
 -D PYTHON3_PACKAGES_PATH=${TARGET_DIR}/lib/python3.6/site-packages ..

make -j4 && make install
${TARGET_DIR}/bin/python3 -c "import cv2; print(cv2.__version__)"
