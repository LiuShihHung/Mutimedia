function [ output ] = NN( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[h,w,d] = size(input) ;
finetune = 0.49999999999;


H =floor(h*4) ;
W = floor(w*4) ;
output = zeros(H,W,3 ) ;
output = im2double(output);

for i = 1:H
    for j = 1:W
        a = i/4 ;
        b = j/4 ;
        
        m = round(a+finetune);
        n = round(b+finetune) ;
           
        output(i,j,:) = input(m,n ,:);
        
        
    end
end






end