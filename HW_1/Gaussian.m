function [ output ] = Gaussian ( input , mask )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[h ,w] = size(input) ;
input = im2double(input);  
[h1 , w1] =size(mask) ;
mask = im2double(mask);
mh_trans = int16(h1/2);
mw_trans = int16(w1/2);

output = zeros(h, w );


for i = 1 : h
    for j = 1 : w
        % transform the index
        for k = 1-mh_trans : h1-mh_trans
            for l = 1-mw_trans : w1-mw_trans              
                % check overflow
                if(i+k > 0 && j+l > 0 && i+k <= h && j+l <= w)       
                    % do the sigma
                    output(i, j) = output(i, j) + input(i+k, j+l) * mask(k+mh_trans, l+mw_trans);
                    
                end
            end
        end    
    end
end




end

