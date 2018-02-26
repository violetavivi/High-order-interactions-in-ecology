%%
%TODO 1 puede que en el eq no sea igual -> correr varias veces
%TODO 2 para cuando se me va a 1, probar con diferectes X0

%% Parameters:
n = 100;                                   % Number of Grid Size
nSpecies = 3;
nEpoch = 1e4;                              % Maximun simulation time
%% Initialize the variables:
%CASE: Initially not sparse forest and  dessity distributes according to x0
X0 = sort(rand(nSpecies,1));
X0 = X0/sum(X0);
ecosystem = CreateGrid(n,X0);              % Grid
H = CreateH(nSpecies);
density = zeros(nSpecies,nEpoch);
for j = 1:nSpecies
        density(j,1) = nnz(ecosystem == j);
end
%TODO: CASE: Initially with hollow sites:
% N =  1000;                            % Total initial number of plats
% x = randi(n,1,N)-1;                       % Random Location along x
% y = randi(n,1,N)-1;                       % Random Location along y
 
%% Monte Carlo
fitnessFigureHandle = figure;
subplot(2,2,1)
image(ecosystem,'CDataMapping','scaled')
axis  equal off

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
%%
subplot(2,2,2)
image(ecosystem,'CDataMapping','scaled')
axis  equal off
subplot(2,2,3:4)
plot(1:nEpoch, density,'LineWidth',1.5)

