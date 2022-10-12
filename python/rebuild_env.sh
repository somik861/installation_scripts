#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

trap '__abort' 0

PYTHON_V=3.10
ENV_NAME=py310

eval "$(conda shell.bash hook)"

if conda env list | grep -q "${ENV_NAME}.*\*"; then
    conda deactivate
fi
if conda env list | grep -q "${ENV_NAME}"; then
    conda remove -y -n  "${ENV_NAME}" --all
fi

conda create -y -n ${ENV_NAME} python=${PYTHON_V}
conda activate ${ENV_NAME}
pip3 install -r python/requirements.txt

sed -i "/conda activate ${ENV_NAME}/d" $SHELL_RC
echo "conda activate ${ENV_NAME}" >> $SHELL_RC

trap : 0
