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

% Plot settings.
fontsize = 14;
sizeBin = 200;

%%% Simulation settings
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
T = 250;  % large enough but finite constant for normalization (see Methods)

% Initialize data matrices.
tauInstances = 35000;  % expected number of tauA and tauO instances/samples
Vec_CCE = nan(numCond, tauInstances);
Vec_tauI = nan(numCond, tauInstances);
Vec_Pc = nan(numCond, tauInstances);

for CondBO = 1:numCond

    % Load the saved samples tauA and tauO for this experiment condition.
    [Vec_tauA, Vec_tauO, sample_size] = soa_loadTauSamples(ExpR, CondBO);
    assert(sample_size == tauInstances, 'Loaded unexpected number of samples')

    % Get reported empirical baseline parameters for this experiment condition.
    [~, sigmaA, ~, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    % Simulate with the previously fitted optimal values of P(Xi=1).
    PXi_1 = soa_IBoptimalPXi1(ExpR, CondBO);

    % Compute the Confidence on Causal Estimate (CCE).
    Vec_CCE(CondBO, :) = soa_computeCCE(Vec_tauA, Vec_tauO, PXi_1, ...
        sigmaA, sigmaO, sigmaAO, muAO, T);

    Vec_tauI(CondBO, :) = Vec_tauO - Vec_tauA;
end

% Sort CCE w.r.t. the difference tauO - tauA.
[sortedtauI, sortIndexes] = sort(Vec_tauI, 2);  % sort per row (per condition)
sortedCCE = soa_sortMatrices(Vec_CCE, sortIndexes);

% Plot trial-to-trial CCE as function of temporal disparity tauO - tauA.
lgd = soa_plotErrorBars(ExpR, sortedtauI, sortedCCE, fontsize, 1, sizeBin);
if ExpR == 2, set(lgd, 'Location', 'NorthEast'), end
xlabel('\tau_O - \tau_A (ms)')
ylabel('\it CCE')
fnameCCE = sprintf('Exp%d_perTrialCCE.png', ExpR);
saveas(gcf(), fnameCCE);