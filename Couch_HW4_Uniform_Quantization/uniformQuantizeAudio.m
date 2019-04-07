% uniformQuantizeAudio(audioData, bitDepth) - uniform quantizes the supplied audio into a set of levels between -1 and 1
% audioData: the audio samples to quantize
% bitDepth: the number of bits to represent each sample
% returns quantized audio data
% 
% TJ Couch
% Homework 4
% CS 443 Multimedia
% 4/7/19

function f = uniformQuantizeAudio(audioData, bitDepth)

[numSamples, cols] = size(audioData);

%matrix of quantized audio data
audioQuantized = zeros(numSamples, cols);

%loop through each sample and quantize it to the proper bit depth
levels = 2 ^ bitDepth; %number of levels in the audio
for i = 1:numSamples
    sampleScaled = round(audioData(i) * levels / 2);
    audioQuantized(i) = sampleScaled / levels * 2;
end

f = audioQuantized;