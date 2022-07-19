% Objective: Lookup function to return the means and standard deviations of the
%            reported baseline action and outcome timing judgment errors.
%            Compare with baseline parameters in paper table 1, left half.
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

function [muA, sigmaA, muO, sigmaO] = soa_IBexperiment(experiment, condition)

switch experiment

    case 1
        % Haggard et al. (2002) "Voluntary action and conscious awareness".
        %    Action: Three conditions with different keypresses:
        %       1. Voluntary action
        %       2. Involuntary action (TMS-induced muscle twitch)
        %       3. Sham TMS (audible click only)
        switch condition
            case 1
                muA = 6;
                sigmaA = 66;
            case 2
                muA = 83;
                sigmaA = 83;
            case 3
                muA = 32;
                sigmaA = 78;
            otherwise
                error('Unexpected combination of experiment and condition!')
        end
        %    Outcome: Auditory tone.
        muO = 15;
        sigmaO = 72;

    case 2
        % Wolpe et al. (2013) "Cue integration and the perception of action in
        %                      intentional binding".
        %    Action: Voluntary keypress.
        muA = -8;
        sigmaA = 75;
        %    Outcome: Three conditions with different tone uncertainties:
        %       1. Low tone uncertainty (high tone intensity).
        %       2. Intermediate tone uncertainty (intermediate intensity).
        %       3. High tone uncertainty (low tone intensity).
        switch condition
            case 1
                muO = 35;
                sigmaO = 61;
            case 2
                muO = 46;
                sigmaO = 66;
            case 3
                muO = 95;
                sigmaO = 90;
            otherwise
                error('Unexpected combination of experiment and condition!')
        end

    otherwise
        error('Unexpected value for experiment number!')
end

end