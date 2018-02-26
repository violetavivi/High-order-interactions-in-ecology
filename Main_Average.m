%%
%es el TODO 1: puede que en el eq no sea igual -> 
% correr varias veces
%RESULTS: el valor medio es X0 (XStar), pero funciona peor si se cambia la
%H en cada run. Mejor mismo H para nAverage runs.

%% Parameters:
n = 100;                                   % Number of Grid Size
nSpecies = 3;
nEpoch = 1e7;                              % Maximun simulation time
nAverage =  1;                            
t = 1.684;                                 % t Student for 95%
%% Initialize the variables:
%CASE: Initially not sparse forest and  density distributes according to x0
X0 = sort([0.3323; 0.4521; 0.2156]);
X0 = X0/sum(X0)
H = real(CreateOddSpeciesH(X0));
averageValues = zeros(nAverage,nSpecies);
runStd = zeros(nAverage,nSpecies);
%% Dinamical Method
tRange = [0 200];  
[tSol, XSol] = ode45(@(t,X) ThreeSeedlingsODE(t,X,H),tRange,X0);
plot(tSol, XSol,'LineWidth',1.5)
%% Average Monte Carlo
profile on
for tau = 1:nAverage
    ecosystem = CreateGrid(n,X0); 
    density = zeros(nSpecies,nEpoch);
    for j = 1:nSpecies
        density(j,1) = nnz(ecosystem == j);
    end
    for t = 2:nEpoch
        density(:,t) = density(:,t-1);
        % Choose a random plant and kill it
        deadR = randi(n,1,1);
        deadC = randi(n,1,1);
        deadSpecie = ecosystem(deadR,deadC);
        % Find its neighbours,periodic neighbourhood
        neighUp = [mod(deadR-2,n)+1, deadC];
        neighDown = [mod(deadR,n)+1, deadC];
        neighLeft = [deadR, mod(deadC - 2,n)+1];
        neighRight = [deadR,  mod(deadC,n)+1];
        neighbours = [neighUp; neighDown; neighLeft;neighRight];
        % Pick two at random, neigh1, neigh2 are the plat type
        neigh1 = ecosystem(neighbours(randi(4),1), neighbours(randi(4),2));
        neigh2 = ecosystem(neighbours(randi(4),1), neighbours(randi(4),2));
        % Make them compete
        if rand < H(neigh1,neigh2)
            ecosystem(deadR,deadC) = neigh1;
            % Update density vector
            density(deadSpecie,t) = density(deadSpecie,t) - 1;
            density(neigh1,t) = density(neigh1,t) + 1;
        else
            ecosystem(deadR,deadC) = neigh2;
            % Update density vector
            density(deadSpecie,t) = density(deadSpecie,t) - 1;
            density(neigh2,t) = density(neigh2,t) + 1;
        end
        
    end    
    density = density./(nnz(ecosystem));
    averageValues(tau,:) = sum(density.')/nEpoch;
    %runStd(tau,:) = std(density.');
    tau
end
profile off
profile report
save('AverageRun5Stable.mat','averageValues','runStd')
Xeq = sum(averageValues)/40;
XeqStd = t*std(averageValues)/(sqrt(nEpoch));
%%
warndlg('Hey! I have just finished!')
%%
x = 1:1000001;
y = density(1,end-1000000:end);
boundedline(x, y,runStd(end,3))
xlabel('\tau')
ylabel('x(\tau)')
xlim([0 x(end)])
ylim([0 1])


