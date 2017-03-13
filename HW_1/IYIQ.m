function [ output ] = IYIQ( input )

f = [.229 .587 .114 ; .596 -.274 -.322 ; .211 -.523 .312];

[h,w,d] = size(input) ;

input = im2double(input) ;

YIQ = zeros(h,w,d) ;

for i = 1 : h
    for j = 1 : w
        s = input (i,j,:) ;
        s = reshape(s,[1 3 ]);  
        s = s*inv(f) ;
        output(i,j,:) = s ; 
    end
end

