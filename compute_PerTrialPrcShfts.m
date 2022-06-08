% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Compute the trial-to-trial temporal binding and repulsion effects,
%               as well as the baseline and operant temporal bindings,
%               as functions of temporal disparity, i.e., taoO-taoA.

% Clear all variables from workspace, clear command window, close all figures.
clearvars()
clc()
close('all')

% Graph display fonts.
fontsize = 20;
sizeBin = 200;

%%% Simulation Conditions
% Set number of taoA and taoO instances to be generated.
taoInstances = 35000;

% Choose experimental set-up.
%   ExpR = 1: Haggard et al. (2002), numCond = 3; (Vol, Invol, Sham)
%   ExpR = 2: Wolpe et al. (2013),   numCond = 3; (Low, Int, High)
ExpR = 2;
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
Vec_PrcShftA = zeros(numCond, taoInstances);
Vec_PrcShftO = zeros(numCond, taoInstances);
Vec_taoI = zeros(numCond, taoInstances);
Vec_OpPrcShfts = zeros(numCond, taoInstances);
Vec_BsPrcShfts = zeros(numCond, taoInstances);

for CondBO = 1:numCond

    % Read from files taoA and taoO values derived from a Gaussian distribution
    fnametaoA = sprintf('Exp%dCond%d_Vec_taoA.csv', ExpR, CondBO);
    fnametaoO = sprintf('Exp%dCond%d_Vec_taoO.csv', ExpR, CondBO);
    Vec_taoA = dlmread(fnametaoA);
    Vec_taoO = dlmread(fnametaoO);

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

    for indx_tao = 1:taoInstances

        % Do for each pair of taoA and taoO
        taoA = Vec_taoA(indx_tao);
        taoO = Vec_taoO(indx_tao);

        % Get the reported empirical baseline parameters
        [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

        % Compute for the posterior-ratio
        Z1 = sqrt(2 * pi) * sigmaAO * T;
        Z0 = T^2;
        Theta = log((PXi_1 * Z0) / (PXi_0 * Z1));
        sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;
        r = exp(Theta - ((taoO - taoA - muAO)^2 / (2 * sigmaTot2)));

        % Compute for strength of temporal binding
        if r > 1  % causal case
            tAhat = taoA + (sigmaA^2 / sigmaTot2) * (taoO - taoA - muAO);
            tOhat = taoO - (sigmaO^2 / sigmaTot2) * (taoO - taoA - muAO);
            Xihat = 1;
        else  % acausal case
            tAhat = taoA;
            tOhat = taoO;
            Xihat = 0;
        end

        Vec_PrcShftA(CondBO, indx_tao) = tAhat - taoA;
        Vec_PrcShftO(CondBO, indx_tao) = tOhat - taoO;
        Vec_BsPrcShfts(CondBO, indx_tao) = taoO - taoA;
        Vec_OpPrcShfts(CondBO, indx_tao) = tOhat - tAhat;
        Vec_taoI(CondBO, indx_tao) = taoO - taoA;
    end
end

% Plot and store the perceptual shifts
sortedtaoI = Vec_taoI;
[sortedtaoI(1, :), sortIndx1] = sort(Vec_taoI(1, :));
[sortedtaoI(2, :), sortIndx2] = sort(Vec_taoI(2, :));
[sortedtaoI(3, :), sortIndx3] = sort(Vec_taoI(3, :));
sortedPrcShftA = soa_sortMatrices(Vec_PrcShftA, sortIndx1, sortIndx2, sortIndx3);
sortedPrcShftO = soa_sortMatrices(Vec_PrcShftO, sortIndx1, sortIndx2, sortIndx3);
sortedOpPrcShfts = soa_sortMatrices(Vec_OpPrcShfts, sortIndx1, sortIndx2, sortIndx3);
sortedBsPrcShfts = soa_sortMatrices(Vec_BsPrcShfts, sortIndx1, sortIndx2, sortIndx3);

soa_plotErrorBars(ExpR, sortedtaoI, sortedPrcShftA, fontsize, 1, sizeBin);
fnamePrcShft = sprintf('Exp%d_perTrialPrcShftA.png', ExpR);
saveas(gcf(), fnamePrcShft);
soa_plotErrorBars(ExpR, sortedtaoI, sortedPrcShftO, fontsize, 1, sizeBin);
fnamePrcShft = sprintf('Exp%d_perTrialPrcShftO.png', ExpR);
saveas(gcf(),fnamePrcShft);
soa_plotErrorBars(ExpR, sortedtaoI, sortedBsPrcShfts, fontsize, 1, sizeBin);
fnamePrcShft = sprintf('Exp%d_perTrialBaselinePrcShfts.png', ExpR);
saveas(gcf(), fnamePrcShft);
soa_plotErrorBars(ExpR, sortedtaoI, sortedOpPrcShfts, fontsize, 1, sizeBin);
fnamePrcShft = sprintf('Exp%d_perTrialOperantPrcShfts.png', ExpR);
saveas(gcf(), fnamePrcShft);
