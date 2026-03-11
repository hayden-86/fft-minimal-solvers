addpath ./problems
addpath ./multipol

iters = 5000;

%% Select problem
problemname = input('Enter the prob name ');
problem = eval(strcat('@',problemname));


%% Initialize result container
result = [];
result.all_res = [];
result.all_failed_res = [];
result.failures = 0;

%% load input coefficients
input_path = sprintf('../data/input_data/%s_%d.csv', func2str(problem), iters);
coef_data = readmatrix(input_path);

%% Load solver outputs
solsPath = sprintf('../data/output_data/our_sols/sols_%s_%d.csv', func2str(problem), iters); % iter, sol_index, x1_re, x1_im, x2_re, x2_im, x3_re, x3_im
A = readmatrix(solsPath);
ncols = size(A,2);
k = (ncols - 2) / 2;
iter_col  = A(:,1);
Z = zeros(size(A,1), k);
for j = 1:k
    re = A(:, 2 + 2*j - 1);
    im = A(:, 2 + 2*j);
    Z(:, j) = complex(re, im);
end
iter_unique = unique(iter_col);
PerIterSolutions = cell(numel(iter_unique),1);
for idx = 1:numel(iter_unique)
    m = (iter_col == iter_unique(idx));
    PerIterSolutions{idx} = Z(m, :);
end
    

%% Evaluate solver accuracy
for iter = 1:iters
%     if mod(iter, 200)==0
%         disp(iter);
%     end
    data = coef_data(iter, :)';
    sols = PerIterSolutions{iter}';
    [eqs,~] = problem(data);
    res = [];
    for sol = sols
        res = [res max(abs(evaluate(eqs, sol)))/norm(abs(sol))];
        res(res == 0) = 1e-20;
    end
    result.all_res = [result.all_res log10(res)];
    result.all_failed_res = [result.all_failed_res min(res)];
end


%% Save error statistics
output_path = "../data/output_data/";
error_file = "_errors_" + func2str(problem) + "_" + num2str(iters) + ".csv";
writematrix(result.all_res', output_path + "ours" + error_file);



%% Display evaluation results
disp("Average errors: ");
disp(mean(result.all_res));
disp("Median error: ");
disp(median(result.all_res));
threshold = 1e-3;
disp("Num: ");
disp(numel(result.all_failed_res));
failure_rate = sum(result.all_failed_res > threshold) / numel(result.all_failed_res);
disp("Failure rate: ");
disp(failure_rate * 100 + "%");




