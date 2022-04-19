8/15/19 10:04 AM                        /Users/roberto/Documents/MATLAB/compute_PXisPrcShfts.m                                  1 of 3
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Fit Haggard et al's data to find the optimal value for the free parameter P(Xi=1),
%               muAO is 23@ms and sigmaAO is 10ms.
%            Plot the action and outcome perceptual shifts given P(Xi=1) in the range
%               [0.0,1.@] with @.1 increments
% Cleaners
clear                                                                    % clears all variables from the workspace
clc                                                                      % clears the command window
close all                                                                % closes all figures (such as plots)
% Graph display fonts
fontsize = 20;
sizeBin = 200;
% Simulation Conditions
taoInstances = 35000;                                                    % Number of taoA and taoO instances to be generated
ExpR = 1; numCond = 3;                                                   % Experimental set-up
%   Haggard et al. (2002): ExpR = 1; NumCond = 3; (Vol, Invol, Sham)
% Wolpe et al. (2013) : ExpR = 2; NumCond = 3; (Low, Int, High)
tAp=0; dist_tAt0=250; tOp=tAp+dist_tAt0;                                  % Actual physical stimulus timings
% Optimal condition-independent parameters
muAO    = 230;
SigmaAO = 10;
% Interval length in consideration
T = 250;                                                                 % Large enough but finite constant
% Data Matrices
LB = 0.0; INC = 0.1; UB = 1.0;
arrPXil     = LB: INC:UB;
size_pXil = numel(arrPXil);
arrPrcShftA = zeros(numCond,size_pXi1);
arrPrcShft0 = zeros(numCond,size_pXil);
arrAOBinding = zeros(numCond,size_pXil1);
for CondBO = 1:numCond
% Read from files taoA and tao0O values derived from a Gaussian distribution
fnametaoA = sprintf ('Exp%dCond%d_Vec_taoA.csv',ExpR, CondBO) ;
fnametaoO = sprintf ('Exp%dCond%d_Vec_tao0.csv',ExpR, CondBO) ;
Vec_taoA = dlmread(fnametaoA) ;
Vec_taoO = dlmread(fnametao0) ;
indxPXi1l = size_pXil + 1;
for PXi_1 = UB:—-INC:LB
PXi_O@ = 1 - PXi_1;
% Matrices to track optimal action and outcome estimates
Vec_PrcShftA = soa_InitMatrix(1,taoInstances);
Vec_PrcShftO = soa_InitMatrix(1,taoInstances);
Vec_AOBinding = soa_InitMatrix(1,taoInstances);
for indx_tao = 1:taoInstances
% Do for each pair of taoA and tao0
taoA = Vec_taoA(indx_tao);
taoO = Vec_tao0(indx_tao);
8/15/19 10:04 AM                        /Users/roberto/Documents/MATLAB/compute_PXisPrcShfts.m                                  2 of 3
% Get the reported empricial baseline parameters
[muA, sigmaA, mu0, sigmaO] = soa_IBexperiment(ExpR, CondBO);
% Compute for the posterior-ratio
Z1 = sqrt(2*pi)*sigmaAOxT;
Z0@ = T*2;
Theta = log((PXi_1*ZO) /(PXi_Q*Z1) );
sigmaTot2 = sigmaA*2 + sigma0*2 + sigmaA0*2;
r = exp(Theta — ((tao0-taoA-muA0)*2/(2*sigmaTot2) ));
% Compute for strength of temporal binding
if r > 1% Causal
tAhat = taoA + (sigmaA*2/sigmaTot2)*(tao0-taoA-muA0) ;
tOhat = tao0 - (sigma0*2/sigmaTot2)x(tao0-—taoA-—muA0) ;
Xihat =1;
else % Acausal
tAhat = taoA;
tOhat = tao0;
Xihat=0;
end
Vec_PrcShftA(1, indx_tao) = tAhat - taoA;
Vec_PrcShft0(1, indx_tao) = tOhat - tao0;
Vec_AOBinding(1, indx_tao) = 250 + (tOhat-tao0) - (tAhat-taoA);
end
uPrcShftA = mean(Vec_PrcShftA(:)); sdPrcShftA = std(Vec_PrcShftA(:));
uPrcShftO = mean(Vec_PrcShft0(:)); sdPrcShftO = std(Vec_PrcShft0(:));
uAOBinding = mean(Vec_AOBinding(:)); sdAOBinding = std(Vec_AOBinding(:));
% Compute for model estimation errors given the reported empirical results
[targPrcShftA, targPrcShft0] = soa_IBTargets(ExpR, CondB0) ;
ruVec_PrcShftA = round(uPrcShftA) ;
ruVec_PrcShftO = round(uPrcShft0) ;
errPrcShftA = abs(ruVec_PrcShftA - targPrcShftA);
errPrcShft0 = abs(ruVec_PrcShft0O - targPrcShft0);
fprintf('Condition %d \t P(Xi=1): %@.2f\n, CondBO, PXi_1);
fprintf('uPercShfts   r\t %O.2f(%@.2F)\t %60.1f(%@.1f)\n; uPrcShftA, sdPrcShftA, uPrcShft0,sdPrcShft0) ;
fprintf('Error in action perceptual shift: %@.2f\n, errPrcShftA) ;
fprintf('Error in outcome perceptual shift: %@.2f\n\n, errPrcShft0O);
indxPXil = indxPXil - 1;
arrPrcShftA(CondBO, indxPXi1) = uPrcShftA;
arrPrcShft0(CondBO, indxPXi1) = uPrcShft0;
arrAOBinding(CondBO, indxPXi1) = uAOBinding;
end
fprintf('\n');
end
% Plot and store the perceptual shifts and action-outcome binding
soa_plotPrcShts(ExpR, arrPrcShftA, arrPrcShft0O, arrPXil, fontsize);
fnamePrcShft = sprintf ('Exp%d_PXisPrcShfts.png',ExpR) ;
saveas(gcf,fnamePrcShft);
soa_plotBehaviors(ExpR, arrAOBinding, arrPXil, fontsize, 1);
fnamePrcShft = sprintf ('Exp%d_PXisPrcShfts.png',ExpR) ;
saveas(gcf,fnamePrcShft) ;
% Store the perceptual shifts
8/15/19 10:04 AM                        /Users/roberto/Documents/MATLAB/compute_PXisPrcShfts.m                                  3 of 3
fnamePrcShftA = sprintf ('Exp%d_arrPrcShftA.csv',ExpR) ;
fnamePrcShftO = sprintf ('Exp%d_arrPrcShft0.csv',ExpR) ;
dlmwrite(fnamePrcShftA, arrPrcShftA, 'delimiter',',');
dlmwrite(fnamePrcShft0, arrPrcShft0O, 'delimiter',',');
Sf
Notes to METHODS:
- Estimates of the perceptual shift in action timing alone was sufficient to indicate
the optimal P(Xi=1) value. However, note the following.
- Although the optimal P(Xi=1) value for the voluntary and involuntary conditions is 1.0,
the result is saturated. Hence, report P(Xi=1)=0.9 for both conditions.
— Report P(Xi=1)=0.1 for the sham condition, assuming causality is less frequently detected.
- Although the ptimal P(Xi=1) value for the intermediate tone uncertainty condition is Q.5,
the outcome binding behavior is not consistent with the reported outcome binding.
Report P(Xi=1)=0.6 for the intermediate tone uncertainty condition since it also best minimized
the estimation error while reproducing the reported action and outcome bindings.
%}