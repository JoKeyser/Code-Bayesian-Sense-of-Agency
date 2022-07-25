% Objective: Row-wise sorting of matrix dataMatrix according to indexMatrix.
%            Used to sort quantities according to the difference tauO - tauA.
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

function sortedMatrix = soa_sortMatrices(dataMatrix, indexMatrix)

size_data = size(dataMatrix);
size_indx = size(indexMatrix);

assert(all(size_data == size_indx), 'Matrices must have same dimensions.')
assert(numel(size_data) == 2, 'Matrices must be two-dimensional.')

sortedMatrix = nan(size_data);

for row_idx = 1:size_data(1)
    sortedMatrix(row_idx, :) = dataMatrix(row_idx, indexMatrix(row_idx, :));
end
end