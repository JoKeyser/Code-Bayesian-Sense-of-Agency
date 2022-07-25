% Objective: Compute the trial-to-trial temporal binding and repulsion effects,
%            as well as the baseline and operant temporal bindings,
%            as functions of temporal disparity, i.e., tauO - tauA.
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

%%% Simulation Conditions
% Choose experimental set-up.
%   ExpR = 1: Haggard et al. (2002), numCond = 3; (Vol, Invol, Sham)
%   ExpR = 2: Wolpe et al. (2013),   numCond = 3; (Low, Int, High)
ExpR = 1;
numCond = 3;

% Actual physical stimulus timings (in ms).
tAp = 0;
dist_tAtO = 250;
tOp = tAp + dist_tAtO;

% Optimal condition-independent parameters (in ms).
muAO = 230;
sigmaAO = 10;

% Interval length in consideration (in ms).
T = 250;  % large enough but finite constant for normalization (see Methods)

% Initialize data matrices.
tauInstances = 35000;  % expected number of tauA and tauO instances/samples
Vec_PrcShftA = nan(numCond, tauInstances);
Vec_PrcShftO = nan(numCond, tauInstances);
Vec_tauI = nan(numCond, tauInstances);
Vec_OpPrcShft = nan(numCond, tauInstances);
Vec_BsPrcShft = nan(numCond, tauInstances);

for CondBO = 1:numCond

    % Load the saved samples tauA and tauO for this experiment condition.
    [Vec_tauA, Vec_tauO, sample_size] = soa_loadTauSamples(ExpR, CondBO);
    assert(sample_size == tauInstances, 'Loaded unexpected number of samples')

    % Get reported empirical baseline parameters for this experiment condition.
    [~, sigmaA, ~, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    % Simulate with the previously fitted optimal values of P(Xi=1).
    PXi_1 = soa_IBoptimalPXi1(ExpR, CondBO);

	% Simulate individual trials with a single perceived tauA and tauO.
    for indx_tau = 1:tauInstances

        tauA = Vec_tauA(indx_tau);
        tauO = Vec_tauO(indx_tau);
        
        [tAhat, tOhat, Xihat] = soa_computePrcShft(tauA, tauO, PXi_1, ...
            sigmaA, sigmaO, sigmaAO, muAO, T);

        Vec_PrcShftA(CondBO, indx_tau) = tAhat - tauA;
        Vec_PrcShftO(CondBO, indx_tau) = tOhat - tauO;
        Vec_BsPrcShft(CondBO, indx_tau) = tauO - tauA;
        Vec_OpPrcShft(CondBO, indx_tau) = tOhat - tAhat;
        Vec_tauI(CondBO, indx_tau) = tauO - tauA;
    end
end

% Sort all quantities of interest w.r.t. the difference tauO - tauA.
[sortedtauI, sortIndexes] = sort(Vec_tauI, 2);  % sort per row (per condition)
sortedPrcShftA = soa_sortMatrices(Vec_PrcShftA, sortIndexes);
sortedPrcShftO = soa_sortMatrices(Vec_PrcShftO, sortIndexes);
sortedBsPrcShft = soa_sortMatrices(Vec_BsPrcShft, sortIndexes);
sortedOpPrcShft = soa_sortMatrices(Vec_OpPrcShft, sortIndexes);

% Plot perceptual shifts as function of temporal disparity tauO - tauA.
figure('Position', [0, 0, 1200, 1000])
subplot(2, 2, 1)
soa_plotErrorBars(ExpR, sortedtauI, sortedPrcShftA, fontsize, 1, sizeBin);
title('Percept. shifts, actions')
xlabel('$\tau_O - \tau_A$ (ms)', 'Interpreter', 'Latex')
ylabel('Action shift: $\hat{t}_A - \tau_A$ (ms)', 'Interpreter', 'Latex')
subplot(2, 2, 2)
lgd = soa_plotErrorBars(ExpR, sortedtauI, sortedPrcShftO, fontsize, 1, sizeBin);
set(lgd, 'Location', 'NorthEast')
title('Percept. shifts, outcomes')
xlabel('$\tau_O - \tau_A$ (ms)', 'Interpreter', 'Latex')
ylabel('Outcome shift: $\hat{t}_O - \tau_O$ (ms)', 'Interpreter', 'Latex')
subplot(2, 2, 3)
soa_plotErrorBars(ExpR, sortedtauI, sortedBsPrcShft, fontsize, 1, sizeBin);
title('Percept. shifts, baseline conditions')
xlabel('$\tau_O - \tau_A$ (ms)', 'Interpreter', 'Latex')
ylabel('Baseline $\hat{t}_O - \hat{t}_A$ (ms)', 'Interpreter', 'Latex')
subplot(2, 2, 4)
soa_plotErrorBars(ExpR, sortedtauI, sortedOpPrcShft, fontsize, 1, sizeBin);
title('Percept. shifts, operant conditions')
xlabel('$\tau_O - \tau_A$ (ms)', 'Interpreter', 'Latex')
ylabel('Operant $\hat{t}_O - \hat{t}_A$ (ms)', 'Interpreter', 'Latex')
fnamePrcShft = sprintf('Exp%d_perTrialPrcShfts.png', ExpR);
saveas(gcf(), fnamePrcShft);
