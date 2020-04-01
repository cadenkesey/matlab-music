function [y] = n(note, T)
%Get a clip of a sample
%note: what note you want from the samples
%T: how long to hold the note
%y: final clip

time_change = 2.3;

[z, ~] = audioread(note);

if size(z,2) == 2
    mono(z);
elseif size(z,1) > 1
    z = z';
end

len = round(44100*T/time_change);

if len >= length(z)
    new = len-length(z);
    z = [z zeros(1, new)];
end

y = z(1:len);

end