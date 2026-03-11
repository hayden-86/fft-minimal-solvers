function config = problem_8ptF_radial_1s_config()
    config.Deg_S = 8;
    config.deleted_row = 1;
    config.deleted_col = 1;
    config.variable_pairs = [[1,2]];
    config.rho1 = 0;
    config.rho2 = 0;
    config.thre_low  = 0; 
    config.thre_high = 9;
    config.num_real_sols = 8;
    config.num_vars = 2;
    config.hidden_var_index = 2;
    config.unhidden_vars_indices = [1];
    config.build_coef = @(data) build_coef(data);
end

function CoefList = build_coef(data)
    c = data(:);
    c1=c(1); c2=c(2); c3=c(3); c4=c(4); c5=c(5); c6=c(6); c7=c(7); c8=c(8); 
    c9=c(9); c10=c(10); c11=c(11); c12=c(12); c13=c(13); c14=c(14); c15=c(15);
    c16=c(16); c17=c(17); c18=c(18); c19=c(19); c20=c(20); c21=c(21); c22=c(22);
    c23=c(23); c24=c(24); c25=c(25); c26=c(26); c27=c(27); c28=c(28); c29=c(29);
    c30=c(30); c31=c(31); c32=c(32);

    Coef1 = [c12 * c16 * c28 - c12 * c20 * c24 - c16 * c8 + c20 * c4, c11 * c16 * c28 - c11 * c20 * c24 + c12 * c15 * c28 + c12 * c16 * c27 - c12 * c19 * c24 - c12 * c20 * c23 - c8 * c15 - c16 * c7 + c19 * c4 + c20 * c3 + c8 * c24 - c28 * c4, c11 * c15 * c28 + c11 * c16 * c27 - c11 * c19 * c24 - c11 * c20 * c23 + c12 * c15 * c27 - c12 * c19 * c23 - c15 * c7 + c19 * c3 + c8 * c23 + c24 * c7 - c27 * c4 - c28 * c3, c11 * c15 * c27 - c11 * c19 * c23 + c23 * c7 - c27 * c3;
    -c32, -c31, 0, 0;
    0, -c32, -c31, 0;
    0, 0, -c32, -c31];

    Coef2 = [c10 * c16 * c28 - c10 * c20 * c24 + c12 * c14 * c28 + c12 * c16 * c26 - c12 * c18 * c24 - c12 * c20 * c22 - c8 * c14 - c16 * c6 + c18 * c4 + c20 * c2, c10 * c15 * c28 + c10 * c16 * c27 - c10 * c19 * c24 - c10 * c20 * c23 + c11 * c14 * c28 + c11 * c16 * c26 - c11 * c18 * c24 - c11 * c20 * c22 + c12 * c13 * c28 + c12 * c14 * c27 + c12 * c15 * c26 + c12 * c16 * c25 - c12 * c17 * c24 - c12 * c18 * c23 - c12 * c19 * c22 - c12 * c20 * c21 + c16 * c28 * c9 - c20 * c24 * c9 + c20 * c1 - c8 * c13 - c14 * c7 - c15 * c6 - c16 * c5 + c17 * c4 + c18 * c3 + c19 * c2 - c28 * c2 + c8 * c22 + c24 * c6 - c26 * c4, c10 * c15 * c27 - c10 * c19 * c23 + c11 * c13 * c28 + c11 * c14 * c27 + c11 * c15 * c26 + c11 * c16 * c25 - c11 * c17 * c24 - c11 * c18 * c23 - c11 * c19 * c22 - c11 * c20 * c21 + c12 * c13 * c27 + c12 * c15 * c25 - c12 * c17 * c23 - c12 * c19 * c21 + c15 * c28 * c9 + c16 * c27 * c9 - c19 * c24 * c9 - c20 * c23 * c9 + c19 * c1 - c1 * c28 - c13 * c7 - c15 * c5 + c17 * c3 - c27 * c2 + c8 * c21 + c22 * c7 + c23 * c6 + c24 * c5 - c25 * c4 - c26 * c3, c11 * c13 * c27 + c11 * c15 * c25 - c11 * c17 * c23 - c11 * c19 * c21 + c15 * c27 * c9 - c19 * c23 * c9 - c27 * c1 + c21 * c7 + c23 * c5 - c25 * c3;
    c12 - c30, c11 - c29, 0, 0;
    0, c12 - c30, c11 - c29, 0;
    0, 0, c12 - c30, c11 - c29];

    Coef3 = [c10 * c14 * c28 + c10 * c16 * c26 - c10 * c18 * c24 - c10 * c20 * c22 + c12 * c14 * c26 - c12 * c18 * c22 - c14 * c6 + c18 * c2, c10 * c13 * c28 + c10 * c14 * c27 + c10 * c15 * c26 + c10 * c16 * c25 - c10 * c17 * c24 - c10 * c18 * c23 - c10 * c19 * c22 - c10 * c20 * c21 + c11 * c14 * c26 - c11 * c18 * c22 + c12 * c13 * c26 + c12 * c14 * c25 - c12 * c17 * c22 - c12 * c18 * c21 + c14 * c28 * c9 + c16 * c26 * c9 - c18 * c24 * c9 - c20 * c22 * c9 + c18 * c1 - c13 * c6 - c14 * c5 + c17 * c2 - c26 * c2 + c22 * c6, c10 * c13 * c27 + c10 * c15 * c25 - c10 * c17 * c23 - c10 * c19 * c21 + c11 * c13 * c26 + c11 * c14 * c25 - c11 * c17 * c22 - c11 * c18 * c21 + c12 * c13 * c25 - c12 * c17 * c21 + c13 * c28 * c9 + c14 * c27 * c9 + c15 * c26 * c9 + c16 * c25 * c9 - c17 * c24 * c9 - c18 * c23 * c9 - c19 * c22 * c9 - c20 * c21 * c9 + c17 * c1 - c26 * c1 - c13 * c5 - c25 * c2 + c21 * c6 + c22 * c5, c11 * c13 * c25 - c11 * c17 * c21 + c13 * c27 * c9 + c15 * c25 * c9 - c17 * c23 * c9 - c19 * c21 * c9 - c25 * c1 + c21 * c5;
    c10, c9, 0, 0;
    0, c10, c9, 0;
    0, 0, c10, c9];

    Coef4 = [c10 * c14 * c26 - c10 * c18 * c22, c10 * c13 * c26 + c10 * c14 * c25 - c10 * c17 * c22 - c10 * c18 * c21 + c14 * c26 * c9 - c18 * c22 * c9, c10 * c13 * c25 - c10 * c17 * c21 + c13 * c26 * c9 + c14 * c25 * c9 - c17 * c22 * c9 - c18 * c21 * c9, c13 * c25 * c9 - c17 * c21 * c9;
    0, 0, 0, 0;
    0, 0, 0, 0;
    0, 0, 0, 0];
    
    CoefList = {Coef1, Coef2, Coef3, Coef4};
end
