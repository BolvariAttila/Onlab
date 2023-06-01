
function [Buck_conv] = Buck_losses(U_in, U_out, P_out, freq)
for i=1:size(U_in)
Buck_param = [U_in(i) U_out P_out freq];
%% Mosfets
%Param = [R_dson[Ohm] | t_rise [s] | t_fall [s] | Rth_jtc [°C/W | U_f0 [V] | rd [Ohm]]
FET_param =     [27e-3 17e-9 8e-9 2.5 0.75 0.004]; %STP45N10F7
                %[18e-3 90e-9 68e-9 0.48 0.75 0.00333333; %STW120NF10
                %20e-3 0.5e-6 0.6e-6 0.44 0.85 60];

%% Insulation parameters
Ins_param = [0.45 ; 0.4; 0.44; 0.3; 0.15];

%%

Buck_conv(i, :) = buck_calc(Buck_param, FET_param(1,:), Ins_param(5));
end
end