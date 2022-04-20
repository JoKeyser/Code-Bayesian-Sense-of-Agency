% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Compute the Confidence on Causal Estimate (CCE) along P(Xi=1)
%               values in the range [0.0,1.0] with increments of 0.1

% Cleaners
clear                      	               % clears all variables from the Workspace
cle                                        % clears the Command Window
close all

% Graph display fonts
fontsize = 20;
sizeBin = 200;

% Simulation Conditions
taoInstances = 35000;                      % Number of taoA and taoO instances to be generated
ExpR = 2; numCond = 3;                     % Experimental set-up
                                           %   Haggard et al. (2002): ExpR = 1; NumCond = 3; (Vol, Invol, Sham)
                                           %   Wolpe et al. (2013)  : ExpR = 2; NumCond = 3; (Low, Int, High)
tAp=0; dist_tAtO=250; tOp=tAp+dist_tAtO;   % Actual physical stimulus timings

% Optimal condition-independent parameters
muAO    = 230;
sigmaAO = 10;

% Interval length in consideration
T = 250;                                   % Large enough but finite constant

% Data Matrices
LB = 0.0; INC = 0.1; UB = 1.0;
arrPXi1 = LB:INC:UB;
size_pXi1 = numel(arrPXi1);
arrCCE = zeros(numCond,size_pXi1);

for CondBO = 1:numCond
    
    % Read from files taoA and taoO values derived from a Gaussian distribution
    fnametaoA = sprintf('Exp%dCond%d_Vec_taoA.csv',ExpR,CondBO);
    fnametaoO = sprintf('Exp%dCond%d_Vec_taoO.csv',ExpR,CondBO);
    Vec_taoA = dlmread(fnametaoA);
    Vec_taoO = dlmread(fnametaoO);
    
    indxPXi1 = size_pXi1 + 1;
    
    for PXi_1 = UB:-INC:LB
        
        PXi_0 = 1 - PXi_1;
        
        Vec_CCE = soa_InitMatrix(1,taoInstances) ;
        
        for indx_tao = 1:taoInstances
            
            % Do for each pair of taoA and taoO
            taoA = Vec_taoA(indx_tao);
            taoO = Vec_taoO(indx_tao);
            
            % Get the reported empricial baseline parameters
            [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(ExpR, CondBO);
            
            % Compute CCE
            Z1 = sqrt(2*pi)*sigmaAO*T;
            Z0 = T^2;
            Theta = log((PXi_1*ZO)/(PXi_0*Z1));
            sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;
            X = Theta - ((taoO-taoA-muAO)^2/(2*sigmaTot2)) + log(sigmaAO/sqrt(sigmaTot2) );
            Vec_CCE(1,indx_tao) = (sqrt(sigmaTot2)/(2*pi*sigmaA*xsigmaO*sigmaAO)) * ...
                (1 / (1 + exp(-X)));
        end
        
        uCCE = mean(Vec_CCE(1,:)); sdCCE = std(Vec_CCE(1,:));
        fprintf('Condition %d\t P(Xi=1): %0.2f\n}', CondBO, PXi_1);
        fprintf('CCE        :\t %0.2e(%0.2e)\n', uCCE, sdCCE);
        
        indxPXi1 = indxPXi1 - 1;
        arrCCE(CondBO, indxPXi1) = uCCE;
    end
end

% Plot and store CCE as function of causal prior strength

soa_plotBehaviors(ExpR, arrCCE, arrPXi1, fontsize, 1);
fnameCCEPXi = sprintf('Exp%d_CCEPXi.png',ExpR);
saveas(gcf,fnameCCEPXi);