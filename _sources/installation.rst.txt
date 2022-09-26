.. _installation:

==============
 Installation
==============

Virtual environment
===================

If you have a supported Python installation on your computer, you can
install the package in a virtual environment like so:

.. code-block:: bash

    # create a virtual environment (called venv)
    python3 -m venv venv

    # activate virtual environment
    . ./venv/bin/activate
    
    # install packages listed in `requirements.txt`, e.g. sphinx
    pip install -r requirements.txt
    
    # to build the documentation locally, run:
    cd docs
    make doctest # optionally check if your examples work
    make html

Library installation
=====================

In this code, the CasADi library is required to take the automatic differentiation. Firstly, download a proper version of the CasADi library from https://web.casadi.org/get/.
Then, save it in the source code folder "src". The path of the library is added in the code main.m as following:

.. code-block:: bash

    # add CasADi library path
    addpath('casadi-osx-matlabR2015a-v3.4.5');

'casadi-osx-matlabR2015a-v3.4.5' is a version for Mac OS, you can chose others according to your system.
