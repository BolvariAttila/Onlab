%% Villamos parameterekbol L szamitas
function [Resoults] = inductance_boost(Uin, Uout, Pout, fsw)
K = 0.2; % Delta_I/I_pp = 20%

D = 1 - (Uin/Uout);
I_load = Pout/Uout;

L = (Uin*D)/(K*I_load*fsw) %first param

%Geometia
mu0 = 4*pi*10e-7;
delta = 2e-4;%legres [m] 
const = L*delta/mu0 %N^2*Am

 Resoults = [L,const];
end