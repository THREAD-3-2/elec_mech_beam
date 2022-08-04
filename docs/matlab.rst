.. _matlab:

=============
 MATLAB code
=============

This primitive example just shows how to document MATLAB code with Sphinx
using the `matlabdomain extension <https://github.com/sphinx-contrib/matlabdomain/blob/master/README.rst>`_.


src
========

.. mat:automodule:: src

:mod:`src` module contains the source code :
    
.. mat:autofunction:: src.main

The initial configuration and parameters are set firstly in:

.. mat:autoscript:: src.a_ini

The discrete Euler-Lagrange equations and tangents are derived using automatic differentiation in:

.. mat:autoscript:: src.b_dEL_AD

The dEL equaitons are solve with the Newton-Raphson scheme in:

.. mat:autoscript:: src.c_NR