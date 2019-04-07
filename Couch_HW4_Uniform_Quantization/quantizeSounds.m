% script quantizeSounds - quantizes and plots audio files into 4-bit and 8-bit audio
% 
% TJ Couch
% Homework 4
% CS 443 Multimedia
% 4/7/19

%close all open graphs
close all

audioNames = ["dee.wav", "lyinEyes.wav"];
[rows, numFiles] = size(audioNames);

%apply uniform quantize to the files
for i = 1:numFiles

	%load audio
	[audioData, audioFreq] = audioread(audioNames(i));
	
	%set up grid
	t=1000:1200;
	
	%plot the original audio
	figure; plot(t,audioData(1000:1200),'r:');
	
	%plot the 4-bit quantized audio
        audio4BitData = uniformQuantizeAudio(audioData, 4);
	hold on; plot(t, audio4BitData(1000:1200),'b-');
	
	%plot the 8-bit quantized audio
        audio8BitData = uniformQuantizeAudio(audioData, 8);
	hold on; plot(t, audio8BitData(1000:1200), 'g--');
	
	%finish setting up the plot
	grid on; legend('original','4bit uniform quantized', '8bit uniform quantized')
	xlabel ('Time (samples)')
	ylabel ('Amplitude (Normalized)')
	title('Audio Comparison of Various Bit Depths');
end