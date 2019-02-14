% convertToYCbCr.m - converts the image matrix provided from rgb to YPbPr
% convertToYCbCr(image)
% image: the rgb image matrix to convert
% Note: the image must be in rgb format
% returns converted image in YCbCr format
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/13/19

function [yCbCrImg, yImg] = convertToYCbCr(sourceImg)

%set up yCbCr conversion matrix
yCbCrMatrix = [.299 .587 .114;
                -.168736 -.331264 .5;
                .5 -.418688 -.081312];

%get image size
imSize = size(sourceImg);

%convert to YCbCr
sourceImg = double(sourceImg);
yCbCrImg = zeros(imSize);

for i = 1:imSize(1)
    for j = 1:imSize(2)
        yCbCrImg(i, j, :) = yCbCrMatrix * (transform3to2(sourceImg(i, j, :)) ./ 255) + [0; .5; .5];
    end
end

%create luminous image
yImg = zeros(imSize);

for i = 1:imSize(1)
    for j = 1:imSize(2)
        y = yCbCrImg(i, j, 1);
        for k = 1:imSize(3)
            yImg(i, j, k) = y;
        end
    end
end

%create Cr image
crImage = zeros(imSize);

for i = 1:imSize(1)
    for j = 1:imSize(2)
        y = yCbCrImg(i, j, 1);
        for k = 1:imSize(3)
            yImg(i, j, k) = y;
        end
    end
end

%f = [yCbCrImg, yImg];