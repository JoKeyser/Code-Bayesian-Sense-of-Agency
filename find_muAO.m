% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Find the optimal value for the free parameter muAO using Haggard et al.'s data,
%               with sigmaAO equal to 10ms.

% Cleaners
clear                                  % clears all variables from the workspace
clc                                    % clears the command window
close all                              % closes all figures (such as plots)

% Simulation Conditions
taoInstances = 35000;                       % Number of taoA and taoO instances to be generated
ExpR = 1; numCond = 3;                      % Experimental set-up
                                            %   Haggard et al. (2002): ExpR = 1; NumCond = 3; (Vol, Invol, Sham)
tAp=0; dist_tAtO=250; tOp=tAp+dist_tAtO;    % Actual physical stimulus timings

sigmaAO = 10;                               % To obtain discernible perceptual shifts, sigmaAO should be small

for muAO = [190 200 210 220 230 240 250]

    fprintf('Action and outcome perceptual shifts per condition given muAO=%d\n', muAO);
    sumError = 0;

    for CondBO = 1:numCond

        % Read from files taoA and taoO values derived from a Gaussian distribution
        fnametaoA = sprintf('Exp%dCond%d_Vec_taoA.csv',ExpR,CondBO);
        fnametaoO = sprintf('Exp%dCond%d_Vec_taoO.csv',ExpR,CondBO);
        Vec_taoA  = dlmread(fnametaoA);
        Vec_taoO  = dlmread(fnametaoO);

        % Get the reported empricial baseline parameters
        [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);

        % Compute for sigma_Tot
        sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;

        % Compute the action and oputcome perceptual shifts
        Vec_PrcShftA   =   (sigmaA*2 / sigmaTot2) * (Vec_taoO - Vec_taoA - muAO);
        Vec_PrcShftO   = - (sigmaO*2 / sigmaTot2) * (Vec_taoO - Vec_taoA - muAO);
        uVec_PrcShftA  = mean(Vec_PrcShftA); sdVec_PrcShftA = std(Vec_PrcShftA) ;
        uVec_PrcShftO  = mean(Vec_PrcShftO); sdVec_PrcShftO = std(Vec_PrcShftO);
        ruVec_PrcShftA = round(uVec_PrcShftA); rsdVec_PrcShftA = round(sdVec_PrcShftA);
        ruVec_PrcShftO = round(uVec_PrcShftO); rsdVec_PrcShftO = round(sdVec_PrcShftO);

        % Compute for model estimation errors given the reported empirical results
        [targPrcShftA, targPrcShftO] = soa_IBTargets(ExpR,CondBO);
        errPrcShft = abs(ruVec_PrcShftA - targPrcShftA);
            %{
                NOTE: Even when we consider the average of action and outcome estimation errors,
                        the optimal result is the same.
                errPrcShft = (abs(ruVec_PrcShftA - targPrcShftA) + abs(ruVec_PrcShftO - targPrcShftO))/2;
            %}
        sumError = sumError + errPrcShft;

        fprintf('Condition %d:\t %0.1f(%0.2f)\t %0.1f(%0.2f)\n', CondBO, ruVec_PrcShftA, rsdVec_PrcShftA, ruVec_PrcShftO, rsdVec_PrcShftO);
    end

    modelEE = sumError/numCond;
    fprintf('model estimation error:\t%0.2f:\n\n',modelEE);
    if muAO==190 || (muAO~=190 && modelEE < min_modelEE)
        min_modelEE = modelEE;
        opt_muAO = muAO;
    end
end

fprintf('Optimal muAO is %d ms.\n', opt_muAO);
%{
    Notes to METHODS:
    - Estimates of the perceptual shift in action timing alone was sufficient to indicate
        the optimal muAO.
    - The optimal muAO for Experiment 1 (Haggard et al.) is 230 ms.
    - Retain this same muAO value for Experiment 2 (Wolpe et al.).
%}
