addpath ./problems
addpath ./multipol

iters = 5000;

%% Select problem
problemname = input('Enter the prob name ');
solv_name = char(problemname);
problem = eval(strcat('@',problemname));
[~,test_data,~] = problem();


%% Save generated input data
seed = 1;
rng(seed, 'twister');
num_coef=size(test_data,1);
coef_data = zeros(iters, num_coef);
for index = 1:iters
    coef_data(index, :) = randn(1, num_coef);
end

folder_path = '../data/input_data';
if ~exist(folder_path, 'dir')
    mkdir(folder_path);
end
input_path = sprintf('%s/%s_%d.csv', folder_path, func2str(problem), iters);

fid = fopen(input_path, 'w');
for i = 1:size(coef_data, 1)
    fprintf(fid, '%.16g,', coef_data(i, 1:end-1));
    fprintf(fid, '%.16g\n', coef_data(i, end));
end
fclose(fid);

disp("Input coefficient data generated successfully!");


