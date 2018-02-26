%% Parameters:
n = 100;                    % Number of Grid Size
nSpecies = 3;
nEpoch = 1e7;               % Simulation time MonteCarlo
tRange = [0 200];           % Simulation time Dinamical Method
%% Initialize variables:
X0 = sort(rand(nSpecies,1));
X0 = X0/sum(X0);
H = CreateH(nSpecies);
%% Dinamical Method
[tSol, XSol] = ode45(@(t,X) ThreeSeedlingsODE(t,X,H),tRange,X0);
plot(tSol, XSol,'LineWidth',1.5)
%% Monte Carlo Method
[density, ecosystem] = MonteCarlo(X0,H,n,nEpoch);
warndlg('Hey! I have just finished!')
%% Comparation
figure;
subplot(2,1,1)
plot(tSol, XSol,'LineWidth',1.5)
title('Dinamical Method')
xlabel('t')
ylabel('x(t)')
ylim([0 1])

subplot(2,1,2)
plot(1:nEpoch, density,'LineWidth',1.5)
title('Monte Carlo')
xlabel('\tau')
ylabel('x(\tau)')
ylim([0 1])
%%
str = sprintf('%dSpeciesComparationTime%1.f_5.png',nSpecies,nEpoch);  saveas(gca,str)



