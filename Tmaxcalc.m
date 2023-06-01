function [res] = Tmaxcalc(Boost_results, Buck_results)

TempBoost = Boost_results(:,5);
TempBuck = Buck_results(:,5);
TempMaxBoost = max(TempBoost);
TempMaxBuck = max(TempBuck);
maxT = max(TempMaxBoost,TempMaxBuck);
if maxT == TempMaxBoost
    res = [maxT 1];
end
if maxT == TempMaxBuck
    res = [maxT 2];
end    
end