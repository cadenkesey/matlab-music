function [y] = gain(audio, gain)
%Generate a sample
%audio: audio sample to manipulate
%gain: the amount of gain to use
%y: the adjusted audio

y = audio*gain;

end