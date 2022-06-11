% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Compute the Confidence on Causal Estimate (CCE) along P(Xi=1)
%            values in the range [0.0, 1.0] with increments of 0.1.

% Clear all variables from workspace, clear command window, close all figures.
clearvars()
clc()
close('all')

% Graph display fonts.
fontsize = 20;
sizeBin = 200;

%%% Simulation Settings
% Set number of taoA and taoO instances to be generated
taoInstances = 35000;

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
T = 250;  % large enough but finite constant

% Data Matrices
LB = 0.0;
INC = 0.1;
UB = 1.0;
arrPXi1 = LB:INC:UB;
size_pXi1 = numel(arrPXi1);
arrCCE = zeros(numCond, size_pXi1);

for CondBO = 1:numCond

    % Read from files taoA and taoO values derived from a Gaussian distribution
    fnametaoA = sprintf('Exp%dCond%d_Vec_taoA.csv', ExpR, CondBO);
    fnametaoO = sprintf('Exp%dCond%d_Vec_taoO.csv', ExpR, CondBO);
    Vec_taoA = dlmread(fnametaoA);
    Vec_taoO = dlmread(fnametaoO);

    indxPXi1 = size_pXi1 + 1;

    for PXi_1 = UB:-INC:LB

        PXi_0 = 1 - PXi_1;
        Vec_CCE = zeros(1, taoInstances);

        for indx_tao = 1:taoInstances

            % Do for each pair of taoA and taoO
            taoA = Vec_taoA(indx_tao);
            taoO = Vec_taoO(indx_tao);

            % Get the reported empricial baseline parameters
            [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

            % Compute CCE
            Z1 = sqrt(2 * pi) * sigmaAO * T;
            Z0 = T^2;
            Theta = log((PXi_1 * Z0) / (PXi_0 * Z1));
            sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;
            X = Theta - ((taoO - taoA - muAO)^2 / (2 * sigmaTot2)) ...
                + log(sigmaAO / sqrt(sigmaTot2));
            Vec_CCE(1, indx_tao) = ( ...
                sqrt(sigmaTot2) / (2 * pi * sigmaA * sigmaO * sigmaAO)) ...
                * (1 / (1 + exp(-X)));
        end

        uCCE = mean(Vec_CCE(1, :));
        sdCCE = std(Vec_CCE(1, :));
        fprintf('Condition %d\t P(Xi=1): %0.2f\n', CondBO, PXi_1);
        fprintf('CCE        :\t %0.2e(%0.2e)\n', uCCE, sdCCE);
        indxPXi1 = indxPXi1 - 1;
        arrCCE(CondBO, indxPXi1) = uCCE;
    end
end

% Plot and store CCE as function of causal prior strength
soa_plotBehaviors(ExpR, arrCCE, arrPXi1, fontsize, 1);
fnameCCEPXi = sprintf('Exp%d_CCEPXi.png', ExpR);
saveas(gcf(), fnameCCEPXi);
