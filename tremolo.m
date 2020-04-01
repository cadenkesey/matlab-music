function [y] = tremolo(sound, freq, fs)
%Original algorithm by Daire Canavan

y = zeros(length(sound),1);
for i = 1:length(sound)
    y(i) = sin(2*pi*freq/fs*i)*sound(i);
end