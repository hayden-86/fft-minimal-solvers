addpath('./configs');
addpath('./utils');

problem = input('Enter problem name: ', 's');
if isempty(problem)
    problem = 'problem_8ptF_radial_1s';
end

iters = 5000;
mode = 1; % Select mode: 1 = generic, 2 = standalone solver

run_solver(problem, iters, mode);
