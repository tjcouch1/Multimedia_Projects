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

function [yCbCrImg, yImg, cbImage, crImage] = chromaSub22(sourceImg)

%set up yCbCr conversion matrix
yCbCrMatrix = [.299 .587 .114;
                -.168736 -.331264 .5;
                .5 -.418688 -.081312];

%get image size
imSize = size(sourceImg);

%convert to YCbCr
sourceImg = double(sourceImg);
yCbCrImg = zeros(imSize);

%for every pixel, multiply by conversion matrix and add the matrix
addMatrix = [0; .5; .5];
for i = 1:imSize(1)
    for j = 1:imSize(2)
        yCbCrImg(i, j, :) = yCbCrMatrix * (transform3to2(sourceImg(i, j, :)) ./ 255) + addMatrix;
    end
end

%create luminous image
yImg = zeros(imSize);

%for every pixel, copy y into r, g, and b
for i = 1:imSize(1)
    for j = 1:imSize(2)
        y = yCbCrImg(i, j, 1);
        for k = 1:imSize(3)
            yImg(i, j, k) = y;
        end
    end
end

%create Cb image
cbImage = uint8(zeros(imSize));

yCbCrImg(1, 1, 2);
cb = yCbCrImg(1, 1, 2) * 255;
antiSat = uint8(254 - (cb - 128) * 2);
%cbImage(1, 1, :) = [antiSat, antiSat, 255]

%for every pixel, replace with various saturations of yellow or blue
for i = 1:imSize(1)
    for j = 1:imSize(2)
        cb = yCbCrImg(i, j, 2) * 255;
        
        %Cb - yellow 0-127, blue 128-255. Further from 127 = higher sat
        cbImage(i, j, 1) = 255 - cb;
        cbImage(i, j, 2) = 255 - cb;
        cbImage(i, j, 3) = cb;
    end
end

%create Cb image
crImage = uint8(zeros(imSize));

%for every pixel, replace with various saturations of cyan or red
for i = 1:imSize(1)
    for j = 1:imSize(2)
        cr = yCbCrImg(i, j, 3) * 255;
        
        %Cr - cyan 0-127, red 128-255. Further from 127 = higher sat
        crImage(i, j, 1) = cr;
        crImage(i, j, 2) = 255 - cr;
        crImage(i, j, 3) = 255 - cr;
    end
end