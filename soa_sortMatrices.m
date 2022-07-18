% Objective: Sort the contents of the matrices.
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

function sortedMatrix = ...
    soa_sortMatrices(vectMatrix, sortIndx1, sortIndx2, sortIndx3)

sortedMatrix = vectMatrix;
sortedMatrix(1, :) = vectMatrix(1, sortIndx1);
sortedMatrix(2, :) = vectMatrix(2, sortIndx2);
sortedMatrix(3, :) = vectMatrix(3, sortIndx3);
end