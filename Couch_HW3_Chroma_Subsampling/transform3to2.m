% transform3to2.m - transforms a 1x1x3 matrix to 3x1
% transform3to2(matrix)
% matrix: 1x1x3 matrix
% returns transformed matrix 3x1
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/14/19

function f = transform3to2(mat)

transformedMat(1:3, 1) = mat(1, 1, 1:3);

f = transformedMat;