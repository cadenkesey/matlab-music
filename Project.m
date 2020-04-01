clear all, close all, clc;

sample_rate = 44100;

sample_list;

%% Test Melody
line_g1 = [n(C4,1.5) n(Gs3,1.5) n(Gs3,.5) n(As3,.5)];
line_g2 = [n(B3,.75) n(As3,.75) n(Gs3,.5) n(G3,.75) n(Gs3,.75) n(As3,.5)];
phrase_g1 = [line_g1 line_g2];
% visualize(phrase_g1, phrase_g1);
% sound(phrase_g1,sample_rate);
% title('Original');

%% Delay
g1_delay = delay(phrase_g1,0.4,400,sample_rate);
% sound(g1_delay, sample_rate);
% visualize(phrase_g1, g1_delay);
% title('Delay');

%% Distortion
g1_distort = distortion(phrase_g1,.15);
% sound(g1_distort, sample_rate);
% visualize(phrase_g1, g1_distort);
% title('Distort');

%% Flanger
g1_flanger = gain(flanger(phrase_g1,0.5,12,sample_rate),0.6);
% sound(g1_flanger, sample_rate);
% visualize(phrase_g1, g1_flanger);
% title('Flanger');

%% Low Pass Filter
g1_filter = low_pass_filter(phrase_g1,.5,sample_rate);
% sound(g1_filter, sample_rate);
% visualize(phrase_g1, g1_filter);
% title('Low Pass Filter');

%% Overdrive
g1_od = gain(overdrive(phrase_g1, 0.9),0.2);
% sound(g1_od, sample_rate);
% visualize(phrase_g1, g1_od);
% title('Overdrive');

%% Tremolo
g1_trem = tremolo(phrase_g1,1,sample_rate);
% sound(g1_trem, sample_rate);
% visualize(phrase_g1, g1_trem);
% title('Tremolo');

%% Panning
g1_pan = panning(phrase_g1);
% sound(g1_pan, sample_rate);
% visualize(phrase_g1, g1_pan);
% title('Panning');

%% Guitar
[mega, ~] = audioread('mega.wav');
%sound(gain(mega,4), sample_rate);

mega_od = gain(overdrive(mega, 0.9),0.7);
mega_flange = gain(flanger(mega_od,0.5,12,sample_rate),0.7);
%sound(mega_flange, sample_rate);

[strum, ~] = audioread('strum.wav');
%sound(gain(strum,4), sample_rate);

strum_dist = gain(distortion(strum,.00025),200);
%strum_od = gain(overdrive(strum, 0.9),0.2);
strum_trem = gain(tremolo(strum_dist,1,sample_rate),3);
%sound(strum_trem, sample_rate);


%% PART 2

note_list;

%% Bassline
line_a1 = [note2(F3,0.75), note2(Ds3, 0.5) note2(B2, 0.25) note2(Gs2, 0.5) note2(F2, 0.75)];
line_a2 = [note2(B2, 0.5) note2(As2, 0.25) note2(Gs2, 0.5) note2(F2, 0.75)];
line_a3 = [note2(D3, 0.5) note2(Ds3, 0.25) note2(E3, 0.5)];
phrase_a1 = [line_a1 line_a2 line_a2 line_a3];
section_a1 = [phrase_a1 phrase_a1 phrase_a1 phrase_a1];
song_a1 = [phrase_a1 phrase_a1 section_a1 section_a1];

%sound(gain(phrase_a1,0.7),sample_rate);

%% Effects on bassline
a1_od = overdrive(song_a1, 0.9);
a1_filter = low_pass_filter(a1_od,.5,sample_rate);
bass = gain(a1_filter, 0.4);

%% Melody
measure_1 = [note2(F4, 4)];
measure_2 = [note2(Gs4, 1.5) note2(C5, 1.5) note2(F5, 1)];
measure_3 = [note2(G5, 5)];
measure_4 = [note2(Gs5, 1) note2(As5, 1) note2(B5, 1)];
measure_5 = [note2(C6, .75) note2(B5, .75) note2(Gs5, 1) note2(F5, 1) note2(C6, .5)];
measure_6 = [note2(B5, .75) note2(As5, .75) note2(Gs5, 1) note2(F5, 1) note2(Ds5, .5)];
measure_7 = [note2(D5, 2) note2(0, 6)];
measure_8 = [note2(0, 8)];
melody_1 = [measure_1 measure_2 measure_3 measure_4 measure_5 measure_6 measure_7];
songlead = [measure_8 measure_8 melody_1 melody_1];

%sound(gain(melody_1,0.1), sample_rate);

%% Melody effects
lead_od = overdrive(songlead, 0.5);
lead_delay = delay(lead_od, 0.4,400,sample_rate);
melody = gain(lead_delay, 0.3);

%% Drums
drum_list;

line_hat = [n(hat,.5) n(hat,.5) n(hat,.5) n(hat,.5)];
phrase_hat = [line_hat line_hat line_hat line_hat];
section_hat = [phrase_hat phrase_hat phrase_hat phrase_hat];
song_hat = [phrase_hat phrase_hat section_hat section_hat];

line_kick = [n(kick,2) n(kick,2) n(kick,2) n(kick,2)];
section_kick = [line_kick line_kick line_kick line_kick];
song_kick = [line_kick line_kick section_kick section_kick];

line_snare = [note2(0,1) n(snare,2) n(snare,2) n(snare,2) n(snare,1)];
line_snare_fill = [note2(0,1) n(snare,2) n(snare,2) n(snare,2) n(snare,.5) n(snare,.5)];
section_snare = [line_snare line_snare line_snare line_snare_fill];
song_snare = [line_snare line_snare_fill section_snare section_snare];

%% Stereo song
song_instruments = add_audio(melody, bass);
song_center = add_audio(song_instruments,song_kick);
song_left = add_audio(song_center, song_hat);
song_right = add_audio(song_center, song_snare);
song = channel(song_left, song_right); 
%sound(song,sample_rate);

%noise = 0.05 * randn(sample_rate*.1, 1);