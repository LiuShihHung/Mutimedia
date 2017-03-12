%DCT
function [output1 , output2] = DCT(input , n)

[h,w,d] = size(input) ;


input = im2double(input) ;

in_r = input(:,:,1) ; %R
in_g = input(:,:,2) ; %G
in_b = input(:,:,3) ; %B


M = 8  ;
f = zeros(8,8) ;

for i = 1 : 8
    for j = 1 : 8
        if i == 1 || j == 1
            f(i,j) =  1 / sqrt(8) ;
        else 
            f(i,j) = cos(pi * (2*(j-1) +1)*(i-1)/16) * sqrt(2/8) ;
        end
    end
end


for i = 1 : 8 : h
    for j = 1 : 8 : w
        R = in_r(i : i+7 , j : j+7 ) ;
        G = in_g(i : i+7 , j : j+7 ) ;
        B = in_b(i : i+7 , j : j+7 ) ;
        R1 = DCT_2(R , f , n) ;
        G1 = DCT_2(G , f , n) ;
        B1 = DCT_2(B , f , n) ;
        result(i : i+7 , j : j+7 , 1) = R1 ;
        result(i : i+7 , j : j+7 , 2) = G1 ;
        result(i : i+7 , j : j+7  , 3) = B1 ;
        
    end
end


for i = 1 : 8 : h
    for j = 1 : 8 : w
        R = result(i : i+7 , j : j+7  , 1) ;
        G = result(i : i+7 , j : j+7  , 2) ;
        B = result(i : i+7 , j : j+7  , 3) ;
        R1 = IDCT_2(R , f ) ;
        G1 = IDCT_2(G , f ) ;
        B1 = IDCT_2(B , f ) ;
        result2(i : i+7 , j : j+7 , 1) = R1 ;
        result2(i : i+7 , j : j+7 , 2) = G1 ;
        result2(i : i+7 , j : j+7  , 3) = B1 ;
        
    end
end

output1 = result ;
output2 = result2;


end

