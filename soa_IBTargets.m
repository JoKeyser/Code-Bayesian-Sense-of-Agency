% Objective: Lookup function to return the reported action and outcome
%            perceptual shifts for the operant conditions.
%            Compare with paper table 2, right column.
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

switch experiment

    case 1
        % Haggard et al. (2002) "Voluntary action and conscious awareness".
        %    Action: Three conditions with different keypresses:
        %       1. Voluntary action
        %       2. Involuntary action (TMS-induced muscle twitch)
        %       3. Sham TMS (audible click only)
        %    Outcome: Auditory tone.
        switch condition
            case 1
                trgtPrcShftA = +15;
                trgtPrcShftO = -46;
            case 2
                trgtPrcShftA = -27;
                trgtPrcShftO = +31;
            case 3
                trgtPrcShftA = -7;
                trgtPrcShftO = -8;
            otherwise
                error('Unexpected combination of experiment and condition!')
        end

    case 2
        % Wolpe et al. (2013) "Cue integration and the perception of action in
        %                      intentional binding".
        %    Action: Voluntary keypress.
        %    Outcome: Three conditions with different tone uncertainties:
        %       1. Low tone uncertainty (high tone intensity).
        %       2. Intermediate tone uncertainty (intermediate intensity).
        %       3. High tone uncertainty (low tone intensity).
        switch condition
            case 1
                trgtPrcShftA = +39;
                trgtPrcShftO = -51;
            case 2
                trgtPrcShftA = +31;
                trgtPrcShftO = -65;
            case 3
                trgtPrcShftA = +32;
                trgtPrcShftO = -105;
            otherwise
                error('Unexpected combination of experiment and condition!')
        end

    otherwise
        error('Unexpected value for experiment number!')
end

end