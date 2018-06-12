function q = recursiveQ(m,X,H)
if m > 1
    q = X.*(H*recursiveQ(m-1,X,H)) + recursiveQ(m-1,X,H).*(H*X);
else
    q = X;
end
   