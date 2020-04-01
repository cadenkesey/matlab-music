function [y] = add_audio(left_audio, right_audio)
%Take two seperate mono audio files and create a stereo file
%left_audio: audio to go on the left channel
%right_audio: audio to go on the right channel
%y: stereo audio

left_len = length(left_audio);
right_len = length(right_audio);

if left_len < right_len
    left_audio = [left_audio zeros(1,right_len - left_len)];
elseif left_len > right_len
    right_audio = [right_audio zeros(1,left_len - right_len)];
end

y = left_audio + right_audio;

end