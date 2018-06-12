function dXdt = TwoSeedlingsODE(t,X,H)
%----option a)
% x1 = X(1)/sum(X);
% x2 = X(2)/sum(X);
% x3 = X(3)/sum(X);
% varX = [x1; x2;x3];
% dx1dt = x1*2*H(1,:)*varX - x1;
% dx2dt = x2*2*H(2,:)*varX - x2;
% dx3dt = x3*2*H(3,:)*varX - x3;
% dXdt = [dx1dt; dx2dt; dx3dt];

%----option b)
% x1 = X(1)/sum(X);
% x2 = X(2)/sum(X);
% x3 = X(3)/sum(X);
% dx1dt = x1*(2*H(1,1)*x1+2*H(1,2)*x2+2*H(1,3)*x3 - 1);
% dx2dt = x2*(2*H(2,1)*x1+2*H(2,2)*x2+2*H(2,3)*x3 - 1);
% dx3dt = x3*(2*H(3,1)*x1+2*H(3,2)*x2+2*H(3,3)*x3 - 1);
% dXdt = [dx1dt; dx2dt; dx3dt];

%----option c)

X = X/sum(X); %important to normalize (ODE solver's stuff...)
dXdt = X.*(2*H*X-1);
end
