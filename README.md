# create-tf-app
Set up and maintain a machine learning project in Tensorflow with a single script.

Inspired by [create-react-app](https://github.com/facebook/create-react-app) and [create-ml-app](https://github.com/shreyashankar/create-ml-app). Made by [radi-cho](https://github.com/radi-cho).

## Usage

Make sure [Conda](https://docs.conda.io/en/latest/) is available on your device. Alternatively, if you don't need environment management, you can just use `main.py` as a template or edit `tf_app.sh` per your needs.

```sh
git clone https://github.com/radi-cho/create-tf-app.git tf_app
cd tf_app
sh ./tf_app.sh {create_env|run|lint|run_tensorboard}
```

- `create_env` - Create a Conda environment (named tf_app by default) and install necessary packages.
- `run` - Run `main.py` in the appropriate environment and pass any arguments to it.
- `lint` - Run [flake8](https://pypi.org/project/flake8/) linting for all `.py` files unless specific filenames are be provided.
- `run_tensorboard` - Run [Tensorboard](https://tensorboard.dev/) to visualize records in the ./logs directory.

If you need to edit your environment or execute specific commands in it, you can always enter it with `conda activate tf_app`.
