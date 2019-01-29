% orderedDither.m - ordered dithers the file provided and writes it with _d
% appended to the name
% orderedDither(fileName)
% fileName: String path to image to dither
% returns true if file written, false otherwise
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 1/24/19

function f = orderedDither(fileName)

sourceImg = imread(fileName);
imshow(sourceImg)

f = true;

%imread()
%imshow()
%imwrite()
%rgb2gray()