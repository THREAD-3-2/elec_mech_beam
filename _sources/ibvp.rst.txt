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
    \end{align}

subject to the Dirichlet boundary conditions

.. math::

    \begin{align}
        \mathbf{u}&=\bar{\mathbf{u}} \qquad {\rm on} \quad \partial_{u} B,
    \end{align}

the Neumann boundary conditions

.. math::

    \begin{align}
        \mathbf{P}\cdot \mathbf{N}&=\bar{\mathbf{T}} \qquad {\rm on} \quad \partial_{\sigma} B
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
        \nabla_{\mathbf{X}} \times \mathbf{E}^e=\mathbf{0}, \;\;\;\; \nabla_{\mathbf{X}} \cdot \mathbf{D}=0 \qquad {\rm in} \quad B
    \end{align}

subject to the Dirichlet boundary conditions

.. math::

    \begin{align}
        \phi&=\bar{\phi} \qquad {\rm on} \quad \partial_{\phi} B
    \end{align}

and the Neumann boundary conditions

.. math::

    \begin{align}
        \mathbf{D}\cdot \mathbf{N}&=\bar{Q} \qquad {\rm on} \quad \partial_D B
    \end{align}

with :math:`\mathbf{E}^e` the electric field, :math:`\mathbf{D}` the electric displacement in the initial configuration, 
:math:`\phi` the electric potential, :math:`\bar{\phi}` the prescribed electric potential, :math:`\mathbf{N}` the outward unit normal vector
and :math:`\bar{Q}` the prescribed charges per unit area on the boundary :math:`\partial_D B`. 
The Maxwell equations introduced above lead to the definition of the electric field as the gradient of a scalar electric potential

.. math::

    \begin{align} 
        \mathbf{E}^e=-\frac{\partial \phi}{\partial \mathbf{X}}.
    \end{align}

.. _em_ibvp:

Electromechanical coupling
---------------------------

When the external electric field is imposed to the body of dielectric elastomer, the contractive pressure will be induced due to 
the polarization effects and thus the deformation of the body will be generated. The coupling effect between the electric field 
and the mechanical deformation is described by the strain energy function $\Omega(\mathbf{F}, \mathbf{E}^e)$ of the dielectric material 
in the constitutive equations

.. math::

    \begin{align}
        \mathbf{D}=-\rho_0\frac{\partial \Omega(\mathbf{F}, \mathbf{E}^e)}{\partial \mathbf{E}^e},  \;\;\;\;  \mathbf{P}=\rho_0\frac{\partial \Omega(\mathbf{F}, \mathbf{E}^e)}{\partial \mathbf{F}}.
    \end{align}

For the dielectric materials, the electromechanical coupling can be described by the strain energy function with the additive form

.. math::

    \begin{align}
        \Omega(\mathbf{F}, \mathbf{E}^e) = \Omega^m (\mathbf{F}) + \Omega^{\rm em}(\mathbf{F}, \mathbf{E}^e)  + \Omega^e( \mathbf{E}^e),
    \end{align}

with :math:`\Omega^m (\mathbf{F})` referring to the purely mechanical behavior, :math:`\Omega^{\rm em}(\mathbf{F}, \mathbf{E}^e)` referring 
to the electomechanical coupling and :math:`\Omega^e( \mathbf{E}^e)` referring to the pure electric behavior. Accordingly, the first Piola-Kirchhoff 
stress can be written as two parts

.. math::

    \begin{align}
        \mathbf{P}=\rho_0\frac{\partial \Omega^m}{\partial \mathbf{F}}+\rho_0\frac{\partial \Omega^{em}}{\partial \mathbf{F}}.
    \end{align}


.. _kinematics_ibvp:

Beam kinematics
---------------

here: kinematics


.. _strainenergy_ibvp:

Beam free energy function
-------------------------

here: strain energy for beam
