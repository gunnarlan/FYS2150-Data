function [ lambda ] = lambda( U )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
e = 1.6021766*10^-19;
h = 6.626070*10^-34;
m = 9.109384*10^-31;
c = 299792458;
lambdac = h./(m*c)
lambda = lambdac * sqrt(m*c^2./(2*e*U)) .* relfaktor(U);

end

