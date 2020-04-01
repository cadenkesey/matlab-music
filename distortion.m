function [distorted] = distortion(audio,clipVal)
%Original algorithm by Daire Canavan
%Distort audio
%audio: original sound
%clipVal: the level at which to start distorting the audio
%distorted: the distorted audio

for j = 1:length(audio)
    if (audio(j)>clipVal)
        audio(j) = clipVal;
    elseif (audio(j)<=clipVal)
        audio(j) = -clipVal;
    else
        audio(j) = audio(j);
    end
end

distorted = audio;