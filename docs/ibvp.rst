.. _ibvp:

===============================
 Initial boundary value problem
===============================

.. _mech_ibvp:


Balance equations
------------------

The local balance law of linear momentum in the dynamic process is given by

.. math::

    \begin{align}
        \nabla_{\mathbf{X}} \cdot \mathbf{P} + \rho_0 \bar{\mathbf{b}} =\rho_0\mathbf{\ddot{u}} \qquad {\rm in} \quad B
        \,.
    \end{align}

subject to the Dirichlet boundary conditions

.. math::

    \begin{align}
        \mathbf{u}&=\bar{\mathbf{u}} \qquad {\rm on} \quad \partial_{u} B,
        \,.
    \end{align}

the Neumann boundary conditions

.. math::

    \begin{align}
        \mathbf{P}\cdot \mathbf{N}&=\bar{\mathbf{T}} \qquad {\rm on} \quad \partial_{\sigma} B,
        \,.
    \end{align}

and the initial conditions

.. math::

    \begin{align}
        \mathbf{\dot{u}}=\mathbf{0},\mathbf{\ddot{u}}=\mathbf{0},
    \end{align}

where :math:`\mathbf{P}` is the first Piola-Kirchhoff stress tensor, :math:`\rho_0` is the mass density in initial configuration,
:math:`\bar{\mathbf{b}}` is the body force vector, :math:`\mathbf{\ddot{u}}` is the acceleration, :math:`\bar{\mathbf{u}}` is the prescribed displacement and 
:math:`\bar{\mathbf{T}}` is the prescribed traction. The local balance of angular momentum reads

.. math::

    \begin{align}
        \mathbf{F}\mathbf{P}^T = \mathbf{P}\mathbf{F}^T,
    \end{align}

in which :math:`\mathbf{F}` is the deformation gradient defined as :math:`\mathbf{F}=\partial\mathbf{x}(\mathbf{X},t)/ \partial \mathbf{X}`.

.. _elec_ibvp:

Maxwell equations
------------------------------

By neglecting the magnetic field, the Maxwell equations are given by

.. math::

    \begin{align}
        \nabla_{\mathbf{X}} \times \mathbf{E}^e=\mathbf{0}, \;\;\;\; \nabla_{\mathbf{X}} \cdot \mathbf{D}=0 \qquad {\rm in} \quad B \label{ED}
        \,
    \end{align}

subject to the Dirichlet boundary conditions

.. math::

    \begin{align}
        \phi&=\bar{\phi} \qquad {\rm on} \quad \partial_{\phi} B
        \,
    \end{align}

and the Neumann boundary conditions

.. math::

    \begin{align}
        \mathbf{D}\cdot \mathbf{N}&=\bar{Q} \qquad {\rm on} \quad \partial_D B
        \,
    \end{align}

with :math:`\mathbf{E}^e` the electric field, :math:`\mathbf{D}` the electric displacement in the initial configuration, 
:math:`\phi` the electric potential, :math:`\bar{\phi}` the prescribed electric potential, :math:`\mathbf{N}` the outward unit normal vector
and :math:`\bar{Q}` the prescribed charges per unit area on the boundary :math:`\partial_D B`. 
The Eq. (\ref{ED}) leads to the definition of the electric field as the gradient of a scalar electric potential

.. math::

    \begin{align} 
        \mathbf{E}^e=-\frac{\partial \phi}{\partial \mathbf{X}}. \label{E}
    \end{align}
