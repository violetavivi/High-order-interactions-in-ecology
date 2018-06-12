nSpecies = 4;
X0 = rand(nSpecies,1);
X0 = X0/sum(X0);
H = CreateEvenSpeciesH([0.25 0.25 0.25 0.25]);
% nSpecies = 5;
% X0 = rand(nSpecies,1);
% X0 = X0/sum(X0);
% H = CreateOddSpeciesH([0.2 0.2 0.2 0.2 0.2]);
%%
tRange = [0 5000];
[tSol1, XSol1] = ode45(@(t,X) TwoSeedlingsODE(t,X,H),tRange,X0);
figure
subplot(2,1,1)
plot(tSol1, XSol1,'LineWidth',1.5)
title('2-Pairwise')
ylabel('x(t)')
xlabel('t')
% xticklabels('')
ylim([0 1])
%
m = 3;
[tSol2, XSol2] = ode45(@(t,X) mInteractionODE(t,X,H,m),tRange,X0);
subplot(2,1,2)
plot(tSol2, XSol2,'LineWidth',1.5)
ylabel('x(t)')
str = sprintf('%d-Pairwise',m);
title(str)
xlabel('t')
% xticklabels('')
ylim([0 1])