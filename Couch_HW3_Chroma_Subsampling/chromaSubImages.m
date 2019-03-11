% script chromaSubImages - applies chroma subsampling to the images in the
% directory
% 
% TJ Couch
% Homework 3
% CS 443 Multimedia
% 3/10/19

%convert each of 3 images to 4:1:1
for i = 1:1
    fileName = sprintf("couch_part3_input_image%d.jpg", i);
    
    %read original rgb image
    sourceImg = imread(fileName);
    
    %convert image
    [rgbImg, cbImg, crImg] = chromaSub11(sourceImg);
    
    %write rgb to its own file
    writeName = sprintf("couch_part3_output_image%d_rgb.jpg", i);
    imwrite(rgbImg, writeName);
    
    %write Cb gray to its own file
    writeName = sprintf("couch_part3_output_image%d_CbGray.jpg", i);
    imwrite(cbImg, writeName);
    
    %write Cr gray to its own file
    writeName = sprintf("couch_part3_output_image%d_CrGray.jpg", i);
    imwrite(crImg, writeName);
end