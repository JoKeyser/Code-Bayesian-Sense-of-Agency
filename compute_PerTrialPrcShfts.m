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

% Graph display fonts.
fontsize = 14;
sizeBin = 200;

%%% Simulation Conditions
% Set number of tauA and tauO instances to be generated.
tauInstances = 35000;

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
T = 250;  % large enough but finite constant

% Data Matrices
Vec_PrcShftA = zeros(numCond, tauInstances);
Vec_PrcShftO = zeros(numCond, tauInstances);
Vec_tauI = zeros(numCond, tauInstances);
Vec_OpPrcShft = zeros(numCond, tauInstances);
Vec_BsPrcShft = zeros(numCond, tauInstances);

for CondBO = 1:numCond

    % Read from files values tauA and tauO (sampled from Gaussian distribution).
    fnametauA = sprintf('Exp%dCond%d_Vec_tauA.csv', ExpR, CondBO);
    fnametauO = sprintf('Exp%dCond%d_Vec_tauO.csv', ExpR, CondBO);
    Vec_tauA = dlmread(fnametauA);
    Vec_tauO = dlmread(fnametauO);

    % Get reported empirical baseline parameters for this experiment condition.
    [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    % Simulated using the fitted P(Xi=1) optimal values
    if ExpR == 1
        if CondBO == 1
            PXi_1 = 0.9;
        elseif CondBO == 2
            PXi_1 = 0.9;
        else
            PXi_1 = 0.1;
        end
    elseif ExpR==2
        if CondBO == 1
            PXi_1 = 0.9;
        elseif CondBO == 2
            PXi_1 = 0.6;
        else
            PXi_1 = 0.5;
        end
    end

    PXi_0 = 1 - PXi_1;

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

        Vec_PrcShftA(CondBO, indx_tau) = tAhat - tauA;
        Vec_PrcShftO(CondBO, indx_tau) = tOhat - tauO;
        Vec_BsPrcShft(CondBO, indx_tau) = tauO - tauA;
        Vec_OpPrcShft(CondBO, indx_tau) = tOhat - tAhat;
        Vec_tauI(CondBO, indx_tau) = tauO - tauA;
    end
end

% Plot and store the perceptual shifts
sortedtauI = Vec_tauI;
[sortedtauI(1, :), sortIdx1] = sort(Vec_tauI(1, :));
[sortedtauI(2, :), sortIdx2] = sort(Vec_tauI(2, :));
[sortedtauI(3, :), sortIdx3] = sort(Vec_tauI(3, :));
sortedPrcShftA = soa_sortMatrices(Vec_PrcShftA, sortIdx1, sortIdx2, sortIdx3);
sortedPrcShftO = soa_sortMatrices(Vec_PrcShftO, sortIdx1, sortIdx2, sortIdx3);
sortedBsPrcShft = soa_sortMatrices(Vec_BsPrcShft, sortIdx1, sortIdx2, sortIdx3);
sortedOpPrcShft = soa_sortMatrices(Vec_OpPrcShft, sortIdx1, sortIdx2, sortIdx3);

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
