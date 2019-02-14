% convertToYCbCr.m - converts the image matrix provided from rgb to YPbPr
% orderedDither(image)
% image: the rgb image matrix to convert
% Note: the image must be in rgb format
% returns converted image in YCbCr format
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/13/19

function f = convertToYCbCr(sourceImg)

%set up yCbCr conversion matrix
yCbCrMatrix = [.299 .587 .114; -.168736 -.331264 .5; .5 -.418688 -.081312];

imSize = size(sourceImg);

size(transform3to2(sourceImg(1, 1, :)))
size([0; .5; .5])

%convert to YCbCr
yCbCrImg = zeros(imSize);

for i = 1:imSize(1)
    for j = 1:imSize(2)
        yCbCrImg(i, j, :) = yCbCrMatrix * double(transform3to2(sourceImg(i, j, :))) + [0; .5; .5];
    end
end

imshow(yCbCrImg);

%create luminous image
%%
%make new image matrix of the proper size
ditheredImg = zeros(imSize);

%loop through each pixel and replace with ordered dithered pixel
for i = 1:rows
    for j = 1:cols
        %get value of pixel
        val = grayImg(i, j);
        
        %set pixel to white if appropriate
        if val >= yCbCrMatrix(mod(i - 1, n) + 1, mod(j - 1, n) + 1)
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
%%
f = sourceImg;