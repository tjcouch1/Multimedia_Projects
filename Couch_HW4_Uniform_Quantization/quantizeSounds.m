% script quantizeSounds - 
% 
% TJ Couch
% Homework 1
% CS 443 Multimedia
% 1/29/19

%apply dither to each of 50 images
for i = 1:50
    fileName = sprintf("homework1_animation_frames/frame_%d_delay-0.1s.gif", i);
	
	t=1000:1200
	xlabel ('Time (samples)')
	ylabel ('Amplitude (Normalized)')
	title('Comparison of Audio of Various Bit Depths’);
	figure; plot(t,Y,'r:'); % Y refers to the original 16bit sample pointsRed dotted line
	hold on; plot(t,x),'b-'); % x refers to the 4bit sample points-blue
	hold on; plot(t,z), ‘g--’); % z refers to the 8bit sample points-green
	grid on; legend('original','4bit uniform quantized', '8bit uniform
quantized' )

	[Y, FS] = audioread(Filename); %returns double pecision normalized samples -1 to 1 and Frequency

    
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
