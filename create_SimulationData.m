% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Create the noisy sensory input signals arriving at various times taoA and taoO

% Clear all variables from workspace, clear command window, close all figures.
clearvars()
clc()
close('all')

% Uncomment to make random number generation repeatable:
% rng(1, 'twister');

%%% Simulation settings
% Set number of taoA and taoO instances to be generated.
taoInstances = 35000;

% Choose experimental set-up.
%   ExpR = 1: Haggard et al. (2002), numCond = 3; (Vol, Invol, Sham)
%   ExpR = 2: Wolpe et al. (2013),   numCond = 3; (Low, Int, High)
ExpR = 1;
numCond = 3;

% Actual physical stimulus timings (in ms).
tAp = 0;
dist_tAtO = 250;
tOp = tAp + dist_tAtO;

for CondBO = 1:numCond
    % Initialize baseline parameters with reported empirical data.
    [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    % Generate from Gaussian distributions.
    % NOTE: Requires Statistics Toolbox.
    Vec_taoA = normrnd(tAp + muA, sigmaA, [1, taoInstances]);
    Vec_taoO = normrnd(tOp + muO, sigmaO, [1, taoInstances]);
    % FIXME, Alternative: sigmaA .* randn(1,numInstances) + (tAp + muA);
    %                     sigmaO .* randn(1,numInstances) + (tOp + muO);

    % Check the generated data.
    % NOTE: Requires Statistics Toolbox.
    % figure(); normplot(Vec_taoA);
    % figure(); normplot(Vec_taoO);
    % figure(); histfit(Vec_taoA);
    % figure(); histfit(Vec_taoO);

    % Generate statistics.
    sizeVec_taoA = numel(Vec_taoA);
    sizeVec_taoO = numel(Vec_taoO);
    taoA_min = min(Vec_taoA);
    taoA_max = max(Vec_taoA);
    taoO_min = min(Vec_taoO);
    taoO_max = max(Vec_taoO);
    uVectaoA = mean(Vec_taoA);
    uVectaoO = mean(Vec_taoO);
    stdVectaoA = std(Vec_taoA);
    stdVectaoO = std(Vec_taoO);

    % Print statistics and store generated simulation data.
    fprintf('\n============= tao DataSet Exp %d Cond %d ===============\n', ...
        ExpR, CondBO);
    fprintf('taoA [%0.2f, %0.2f] taoO [%0.2f, %0.2f]\n', ...
        taoA_min, taoA_max, taoO_min, taoO_max);
    fprintf('tao statistics: %0.2f (%0.2f)\t %0.2f (%0.2f)\n', ...
        uVectaoA, stdVectaoA, uVectaoO, stdVectaoO);
    fprintf('taoA elements: %d taoO elements: %d\n', ...
        sizeVec_taoA, sizeVec_taoO);
    fprintf('==============================================\n');
    fnametaoA = sprintf('Exp%dCond%d_Vec_taoA.csv', ExpR, CondBO);
    fnametaoO = sprintf('Exp%dCond%d_Vec_taoO.csv', ExpR, CondBO);
    dlmwrite(fnametaoA, Vec_taoA, 'delimiter', ',');
    dlmwrite(fnametaoO, Vec_taoO, 'delimiter', ',');
end
