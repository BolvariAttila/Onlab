function [] = Power_chart(Boost_results, Buck_results, U_in)

figure(1);
plot(U_in, Boost_results(:, 1)); 
hold on;
plot(U_in, Buck_results(:, 1)); 
plot(U_in, Boost_results(:, 3));
plot(U_in, Buck_results(:, 3));
legend('Boost FET', 'Buck FET', 'Boost Diode', 'Buck Diode');
xlabel('Feszültség [V]');
ylabel('Vezetési veszteség a FET-en [W]');
title('A FET-en fellépő vezetési veszteség a bemeneti feszültség függvényében');


figure(2);
plot(U_in, Boost_results(:, 5)); 
hold on;
plot(U_in, Buck_results(:, 5)); 
legend('Boost deltaT', 'Buck deltaT');
xlabel('Feszültség [V]');
ylabel('A junction hőmérsékletnövekedése [C]');
title('A junction hőmérsékletnövekedése a bemenő feszültség függvényében');

figure(3);
Tjunctboost = Boost_results(:,5)+40;
Tjunctbuck = Buck_results(:,5)+40;
plot(U_in, Tjunctboost); 
hold on;
plot(U_in, Tjunctbuck); 
legend('Boost Tjunction', 'Buck Tjunction');
xlabel('Feszültség [V]');
ylabel('A junction hőmérséklete [C]');
title('A junction hőmérséklete a bemenő feszültség függvényében 40 fokos hőmérsékleten');

figure(4);
plot(U_in, Boost_results(:,9)); 
hold on;
plot(U_in, Buck_results(:,9)); 
legend('Boost P_tot', 'Buck P_tot');
xlabel('Feszültség [V]');
ylabel('A teljes teljesítményveszteség [W]');
title('A teljes veszteség a bemenő feszültség függvényében');


figure(5);
EffBoost = Boost_results(:,8)*100;
EffBuck = Buck_results(:,8)*100;
plot(U_in, EffBoost); 
hold on;
plot(U_in, EffBuck); 
legend('Boost Efficiency', 'Buck Efficiency');
xlabel('Feszültség [V]');
ylabel('Hatásfok [%]');
title('Az átalakítás hatásfoka a bemenő feszültség függvényében');
end