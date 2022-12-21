#!/bin/sh
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"

create_env() {
    tf_package="tensorflow"
    read -p "Set up GPU support packages for Tensorflow (y/[n])? " choice

    case "$choice" in
        y|Y ) tf_package="tensorflow-gpu";;
        * ) echo "Skipping tensorflow-gpu setup.";;
    esac

    conda create --name tf_app python=3.9 $tf_package pylint
    conda activate tf_app
    pip install --upgrade pip
}

run() {
    conda activate tf_app
    python3 main.py "$@"
}

help() {
    echo
    echo "Usage: sh ./tf_app.sh {create_env|run}" >&2
    echo "   create_env         Create a Conda environment (named tf_app by default) and install necessary packages."
    echo "   run                Run the main Python script in the appropriate environment."
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
    * )
        printf 'Invalid action "%s"\n' "$subcmd" >&2
        exit 1;;
esac