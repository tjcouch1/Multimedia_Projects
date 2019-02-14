% script gammaCorrectImages - gamma corrects the three images in this directory
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 2/13/19

%apply dither to each of 50 images
for i = 1:50
    fileName = sprintf("homework1_animation_frames/frame_%d_delay-0.1s.gif", i);
    
    %read image and convert from byte indexed to rgb
    [indexedSrcImg, colorMap] = imread(fileName, "Frames", 1);
    sourceImg = ind2rgb(indexedSrcImg, colorMap);
    
    %apply dither to image
    ditheredImg = orderedDither(sourceImg);
    
    %stitch image into the gif
    %format image into byte indexed image
    [indexedImg, colorMap] = rgb2ind(ditheredImg,256);
    
    %write indexed image to its own file
    writeName = sprintf("homework1_dithered_frames/frame_%d_delay-0.1s.gif", i);
    imwrite(indexedImg, colorMap, writeName, 'gif');
    
    %write indexed image to the gif
    if i == 1
      imwrite(indexedImg, colorMap, 'homework1_dithered_frames/dithered_animation.gif', 'gif', 'DelayTime',0.1, 'Loopcount', inf);
    else
      imwrite(indexedImg, colorMap, 'homework1_dithered_frames/dithered_animation.gif', 'gif', 'DelayTime',0.1, 'WriteMode', 'append');
    end
end
