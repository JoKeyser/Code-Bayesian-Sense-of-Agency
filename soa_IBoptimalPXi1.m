% Objective: Return fitted optimal value P(Xi=1) for each experiment condition.
%            TODO: Clarify where the values come from.
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

function PXi_1 = soa_IBoptimalPXi1(ExpR, CondBO)

if ExpR == 1
    if CondBO == 1
        PXi_1 = 0.9;
    elseif CondBO == 2
        PXi_1 = 0.9;
    else
        PXi_1 = 0.1;
    end
elseif ExpR == 2
    if CondBO == 1
        PXi_1 = 0.9;
    elseif CondBO == 2
        PXi_1 = 0.6;
    else
        PXi_1 = 0.5;
    end
end

end