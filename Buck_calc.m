function [Results] = Buck_calc(Conv_param, FET_param, Ins_param)

%input Conv_param = [U_in U_out I_out freq]
%input FET_param = [R_dson t_rise t_fall Rth_jtc U_sd I_sd]
%input Ins_param a szigetel? lapka h?ellenállása
%results = [P_cond_T_avg P_cond_T_max P_cond_D_avg P_cond_D_max T_juct I_rms_T I_rms_D Conv_eff]

    U_in = Conv_param(1);
    U_out = Conv_param(2);
    P_out = Conv_param(3);
    freq = Conv_param(4);
    
    I_out = P_out/U_out;
    
    D = U_out / U_in;
    T = 1/freq;

%MOSFET

    Rdson = FET_param(1);
    t_rise = FET_param(2);
    t_fall = FET_param(3);
    Rth_jtc = FET_param(4);
    Uf0 = FET_param(5);
    rd = FET_param(6);

%Kimenetek

    I_peak = I_out;
    I_rms_D = sqrt(1-D)*I_peak;
    I_rms_T = sqrt(D) * I_peak;
    
    
    P_cond_T_max = I_out^2*Rdson;
    P_cond_T_avg = D * P_cond_T_max;
    
    
    P_cond_D_max = Uf0*I_out+rd*I_out^2;
    P_cond_D_avg = (1-D) * P_cond_D_max;
    
    
    E_on = ((-I_out*U_in*t_rise)/3) + ((I_out*U_in*t_rise)/2);
    E_off = ((-I_out*U_in*t_fall)/3) + ((I_out*U_in*t_fall)/2);
    Psw_T = (E_on+E_off)/T ;
    
    P_tot_T = P_cond_T_avg + Psw_T;
    P_tot_D= P_cond_D_avg;
    P_tot = P_tot_T + P_tot_D;
    
    Conv_eff =  (U_out*I_out) / (P_tot_D + P_tot_T + U_out*I_out);
    
    deltaTjunct = P_tot*(Ins_param + Rth_jtc);
    
    Results = [P_cond_T_avg P_cond_T_max P_cond_D_avg P_cond_D_max deltaTjunct I_rms_T I_rms_D Conv_eff P_tot];
    
end

