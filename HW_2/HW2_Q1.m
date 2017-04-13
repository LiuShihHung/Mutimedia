%%% HW2_Q1.m - Complete the procedure of separating HW2_mix.wav into 3 songs

%% Clean variables and screen
close all;
clear;
clc;

%% Visualization parameters (Change it if you want)
% Some Tips:
% (Tip 1) You can change the axis range to make the plotted result more clearly 
% (Tip 2) You can use subplot function to show multiple spectrums / shapes in one figure
titlefont = 15;
fontsize = 13;
LineWidth = 1.5;

LL = (1:601);
%% 1. Read in input audio file ( audioread )
% y_input: input signal, fs: sampling rate
[y_input, fs] = audioread('audio/HW2_Mix.wav');
%player = audioplayer(y_input ,  fs) ;
%play(player);
%%% Plot example : plot the input audio
% The provided function "make_spectrum" generates frequency
% and magnitude. Use the following example to plot the spectrum.
[frequency, magnitude] = make_spectrum(y_input, fs);
%plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
%title('Input', 'fontsize', titlefont);
%set(gca, 'fontsize', fontsize)

%% 2. Filtering 
% (Hint) Implement my_filter here
[outputSignal, outputFilter] = my_filter( y_input, fs ,  601  , 'Blackmann' , 'low-pass' , 250);
[outputSignal1, outputFilter1] = my_filter( y_input, fs ,  601  , 'Blackmann' , 'high-pass' , 850);
[outputSignal2, outputFilter2] = my_filter( y_input, fs ,  601  , 'Blackmann' , 'bandpass' , [500 , 530]);
%[outputSignal3, outputFilter3] = my_filter( y_input, fs ,  601  , 'Blackmann' , 'bandstop' , 250);
%%% Plot the shape of filters in Time domain
figure;
plot(LL , outputFilter2);
title('bandpass_time');
figure;
plot(LL , outputFilter1);
title('low-pass_time');
figure;
plot(LL , outputFilter);
title('high-pass_time');

%%% Plot the spectrum of filters (Frequency Analysis)
figure
[frequency2, magnitude2] = make_spectrum(outputFilter2, fs);
plot(frequency2, magnitude2, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('bandpass_f', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0,1000]);
figure
[frequency, magnitude] = make_spectrum(outputFilter, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('lowpass_f', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0,1000]);
figure
[frequency1, magnitude1] = make_spectrum(outputFilter1, fs);
plot(frequency1, magnitude1, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('highpass_f', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0,1000]);


%% 3. Save the filtered audio (audiowrite)
% Name the file 'FilterName_para1_para2.wav'
player = audioplayer(outputSignal2,  fs) ;
play(player);

% para means the cutoff frequency that you set for the filter

audiowrite('low-pass_250.wav', outputSignal, fs);
audiowrite('high-pass_850.wav', outputSignal1, fs);
audiowrite('bandpass_500_530.wav', outputSignal2, fs);

%%% Plot the spectrum of filtered signals

figure
[frequency2, magnitude2] = make_spectrum(outputSignal2, fs);
plot(frequency2, magnitude2, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('bandpass_s', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0,1000]);
figure
[frequency, magnitude] = make_spectrum(outputSignal, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('lowpass_s', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0,1000]);
figure
[frequency1, magnitude1] = make_spectrum(outputSignal1, fs);
plot(frequency1, magnitude1, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('highpass_s', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)
xlim([0,1000]);


