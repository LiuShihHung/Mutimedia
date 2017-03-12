function [ output ] = IDCT_2( input , mat )
%UNTITLED Summary of this function goe here
%   Detailed explanation goes here

output = zeros(8,8) ;
output = inv(mat)*input*inv(mat') ;


end
