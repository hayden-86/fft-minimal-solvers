function xvals = computeHiddenVars(Sprime, sj_prime, variable_pairs)
    r = size(variable_pairs,1);
    xvals = zeros(1,r);
    for k = 1:r
        p = variable_pairs(k,1);
        q = variable_pairs(k,2);

        Sprime_p = Sprime; Sprime_p(:,p) = sj_prime;
        Sprime_q = Sprime; Sprime_q(:,q) = sj_prime;

        det_p = det(Sprime_p);
        det_q = det(Sprime_q);

        xvals(k) = det_q / det_p;
    end
end