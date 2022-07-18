% Objective: Return the reported action and outcome perceptual shifts
%            for the operant conditions.
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

function [trgtPrcShftA, trgtPrcShftO] = soa_IBTargets(experiment, condition)

if experiment == 1
    % Haggard et al. 2002 (Nat Neurosci): Seminal intentional binding experiment
    %      Different keypress (i.e., the action) conditions.
    if condition == 1
        trgtPrcShftA =  15;
        trgtPrcShftO = -46;
    elseif condition == 2
        trgtPrcShftA = -27;
        trgtPrcShftO =  31;
    elseif condition == 3
        trgtPrcShftA = -7;
        trgtPrcShftO = -8;
    end
elseif experiment == 2
    % Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome.
    %       Different tone (i.e., the outcome) conditions.
    if condition == 1
        trgtPrcShftA =  39;
        trgtPrcShftO = -51;
    elseif condition == 2
        trgtPrcShftA =  31;
        trgtPrcShftO = -65;
    elseif condition == 3
        trgtPrcShftA =   32;
        trgtPrcShftO = -105;
    end
end

end