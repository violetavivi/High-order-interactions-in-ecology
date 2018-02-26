function H = CreateH(nSpecies)
%---Info---
%H = network of competitive random relationships
%Hij = prob i wins j
%Hij + Hji = 1
%Hii = 0.5

H = rand(nSpecies);
Hu = triu(H,1);
aux = 1-Hu;
aux = aux.';
Hl = tril(aux,-1);
H = Hu + Hl;
H(1:nSpecies+1:end) = 0.5;

end