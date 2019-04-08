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
    %scale up the sample to range -levels to levels, then floor it
    sampleScaled = floor(audioData(i) * levels / 2);
    
    %if the number didn't get floored, subtract one to get from the actual top level to where it should be, the top level minus one
    if (sampleScaled == 1)
        sampleScaled = sampleScaled - 1;
    end
    
    %scale the sample back down to the proper divisions, then add the
    %offset to fix the numbers to be how they're supposed to look
    audioQuantized(i) = sampleScaled / levels * 2 + 1 / levels;
end

f = audioQuantized;