% Objective: Compute observer model MAP estimates of tA, tO, and Xi, resulting
%            in perceptual shifts relative to tauA, tauO in the causal case.
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

function [tAhat, tOhat, Xihat] = ...
    soa_computePrcShft(tauA, tauO, PXi_1, sigmaA, sigmaO, sigmaAO, muAO, T)

assert(isscalar(tauA) && isscalar(tauO) && isscalar(PXi_1) ...
    && isscalar(sigmaA) && isscalar(sigmaO) && isscalar(sigmaAO) ...
    && isscalar(muAO) && isscalar(T), ...
    'All input parameters are assumed to be scalar values.')

% Compute helper terms (see Methods).
Z1 = sqrt(2 * pi) * sigmaAO * T;
Z0 = T^2;
PXi_0 = 1 - PXi_1;
theta = log((PXi_1 * Z0) / (PXi_0 * Z1));

% Compute total variance.
sigmaTot2 = sigmaA^2 + sigmaO^2 + sigmaAO^2;

% Compute the posterior ratio (Eq. 4, see formula in Methods).
r = exp(theta - ((tauO - tauA - muAO)^2 / (2 * sigmaTot2)));

% Compute MAP estimates of tA, tO, and Xi (Eq. 3 and 5, see formula in Methods),
% leading to perceptual temporal shifts (binding or repulsion) in causal case.
if r > 1  % causal case
    tAhat = tauA + (sigmaA^2 / sigmaTot2) * (tauO - tauA - muAO);
    tOhat = tauO - (sigmaO^2 / sigmaTot2) * (tauO - tauA - muAO);
    Xihat = 1;
else  % acausal case
    tAhat = tauA;
    tOhat = tauO;
    Xihat = 0;
end

end