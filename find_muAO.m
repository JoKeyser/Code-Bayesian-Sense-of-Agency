% Objective: Find the optimal value for the free parameter muAO using
%            Haggard et al.'s data, with sigmaAO equal to 10 ms.
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

%%% Simulation settings

% Choose experimental set-up.
%   ExpR = 1: Haggard et al. (2002), numCond = 3; (Vol, Invol, Sham)
%   ExpR = 2: Wolpe et al. (2013),   numCond = 3; (Low, Int, High)
ExpR = 1;
numCond = 3;

% Actual physical stimulus timings (in ms).
tAp = 0;
dist_tAtO = 250;
tOp = tAp + dist_tAtO;

% To obtain discernible perceptual shifts, sigmaAO should be small:
sigmaAO = 10;

% Initialize minimal model error, to find optimal fitting muAO.
min_modelEE = Inf;

% Perform a grid search for optimal muAO.
muAO_grid = 190:10:250;

for muAO = muAO_grid

    fprintf('Action + outcome perceptual shifts given muAO = %d ms:\n', muAO);
    sumError = 0;

    for CondBO = 1:numCond

        % Read tauA and tauO from files (sampled from Gaussian distribution).
        fnametauA = sprintf('Exp%dCond%d_Vec_tauA.csv', ExpR, CondBO);
        fnametauO = sprintf('Exp%dCond%d_Vec_tauO.csv', ExpR, CondBO);
        Vec_tauA = dlmread(fnametauA);
        Vec_tauO = dlmread(fnametauO);

        % Get empirical baseline parameters for this experiment condition.
        [~, sigmaA, ~, sigmaO] = soa_IBexperiment(ExpR, CondBO);

        % Compute total variance.
        sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;

        % Compute the action and outcome perceptual shifts (Eq. 5)
        Vec_PrcShftA = +(sigmaA^2 / sigmaTot2) * (Vec_tauO - Vec_tauA - muAO);
        Vec_PrcShftO = -(sigmaO^2 / sigmaTot2) * (Vec_tauO - Vec_tauA - muAO);
        uVec_PrcShftA = mean(Vec_PrcShftA);
        uVec_PrcShftO = mean(Vec_PrcShftO);
        sdVec_PrcShftA = std(Vec_PrcShftA);
        sdVec_PrcShftO = std(Vec_PrcShftO);
        % Round to full milliseconds.
        ruVec_PrcShftA = round(uVec_PrcShftA);
        ruVec_PrcShftO = round(uVec_PrcShftO);
        rsdVec_PrcShftA = round(sdVec_PrcShftA);
        rsdVec_PrcShftO = round(sdVec_PrcShftO);

        % Compute model estimation errors given the reported empirical results.
        [targPrcShftA, targPrcShftO] = soa_IBTargets(ExpR, CondBO);
        % Action error: Compute error for action shifts.
        errPrcShft = abs(ruVec_PrcShftA - targPrcShftA);

        % Outcome error: Optionally add error for outcome shifts.
        % NOTE: Even when we consider the average of action and outcome
        %       estimation errors, the optimal result is the same for ExpR = 1.
%         errPrcShft = (errPrcShft + abs(ruVec_PrcShftO - targPrcShftO)) / 2;

        sumError = sumError + errPrcShft;

        fprintf('\tCondition %d:\t%+3d (%2d) ms,\t%+3d (%2d) ms\n', CondBO, ...
            ruVec_PrcShftA, rsdVec_PrcShftA, ruVec_PrcShftO, rsdVec_PrcShftO);
    end

    % Average model error over conditions.
    modelEE = sumError / numCond;
    fprintf('Avg. model estimation error:\t%0.1f.\n\n', modelEE);

    % Save current minimum error and corresponding optimal muAO.
    if modelEE < min_modelEE
        min_modelEE = modelEE;
        opt_muAO = muAO;
    end
end

fprintf('For ExpR = %d, optimal muAO is %d ms.\n', ExpR, opt_muAO);

% Notes to METHODS:
% - Estimates of the perceptual shift in action timing alone was sufficient to
%   indicate the optimal muAO.
% - The optimal muAO for Experiment 1 (Haggard et al., 2002) is 230 ms.
% - Retain this same muAO value for Experiment 2 (Wolpe et al., 2013).
