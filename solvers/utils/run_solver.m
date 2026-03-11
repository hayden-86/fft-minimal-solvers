function run_solver(problem, iters, mode)

    %% Input and output paths
    input_file = fullfile('../data/input_data', [problem '_' num2str(iters) '.csv']);
    solution_file = fullfile('../data/output_data/our_sols', ['sols_' problem '_' num2str(iters) '.csv']);

    if ~isfile(input_file)
        error('Input file not found: %s', input_file);
    end

    dataset = readmatrix(input_file);
    [loops, ~] = size(dataset);
    runtime_all = zeros(loops,1);
%     runtime_stage1_ratio = zeros(loops,1);
%     runtime_stage2_ratio = zeros(loops,1);


    %% Ensure output directory exists
    if ~exist(fileparts(solution_file), 'dir')
        mkdir(fileparts(solution_file));
    end

    fid = fopen(solution_file,'w');
    if fid < 0
        error('Cannot open file: %s', solution_file);
    end

    fprintf('Running %s in mode %d ...\n', problem, mode);
    

    %% Run solver
    for it = 1:loops
        sample = dataset(it,:);
        if mode == 1
            % === Generic solver mode ===
            config_func = str2func([problem '_config']);
            config = config_func();
            tic;
            solver_result = generic_solver(sample, config);
            elapsed = toc;
            runtime_all(it) = elapsed;
%             runtime_stage1_ratio(it) = solver_result.time_ratio1;
%             runtime_stage2_ratio(it) = solver_result.time_ratio2;
        elseif mode == 2
            % === Standalone solver mode ===
            solver_func = str2func([problem '_solver']);
            solver_result = solver_func(sample);
        else
            error('Invalid mode: %d. Use 1 (generic) or 2 (standalone).', mode);
        end

        % Write results to file
        for s = 1:length(solver_result.sols)
            sol = solver_result.sols{s};
            fprintf(fid, '%d,%d', it-1, s-1);
            for j = 1:length(sol)
                fprintf(fid, ',%.18g,%.18g', real(sol(j)), imag(sol(j)));
            end
            fprintf(fid, '\n');
        end
    end
    fclose(fid);
%     mean_runtime_stage1_ratio = mean(runtime_stage1_ratio);
%     mean_runtime_stage2_ratio = mean(runtime_stage2_ratio);
    mean_runtime = mean(runtime_all);
%     fprintf('Average runtime breakdown:\n');
%     fprintf('  Stage 1 (interpolation) ratio : %.4f\n', mean_runtime_stage1_ratio);
%     fprintf('  Stage 2 (solver) ratio        : %.4f\n', mean_runtime_stage2_ratio);
    fprintf('Average runtime per instance: %.6f seconds\n', mean_runtime);
    fprintf('Results saved to: %s\n', solution_file);

end
