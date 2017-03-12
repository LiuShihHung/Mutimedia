function [ output ] = DCT_2( input , mat , n )
%UNTITLED Summary of this function goe here
%   Detailed explanation goes here

output = zeros(8,8) ;
output = mat*input*(mat') ;

for i = n+1 : 8
    for j = n+1 : 8
        output(i,j) = 0 ;
    end
end



end

