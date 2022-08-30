% main function
%
%  An electromechanically coupled beam, 
%  Dengpeng Huang @ LTD-FAU, August 2022.
%
%  Reference: Huang and Leyendecker. Computational Mechanics, 69(2022)(3):805-824.

clear all; clc; close all;
tic

% add paths
addpath('casadi-osx-matlabR2015a-v3.4.5'); % casadi library download from: https://web.casadi.org/get/
addpath('pre_post_processing'); addpath('integrator');

% initialization
a_ini;

% Residual R (discrete Euler-Lagrange equations) and Tangent K
fns = b_dEL_AD(param);

% solve dEL with Newton-Raphson scheme
res.Q = c_NR(param, fns); 
toc

% postprocessing
figure;
Hamilton; % plot the Hamiltonia total energy

figure;
Energy % plot the energy of the beam

figure;
plot_FE(res.Q(:,end), param, res, 'v') % plot displacement u/ electric potential v at state

figure;
plot_u % plot the displacement of the end node

% plot_FE_mov(res.Q, param)  % movie
