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