.. _ibvp:

===============================
 Initial boundary value problem
===============================

.. _general_ibvp:


General initial boundary value problem
--------------------------------------

The considered initial value problems are stated as
a system of first-order ordinary differential equations
defined via a function :math:`f`
together with an initial condition :math:`x_0`:

.. math::

    \begin{aligned}
        \dot{x} &= X(x) \\
        x(0) &= x_0
        \,.
    \end{aligned}

Here, :math:`x` is a function of time
which takes values in the state space :math:`\mathcal{X} = \mathbb{R}^n`,
for some :math:`n \in \mathbb{N}`.
The right hand side :math:`X \colon \mathcal{X} \rightarrow \mathcal{X}`
defines a vector field on :math:`\mathcal{X}`
since for a flat state space :math:`T \mathcal{X} \cong \mathcal{X}`.


.. _hamiltonian_ivp:

Initial boundary value problem
------------------------------

the canonical Hamiltonian structure of initial value problems of the form

.. math::

    \begin{aligned}
        \begin{bmatrix}
            \dot{q} \\
            \dot{p}
        \end{bmatrix}
        &=
        \begin{bmatrix}
            0 & 1 \\
            -1 & 0
        \end{bmatrix}
        \,
        \begin{bmatrix}
            \frac{\partial H(q, p)}{\partial q} \\
            \frac{\partial H(q, p)}{\partial p}
        \end{bmatrix}
        =
        \begin{bmatrix}
            +\frac{\partial H(q, p)}{\partial q} \\
            -\frac{\partial H(q, p)}{\partial p}
        \end{bmatrix}
        \\
        \begin{bmatrix}
            q(0) \\
            p(0)
        \end{bmatrix}
        &=
        \begin{bmatrix}
            q_0 \\
            p_0
        \end{bmatrix}
        \,.
    \end{aligned}

Here :math:`H \colon \mathcal{X} \rightarrow \mathbb{R}` is the Hamiltonian
which yields the sum of the kinetic energy and the potential energy of the system.
