% convertFromYCbCr.m - converts the image matrix provided from YCbCr to rgb
% convertFromYCbCr(image)
% image: the YCbCr image matrix to convert
% Note: the image must be in YCbCr format
% returns converted image in rgb format
% 
% TJ Couch
% Homework 3
% CS 443 Multimedia
% 3/13/19

%function [yCbCrImg, yImg, cbImage, crImage] = convertToYCbCr(sourceImg)
function rgbImg = convertFromYCbCr(sourceImg)

%set up yCbCr conversion matrix
yCbCrMatrix = [.299 .587 .114;
                -.168736 -.331264 .5;
                .5 -.418688 -.081312];

%get image size
imSize = size(sourceImg);

%convert to rgb
sourceImg = double(sourceImg);
rgbImg = zeros(imSize);

%for every pixel, multiply by conversion matrix and add the matrix
addMatrix = [0; .5; .5];
for i = 1:imSize(1)
    for j = 1:imSize(2)
        rgbImg(i, j, :) = (yCbCrMatrix \ (([sourceImg(i, j, 1); sourceImg(i, j, 2); sourceImg(i, j, 3)]) - addMatrix));
    end
end