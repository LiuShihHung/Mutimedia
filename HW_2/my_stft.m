function [S, F, T] = my_stft(x, segment_duration, segment_overlap, samplerate)
% my_stft:
% input
% x: The target signal.
% segment_duration: The number of samples of each segment.
% segment_overlap: The number of samples overlapping on two adjacent segments.
%
% output
% S: Short-time Fourier transform, returned as a matrix. Time increases across the columns of S and frequency increases down the rows, starting from zero.
% F: Cyclical frequencies, returned as a vector. F has a length equal to the number of rows of S.
% T: Time instants, returned as a vector. The time values in T correspond to the midpoint of each segment.


%% Your implement

%disp( length(x)) ;
%disp(  length(x)- segment_duration ) ; 
%disp(segment_duration-segment_overlap) ;
c= 1 ;
w =  hann(segment_duration) ; 

for i = 1 :  (segment_duration-segment_overlap): length(x)- segment_duration 

         y = x( i : i  + segment_duration -1) ;
         y = y.*w ;
         y = fft(y) ;
         T(c) = (i + i  + segment_duration -1)/2;
         S(:,c) = y ;
       
c = c +1 ;

end
disp(c);
T = T / samplerate ; 
F = (0 :20 : (119*20)) ;













