#!/bin/sh

# Create virtual environment if required
test -e venv/bin/pip3 \
|| python3 -m venv venv

# Install or update dependencies 
venv/bin/pip3 install --upgrade \
    dataclasses-json \
    numpy \
    scipy \
    solidpython

# Generate config if required
test -e run_config.json \
|| venv/bin/python3 src/generate_configuration.py

# Build things
venv/bin/python3 src/dactyl_manuform.py
cp ../things/* things/
