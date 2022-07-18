% Objective: Return the means and standard deviations of the reported
%            baseline action and outcome timing judgment errors.
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

function [mu_A, sigma_A, mu_O, sigma_O] = ...
    soa_IBexperiment(experiment_case, condition)

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

end
