% Objective: Lookup function to return the fitted optimal value P(Xi=1) for
%            each experiment condition.
%            Compare with operant parameters in paper table 1, right half.
%
% Copyright: Roberto Legaspi and Taro Toyoizumi
%            Lab for Neural Computation and Adaptation
%            RIKEN Center for Brain Science
% License: CC-BY-4.0
% Changes by: Johannes Keyser, please refer to changelog.md
%
% SPDX-FileCopyrightText: 2019 Roberto Legaspi and Taro Toyoizumi
%
% SPDX-License-Identifier: CC-BY-4.0

function PXi_1 = soa_IBoptimalPXi1(experiment, condition)

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
                PXi_1 = 0.9;
            case 2
                PXi_1 = 0.9;
            case 3
                PXi_1 = 0.1;
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
                PXi_1 = 0.9;
            case 2
                PXi_1 = 0.6;
            case 3
                PXi_1 = 0.5;
            otherwise
                error('Unexpected combination of experiment and condition!')
        end

    otherwise
        error('Unexpected value for experiment number!')
end

end