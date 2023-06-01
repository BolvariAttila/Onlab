
function [Boost_conv] = Boost_losses(U_in, U_out, P_out, f_sw)
for i= 1:size(U_out)
Boost_param = [U_in, U_out(i), P_out, f_sw];
%% Insulatin parameters
%["WK247 FISKER"; "WS247 1 FISCHER";"Kerafol 70/50"; "AOS 218/247-1 FISCHER "; "KAP 218 FISCHER"];
Ins_param = [0.45 ; 0.4; 0.44; 0.3; 0.15]; % Rth[K/W]

%% MosFET
%Param = [R_dson[Ohm] | t_rise [s] | t_fall [s] | Rth_jtc [°C/W | U_f0 [V] | rd [Ohm]]
FET_param =     [27e-3 17e-9 8e-9 2.5 0.75 0.004]; %STP45N10F7
                %[18e-3 90e-9 68e-9 0.48 0.75 0.003333]; %STW120NF10

%% calc
Boost_conv(i,:) = Boost_calc(Boost_param, FET_param(1,:), Ins_param(5))
%results = [P_cond_T_avg; P_cond_T_max ;P_cond_D_avg; P_cond_D_max; T_juct; I_rms_T; I_rms_D; Conv_eff]
end
end
