% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Sort the cotents of the matrices

function [sortedMatrix] = soa_sortMatrices(vectMatrix, sortIndx1, sortIndx2, sortIndx3)

sortedMatrix      = vectMatrix;
sortedMatrix(1,:) = vectMatrix(1,sortIndx1);
sortedMatrix(2,:) = vectMatrix(2,sortIndx2);
sortedMatrix(3,:) = vectMatrix(3,sortIndx3);