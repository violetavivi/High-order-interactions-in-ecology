function U = GramSchmidtCOL(V)
%this function does not NORMALIZE
[~, n] = size(V); %number of columns = number of vectors
U(:,1) = V(:,1);

for k = 2:n
    p = 0;    
    for j = 1:k-1
        p = p + projectorCOL(U(:,j),V(:,k));
    end
    
    U(:,k) = V(:,k) - p;

end

end