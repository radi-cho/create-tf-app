#!/bin/sh

run() {
    python3.9 main.py
}

help() {
    echo
    echo "Usage: sh ./tf-app.sh {run|tensorboard}" >&2
    echo "   run                Run the main python script in an appropriate environment."
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
        run)
                run;;
        *)
                printf 'Invalid action "%s"\n' "$subcmd" >&2
                exit 1
esac