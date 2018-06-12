function H = CreateOddSpeciesH(X)
%x = desired relative species abundance column vector (so mod=1)
nSpecies = length(X);
%Create U
V = rand(nSpecies);
V(:,1) = X;
%make every column orthogonal to each other
auxU = GramSchmidtCOL(V);
%normalize them
for j = 1:nSpecies
    norma = (sum(auxU(:,j).*auxU(:,j)))^(1/2);
    auxU(:,j) = auxU(:,j)/norma;
end
%Allesina's transformation
U(:,1) = auxU(:,1);
if nSpecies > 2
    for j = 2:2:nSpecies
        U(:,j) = auxU(:,j) + auxU(:,j+1)*sqrt(-1);        
        U(:,j+1) = auxU(:,j) - auxU(:,j+1)*sqrt(-1);
    end
end
%Choose eigenvalues
L = zeros(nSpecies);
if nSpecies > 2
    for j = 2:2:nSpecies
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