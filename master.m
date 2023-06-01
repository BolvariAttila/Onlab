clc;
clear all;
%% Boost convert parameters
U_in = 12; %[V]
U_out =[40;45;50;55;60]; %[V]
P_out = 300; %[W]
f_sw = 1e5; %[Hz]
Boost_results = Boost_losses(U_in, U_out, P_out, f_sw);

%% Buck converter settings

U_in_buck = [40;45;50;55;60];
U_out_buck = 12;
P_out_buck = 300;
freq_buck = 1e5;
Buck_results = Buck_losses(U_in_buck, U_out_buck, P_out_buck, freq_buck);

power_chart(Boost_results, Buck_results, U_out);

Tmax_and_where = Tmaxcalc(Boost_results, Buck_results);

if Tmax_and_where(2) == 1
    fprintf('A legmagasabb hőmérséklet növekedés Boost esetben van, és %f C nagyságú', Tmax_and_where(1));
end

if Tmax_and_where(2) == 2
    fprintf('A legmagasabb hőmérséklet növekedés Buck esetben van, és %f C nagyságú', Tmax_and_where(1));
end