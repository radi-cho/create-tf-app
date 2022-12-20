from setuptools import setup, find_packages

setup(
    name='tf-app',
    version='0.1',
    packages=find_packages(exclude=['tests']),
    install_requires=[
        'pylint',
        'tensorflow',
        'tensorboard'
    ]
)