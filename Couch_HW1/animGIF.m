
% Provided by Dr. Chung
% This code uses the 'imwrite' function to create an animated GIF. An animated GIF contains a series of images all combined into one file. For this example,
% 1. Draw a series of plots for the function y = x^n for different values of n
% 2. Capture them as images
% 3. Write them into a GIF file

h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';
for n = 1:0.5:5
    % Draw plot for y = x.^n
    x = 0:0.01:1;
    y = x.^n;
    plot(x,y) 
    drawnow 
    % Capture the plot as an image 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if n == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end
end