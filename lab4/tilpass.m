function [A, dA] = tilpass(x, y)
%
%   Detailed explanation goes here
df = table(x, y, 'VariableNames',{'x', 'y'});
lm = fitlm(df, 'y~x');
A = lm.Coefficients.Estimate(2);
dA = lm.Coefficients.SE(2);
end

