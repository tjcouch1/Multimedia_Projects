% script ditherGIF - dithers the fifty images in homework1_animation_frames and
% sews them into a gif
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 1/29/19

outImageName = 'dithered_animation.gif';

%apply dither to each of 50 images
for i = 1:1%50
    fileName = sprintf("homework1_animation_frames/frame_%d_delay-0.1s.gif", i);
    
    %read image and convert from byte indexed to rgb
    [indexedSrcImg, colorMap] = imread(fileName, "Frames", 1);
    sourceImg = ind2rgb(indexedSrcImg, colorMap);
    
    %apply dither to image
    ditheredImg = orderedDither(sourceImg);
    
    %stitch image into the gif
    %format image into byte indexed image
    [indexedImg, colorMap] = rgb2ind(ditheredImg,256);
    %write indexed image to the file
    if n == 1
      imwrite(indexedImg, colorMap, outImageName, 'gif', 'Loopcount', inf);
    else
      imwrite(indexedImg, colorMap, outImageName, 'gif', 'WriteMode', 'append');
    end
end
