#! /bin/bash

source src_common.sh
source utils/src_init_shell.sh

trap '__abort' 0

PYTHON_V=3.10
ENV_NAME=napari-env

eval "$(conda shell.bash hook)"
conda update -y -n base -c defaults conda

if conda env list | grep -q "${ENV_NAME}.*\*"; then
    conda deactivate
fi
if conda env list | grep -q "${ENV_NAME}"; then
    conda remove -y -n  "${ENV_NAME}" --all
fi

conda create -y -n ${ENV_NAME} python=${PYTHON_V}
conda activate ${ENV_NAME}
pip3 install 'napari[all]' imagecodecs napari-bioformats imageio_ffmpeg
conda deactivate

cat << EOF > "${HOME}/.napari_rc"
#!/bin/bash

function napari {
    conda activate ${ENV_NAME}
    python -m napari \$*
    conda deactivate
}
EOF

_TO_INPUT="source \${HOME}/.napari_rc"
if ! grep -qx "${_TO_INPUT}" "${SHELL_RC}"; then
    echo "${_TO_INPUT}" >> "${SHELL_RC}"
fi

trap : 0
