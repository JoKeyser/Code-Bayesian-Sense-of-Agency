% Objective: Compute the Confidence on Causal Estimate (CCE), see Methods.
%
% Published: August 14, 2019
% Copyright: Roberto Legaspi and Taro Toyoizumi
%            Lab for Neural Computation and Adaptation
%            RIKEN Center for Brain Science
% License: CC-BY-4.0
% Changes by: Johannes Keyser, please refer to changelog.md
%
% SPDX-FileCopyrightText: 2019 Roberto Legaspi and Taro Toyoizumi
%
% SPDX-License-Identifier: CC-BY-4.0

function CCE = ...
    soa_computeCCE(tauA, tauO, PXi_1, sigmaA, sigmaO, sigmaAO, muAO, T)

% Compute total standard deviation.
sigmaTot = sqrt(sigmaA^2 + sigmaO^2 + sigmaAO^2);

% Compute helper terms for CCE computation.
Z1 = sqrt(2 * pi) * sigmaAO * T;
Z0 = T^2;
PXi_0 = 1 - PXi_1;
theta = log((PXi_1 * Z0) / (PXi_0 * Z1));
X = theta - ((tauO - tauA - muAO) .^ 2 ./ (2 * sigmaTot^2)) ...
    + log(sigmaAO / sigmaTot);

CCE = (sigmaTot / (2 * pi * sigmaA * sigmaO * sigmaAO)) .* soa_Sigmoid(X);

end