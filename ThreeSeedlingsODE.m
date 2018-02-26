function dXdt = ThreeSeedlingsODE(t,X,H)
%----option a)
X = X/sum(X);
[~, nSpecies]= size(H);
dXdt = zeros(nSpecies,1);
for i = 1:nSpecies
    sumatoria = 0;
    for j = 1:nSpecies
        for k = 1:nSpecies
            HijHik = H(i,j)*H(i,k);
            HijHjk = H(i,j)*H(j,k);
            sumatoria = sumatoria + (HijHik + HijHjk)*X(j)*X(k);
        end
    end
    dXdt(i) = X(i)*(2*sumatoria-1);
end
% dXdt = dXdt.';

end