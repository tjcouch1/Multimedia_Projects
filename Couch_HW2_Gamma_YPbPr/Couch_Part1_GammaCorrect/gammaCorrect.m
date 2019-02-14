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

sprintf("original %d", sourceImg(1, 1, 1))

destImg = double(sourceImg);
destImg = destImg .^ (1 / gamma);

sprintf("gamma correct %d", destImg(1, 1, 1))

f = uint8(destImg);