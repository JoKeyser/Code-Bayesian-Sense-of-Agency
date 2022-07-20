% Objective: Fit Haggard et al's data to find the optimal value for the free
%            parameter P(Xi=1), muAO is 230 ms and sigmaAO is 10 ms.
%            Plot the action and outcome perceptual shifts given P(Xi=1)
%            in the range [0.0, 1.0] with increments of 0.1 (see figure 2).
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

% Actual physical stimulus timings.
tAp = 0;
dist_tAtO = 250;
tOp = tAp + dist_tAtO;

% Optimal condition-independent parameters.
muAO = 230;
sigmaAO = 10;

% Interval length in consideration (in ms).
T = 250;  % large enough but finite constant for normalization (see Methods)

% Set range of values for P(Xi=1).
LB = 0.0;  % lower bound
INC = 0.1;  % increment
UB = 1.0;  % upper bound
arrPXi1 = LB:INC:UB;

% Initialize data matrices.
size_pXi1 = numel(arrPXi1);
arrPrcShftA = nan(numCond, size_pXi1);
arrPrcShftO = nan(numCond, size_pXi1);
arrAOBinding = nan(numCond, size_pXi1);

for CondBO = 1:numCond

    % Load the saved samples tauA and tauO for this experiment condition.
    [Vec_tauA, Vec_tauO, tauInstances] = soa_loadTauSamples(ExpR, CondBO);

    % Get reported empirical baseline parameters for this experiment condition.
    [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    indxPXi1 = size_pXi1 + 1;

    for PXi_1 = UB:-INC:LB

        % Initialize matrices to save shifts in perceived action and outcome.
        Vec_PrcShftA = nan(1, tauInstances);
        Vec_PrcShftO = nan(1, tauInstances);
        Vec_AOBinding = nan(1, tauInstances);

        % Simulate individual trials with a single perceived tauA and tauO.
        for indx_tau = 1:tauInstances
            % Compute model estimates of tA, tO and compare to tauA, tauO.
            tauA = Vec_tauA(indx_tau);
            tauO = Vec_tauO(indx_tau);
            [tAhat, tOhat, Xihat] = soa_computePrcShft(tauA, tauO, PXi_1, ...
                sigmaA, sigmaO, sigmaAO, muAO, T);
            Vec_PrcShftA(indx_tau) = tAhat - tauA;
            Vec_PrcShftO(indx_tau) = tOhat - tauO;
            % FIXME: What does 250 mean in line below? Replace with variable.
            Vec_AOBinding(indx_tau) = 250 + (tOhat - tauO) - (tAhat - tauA);
        end

        % Compute mean and SD over all simulated trials.
        uPrcShftA = mean(Vec_PrcShftA);
        uPrcShftO = mean(Vec_PrcShftO);
        uAOBinding = mean(Vec_AOBinding);
        sdPrcShftA = std(Vec_PrcShftA);
        sdPrcShftO = std(Vec_PrcShftO);
        sdAOBinding = std(Vec_AOBinding);
        % Round mean shifts to full milliseconds.
        ruVec_PrcShftA = round(uPrcShftA);
        ruVec_PrcShftO = round(uPrcShftO);

        % Compute model estimation errors w.r.t. the reported empirical results.
        [targPrcShftA, targPrcShftO] = soa_IBTargets(ExpR, CondBO);
        errPrcShftA = abs(ruVec_PrcShftA - targPrcShftA);
        errPrcShftO = abs(ruVec_PrcShftO - targPrcShftO);

        % Print key statistics to console.
        fprintf('Condition %d, P(Xi=1) = %0.1f\n', CondBO, PXi_1);
        fprintf(' Model-predicted mean (SD) perceptual shifts:\n');
        fprintf(' Action %.1f (%.1f) ms,  Outcome %.1f (%.1f) ms.\n', ...
            uPrcShftA, sdPrcShftA, uPrcShftO, sdPrcShftO);
        fprintf(' Abs. error of modeled versus reported perceptual shifts:\n')
        fprintf(' Action %d ms,  Outcome %d ms.\n\n', errPrcShftA, errPrcShftO);

        indxPXi1 = indxPXi1 - 1;

        arrPrcShftA(CondBO, indxPXi1) = uPrcShftA;
        arrPrcShftO(CondBO, indxPXi1) = uPrcShftO;
        arrAOBinding(CondBO, indxPXi1) = uAOBinding;
    end
    fprintf('--------------------------------------------------------\n\n');
end

% Plot and store the perceptual shifts and action-outcome binding
figure()
soa_plotPrcShfts(ExpR, arrPrcShftA, arrPrcShftO, arrPXi1, fontsize);
fnamePrcShft = sprintf('Exp%d_PXisPrcShfts.png', ExpR);
saveas(gcf(), fnamePrcShft);

figure()
lgd = soa_plotBehaviors(ExpR, arrAOBinding, arrPXi1, fontsize, 1);
set(lgd, 'Location', 'NorthEast')
ylabel('Perceptual shift intervals (ms)')
fnamePrcShft = sprintf('Exp%d_PXisPrcShfts.png', ExpR);
saveas(gcf(), fnamePrcShft);

% Store the perceptual shifts to file.
fnamePrcShftA = sprintf('Exp%d_arrPrcShftA.csv', ExpR);
fnamePrcShftO = sprintf('Exp%d_arrPrcShftO.csv', ExpR);
dlmwrite(fnamePrcShftA, arrPrcShftA, 'delimiter', ',');
dlmwrite(fnamePrcShftO, arrPrcShftO, 'delimiter', ',');

% Notes to METHODS:
% - Estimates of the perceptual shift in action timing alone was sufficient to
%   indicate the optimal P(Xi=1) value. However, note the following.
% - Although the optimal P(Xi=1) value for the voluntary and involuntary
%   conditions is 1.0, the result is saturated.
%   Hence, report P(Xi=1) = 0.9 for both conditions.
% - Report P(Xi=1) = 0.1 for the sham condition, assuming causality is less
%   frequently detected.
% - Although the optimal P(Xi=1) value for the intermediate tone uncertainty
%   condition is 0.5, the outcome binding behavior is not consistent with the
%   reported outcome binding.
%   Report P(Xi=1) = 0.6 for the intermediate tone uncertainty condition since
%   it also best minimized the estimation error while reproducing the reported
%   action and outcome bindings.
