clearvars
close all
clc
addpath Support_functions

%% Problem definition
ll_x1 = 1.0; ul_x1 = 20;
ll_x2 = 0.1; ul_x2 = 5.0;

lb = [ll_x1 ll_x2]; % lower bounds for lambda , C
ub = [ul_x1 ul_x2]; % upper bounds for lambda , C

%% Optimization problem in NOMAD
global index

lb_n = [0 0]; % lower scaled bounds (usually between 0 and 1)
ub_n = [1 1]; % upper scaled bounds (usually between 0 and 1)

x0 = [0.5, 0.5];  % <--------------------------------------------------------- SET INITIAL GUESS HERE (scaled)

index = 0; % Initialize counter
param = {lb,ub}; % include additional parameters here

opts = nomadset('display_degree',2,'max_bb_eval',2000,'min_mesh_size','1e-3','bb_output_type','OBJ PB'); 
% Start optimization
[x_opt,f_opt] = nomad(@blackbox,x0,lb_n,ub_n,opts,param);

%% Visualize results
% RMSF(x_opt',param)

x0 = scaling(x0,lb,ub,2);
x_opt = scaling(x_opt',lb,ub,2);

fprintf('================================\n')
fprintf('SOLUTION\n')
fprintf('The optimizer is at x = [%f, %f]\n',x_opt(1),x_opt(2))
fprintf('The optimum function value is f = %f \n',f_opt)
fprintf('================================\n')