% Objective: Compute the Confidence on Causal Estimate (CCE) along P(Xi=1)
%            values in the range [0.0, 1.0] with increments of 0.1.
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

%%% Simulation Settings
% Choose experimental set-up.
%   ExpR = 1: Haggard et al. (2002), numCond = 3; (Vol, Invol, Sham)
%   ExpR = 2: Wolpe et al. (2013),   numCond = 3; (Low, Int, High)
ExpR = 1;
numCond = 3;

% Actual physical stimulus timings (in ms).
tAp = 0;
dist_tAtO = 250;
tOp = tAp + dist_tAtO;

% Set optimal condition-independent parameters (in ms).
muAO = 230;
sigmaAO = 10;

% Interval length in consideration (in ms).
T = 250;  % large enough but finite constant for normalization (see Methods)

% Initialize data matrices.
LB = 0.0;
INC = 0.1;
UB = 1.0;
arrPXi1 = LB:INC:UB;
size_pXi1 = numel(arrPXi1);
arrCCE = nan(numCond, size_pXi1);

for CondBO = 1:numCond

    % Load the saved samples tauA and tauO for this experiment condition.
    [Vec_tauA, Vec_tauO] = soa_loadTauSamples(ExpR, CondBO);

    % Get reported empirical baseline parameters for this experiment condition.
    [~, sigmaA, ~, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    indxPXi1 = size_pXi1 + 1;

    for PXi_1 = UB:-INC:LB
        % Compute the Confidence on Causal Estimate (CCE).
        Vec_CCE = soa_computeCCE(Vec_tauA, Vec_tauO, PXi_1, sigmaA, sigmaO, ...
            sigmaAO, muAO, T);
        uCCE = mean(Vec_CCE);
        sdCCE = std(Vec_CCE);
        fprintf('Condition %d, P(Xi=1) = %.1f\n', CondBO, PXi_1);
        fprintf(' CCE mean (SD): %.2e (%.2e)\n', uCCE, sdCCE);
        indxPXi1 = indxPXi1 - 1;
        arrCCE(CondBO, indxPXi1) = uCCE;
    end
    fprintf('------------------------------------\n');
end

% Plot and store CCE as function of causal prior strength.
soa_plotBehaviors(ExpR, arrCCE, arrPXi1, fontsize, 1);
ylabel('\it CCE')
fnameCCEPXi = sprintf('Exp%d_CCEPXi.png', ExpR);
saveas(gcf(), fnameCCEPXi);