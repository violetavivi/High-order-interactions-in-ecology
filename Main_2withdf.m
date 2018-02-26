nSpecies = 3;
X0 = rand(nSpecies,1);
X0 = X0/sum(X0);
H = CreateH(nSpecies);
v = 0.1;
d = 2*v*rand(nSpecies,1) + 1 - v;
f = 2*v*rand(nSpecies,1) + 1 - v;
%%
tRange = [0 150];
[tSol, XSol] = ode45(@(t,X) VariableTwoSeedlingsODE(t,X,H,f,d),tRange,X0);

plot(tSol, XSol,'LineWidth',1.5)
xlabel('t')
ylabel('x(t)')
str = sprintf('2 Seedlings with d & f');
title(str)