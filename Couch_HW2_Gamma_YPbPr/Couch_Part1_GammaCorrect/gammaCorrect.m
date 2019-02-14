% gammaCorrect.m - gamma corrects the image provided with gamma provided
% orderedDither(image, gamma)
% image: the rgb image matrix to convert
% gamma: the gamma value to use to correct the image
% Note: the image must be in rgb format
% returns converted image in YPbPr format
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/13/19

function f = gammaCorrect(sourceImg, gamma)

%convert to double
destImg = double(sourceImg);

%normalize and gamma correct
destImg = (destImg ./ 255) .^ (1 / gamma);

%scale back and return
f = uint8(destImg .* 255);