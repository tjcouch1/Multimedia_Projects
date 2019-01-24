% orderedDither.m - ordered dithers the file provided and writes it with _d
% appended to the name
% Parameter 1: String filename of image to dither
% returns true if file written, false otherwise
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 1/24/19

function y = orderedDither(fileName)

sourceImg = imread(fileName);
imshow(sourceImg)

y = true;

%imread()
%imshow()
%imwrite()
%rgb2gray()