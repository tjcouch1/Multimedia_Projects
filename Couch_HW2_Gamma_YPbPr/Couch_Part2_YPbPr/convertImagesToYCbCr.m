% script convertImagesToYCbCr - converts the three images in this directory from rgb to YCbCr
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/13/19

%close any open figures
close all

%convert each of 3 images
for i = 1:3
    fileName = sprintf("couch_part2_input_image%d.jpg", i);
    
    %read rgb image
    sourceImg = imread(fileName);
    
    %convert image
    yPbPrImg = convertToYCbCr(sourceImg);
    
    %show image
    imshow(yCbCrImg);
    
    %write image to its own file
    writeName = sprintf("couch_part2_output_image%d.jpg", i);
    imwrite(yCbCrImg, writeName);
end