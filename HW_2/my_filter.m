function [outputSignal, outputFilter] = my_filter(inputSignal, fsample, N, windowName, filterName, fcutoff)
%%% Input 
% inputSignal: input signal
% fsample: sampling frequency
% N : size of FIR filter(odd)
% windowName: 'Blackmann'
% filterName: 'low-pass', 'high-pass', 'bandpass', 'bandstop' 
% fcutoff: cut-off frequency or band frequencies
%       if type is 'low-pass' or 'high-pass', para has only one element         
%       if type is 'bandpass' or 'bandstop', para is a vector of 2 elements

%%% Ouput
% outputSignal: output (filtered) signal
% outputFilter: output filter 

outputFilter = zeros( length(inputSignal) , 1) ;
%% 1. Normalization
fcutoff1 = fcutoff(1)/fsample  ;
if length(fcutoff) > 1
fcutoff2 =  fcutoff(2)/ fsample ;
end
w_c = 2*pi*fcutoff ;

middle = floor(N/2) ;


%% 2. Create the filter according the ideal equations (slide #76)
% (Hint) Do the initialization for the outputFilter here
% if strcmp(filterName,'?') == 1
% ...
% end
if strcmp(filterName,'low-pass') == 1
    for n =  ceil(-N/2) :floor(N/2)

        if(n == 0)
            h(middle+1) = 1 ;
        else
            h(n + middle + 1) = sin (2*pi*fcutoff1*n)/(pi*n);
        end
    end
   h(middle+1) =  2*fcutoff1 ;
end
    
if strcmp(filterName,'bandpass') == 1
     for n =  ceil(-N/2) :floor(N/2)
        if(n == 0)
            h(middle+1) = 1 ;
        else
            h(n + middle + 1) = sin (2*pi*(fcutoff1)*n)/(pi*n) - sin (2*pi*(fcutoff2)*n)/(pi*n);
        end
    end
   h(middle+1) = 2*(fcutoff2 - fcutoff1) ;
end

if strcmp(filterName,'bandstop') == 1
     for n =  ceil(-N/2) :floor(N/2)
        if(n == 0)
            h(middle+1) = 1 ;
        else
            h(n + middle + 1) = sin (2*pi*(fcutoff1)*n)/(pi*n) - sin (2*pi*(fcutoff2)*n)/(pi*n);
        end
    end
   h(middle+1) = 1- 2*(fcutoff2 - fcutoff1)  ;
end

if strcmp(filterName,'high-pass') == 1
     for n =  ceil(-N/2) :floor(N/2)
        if(n == 0)
            h(middle+1) = 1 ;
        else
            h(n + middle + 1) = -sin (2*pi*fcutoff1*n)/(pi*n);
        end
    end
   h(middle+1) = 1- 2*fcutoff1 ;
end

%% 3. Create the windowing function (slide #80) and Get the realistic filter
% if strcmp(windowName,'Blackman') == 1 
%     % do it here
% end
if strcmp(windowName,'Blackmann') == 1
    for i = 1 : N
        h(i) = h(i) *(0.42 - 0.5*cos(2*pi*(i-1)/(N-1))+0.08*cos(4*pi*(i-1)/(N-1))) ;
    end
end

outputFilter = h ;

%% 4. Filter the input signal in time domain. Do not use matlab function 'conv'
outputSignal = zeros( length(inputSignal) , 1);

for  i = 1:length(inputSignal)
    for j =  1:N 
        if(i-j <= 0 ) 
            outputSignal(i) = 0 + outputSignal(i);
        else     
            outputSignal(i) = outputSignal(i) +  h(j)*inputSignal(i-j);
           
        end
    end
end





