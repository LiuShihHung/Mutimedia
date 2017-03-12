function [ output ] = NN( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[h,w,d] = size(input) ;
finetune = 1e-5;


H = h*4 ;
W = w*4 ;
output = zeros(H,W,3 ,'uint8') ;

for i = 1:H
    for j = 1:W
        a = i/4 ;
        b = j/4 ;
        c = [floor(a+finetune) floor(b+finetune) ; ceil(a-finetune) floor(b+finetune);floor(a+finetune) ceil(b-finetune);ceil(a-finetune) ceil(b-finetune)] ;
        d = [a,b] ;
        max =999999 ;
        index = 1 ;
        for k = 1 : 4
            dis = (c(k,1) - d(1)).^2 + (c(k,2) - d(2)).^2;
            if(dis < max)
                index = k ;
                max = dis;
            end
        end
        m = c(index , 1);
        n = c(index , 2) ;
        if(m == 0)
            m= 1 ;
        end
        if(n==0)
            n= 1 ;
        end
        
        output(i,j,:) = input(m,n ,:);
        
        
    end
end






end

