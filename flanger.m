function [flanged] = flanger(audio,sweep_freq,sweep_range,fs)
%Original algorithm by Daire Canavan

given_delay = 15;
for i = given_delay+sweep_range:length(audio)
    flanged(i)=audio(i)+audio(i-given_delay-round(sweep_range*sin(2*pi*i*sweep_freq/fs)));
end
flanged = transpose(flanged);

end

