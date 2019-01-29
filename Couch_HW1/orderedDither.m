% orderedDither.m - ordered dithers the image matrix provided and writes it
% with _d appended to the name
% orderedDither(image)
% image: the rgb image matrix to dither
% Note: the image must be in rgb format
% returns dithered image
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 1/24/19

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
            ditheredImg(i, j) = 1;
        end
    end
end

imshow(ditheredImg)

f = ditheredImg;