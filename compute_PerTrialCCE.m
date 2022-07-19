% Objective: Compute the trial-to-trial Confidence on Causal Estimate (CCE).
%
% Published: August 14, 2019
% Copyright: Roberto Legaspi and Taro Toyoizumi
%            Lab for Neural Computation and Adaptation
%            RIKEN Center for Brain Science
% License: CC-BY-4.0
% Changes by: Johannes Keyser, please refer to changelog.md
%
% SPDX-FileCopyrightText: 2019 Roberto Legaspi and Taro Toyoizumi
%
% SPDX-License-Identifier: CC-BY-4.0

% Clear all variables from workspace, clear command window, close all figures.
clearvars()
clc()
close('all')

% Graph display fonts
fontsize = 14;
sizeBin = 200;

% Simulation settings
tauInstances = 35000;  % Number of tauA and tauO instances (loaded from file)

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
Vec_CCE = zeros(numCond, tauInstances);
Vec_tauI = zeros(numCond, tauInstances);
Vec_Pc = zeros(numCond, tauInstances);

for CondBO = 1:numCond
    % Read from files values tauA and tauO (sampled from Gaussian distribution).
    fnametauA = sprintf('Exp%dCond%d_Vec_tauA.csv', ExpR, CondBO);
    fnametauO = sprintf('Exp%dCond%d_Vec_tauO.csv', ExpR, CondBO);
    Vec_tauA = dlmread(fnametauA);
    Vec_tauO = dlmread(fnametauO);

    % Get reported empirical baseline parameters for this experiment condition.
    [~, sigmaA, ~, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    % Simulate with the previously fitted optimal values of P(Xi=1).
    PXi_1 = soa_IBoptimalPXi1(ExpR, CondBO);

    % Compute the Confidence on Causal Estimate (CCE).
    Vec_CCE(CondBO, :) = soa_computeCCE(Vec_tauA, Vec_tauO, PXi_1, ...
        sigmaA, sigmaO, sigmaAO, muAO, T);

    Vec_tauI(CondBO, :) = Vec_tauO - Vec_tauA;
end

% Plot and store trial-to-trial CCE as function of temporal disparity
sortedtauI = Vec_tauI;
[sortedtauI(1, :), sortIndx1] = sort(Vec_tauI(1, :));
[sortedtauI(2, :), sortIndx2] = sort(Vec_tauI(2, :));
[sortedtauI(3, :), sortIndx3] = sort(Vec_tauI(3, :));

sortedCCE = soa_sortMatrices(Vec_CCE, sortIndx1, sortIndx2, sortIndx3);
lgd = soa_plotErrorBars(ExpR, sortedtauI, sortedCCE, fontsize, 1, sizeBin);
if ExpR == 2, set(lgd, 'Location', 'NorthEast'), end
xlabel('P(\xi = 1)')
ylabel('\it CCE')
fnameCCE = sprintf('Exp%d_perTrialCCE.png', ExpR);
saveas(gcf(), fnameCCE);