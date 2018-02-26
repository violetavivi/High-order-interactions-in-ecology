nSpecies = 5;
X0 = rand(nSpecies,1);
X0 = X0/sum(X0);

tRange = [0 700];
H = CreateH(nSpecies);
% v = eig(H)
[tSol, XSol] = ode45(@(t,X) ThreeSeedlingsODE(t,X,H),tRange,X0);
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
str = sprintf('3Seedlins%dSpecies_third.png',nSpecies); 
saveas(gca,str)
