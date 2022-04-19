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