function dXdt = mInteractionODE(t,X,H,m)

X = X/sum(X);
q = recursiveQ(m,X,H);
dXdt = q - X;

end