
function [Boost_conv] = Boost_losses(U_in, U_out, P_out, freq, FET_param, Ins_param)

    for i= 1:size(U_out)
    
        Boost_param = [U_in, U_out(i), P_out, freq];
        
        %Boost_conv = [P_cond_T_avg; P_cond_T_max ;P_cond_D_avg; P_cond_D_max; T_juct; I_rms_T; I_rms_D; Conv_eff]
        Boost_conv(i,:) = Boost_calc(Boost_param, FET_param, Ins_param);
    end
end
 