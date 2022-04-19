8/15/19 10:25 AM                         /Users/roberto/Documents/MATLAB/soa_sortMatrices.m                                   1 of 1
function [sortedMatrix] = soa_sortMatrices(vectMatrix, sortIndx1, sortIndx2, sortIndx3)

sortedMatrix     = vectMatrix;

sortedMatrix(1,:) = vectMatrix(1,sortIndx1) ;

sortedMatrix(2,:) = vectMatrix(2,sortIndx2) ;

sortedMatrix(3,:) = vectMatrix(3,sortIndx3);