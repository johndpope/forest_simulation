
%model based on http://www.sciencedirect.com/science/article/pii/S0304380099000903
%CONSTANTS
dt = 1; %timestep
simulationLength = 1000; %simulation length
numIterations = simulationLength/dt; % number of iterations
times = zeros(1,numIterations); %timesteps for graphing

%VARIABLES

%size of forest in cells = m x n
m = 25; 
n = 25;
R = 6; %neighborhood radius meters
s_cell = 2; %size cell in meters
centerDistance = fix(R/s_cell); %max radial neighborhood distance
forest = ones(m,n);
extGrid = cell(m + centerDistance, n + centerDistance);
% extended grid, including boundary  conditions
forestList = cell(numIterations);
forestList{1} = forest;
extGridList = cell(numIterations);
extGridList{1} = extGrid;

% neighbor  fn
% input: x,y - coordinates of grid element
%        extGrid - current extended grid
% output: array of moore neighborhood elements
mooreNeighbors = @(x,y,extGrid)  ({...
    extGrid(x+1-1,y+1-1) extGrid(x+1-1,y+1), ...
    extGrid(x+1-1,y+1+1) extGrid(x+1,y+1-1), ...
    extGrid(x+1,y+1+1)   extGrid(x+1+1,y+1-1)  + ...
    extGrid(x+1+1,y+1)   extGrid(x+1+1,y+1+1)});

% radial neighbor func
% input: x,y, coordinates of grid element
%        extGrid - current extended grid
% output: array of neighborhood elements within R of x,y
radialNeighbors = @(x, y, extGrid) (findRadialNeighbors(x, y, extGrid, R, s_cell));

%Optimal growth of a tree without constraining factors
optimalGrowth = @(tree) ((tree.G * tree.D * ...
         (1 - (tree.D * Tree.H)/(tree.Dmax * tree.Hmax)))...
         /(247 + 3 * tree.b2 * tree.D - 4 * tree.b3 * tree.D^2));
Al0 = 1; %light incident above canopy
k = .001; %light extinction coefficient




% simulation loop
for i=2:numIterations
    %loop through every cell
    for x = 1:m
        for y = 1:n
            %for each species i that is not in forest(x,y) if ALmini<=AL<=ALmaxi a
                %new tree is added
            %for each species i in forest(x,y)
                %calc opt diameter growth
                %calc available light
                %calc basal aread
                %calc response to light & space availability as applicable
                %calc actual diameter growth
                %update values
                %check if tree dies due to chance
                %check if tree dies due to competition
        end
    end
    
end