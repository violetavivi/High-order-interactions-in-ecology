function dXdt = VariableTwoSeedlingsODE(t,X,H,f,d)

X = X/sum(X); %important to normalize (ODE solver's stuff...)
D = sum(d.*X);
F = sum(f.*X);
nSpecies = length(X);
% dXdt = X.*((D/F^2)*f.*((H*f)*X)-d);
for j = 1:nSpecies
    sumatoria = 0;
    for k = 1:nSpecies
        sumatoria = sumatoria + f(j)*2*H(j,k)*f(k)*X(k);
    end
    dXdt(j) = X(j)*((D/F^2)*sumatoria-d(j));
end

dXdt = dXdt.';