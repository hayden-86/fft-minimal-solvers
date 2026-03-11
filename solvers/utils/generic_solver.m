function out = generic_solver(data, config)
    % Generic solver implementation (problem-independent)
    Deg_S = config.Deg_S;
    deleted_row = config.deleted_row;
    deleted_col = config.deleted_col;
    variable_pairs = config.variable_pairs;


    % Build coefficient matrices
    CoefList = config.build_coef(data);

    % [Coef_low, Coef_mid, Coef_high] = ori_coef_eval(CoefList, config);   
%     tic;
    [Coef_low, Coef_mid, Coef_high] = fast_coef_eval(CoefList, config);

    Coef = [Coef_low(1:config.thre_low), ...
            Coef_mid(config.thre_low+1:config.thre_high), ...
            Coef_high(config.thre_high+1:end)];
    Coef = real(Coef(:).');
    Coef = [Coef, zeros(1, Deg_S+1 - length(Coef))];
%     elapsed = toc;
    % === Root finding ===
%     tic;    
    x_all_roots = roots(fliplr(Coef));
%     elapsed1 = toc;

    % === Back-substitution of hidden variables ===
    sols = cell(1,Deg_S);
    for i = 1:Deg_S
        x = x_all_roots(i);
        S_eval = 0;
        for d = 1:length(CoefList)
            S_eval = S_eval + CoefList{d} * (x^(d-1));
        end

        n = size(S_eval,1);
        if deleted_row == 1 && deleted_col == 1
            Sprime  = S_eval(2:n, 2:n);
            sj_prime = -S_eval(2:n, 1);
        else
            rows = true(1,n); rows(deleted_row) = false;
            cols = true(1,n); cols(deleted_col) = false;
            Sprime  = S_eval(rows, cols);
            sj_prime = -S_eval(rows, deleted_col);
        end
     
        xvals = computeHiddenVars(Sprime, sj_prime, variable_pairs);
        sol = zeros(1, config.num_vars);
        for kk = 1:(config.num_vars-1)
            sol(config.unhidden_vars_indices(kk)) = xvals(kk);
        end
    
        % Fill hidden var
        sol(config.hidden_var_index) = x;
        sols{i} = sol;
    end

    % === Residual filtering (only if necessary) ===
    if isfield(config, 'check_eqs') && isfield(config, 'num_real_sols')
        if config.Deg_S > config.num_real_sols
            residuals = zeros(1, numel(sols));
            for i = 1:numel(sols)
                try
                    eqs = config.check_eqs(sols{i}, data);
                    residuals(i) = max(abs(eqs));
                catch
                    residuals(i) = inf;
                end
            end
            [~, idx] = sort(residuals);
            keepk = min(config.num_real_sols, numel(idx));
            sols = sols(idx(1:keepk));
        end
    end
    out.sols = sols;
%     out.time_ratio1 = elapsed/(elapsed+elapsed1);
%     out.time_ratio2 = elapsed1/(elapsed+elapsed1);
end

function [Coef_low, Coef_mid, Coef_high] = fast_coef_eval(CoefList, config)
    n     = config.Deg_S + 1;        % number of sampling points
    num_d = length(CoefList);        % polynomial degree + 1
    S_stack = cat(3, CoefList{:});   % (m, m, num_d)

    % === Rho values ===
    rho_list = [config.rho1, 1, config.rho2];
    Coef_all = cell(1, 3);

    % === Main loop over rho values ===
%     tic;
    for rr = 1:3
        rho = rho_list(rr);
        if rho == 0
            Coef_all{rr} = [];
            continue;
        end
        if rho == 1
            S_stack_scaled = S_stack;
        else
            rho_power = reshape(rho.^(0:(num_d-1)), 1, 1, []); % (1,1,num_d)
            S_stack_scaled = S_stack .* rho_power;  
        end     
        S_fft = fft(S_stack_scaled, n, 3);   % (m,m,n)
        Y = zeros(1, n);
        for k = 1:n
            Y(k) = det(S_fft(:,:,k));
        end
        Coef = ifft(Y);
        if rho ~= 1
            j = 0:(n-1);
            Coef = Coef ./ (rho .^ j);
        end
        Coef_all{rr} = Coef;
    end

    % === Assign outputs ===
    Coef_low  = Coef_all{1};
    Coef_mid  = Coef_all{2};
    Coef_high = Coef_all{3};
end
