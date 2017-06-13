function [b,E,Stdb] = mlinregr(y,Vin,W)

% Weighted multilinear regression
% y    =  Vin  * b     + E
% (Jx1)  (JxP)   (Px1)   (Jx1)
% Vin = Vandermonde matrix
% where W (Jx1) is the weight of each data point,
% W(i)=1/(standard deviation in i)^2
% ordinary least squares: use W = ones(size(y));
% See Numerical Recipies, Press et. al. pp 558 ->
%
% b      (Px1) = fitting coefficients
% E      (Jx1) = absolute error in each fitting point
% Stdb   (Px1) = standard deviation in percent of fitting coefficients

  J = length(y);
  P = length(Vin(1,:));

  V = ( W*ones(1,P) ).*Vin;
  VTV = inv(V'*V);
  b = VTV*V'*( W .* y );
  E = y - Vin*b; 
  Var = (E'*E)/(J-P);
  Stdb = sqrt(Var.*diag(inv(Vin'*Vin))); %Absolutt feil
 % Stdb = 100.*sqrt(Var.*diag(inv(Vin'*Vin)))./abs(b);% i prosent

