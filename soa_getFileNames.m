% Objective: Return file names to save/load tau samples to/from files.
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

function [fnameTauA, fnameTauO] = soa_getFileNames(experiment, condition)

fnameTauA = sprintf('Exp%dCond%d_Vec_tauA.csv', experiment, condition);
fnameTauO = sprintf('Exp%dCond%d_Vec_tauO.csv', experiment, condition);

end