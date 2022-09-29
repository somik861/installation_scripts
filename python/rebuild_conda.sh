#! /bin/bash
eval "$(conda shell.bash hook)"
conda deactivate
yes | conda remove -n py310 --all
yes | conda create -n py310 python=3.10
conda activate py310
pip3 install -r requirements.txt
