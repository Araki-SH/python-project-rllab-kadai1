#!/bin/bash

PARENT_DIR=$(pwd|xargs dirname)

docker run --name kadai1mlp -it --rm -d --gpus all --ipc=host \
           --ulimit memlock=-1 --ulimit stack=67108864 \
           -v /tmp/.X11-unix:/tmp/.X11-unix: -v "${PARENT_DIR}":/home/"${USER}"/python-project-rllab-kadai1/Kadai1MLP \
           -e DISPLAY="${DISPLAY}" \
           -p 63322:63322 \
           -p 6006:6006 \
           -p 6007:6007 \
           kadai1mlp jupyter lab --config='./Kadai1MLP/jupyter_lab_config.py'
