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

% Graph display fonts
fontsize = 14;
sizeBin = 200;

% Simulation settings
tauInstances = 35000;  % Number of tauA and tauO instances to be generated

% Choose experimental set-up.
%   ExpR = 1: Haggard et al. (2002), numCond = 3; (Vol, Invol, Sham)
%   ExpR = 2: Wolpe et al. (2013),   numCond = 3; (Low, Int, High)
ExpR = 1;
numCond = 3;

% Actual physical stimulus timings
tAp = 0;
dist_tAtO = 250;
tOp = tAp + dist_tAtO;

% Optimal condition-independent parameters
muAO = 230;
sigmaAO = 10;

% Interval length in consideration
T = 250;  % large enough but finite constant

% Data Matrices
LB = 0.0; INC = 0.1; UB = 1.0;
arrPXi1 = LB:INC:UB;
size_pXi1 = numel(arrPXi1);
arrPrcShftA = zeros(numCond,size_pXi1);
arrPrcShftO = zeros(numCond,size_pXi1);
arrAOBinding = zeros(numCond,size_pXi1);

for CondBO = 1:numCond

    % Read from files values tauA and tauO (sampled from Gaussian distribution).
    fnametauA = sprintf('Exp%dCond%d_Vec_tauA.csv', ExpR, CondBO);
    fnametauO = sprintf('Exp%dCond%d_Vec_tauO.csv', ExpR, CondBO);
    Vec_tauA = dlmread(fnametauA);
    Vec_tauO = dlmread(fnametauO);

    % Get reported empirical baseline parameters for this experiment condition.
    [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    indxPXi1 = size_pXi1 + 1;

    for PXi_1 = UB:-INC:LB
        PXi_0 = 1 - PXi_1;

        % Matrices to track optimal action and outcome estimates
        Vec_PrcShftA = zeros(1, tauInstances);
        Vec_PrcShftO = zeros(1, tauInstances);
        Vec_AOBinding = zeros(1, tauInstances);

        for indx_tau = 1:tauInstances

            % Do for each pair of tauA and tauO
            tauA = Vec_tauA(indx_tau);
            tauO = Vec_tauO(indx_tau);

            % Compute for the posterior-ratio (see Methods)
            Z1 = sqrt(2 * pi) * sigmaAO * T;
            Z0 = T^2;
            Theta = log((PXi_1 * Z0) / (PXi_0 * Z1));
            sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;
            r = exp(Theta - ((tauO - tauA - muAO)^2 / (2 * sigmaTot2)));

            % Compute for strength of temporal binding (Eq. 5)
            if r > 1  % causal case
                tAhat = tauA + (sigmaA^2 / sigmaTot2) * (tauO - tauA - muAO);
                tOhat = tauO - (sigmaO^2 / sigmaTot2) * (tauO - tauA - muAO);
                Xihat = 1;
            else  % acausal case
                tAhat = tauA;
                tOhat = tauO;
                Xihat = 0;
            end
            
            Vec_PrcShftA(1, indx_tau) = tAhat - tauA;
            Vec_PrcShftO(1, indx_tau) = tOhat - tauO;
            Vec_AOBinding(1, indx_tau) = 250 + (tOhat - tauO) - (tAhat - tauA);
        end

        uPrcShftA = mean(Vec_PrcShftA(:));
        sdPrcShftA = std(Vec_PrcShftA(:));
        uPrcShftO = mean(Vec_PrcShftO(:));
        sdPrcShftO = std(Vec_PrcShftO(:));
        uAOBinding = mean(Vec_AOBinding(:));
        sdAOBinding = std(Vec_AOBinding(:));

        % Compute model estimation errors given the reported empirical results
        [targPrcShftA, targPrcShftO] = soa_IBTargets(ExpR, CondBO);

        ruVec_PrcShftA = round(uPrcShftA);
        ruVec_PrcShftO = round(uPrcShftO);
        errPrcShftA = abs(ruVec_PrcShftA - targPrcShftA);
        errPrcShftO = abs(ruVec_PrcShftO - targPrcShftO);

        fprintf('Condition %d  \t P(Xi=1): %0.2f\n', CondBO, PXi_1);
        fprintf('uPercShfts   :\t %O.2f(%0.2F)\t %0.1f(%0.1f)\n', ...
            uPrcShftA, sdPrcShftA, uPrcShftO, sdPrcShftO);
        fprintf('Error in action  perceptual shift: %0.2f\n', errPrcShftA);
        fprintf('Error in outcome perceptual shift: %0.2f\n\n', errPrcShftO);

        indxPXi1 = indxPXi1 - 1;

        arrPrcShftA(CondBO, indxPXi1) = uPrcShftA;
        arrPrcShftO(CondBO, indxPXi1) = uPrcShftO;
        arrAOBinding(CondBO, indxPXi1) = uAOBinding;
    end
    fprintf('\n');
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

% Store the perceptual shifts
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
