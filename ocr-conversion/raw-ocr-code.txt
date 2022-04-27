8/15/19 9:56 AM                              /Users/roberto/Documents/MATLAB/create_SimulationData.m                                          1 of 1
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Create the noisy sensory input signals arriving at various times taoA and tao0
% Cleaners
clear                                                                    % clears all variables from the workspace
clc                                                                      % clears the command window
close all                                                                % closes all figures (such as plots)
Sf
Only if random generation should be repeatable
rng(1, 'twister');
%}
% Simulation conditions
taoInstances = 35000;                                                    % Number of taoA and taoO instances to be generated
ExpR = 1; numCond = 3;                                                   % Experimental set-up
% Haggard et al. (2002): ExpR = 1; NumCond = 3; (Voluntary, Involuntary, Sham)
% Wolpe et al. (2013) : ExpR = 2; NumCond = 3; (Low, Intermediate, High)
tAp=0; dist_tAt0=250; tOp=tAp+dist_tAt0;                                  % Actual physical stimulus timings
for CondBO = 1:numCond
% Initialize baseline parameters with reported empirical data
[muA, sigmaA, mu0, sigma0] = soa_IBexperiment(ExpR, CondBO);
% Generate from Gaussian distributions
Vec_taoA = normrnd(tAp + muA, sigmaA, [1 taoInstances]);              % Alterntaive: sigmaA .* randn(1,numInstances) + (tAp + muA);
Vec_taoO = normrnd(tOp + mu0, sigmaO, [1 taoInstances] );               %               sigmaO .* randn(1,numInstances) + (tOp + mu0);
%{
% Check the generated data
figure; normplot(Vec_taoA) ;
figure; normplot(Vec_tao0) ;
figure; histfit(Vec_taoA);
figure; histfit(Vec_tao0);
%}
% Generate statistics
sizeVec_taoA = numel(Vec_taoA);
sizeVec_tao0 = numel(Vec_tao0);
taoA_min = min(Vec_taoA); taoA_max = max(Vec_taoA);
taoO_min = min(Vec_tao0); taoO_max = max(Vec_tao0);
uVectaoA = mean(Vec_taoA); stdVectaoA = std(Vec_taoA);
uVectaoO = mean(Vec_tao0); stdVectao0O = std(Vec_tao0);
% Store generated simulation data
fprintf ('\n============== tao DataSet Exp %d Cond %d ================\n,' ExpR, CondBO);
fprintf('taoA [%0.2f, %0.2f] taoO0 [%0.2f, %@.2f]\n, taoA_min,taoA_max, taoO_min, tao0_max) ;
fprintf('tao statistics: %0.2f (%@.2f)\t %@.2f (%@.2f)\n, uVectaoA, stdVectaoA, uVectao0, stdVectao0);
fprintf('taoA elements: %d taoO elements: %d\n, sizeVec_taoA, sizeVec_tao0);
f p rintf(' SossssSsSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS=====\ ny ,
fnametaoA = sprintf ('Exp%dCond%d_Vec_taoA.csv',ExpR, CondBO) ;
fnametaoO = sprintf ('Exp%dCond%d_Vec_tao0.csv',ExpR, CondBO);
dlmwrite(fnametaoA, Vec_taoA, delimiter',',');
dlmwrite(fnametaoO, Vec_tao0,;delimiter',',');
end
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
8/15/19 10:16 AM                      /Users/roberto/Documents/MATLAB/compute_PerTrialPrcShfts.m                                 1 of 2
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Compute the trial-to-trial temporal binding and repulsion effects,
%               as well as the baseline and operant temporal bindings,
%               as functions of temporal disparity, i.e., tao0-taoA
% Cleaners
clear                                                                    % clears all variables from the Workspace
clc                                                                      % clears the Command Window
close all
% Graph display fonts
fontsize = 20;
sizeBin = 200;
% Simulation Conditions
taoInstances = 35000;                                                    % Number of taoA and taoO instances to be generated
ExpR = 2; numCond = 3;                                                   % Experimental set-up
% Haggard et al. (2002): ExpR = 1; NumCond = 3; (Vol, Invol, Sham)
% Wolpe et al. (2013) : ExpR = 2; NumCond = 3; (Low, Int, High)
tAp=0; dist_tAt0=250; tOp=tAp+dist_tAt0;                                  % Actual physical stimulus timings
% Optimal condition-—independent parameters
muAO    = 230;
sigmaAO = 10;
% Interval length in consideration
T = 250;                                                                 % Large enough but finite constant
% Data Matrices
Vec_PrcShftA   = zeros(numCond, taoInstances) ;
Vec_PrcShftO = zeros(numCond,taoInstances);
Vec_taol       = zeros(numCond, taoInstances) ;
Vec_OpPrcShfts = zeros(numCond, taoInstances) ;
Vec_BsPrcShfts = zeros(numCond, taoInstances) ;
for CondBO = 1:numCond
% Read from files taoA and tao0 values derived from a Gaussian distribution
fnametaoA = sprintf ('Exp%sdCond%d_Vec_taoA.csv',ExpR, CondBO) ;
fnametaoO = sprintf ('Exp%dCond%d_Vec_tao0.csv',ExpR, CondBO) ;
Vec_taoA = dlmread(fnametaoA) ;
Vec_taoO = dlmread(fnametao0) ;
% Simulated using the fitted P(Xi=1) optimal values
if ExpR==1
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
else PXi_1 = 0.5;
end
end
8/15/19 10:16 AM                      /Users/roberto/Documents/MATLAB/compute_PerTrialPrcShfts.m                                 2 of 2
PXi_@ = 1 - PXi_1;
for indx_tao = 1:taoInstances
taoA = Vec_taoA(indx_tao) ;
tao0 = Vec_tao0(indx_tao);
[muA, sigmaA, mu0, sigma0] = soa_IBexperiment(ExpR, CondBO);
Z1 = sqrt(2*pi)*sigmaAOxT;
Z® = T%2;
Theta = log((PXi_1*ZO)/(PXi_QxZ1) );
sigmaTot2 = sigmaA*2 + sigma0*2 + sigmaA0*2;
r = exp(Theta — ((tao0-taoA-muA0)*2/(2*sigmaTot2) ));
ifr>1
tAhat = taoA + (sigmaA*2/sigmaTot2)*(tao0-taoA-muA0) ;
tOhat = tao0 - (sigma0*2/sigmaTot2)*(tao0-taoA—muA0) ;
Xihat =1;
else
tAhat = taoA;
tOhat = tao0;
Xihat=0;
end
Vec_PrcShftA(CondBO, indx_tao)     = tAhat - taoA;
Vec_PrcShft0(CondBO, indx_tao)     = tOhat - tao0;
Vec_BsPrcShfts(CondBO, indx_tao) = taoO - taoA;
Vec_OpPrcShfts(CondBO, indx_tao) = tOhat - tAhat;
Vec_taoI(CondBO, indx_tao)         = tao0 - taoA;
end
end
sortedtaoI = Vec_taol;
[sortedtaol(1,:), sortIndx1] = sort(Vec_taoI(1,:));
[sortedtaoI(2,:), sortIndx2] = sort(Vec_taoI(2,:));
[sortedtaoI(3,:), sortIndx3] = sort(Vec_taoI(3,:));
sortedPrcShftA = soa_sortMatrices(Vec_PrcShftA,   sortIndx1, sortIndx2, sortIndx3);
sortedPrcShftO = soa_sortMatrices(Vec_PrcShft0,   sortIndx1, sortIndx2, sortIndx3);
sortedOpPrcShfts = soa_sortMatrices(Vec_OpPrcShfts, sortIndx1, sortIndx2, sortIndx3);
sortedBsPrcShfts = soa_sortMatrices(Vec_BsPrcShfts, sortIndx1, sortIndx2, sortIndx3);
soa_plotErrorBars(ExpR, sortedtaoI, sortedPrcShftA, fontsize, 1, sizeBin);
fnamePrcShft = sprintf ('Exp%d_perTrialPrcShftA. png, ExpR) ;
saveas(gcf,fnamePrcShft) ;
soa_plotErrorBars(ExpR, sortedtaoI, sortedPrcShft0, fontsize, 1, sizeBin);
fnamePrcShft = sprintf ('Exp%d_perTrialPrcShft0.pngExpR);
saveas(gcf,fnamePrcShft);
soa_plotErrorBars(ExpR, sortedtaol, sortedBsPrcShfts, fontsize, 1, sizeBin);
fnamePrcShft = sprintf ('Exp%d_perTrialBaselinePrcShfts.png,ExpR);
saveas(gcf,fnamePrcShft);
soa_plotErrorBars(ExpR, sortedtaoI, sortedOpPrcShfts, fontsize, 1, sizeBin);
fnamePrcShft = sprintf ('Exp%d_perTrialO0perantPrcShfts.png,ExpR);
saveas(gcf,fnamePrcShft) ;
8/15/19 10:17 AM                                /Users/roberto/Documents/MATLAB/compute_CCEPXil.m                                             1 of 2
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Compute the Confidence on Causal Estimate (CCE) along P(Xi=1)
%               values in the range [0.0,1.0] with increments of 0.1
% Cleaners
clear                                                                    % clears all variables from the Workspace
cle                                                                      % clears the Command Window
close all
% Graph display fonts
fontsize = 20;
sizeBin = 200;
% Simulation Conditions
taoInstances = 35000;                                                    % Number of taoA and taoO instances to be generated
ExpR = 2; numCond = 3;                                                   % Experimental set-up
% Haggard et al. (2002): ExpR = 1; NumCond = 3; (Vol, Invol, Sham)
% Wolpe et al. (2013) : ExpR = 2; NumCond = 3; (Low, Int, High)
tAp=0; dist_tAt0=250; tOp=tAp+dist_tAt0;                                  % Actual physical stimulus timings
% Optimal condition-independent parameters
muAO    = 230;
sigmaAO = 10;
% Interval length in consideration
T = 250;                                                                 % Large enough but finite constant
% Data Matrices
LB = 0.0; INC = @.1; UB = 1.0;
arrPXil = LB: INC:UB;
size_pXil = numel(arrPXil);
arrCCE = zeros(numCond,size_pXil);
for CondBO = 1:numCond
% Read from files taoA and tao0 values derived from a Gaussian distribution
fnametaoA = sprintf ('Exp%dCond%d_Vec_taoA.csv',ExpR, CondBO) ;
fnametaoO = sprintf ('Exp%dCond%d_Vec_tao0.csv',ExpR, CondBO) ;
Vec_taoA = dlmread(fnametaoA) ;
Vec_taoO = dlmread(fnametao0) ;
indxPXil = size_pXil + 1;
for PXi_1 = UB:-INC:LB
PXi_@ = 1 - PXi_1;
Vec_CCE = soa_InitMatrix(1,taoInstances) ;
for indx_tao = 1:taoInstances
% Do for each pair of taoA and tao0
taoA = Vec_taoA(indx_tao);
tao0 = Vec_tao0(indx_tao);
% Get the reported empricial baseline parameters
[muA, sigmaA, mu0, sigma0] = soa_IBexperiment(ExpR, CondBO);
% Compute CCE
Z1 = sqrt(2xpi)*sigmaAOxT;
8/15/19 10:17 AM                                /Users/roberto/Documents/MATLAB/compute_CCEPXil.m                                             2 of 2
20 = T*2;
Theta = log((PXi_1*ZO)/(PXi_Q*Z1) );
sigmaTot2 = sigmaA*2 + sigma0*2 + sigmaA0*%2;
X = Theta - ((tao0-taoA-—muA0)*2/(2*sigmaTot2)) + log(sigmaA0/sqrt(sigmaTot2) );
Vec_CCE(1,indx_tao) = (sqrt(sigmaTot2)/(2*pixsigmaA*xsigmaO*sigmaAO)) x..
(1 / (1 + exp(-X)));
end
uCCE = mean(Vec_CCE(1,:)); sdCCE = std(Vec_CCE(1,:));
fprintf (‘Condition %d\t P(Xi=1): %@.2f\n}, CondBO, PXi_1);
fprintf (‘CCE     :\t %@.2e(%@.2e)\n}  uCCE, sdCCE);
indxPXil = indxPXil - 1;
arrCCE(CondBO, indxPXi1) = uCCE;
end
end
soa_plotBehaviors(ExpR, arrCCE, arrPXil, fontsize, 1);
fnameCCEPXi = sprintf ('Exp%d_CCEPXi.png',ExpR);
saveas(gcf, fnameCCEPXi) ;
8/15/19 10:18 AM                         /Users/roberto/Documents/MATLAB/compute_PerTrialCCE.m                                   1 of 2
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Compute the trial-to-trial Confidence on Causal Estimate (CCE)
% Cleaners
clear                                                                    % clears all variables from the Workspace
clc                                                                      % clears the Command Window
close all
% Graph display fonts
fontsize = 20;
sizeBin = 200;
% Simulation Conditions
taoInstances = 35000;                                                    % Number of taoA and taoO instances to be generated
ExpR = 1; numCond = 3;                                                   % Experimental set-up
% Haggard et al. (2002): ExpR = 1; NumCond = 3; (Vol, Invol, Sham)
% Wolpe et al. (2013) : ExpR = 2; NumCond = 3; (Low, Int, High)
tAp=0; dist_tAt0=250; tOp=tAp+dist_tAt0;                                  % Actual physical stimulus timings
% Optimal condition—independent parameters
muAO    = 230;
sigmaAO = 10;
% Interval length in consideration
T = 250;                                                                 % Large enough but finite constant
% Data Matrices
Vec_CCE = soa_InitMatrix(numCond,taoInstances) ;
Vec_taoI = soa_InitMatrix(numCond, taoInstances) ;
Vec_Pc = soa_InitMatrix(numCond,taoInstances) ;
for CondBO = 1:numCond
% Simulated using the fitted P(Xi=1) optimal values
if ExpR==1
if CondBO == 1
PXi_1 = 0.9;
elseif CondBO == 2
PXi_1 = 0.9;
else
PXi_1 = Q.1;
end
elseif ExpR==2
if CondBO == 1
PXi_1 = 0.9;
elseif CondBO == 2
PXi_1 = 0.6;
else PXi_1 = 0.5;
end
end
PXi_@ = 1 - PXi_1;
% Read from files taoA and tao0 values derived from a Gaussian distribution
fnametaoA = sprintf ('Exp%dCond%d_Vec_taoA.csv',ExpR, CondBO) ;
fnametaoO = sprintf ('Exp%dCond%d_Vec_tao0.csv',ExpR, CondBO) ;
Vec_taoA = dlmread(fnametaoA) ;
Vec_taoO = dlmread(fnametao0) ;
8/15/19 10:18 AM                         /Users/roberto/Documents/MATLAB/compute_PerTrialCCE.m                                   2 of 2
for indx_tao = 1:taoInstances
taoA = Vec_taoA(indx_tao);
tao0 = Vec_tao0(indx_tao);
[muA, sigmaA, mu0, sigma0] = soa_IBexperiment(ExpR, CondBO);
Z1 = sqrt(2*xpi)*sigmaAOxT;
Z@ = T%2;
Theta = log((PXi_1*Z@) /(PXi_@*Z1));
sigmaTot2 = sigmaA*2 + sigma0*2 + sigmaA0*2;
X = Theta — ((tao0-taoA-muA0)*2/(2*sigmaTot2)) + log(sigmaA0/sqrt(sigmaTot2) );
Vec_CCE(CondBO, indx_tao) = (sqrt(sigmaTot2) /(2*xpixsigmaA*sigmaOxsigmaAO)) x..
(1 / (1 + exp(-X)));
Vec_taoI(CondBO,indx_tao) = tao0-taoA;
end
end
sortedtaol = Vec_taolI;
[sortedtaoI(1,:), sortIndx1] = sort(Vec_taoI(1,:));
[sortedtaoI(2,:), sortIndx2] = sort(Vec_taoI(2,:));
[sortedtaoI(3,:), sortIndx3] = sort(Vec_taoI(3,:));
sortedCCE = soa_sortMatrices(Vec_CCE, sortIndx1, sortIndx2, sortIndx3) ;
soa_plotErrorBars(ExpR, sortedtaoI, sortedCCE, fontsize, 1, sizeBin);
fnameCCE = sprintf ('Exp%d_perTrialCCE.png',ExpR);
saveas(gcf, fnameCCE) ;
8/15/19 10:21 AM                         /Users/roberto/Documents/MATLAB/soa_IBexperiment.m                                   1 of 1
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Return the means and standard deviations of the reported
%            baseline action and outcome timing judgment errors
function [mu_A, sigma_A, mu_0, sigma_0] = soa_IBexperiment(experiment_case, condition)
if experiment_case == 1
% Haggard et al., 2002 (Nat Neurosci): Seminal intentional binding experiment
%      Different keypress (i.e., the action) conditions
if condition == 1
mu_A = 6; sigma_A = 66;
elseif condition == 2
mu_A = 83; sigma_A = 83;
elseif condition == 3
mu_A = 32; sigma_A = 78;
end
mu_O = 15; sigma_O = 72;
elseif experiment_case == 2
% Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome
%       Different tone (i.e., the outcome) conditions
mu_A = -8; sigma_A = 75;
if condition == 1
mu_O = 35; sigma_O = 61;
elseif condition == 2
mu_O = 46; sigma_O = 66;
elseif condition == 3
mu_O = 95; sigma_O = 90;
end
end
8/15/19 10:22 AM                                 /Users/roberto/Documents/MATLAB/soa_IBTargets.m                                              1 of 1
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Return the reported action and outcome perceptual shifts
%               for the operant conditions
function [trgtPrcShftA, trgtPrcShft0] = soa_IBTargets(experiment, condition)
if experiment == 1
% Haggard et al., 2002 (Nat Neurosci): Seminal intentional binding experiment
%      Different keypress (i.e., the action) conditions
if condition == 1
trgtPrcShftA = 15;
trgtPrcShftO = -46;
elseif condition == 2
trgtPrcShftA = -27;
trgtPrcShftO = 31;
elseif condition == 3
trgtPrcShftA = -7;
trgtPrcShftO = -8;
end
elseif experiment == 2
% Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome
%       Different tone (i.e., the outcome) conditions
if condition == 1
trgtPrcShftA = 39;
trgtPrcShftO = -51;
elseif condition == 2
trgtPrcShftA = 31;
trgtPrcShftO = -65;
elseif condition == 3
trgtPrcShftA =   32;
trgtPrcShftO = -105;
end
end
8/15/19 10:23 AM                          /Users/roberto/Documents/MATLAB/soa_InitMatrix.m                                    1 of 1
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Instantiate a rows—by-cols matrix with zero values
function [matrix_] = soa_InitMatrix(rows_, cols_)
matrix_ = zeros(rows_, cols_);
8/15/19 10:25 AM                         /Users/roberto/Documents/MATLAB/soa_sortMatrices.m                                   1 of 1
function [sortedMatrix] = soa_sortMatrices(vectMatrix, sortIndx1, sortIndx2, sortIndx3)

sortedMatrix     = vectMatrix;

sortedMatrix(1,:) = vectMatrix(1,sortIndx1) ;

sortedMatrix(2,:) = vectMatrix(2,sortIndx2) ;

sortedMatrix(3,:) = vectMatrix(3,sortIndx3);
8/15/19 10:26 AM                                /Users/roberto/Documents/MATLAB/soa_plotPrcShts.m                                             1 of 1
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Graph the action and outcome perceptual shifts as functions of
%       the strenth of the causal prior
function F = soa_plotPrcShts(experiment, arrPrcShftA, arrPrcShft0O, arrPXil, fontsize)
F = figure;
linewidth = 2;
if experiment == 1
% Haggard et al., 2002 (Nat Neurosci): Seminal intentional binding experiment
%      Different keypress (i.e., the action) conditions
plot(arrPXil,arrPrcShftA(1,:),;b-', arrPXil,arrPrcShft0(1,:),'b--',...
arrPXil,arrPrcShftA(2,:),;r-', arrPXil,arrPrcShft0(2,:),'r--',...
arrPXil,arrPrcShftA(3,:),;k-', arrPXil,arrPrcShft0(3,:),)k-—', ‘Linewidth', linewidth) ;
%legend('Voluntary Action', '    Tone', ‘Involuntary MEP','    Tone', 'Sham TMS','    Tone', ‘'Location', 'northwest');
lgnd = legend('Voluntary action',' and tone', ‘Involuntary action',' and tone','Sham',' and tone', 'Location', 'northwest', 'Orientation','vertical');
lgnd.FontSize = 18;
set(lgnd.BoxFace, 'ColorType', ‘truecoloralpha', 'ColorData', uint8(255*[1; 1; 1; @.8]));
elseif experiment == 2
% Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome
%       Different tone (i.e., the outcome) conditions
hold on;
plot(arrPXil,arrPrcShftA(1,:),;Color', [@ @ 250/255],       'LineStyle','-', 'Linewidth', linewidth);
plot(arrPXil,arrPrcShft0(1,:);Color', [@ @ 250/255],       ‘LineStyle', '--', 'Linewidth', linewidth) ;
plot(arrPXil,arrPrcShftA(2,:);Color', [@ 140/255 255/255], 'LineStyle','-', ‘Linewidth', linewidth);
plot(arrPXil,arrPrcShft0(2,:);Color', [@ 140/255 255/255], 'LineStyle','--','Linewidth', linewidth) ;
plot(arrPXil,arrPrcShftA(3,:);Color', [@ 240/255 255/255], 'LineStyle','-', ‘Linewidth', linewidth);
plot(arrPXil,arrPrcShft0(3,:);Color', [@ 240/255 255/255], '‘LineStyle', '-—', 'Linewidth', linewidth);
lgnd = legend('Action', ' and low uncertainty tone’, 'Action', ' and intermediate uncertainty tone, ‘Action', ' and high uncertainty tone’, ‘Location', ‘northwest');
lgnd.FontSize = 18;
set(lgnd.BoxFace, ‘ColorType', ‘truecoloralpha', ‘ColorData', uint8(255*[1; 1; 1; @.8]));
end
set(gca,'FontSize', fontsize);
set(gca, 'Box', ‘on');
set(lgnd, ‘Color’, ‘none');
set(gca,'color', 'white');
set(gca,'FontSize', fontsize);
8/15/19 10:27 AM                         /Users/roberto/Documents/MATLAB/soa_plotErrorBars.m                                   1 of 2
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Plot the optimal baheviors used in the figures of the paper with ERROR BARS displayed
function F = soa_plotErrorBars(experiment, arrAxes, arrBehavior, fontsize, flag, sizeBin)
F = figure;
markerSize = 27;
lineWidth = @.1;
if experiment == 1
% Haggard et al., 2002 (Nat Neurosci): Seminal intentional binding experiment
%      Different keypress (i.e., the action) conditions
hold all
if flag == 1
errorbar(mean(reshape(arrAxes(1,:),sizeBin,[]),1), mean(reshape(arrBehavior(1,:),sizeBin,[]),1), std(reshape(arrBehavior(1,:),sizeBin,[]),2b,', ‘LineWidth', LineWidth,'MarkerSize', ¥
markerSize);
errorbar(mean(reshape(arrAxes(2,:),SsizeBin,[]),1), mean(reshape(arrBehavior(2,:),sizeBin,[]),1), std(reshape(arrBehavior(2,:),sizeBin,[]),1},', ‘LineWidth', LineWidth,'MarkerSize',”
markerSize) ;
errorbar(mean(reshape(arrAxes(3,:),SsizeBin,[]),1), mean(reshape(arrBehavior(3,:),sizeBin,[]),1), std(reshape(arrBehavior(3,:),sizeBin,[]),1k,', ‘LineWidth', LineWidth,'MarkerSize',¥”
markerSize) ;
lgnd = legend('Voluntary condition','Involuntary condition','Sham condition', ‘Location’, 'northwest');
elseif flag == 2
errorbar(mean(reshape(arrAxes(2,:),sizeBin, []),1), mean(reshape(arrBehavior(2,:),sizeBin,[]),1), std(reshape(arrBehavior(2,:),sizeBin,[]),1}),', ‘LineWidth', LineWidth,'MarkerSize',”
markerSize) ;
errorbar(mean(reshape(arrAxes(1,:),sizeBin,[]),1), mean(reshape(arrBehavior(1,:),sizeBin, []),1), std(reshape(arrBehavior(1,:),sizeBin,[]),1b,', ‘LineWidth', LineWidth,'MarkerSize', ¥
markerSize);
Ugnd = legend('Voluntary condition','Involuntary condition’, 'Location', 'northwest');
end
set(lgnd.BoxFace, ‘ColorType', ‘truecoloralpha', ‘ColorData', uint8(255*[1; 1; 1; @.8]));
set(gca, ‘Box', ‘on');
hold off
elseif experiment == 2
% Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome
%       Different tone (i.e., the outcome) conditions
hold all
if flag == 1
errorbar(mean(reshape(arrAxes(1,:),SsizeBin, []),1), mean(reshape(arrBehavior(1,:),sizeBin,[]),1), std(reshape(arrBehavior(1,:),sizeBin,[]),2x¢plor', [@ @ 250/255] ,”
‘LineStyle','none','Marker', '.', ‘LineWidth', LineWidth,'MarkerSize', markerSize);
errorbar(mean(reshape(arrAxes(2,:),SizeBin, []),1), mean(reshape(arrBehavior(2,:),sizeBin,[]),1), std(reshape(arrBehavior(2,:),sizeBin,[]),1IXplor', [0 140/255 255/255] ”
‘LineStyle','none','Marker', ‘.', ‘LineWidth', LineWidth, '‘MarkerSize',markerSize) ;
errorbar(mean(reshape(arrAxes(3,:),SizeBin,[]),1), mean(reshape(arrBehavior(3,:),sizeBin, []),1), std(reshape(arrBehavior(3,:),sizeBin,[]),1¥plor', [0 240/255 255/255] ”
‘LineStyle','none','Marker', '.', ‘LineWidth', LineWidth, '‘MarkerSize',markerSize) ;
end
lgnd = legend('Low uncertainty’, ‘Intermediate uncertainty’, 'High uncertainty', 'Location', 'northwest');
set(lgnd.BoxFace, 'ColorType', ‘truecoloralpha', 'ColorData', uint8(255*[1; 1; 1; @.8]));
set(gca, ‘Box', ‘on');
hold of f
8/15/19 10:27 AM                         /Users/roberto/Documents/MATLAB/soa_plotErrorBars.m                                   2 of 2
end
set(gca,'FontSize', fontsize);
8/15/19 10:28 AM                         /Users/roberto/Documents/MATLAB/soa_plotBehaviors.m                                   1 of 2
% Function to graph the SoA related measures
% Added 09/06/2017
function F = soa_plotBehaviors(experiment, arrBehavior, arrPXi1, fontsize, behavior)
F = figure;
linewidth = 2;
if experiment == 1
if behavior == 1
plot( arrPXil,arrBehavior(1,:)}b', arrPXil,arrBehavior(2,:),'r', arrPXil,arrBehavior(3,:),'k', ‘Linewidth', linewidth) ;
%{
hold all
plot(arrPXil1,arrBehavior(1,:),'b', 'Linewidth',3);
plot(arrPXil,arrBehavior(2,:),'r','Linewidth',3);
plot(arrPXil,arrBehavior(3,:),'Color', [0 0 0]+0.05x*13, 'Linewidth',3);
hold off
%}
elseif behavior == 3
plot( arrPXil,arrBehavior(2,:),r', arrPXil,arrBehavior(1,:),'b', arrPXil,arrBehavior(3,:),'k', '‘Linewidth', linewidth) ;
elseif behavior == 0
plot( arrPXil,arrBehavior(1,:),b', arrPXil,arrBehavior(2,:),'r', ‘Linewidth', linewidth) ;
elseif behavior == 2
ylim([@.@ 1.0]);
plot( arrPXil,arrBehavior(1,:),b', arrPXil,arrBehavior(2,:),'r', ‘Linewidth', linewidth) ;
end
elseif experiment == 2
hold on;
plot(arrPXil,arrBehavior(1,:),;Color', [0 @ 250/255],       ‘LineStyle', '-', 'Linewidth', linewidth) ;
plot(arrPXil,arrBehavior(2,:);Color', [@ 140/255 255/255], ‘LineStyle','-', ‘Linewidth', Linewidth) ;
plot(arrPXi1,arrBehavior(3,:),Color', [@ 240/255 255/255], ‘LineStyle','-',‘Linewidth', Linewidth) ;
hold off;
elseif experiment == 3
hold on;
plot(arrPXil,arrBehavior(1,:),;Color', [0 @ 250/255],       ‘LineStyle','-', 'Linewidth', linewidth) ;
plot(arrPXil,arrBehavior(2,:);Color', [@ 140/255 255/255], 'LineStyle','-',‘'Linewidth', linewidth) ;
hold off;
end
%{
xlabel('P(\xi=1) of Prior');
if behavior == 1
ylabel('Feeling of Agency');
elseif behavior == 2
ylabel('Judgment of Agency');
elseif behavior == 3
ylabel('Bias in Action Estimates');
elseif behavior == 4
ylabel('Bias in Outcome Estimates');
end
%}
if experiment == 1
if behavior == 1
lgnd = legend('Voluntary condition’, 'Involuntary condition','Sham condition’, ‘Location’, 'northwest');
elseif behavior ==3
lgnd = legend('Voluntary condition','Involuntary condition','Sham condition’, ‘Location’, 'northwest');
else
8/15/19 10:28 AM                         /Users/roberto/Documents/MATLAB/soa_plotBehaviors.m                                   2 of 2
lgnd = legend(‘Voluntary condition','Involuntary condition','Sham condition’, ‘Location’, 'northwest');
end
elseif experiment == 2
lgnd = legend('Low uncertainty condition’, ‘Intermediate uncertainty condition, ‘High uncertainty condition’ ‘Location', 'northeast');
elseif experiment == 3
lgnd = legend('Active, Instructed', ‘Passive, Instructed', 'Location', 'northeast');
end
set(gca,'FontSize', fontsize);
set(gca, 'Box', ‘on');
%set(lgnd, 'Color', 'none');
set(gca,'color', 'white');
set(lgnd.BoxFace, ‘ColorType', ‘truecoloralpha', ‘ColorData', uint8(255*[1; 1; 1; @.8]));
% If you want to bold
%ylabel('Feeling of Agency', 'FontWeight', ‘bold');
