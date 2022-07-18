% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Compute the trial-to-trial Confidence on Causal Estimate (CCE).

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

    % Simulated using the fitted P(Xi=1) optimal values
    if ExpR == 1
        if CondBO == 1
            PXi_1 = 0.9;
        elseif CondBO == 2
            PXi_1 = 0.9;
        else
            PXi_1 = 0.1;
        end
    elseif ExpR == 2
        if CondBO == 1
            PXi_1 = 0.9;
        elseif CondBO == 2
            PXi_1 = 0.6;
        else
            PXi_1 = 0.5;
        end
    end

    PXi_0 = 1 - PXi_1;

    % Read from files tauA and tauO values derived from a Gaussian distribution
    fnametauA = sprintf('Exp%dCond%d_Vec_tauA.csv', ExpR, CondBO);
    fnametauO = sprintf('Exp%dCond%d_Vec_tauO.csv', ExpR, CondBO);
    Vec_tauA = dlmread(fnametauA);
    Vec_tauO = dlmread(fnametauO);

    for indx_tau = 1:tauInstances

        % Do for each pair of tauA and tauO.
        tauA = Vec_tauA(indx_tau);
        tauO = Vec_tauO(indx_tau);

        % Get the reported empirical baseline parameters.
        [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

        % Compute CCE (see Methods).
        Z1 = sqrt(2 * pi) * sigmaAO * T;
        Z0 = T^2;
        Theta = log((PXi_1 * Z0) / (PXi_0 * Z1));
        sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;
        X = Theta - ((tauO - tauA - muAO)^2 / (2 * sigmaTot2)) ...
            + log(sigmaAO / sqrt(sigmaTot2));
        Vec_CCE(CondBO, indx_tau) = ...
            (sqrt(sigmaTot2) / (2 * pi * sigmaA * sigmaO * sigmaAO)) ...
            * soa_Sigmoid(X);

        Vec_tauI(CondBO, indx_tau) = tauO - tauA;
    end
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
