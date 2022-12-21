# create-tf-app
Set up and maintain ML projects in Tensorflow by running a single script.

Inspired by [create-react-app](https://github.com/facebook/create-react-app) and [create-ml-app](https://github.com/shreyashankar/create-ml-app). Made by [radi-cho](https://github.com/radi-cho).

## Usage

```sh
git clone https://github.com/radi-cho/create-tf-app.git tf_app
cd tf_app
sh ./tf_app.sh {create_env|run|lint}
```

- `create_env` - Create a Conda environment (named tf_app by default) and install necessary packages.
- `run` - Run `main.py` in the appropriate environment and pass any arguments to it.
- `lint` - Run [flake8](https://pypi.org/project/flake8/) linting for all `.py` files unless specific filenames are be provided.
