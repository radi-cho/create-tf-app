#!/bin/sh
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"

env_name=tf_app
if [ ! -z "${TF_APP_ENV_NAME}" ]; then
  env_name="${TF_APP_ENV_NAME}"
fi

create_env() {
    tf_package="tensorflow"
    read -p "Set up GPU support packages for Tensorflow (y/[n])? " choice

    case "$choice" in
        y|Y ) tf_package="tensorflow-gpu";;
        * ) echo "Skipping tensorflow-gpu setup.";;
    esac

    conda create --name $env_name python=3.9 $tf_package
    activate_env

    pip install --upgrade pip
    pip install flake8 pyyaml h5py
}

activate_env() {
    conda activate $env_name
}

run() {
    activate_env
    python3 main.py "$@"
}

lint() {
    activate_env
    flake8 $@
}

run_tensorboard() {
    activate_env
    tensorboard --logdir=logs/ "$@"
}

help() {
    echo
    echo "Usage: sh ./tf_app.sh {create_env|run|lint|run_tensorboard}" >&2
    echo "    create_env         Create a Conda environment (named tf_app by default) and install necessary packages."
    echo "    run                Run main.py in the appropriate environment and pass any arguments to it."
    echo "    lint               Run flake8 linting for all .py files unless specific filenames are be provided."
    echo "    run_tensorboard    Run Tensorboard to visualize records in the ./logs directory."
    echo

    exit 0
}

cmd=${0##*/}
subcmd=

if [ -z "$subcmd" ] && [ "$#" -ge 1 ]; then
    subcmd=$1
    shift
fi

if [ -z "$subcmd" ]; then
    help
    exit 1
fi

case $subcmd in
    create_env )
        create_env;;
    run )
        run "$@";;
    lint )
        lint "$@";;
    run_tensorboard )
        run_tensorboard "$@";;
    * )
        printf 'Invalid action "%s"\n' "$subcmd" >&2
        exit 1;;
esac
