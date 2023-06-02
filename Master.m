clc;
clear all;

%% Insulatin parameters

%["WK247 FISKER"; "WS247 1 FISCHER";"Kerafol 70/50"; "AOS 218/247-1 FISCHER "; "KAP 218 FISCHER"];

Ins_param = [0.45 ; 0.4; 0.44; 0.3; 0.15]; % Rth[K/W]

Ins_selected = 5;

%% Fet Parameters

%Param = [R_dson[Ohm] | t_rise [s] | t_fall [s] | Rth_jtc [°C/W | U_f0 [V] | rd [Ohm]]

FET_param = [27e-3 17e-9 8e-9 2.5 0.75 0.004; %STP45N10F7
            18e-3 90e-9 68e-9 0.48 0.75 0.00333333; %STW120NF10
            20e-3 0.5e-6 0.6e-6 0.44 0.85 0.004];

FET_selected = 1;
%% Boost converter parameters

U_in_boost = 12; %[V]
U_out_boost =[40;45;50;55;60]; %[V]
P_out_boost = 300; %[W]
freq_boost = 1e5; %[Hz]
Boost_results = Boost_losses(U_in_boost, U_out_boost, P_out_boost, freq_boost, FET_param(FET_selected,:), Ins_param(Ins_selected));

%% Buck converter parameters

U_in_buck = [40;45;50;55;60]; %[V]
U_out_buck = 12; %[V]
P_out_buck = 300; %[W]
freq_buck = 1e5; %[Hz]
Buck_results = Buck_losses(U_in_buck, U_out_buck, P_out_buck, freq_buck, FET_param(FET_selected,:), Ins_param(Ins_selected));

%% Print results

Power_chart(Boost_results, Buck_results, U_out_boost);

Tmax_and_where = Tmaxcalc(Boost_results, Buck_results);

if Tmax_and_where(2) == 1
    fprintf('A legmagasabb hőmérséklet növekedés Boost esetben van, és %f C nagyságú', Tmax_and_where(1));
end

if Tmax_and_where(2) == 2
    fprintf('A legmagasabb hőmérséklet növekedés Buck esetben van, és %f C nagyságú', Tmax_and_where(1));
end