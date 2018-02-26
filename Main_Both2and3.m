nSpecies = 3;
X0 = rand(nSpecies,1);
X0 = X0/sum(X0);
H = CreateH(nSpecies);

%%
tRange = [0 150];
[tSol2, XSol2] = ode45(@(t,X) TwoSeedlingsODE(t,X,H),tRange,X0);
[tSol3, XSol3] = ode45(@(p,X) ThreeSeedlingsODE(p,X,H),tRange,X0);

figure;
subplot(2,1,1)
plot(tSol2, XSol2,'LineWidth',1.5)
xlabel('t')
ylabel('x(t)')
str = sprintf('2 Seedlings');
title(str)

subplot(2,1,2)
plot(tSol3, XSol3,'LineWidth',1.5)
xlabel('t')
ylabel('x(t)')
str = sprintf('3 Seedlings');
title(str)
%%
str = sprintf('%dSpecies_1.png',nSpecies); 
saveas(gca,str)
