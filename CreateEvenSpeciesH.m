function H = CreateEvenSpeciesH(x)
%%
%x = desired relative species abundance column vector (so mod=1)
nSpecies = length(x);

%Create U
V = rand(nSpecies);
V(:,1) = x;
auxU = GramSchmidtCOL(V);
%normalize
for j = 1:nSpecies
    norma = (sum(auxU(:,j).*auxU(:,j)))^(1/2);
    auxU(:,j) = auxU(:,j)/norma;
end
%Allesina's transformation
U(:,1:2) = auxU(:,1:2);
if nSpecies > 2
    for j = 3:2:nSpecies
        U(:,j) = auxU(:,j) + auxU(:,j+1)*sqrt(-1);        
        U(:,j+1) = auxU(:,j) - auxU(:,j+1)*sqrt(-1);
    end
end
%Choose eigenvalues
L = zeros(nSpecies);
if nSpecies > 2
    for j = 3:2:nSpecies
        z = rand(1);
        L(j,j) = sqrt(-1)*z;
        L(j+1,j+1) = -sqrt(-1)*z;
    end
end
%Compute P
P = (U*L/U);
if P > 1
    P = P/max(P);
end
if P < -1
    P = P/min(P);
end
%Compute H
H = real((P+1)./2);
end