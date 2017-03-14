function [ output ] = YIQ( input )

f = [.229 .587 .114 ; .595716 -.274453 -.321263 ; .211456 -.522591 .311135];
[h,w,d] = size(input) ;

input = im2double(input) ;

output = im2double(zeros(h,w,d)) ;

for i = 1 : h
    for j = 1 : w
        s = input (i,j,:) ;
        s = reshape(s,3,1 );  
        s = f*s ;
        output(i,j,:) = s ; 
    end
end

