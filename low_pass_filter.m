function [filtered,b] = low_pass_filter(sound,cutoff,fs)

f_nyq = fs/2;
b = fir1(15,cutoff/f_nyq);
filtered = filter(b,1,sound);