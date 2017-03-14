function [ output ] = DCT_2( input , mat , n )
%UNTITLED Summary of this function goe here
%   Detailed explanation goes here

output = zeros(8,8) ;
s = mat*input*(mat') ;

for i = 1:n
    for j = 1:n
        output(i,j) = s(i,j);
    end
end



end

