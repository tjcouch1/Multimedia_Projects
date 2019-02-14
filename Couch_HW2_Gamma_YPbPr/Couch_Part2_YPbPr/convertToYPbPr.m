% convertToYPbPr.m - converts the image matrix provided from rgb to YPbPr
% orderedDither(image)
% image: the rgb image matrix to convert
% Note: the image must be in rgb format
% returns converted image in YPbPr format
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/13/19

function f = orderedDither(sourceImg)

%set up dither matrix
n = 4;%size of dither matrix - 4x4
ditherMatrix = (1/16) .* [0 8 2 10; 12 4 14 6; 3 11 1 9; 15 7 13 5];

%convert to grayscale
grayImg = rgb2gray(sourceImg);

%make new image matrix of the proper size
[rows, cols] = size(grayImg)
ditheredImg = zeros(rows, cols);

%loop through each pixel and replace with ordered dithered pixel
for i = 1:rows
    for j = 1:cols
        %get value of pixel
        val = grayImg(i, j);
        
        %set pixel to white if appropriate
        if val >= ditherMatrix(mod(i - 1, n) + 1, mod(j - 1, n) + 1)
            ditheredImg(i, j) = 255;
        end
    end
end

%convert double matrix into 3d uint8 rgb matrix
intImg = uint8(ditheredImg);
rgbImg = zeros(rows, cols, 3);
for i = 1:3
    rgbImg(:, :, i) = intImg(:, :);
end

f = rgbImg;