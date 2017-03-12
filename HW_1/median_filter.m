function [ output ] = median_filter(input)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[h ,w] = size(input) ;
input = im2double(input);  


mh_trans = int16(3/2);
mw_trans = int16(3/2);

output = zeros(h, w);


s= zeros(81, 1);

index = 1 ;

t = 0 ;

for i = 1 : h
    for j = 1 : w
        % transform the index
        index = 1 ;
        for k = 1-mh_trans : 9-mh_trans
            for l = 1-mw_trans : 9-mw_trans              
                % check overflow
                index = index +1 ;
                if(i+k > 0 && j+l > 0 && i+k <= h && j+l <= w)       
                    % do the sigma
                    s(index) = input(i+k, j+l) ;
                    
                end
            end
        end  
     
        
        output(i,j) =median(s);
        
    end
end
   %display(s) ;



end
