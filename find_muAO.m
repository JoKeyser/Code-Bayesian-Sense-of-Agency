8/15/19 9:56 AM                                    /Users/roberto/Documents/MATLAB/find_muAO.m                                                1 of 2
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Find the optimal value for the free parameter muAO using Haggard et al.'s data,
%               with sigmaAO equal to 10ms.
% Cleaners
clear                                                                    % clears all variables from the workspace
cle                                                                      % clears the command window
close all                                                                % closes all figures (such as plots)
% Simulation Conditions
taoInstances = 35000;                                                    % Number of taoA and taoO instances to be generated
ExpR = 1; numCond = 3;                                                   % Experimental set-up
% Haggard et al. (2002): ExpR = 1; NumCond = 3; (Vol, Invol, Sham)
tAp=0; dist_tAt0=250; tOp=tAp+dist_tAt0;                                  % Actual physical stimulus timings
sigmaAO = 10;                                                            % To obtain discernible perceptual shifts, sigmaAO should be small
for muAO = [190 200 210 220 230 240 250]
fprintf('Action and outcome perceptual shifts per condition given muA0=%d\n' muA0) ;
sumError = Q;
for CondBO = 1:numCond
% Read from files taoA and tao0O values derived from a Gaussian distribution
fnametaoA = sprintf ('Exp%dCond%d_Vec_taoA.csv',ExpR, CondBO) ;
fnametaoO = sprintf ('Exp%dCond%d_Vec_tao0.csv',ExpR, CondBO) ;
Vec_taoA = dlmread(fnametaoA);
Vec_taoO = dlmread(fnametao0) ;
% Get the reported empricial baseline parameters
[muA, sigmaA, mu0, sigma0] = soa_IBexperiment(ExpR, CondBO);
% Compute for sigma_Tot
sigmaTot2 = sigmaA*2 + sigma0*2 + sigmaA0*%2;
% Compute the action and oputcome perceptual shifts
Vec_PrcShftA = (sigmaA*2 / sigmaTot2) * (Vec_tao0 - Vec_taoA - muA0);
Vec_PrcShftO = — (sigma0*2 / sigmaTot2) * (Vec_tao0O - Vec_taoA — muAQ);
uVec_PrcShftA = mean(Vec_PrcShftA); sdVec_PrcShftA = std(Vec_PrcShftA) ;
uVec_PrcShftO = mean(Vec_PrcShft0); sdVec_PrcShftO = std(Vec_PrcShft0);
ruVec_PrcShftA = round(uVec_PrcShftA); rsdVec_PrcShftA = round(sdVec_PrcShftA) ;
ruVec_PrcShft0O = round(uVec_PrcShft0); rsdVec_PrcShftO = round(sdVec_PrcShft0) ;
% Compute for model estimation errors given the reported empirical results
[targPrcShftA, targPrcShft0] = soa_IBTargets(ExpR,CondB0) ;
errPrcShft = abs(ruVec_PrcShftA - targPrcShftA) ;
%{
NOTE: Even when we consider the average of action and outcome estimation errors,
the optimal result is the same.
errPrcShft = (abs(ruVec_PrcShftA - targPrcShftA) + abs(ruVec_PrcShft0 - targPrcShft0))/2;
%}
sumError = sumError + errPrcShft;
fprintf('Condition %d:\t %@.1f(%0.2f)\t %@.1f(%@.2f)\n,; CondBO, ruVec_PrcShftA, rsdVec_PrcShftA, ruVec_PrcShft0, rsdVec_PrcShft0) ;
end
modelEE = sumError/numCond;
fprintf (‘model estimation error:\t%@.2f:\n\n,modelEE) ;
if muAO==190 || (muA0~=19@ && modelEE < min_modelEE)
8/15/19 9:56 AM                                    /Users/roberto/Documents/MATLAB/find_muAO.m                                                2 of 2
min_modelEE = modelEE;
opt_muAO = muAO;
end
end
fprintf('Optimal muAO is %d ms.\n', opt_muA0);
%{
Notes to METHODS:
— Estimates of the perceptual shift in action timing alone was sufficient to indicate
the optimal muA0O.
- The optimal muAO for Experiment 1 (Haggard et al.) is 23@ ms.
- Retain this same muAO value for Experiment 2 (Wolpe et al.).
%}