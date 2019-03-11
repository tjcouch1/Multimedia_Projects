% script chromaSubImages - applies chroma subsampling to the images in the
% directory
% 
% TJ Couch
% Homework 3
% CS 443 Multimedia
% 3/10/19

%convert each of 3 images
for i = 1:1
    fileName = sprintf("couch_part3_input_image%d.jpg", i);
    
    %read original rgb image
    sourceImg = imread(fileName);
    
    %convert image to 4:1:1
    [rgbImg, cbImg, crImg] = chromaSub11(sourceImg);
    
    %write rgb to its own file
    writeName = sprintf("couch_part3_output_image%d_rgb_411.jpg", i);
    imwrite(rgbImg, writeName);
    
    %write Cb gray to its own file
    writeName = sprintf("couch_part3_output_image%d_CbGray_411.jpg", i);
    imwrite(cbImg, writeName);
    
    %write Cr gray to its own file
    writeName = sprintf("couch_part3_output_image%d_CrGray_411.jpg", i);
    imwrite(crImg, writeName);
    
    %convert image to 4:2:2
    [rgbImg, cbImg, crImg] = chromaSub22(sourceImg);
    
    %write rgb to its own file
    writeName = sprintf("couch_part3_output_image%d_rgb_422.jpg", i);
    imwrite(rgbImg, writeName);
    
    %write Cb gray to its own file
    writeName = sprintf("couch_part3_output_image%d_CbGray_422.jpg", i);
    imwrite(cbImg, writeName);
    
    %write Cr gray to its own file
    writeName = sprintf("couch_part3_output_image%d_CrGray_422.jpg", i);
    imwrite(crImg, writeName);
end