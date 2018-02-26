nSpecies = 5;
X0 = rand(nSpecies,1);
X0 = X0/sum(X0);
H = CreateH(nSpecies);
%%
tRange = [0 300];
[tSol1, XSol1] = ode45(@(t,X) ThreeSeedlingsODE(t,X,H),tRange,X0);
figure
subplot(3,1,1)
plot(tSol1, XSol1,'LineWidth',1.5)
title('3 seedlings')
xticklabels('')

%%
m = 5;
[tSol2, XSol2] = ode45(@(t,X) mInteractionODE(t,X,H,m),tRange,X0);
subplot(3,1,2)
plot(tSol2, XSol2,'LineWidth',1.5)
ylabel('x(t)')
str = sprintf('%d seedlings',m);
title(str)
xticklabels('')

%%
m = 7;
[tSol2, XSol2] = ode45(@(t,X) mInteractionODE(t,X,H,m),tRange,X0);
subplot(3,1,3)
plot(tSol2, XSol2,'LineWidth',1.5)
xlabel('t')
str = sprintf('%d seedlings',m);
title(str)
%%
str = sprintf('Comparation2.png',m,nSpecies); 
saveas(gca,str)