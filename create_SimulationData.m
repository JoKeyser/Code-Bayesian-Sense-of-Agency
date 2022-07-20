% Objective: Create the noisy sensory input signals arriving at various times
%            tauA and tauO.
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

% Uncomment to make random number generation repeatable:
rng(1, 'twister');

% Choose whether to use the Statistics and Machine Learning Toolbox; the
% original version of the code uses toolbox functions to generate and
% optionally inspect the samples (see below).
Flag_Use_Statistics_Toolbox = false;

%%% Simulation settings
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

for CondBO = 1:numCond
    % Get reported empirical baseline parameters for this experiment condition.
    [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

    % Generate samples from Gaussian distributions (first paragraph of Results).
    if Flag_Use_Statistics_Toolbox  % flag is set above
        % NOTE: Requires the Statistics and Machine Learning Toolbox.
        Vec_tauA = normrnd(tAp + muA, sigmaA, [1, tauInstances]);
        Vec_tauO = normrnd(tOp + muO, sigmaO, [1, tauInstances]);
        % Optionally, check the generated samples.
%         figure(); normplot(Vec_tauA);
%         figure(); normplot(Vec_tauO);
%         figure(); histfit(Vec_tauA);
%         figure(); histfit(Vec_tauO);
    else
        Vec_tauA = (tAp + muA) + sigmaA .* randn(1, tauInstances);
        Vec_tauO = (tOp + muO) + sigmaO .* randn(1, tauInstances);
    end

    % Generate sample statistics.
    sizeVec_tauA = numel(Vec_tauA);
    sizeVec_tauO = numel(Vec_tauO);
    tauA_min = min(Vec_tauA);
    tauA_max = max(Vec_tauA);
    tauO_min = min(Vec_tauO);
    tauO_max = max(Vec_tauO);
    uVectauA = mean(Vec_tauA);
    uVectauO = mean(Vec_tauO);
    stdVectauA = std(Vec_tauA);
    stdVectauO = std(Vec_tauO);

    % Print sample statistics and store generated simulation data.
    fprintf('\n========= tau sample statistics, exp %d cond %d =========\n', ...
        ExpR, CondBO);
    fprintf('ranges      tauA [%.1f, %.1f],  tauO [%.1f, %.1f]\n', ...
        tauA_min, tauA_max, tauO_min, tauO_max);
    fprintf('means (SDs) tauA %.1f (%.1f),  tauO %.1f (%.1f)\n', ...
        uVectauA, stdVectauA, uVectauO, stdVectauO);
    fprintf('sample size tauA %d,  tauO %d\n', ...
        sizeVec_tauA, sizeVec_tauO);
    fprintf('=======================================================\n');
    % Save samples to file for other scripts to load.
    [fnametauA, fnametauO] = soa_getFileNames(ExpR, CondBO);
    dlmwrite(fnametauA, Vec_tauA, 'delimiter', ',');
    dlmwrite(fnametauO, Vec_tauO, 'delimiter', ',');
end

% Optionally, visualize the generated samples.
soa_plotTauSamples(ExpR, numCond)
