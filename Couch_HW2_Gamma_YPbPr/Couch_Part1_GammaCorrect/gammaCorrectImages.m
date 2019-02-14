% script gammaCorrectImages - gamma corrects the three images in this directory
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/13/19

%apply gamma correct to each of 3 images
for i = 1:3
    fileName = sprintf("couch_part1_input_image%d.jpg", i);
    
    %read rgb image
    sourceImg = imread(fileName);
    
    %apply gamma correct to image
    gammaImg = gammaCorrect(sourceImg, 1.1);
    
    %write image to its own file
    writeName = sprintf("couch_part1_output_image%d.jpg", i);
    imwrite(gammaImg, writeName);
end
