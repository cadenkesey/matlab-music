function [delayed] = delay(sound, feedback, delaytime, fs)
%Original algorithm by Daire Canavan
%Add a delay effect to audio
%audio: original sound
%feedback: amount of echoes
%delaytime: the time between echoes
%fs: sample rate
%delayed: the audio with delay

delaySamples = floor(delaytime./1000.*fs);
delayed = sound;

for sample = delaySamples+1:length(sound)
    if(sample-delaySamples>0)
        delayed(sample) = sound(sample)+feedback*(delayed(sample-delaySamples));
    end
end