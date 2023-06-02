
function [Buck_conv] = Buck_losses(U_in, U_out, P_out, freq, FET_param, Ins_param)

    for i=1:size(U_in)

        Buck_param = [U_in(i) U_out P_out freq];

        %Buck_conv = [P_cond_T_avg; P_cond_T_max ;P_cond_D_avg; P_cond_D_max; T_juct; I_rms_T; I_rms_D; Conv_eff]
        Buck_conv(i, :) = Buck_calc(Buck_param, FET_param, Ins_param);
    end
end