nSpecies = 3; %choose an appropiate function to create H
X0 = rand(nSpecies,1);
X0 = X0/sum(X0);

xStar = rand(nSpecies,1);
xStar = xStar/sum(xStar)

tRange = [0 500];
H = real(CreateOddSpeciesH(xStar));
v = eig(H)
[tSol, XSol] = ode45(@(t,X) TwoSeedlingsODE(t,X,H),tRange,X0);
plot(tSol, XSol,'LineWidth',1.5)

%%
plot(tSol, XSol,'LineWidth',1.5)
xlabel('t')
ylabel('x(t)')
str = sprintf('2 Seedlings - %d Species',nSpecies);
title(str)
% dim = [.2 .5 .3 .3];
% str = string(v);
% annotation('textbox',dim,'String',str,'FitBoxToText','on');
str = sprintf('2Seedlins%dSpecies_DesideredODD.png',nSpecies); 
saveas(gca,str)
