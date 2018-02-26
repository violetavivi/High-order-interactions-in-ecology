function H = CreateOddSpeciesH(x)
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
U(:,1) = auxU(:,1);
if nSpecies > 2
    for j = 2:2:nSpecies
        U(:,j) = auxU(:,j) + auxU(:,j+1)*sqrt(-1);        
        U(:,j+1) = auxU(:,j) - auxU(:,j+1)*sqrt(-1);
    end
end


%Create Spectrum
L = zeros(nSpecies);
if nSpecies > 2
    for j = 2:nSpecies
        L(j,j) = ((-1)^j)*sqrt(-1)*rand(1);
    end
end

%Compute P
P = (U*L*inv(U));
if P > 1
    P = P/max(P);
end
if P < -1
    P = P/min(P);
end
%Compute H
H = (P+1)./2;
end