% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Compute the trial-to-trial Confidence on Causal Estimate (CCE).

% Clear all variables from workspace, clear command window, close all figures.
clearvars()
clc()
close('all')

% Graph display fonts
fontsize = 20;
sizeBin = 200;

% Simulation settings
taoInstances = 35000;  % Number of taoA and taoO instances (loaded from file)

% Choose experimental set-up.
%   ExpR = 1: Haggard et al. (2002), numCond = 3; (Vol, Invol, Sham)
%   ExpR = 2: Wolpe et al. (2013),   numCond = 3; (Low, Int, High)
ExpR = 1;
numCond = 3;

% Actual physical stimulus timings (in ms)
tAp = 0;
dist_tAtO = 250;
tOp = tAp + dist_tAtO;

% Optimal condition—independent parameters (in ms)
muAO = 230;
sigmaAO = 10;

% Interval length in consideration
T = 250;  % large enough but finite constant (see Methods)

% Data Matrices
Vec_CCE = zeros(numCond, taoInstances);
Vec_taoI = zeros(numCond, taoInstances);
Vec_Pc = zeros(numCond, taoInstances);

for CondBO = 1:numCond

    % Simulated using the fitted P(Xi=1) optimal values
    if ExpR == 1
        if CondBO == 1
            PXi_1 = 0.9;
        elseif CondBO == 2
            PXi_1 = 0.9;
        else
            PXi_1 = 0.1;
        end
    elseif ExpR == 2
        if CondBO == 1
            PXi_1 = 0.9;
        elseif CondBO == 2
            PXi_1 = 0.6;
        else
            PXi_1 = 0.5;
        end
    end

    PXi_0 = 1 - PXi_1;

    % Read from files taoA and taoO values derived from a Gaussian distribution
    fnametaoA = sprintf('Exp%dCond%d_Vec_taoA.csv', ExpR, CondBO);
    fnametaoO = sprintf('Exp%dCond%d_Vec_taoO.csv', ExpR, CondBO);
    Vec_taoA = dlmread(fnametaoA);
    Vec_taoO = dlmread(fnametaoO);

    for indx_tao = 1:taoInstances

        % Do for each pair of taoA and taoO.
        taoA = Vec_taoA(indx_tao);
        taoO = Vec_taoO(indx_tao);

        % Get the reported empirical baseline parameters.
        [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

        % Compute CCE (see Methods).
        Z1 = sqrt(2 * pi) * sigmaAO * T;
        Z0 = T^2;
        Theta = log((PXi_1 * Z0) / (PXi_0 * Z1));
        sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;
        X = Theta - ((taoO - taoA - muAO)^2 / (2 * sigmaTot2)) ...
            + log(sigmaAO / sqrt(sigmaTot2));
        Vec_CCE(CondBO, indx_tao) = ...
            (sqrt(sigmaTot2) / (2 * pi * sigmaA * sigmaO * sigmaAO)) ...
            * soa_Sigmoid(X);

        Vec_taoI(CondBO, indx_tao)  = taoO - taoA;
    end
end

% Plot and store trial-to-trial CCE as function of temporal disparity
sortedtaoI = Vec_taoI;
[sortedtaoI(1, :), sortIndx1] = sort(Vec_taoI(1, :));
[sortedtaoI(2, :), sortIndx2] = sort(Vec_taoI(2, :));
[sortedtaoI(3, :), sortIndx3] = sort(Vec_taoI(3, :));

sortedCCE = soa_sortMatrices(Vec_CCE, sortIndx1, sortIndx2, sortIndx3);
soa_plotErrorBars(ExpR, sortedtaoI, sortedCCE, fontsize, 1, sizeBin);
fnameCCE = sprintf('Exp%d_perTrialCCE.png', ExpR);
saveas(gcf(), fnameCCE);
