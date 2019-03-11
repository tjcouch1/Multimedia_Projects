% chromaSub22.m - applies chroma subsampling 4:2:2 to the image
% chromaSub22(image)
% image: the rgb image matrix to convert
% Note: the image must be in rgb format
% returns rgb image, Cb gray image, and Cr gray image
% 
% TJ Couch
% Homework 3
% CS 443 Multimedia
% 3/10/19

function [rgbImage, cbImage, crImage] = chromaSub22(sourceImg)

%get image size
imSize = size(sourceImg);

%convert to YCbCr
yCbCrImg = convertToYCbCr(sourceImg);

%apply 4:2:2 subsampling
yccSubImg = zeros(imSize);
for i = 1:imSize(1)
    for j = 1:imSize(2)
        %copy Cb and Cr as the pattern specifies by row and by column
        %1st and 2nd row - get first in group of two columns
        %copy y
        yccSubImg(i, j, 1) = yCbCrImg(i, j, 1);
        %subsample Cb and Cr
        yccSubImg(i, j, 2) = yCbCrImg(floor((i - 1) / 2) * 2 + 1, j, 2);
        yccSubImg(i, j, 3) = yCbCrImg(floor((i - 1) / 2) * 2 + 1, j, 3);
        if (i < 15 && j < 2)
            i
            floor((i - 1) / 4) * 4 + 1
        end
    end
end

%create subsampled rgb image
rgbImage = ycbcr2rgb(yccSubImg);

%create Cb gray image
cbImage = zeros(imSize);

%for every pixel, copy cb into r, g, and b
for i = 1:imSize(1)
    for j = 1:imSize(2)
        cb = yccSubImg(i, j, 2);
        for k = 1:imSize(3)
            cbImage(i, j, k) = cb;
        end
    end
end

%create Cr gray image
crImage = zeros(imSize);

%for every pixel, copy cr into r, g, and b
for i = 1:imSize(1)
    for j = 1:imSize(2)
        cr = yccSubImg(i, j, 3);
        for k = 1:imSize(3)
            crImage(i, j, k) = cr;
        end
    end
end