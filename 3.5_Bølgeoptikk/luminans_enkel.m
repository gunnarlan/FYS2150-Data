function E = luminans_enkel(x,R,a,N,A)

% Bølgelengde til laserlys
lambda = 632.8e-9;
u = x./(lambda*R);
%E = a.^2*(1./N*sinc(N*A*u)./sinc(A*u) .* sinc(a.*u)).^2;
E = 4*a.^2*cos(pi*A*u).^2.*(sinc(a.*u)).^2;
end