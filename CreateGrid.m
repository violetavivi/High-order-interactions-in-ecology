function ecosystem = CreateGrid(n,X0)
    nSpecies = length(X0);
    ecosystem = rand(n);
    [sortedX0, I] = sort(X0,'descend');
    
    for j = 1:nSpecies-1
        sortedX0(j+1) = sortedX0(j) + sortedX0(j+1);
    end
    for j = 1:nSpecies
        ecosystem(ecosystem < sortedX0(j)) = I(j);        
    end
    
end