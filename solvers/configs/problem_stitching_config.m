function config = problem_stitching_config()
    config.Deg_S = 18;
    config.deleted_row = 1;
    config.deleted_col = 1;
    config.variable_pairs = [[1,2]];
    config.rho1 = 0;
    config.rho2 = 0;
    config.thre_low  = 0; 
    config.thre_high = 19; 
    config.num_real_sols = 18;
    config.num_vars = 2;
    config.hidden_var_index = 1;
    config.unhidden_vars_indices = [2];
    config.build_coef = @(data) build_coef(data);
end

function CoefList = build_coef(data)
    c = data(:);
    c1=c(1); c2=c(2); c3=c(3); c4=c(4); c5=c(5); c6=c(6); c7=c(7); c8=c(8);
    c9=c(9); c10=c(10); c11=c(11); c12=c(12); c13=c(13); c14=c(14); c15=c(15);
    c16=c(16); c17=c(17); c18=c(18); c19=c(19); c20=c(20); c21=c(21); c22=c(22);
    c23=c(23); c24=c(24); c25=c(25); c26=c(26); c27=c(27); c28=c(28); c29=c(29);
    c30=c(30); c31=c(31); c32=c(32); 

    Coef1 = [
        c16, c15, c14, c13, 0, 0;
        0, c16, c15, c14, c13, 0;
        0, 0, c16, c15, c14, c13;
        c32, c31, c30, c29, 0, 0;
        0, c32, c31, c30, c29, 0;
        0, 0, c32, c31, c30, c29];
    Coef2 = [
        0, c12, c11, c10, 0, 0;
        0, 0, c12, c11, c10, 0;
        0, 0, 0, c12, c11, c10;
        0, c28, c27, c26, 0, 0;
        0, 0, c28, c27, c26, 0;
        0, 0, 0, c28, c27, c26];
    Coef3 = [
        0, c9, c8, c7, 0, 0;
        0, 0, c9, c8, c7, 0;
        0, 0, 0, c9, c8, c7;
        0, c25, c24, c23, 0, 0;
        0, 0, c25, c24, c23, 0;
        0, 0, 0, c25, c24, c23];
    Coef4 = [
        0, 0, c6, c5, 0, 0;
        0, 0, 0, c6, c5, 0;
        0, 0, 0, 0, c6, c5;
        0, 0, c22, c21, 0, 0;
        0, 0, 0, c22, c21, 0;
        0, 0, 0, 0, c22, c21];
    Coef5 = [
        0, 0, c4, c3, 0, 0;
        0, 0, 0, c4, c3, 0;
        0, 0, 0, 0, c4, c3;
        0, 0, c20, c19, 0, 0;
        0, 0, 0, c20, c19, 0;
        0, 0, 0, 0, c20, c19];
    Coef6 = [
        0, 0, 0, c2, 0, 0;
        0, 0, 0, 0, c2, 0;
        0, 0, 0, 0, 0, c2;
        0, 0, 0, c18, 0, 0;
        0, 0, 0, 0, c18, 0;
        0, 0, 0, 0, 0, c18];
    Coef7 = [
        0, 0, 0, c1, 0, 0;
        0, 0, 0, 0, c1, 0;
        0, 0, 0, 0, 0, c1;
        0, 0, 0, c17, 0, 0;
        0, 0, 0, 0, c17, 0;
        0, 0, 0, 0, 0, c17];

    
    CoefList = {Coef1, Coef2, Coef3, Coef4, Coef5, Coef6, Coef7};
end
