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