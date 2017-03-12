function [ output ] = IYIQ( input )

f = [.229 .587 .114 ; .595716 -.274453 -.321263 ; .211456 -.522591 .311135];

[h,w,d] = size(input) ;

input = im2double(input) ;

YIQ = zeros(h,w,d) ;

for i = 1 : h
    for j = 1 : w
        trans = input (i,j,:) ;
        trans = reshape(trans,[1 3 ]);  
        trans = trans*inv(f) ;
        output(i,j,:) = trans ; 
    end
end

