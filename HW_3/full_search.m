function [output,TotalSAD] = full_search( index_i , index_j,range , block_size , reference_image,target_image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

SAD = 0 ;
min = realmax ;
vector = [0,0] ;
output = zeros(block_size,block_size,3);
output  = im2double(output); 


[h,w,d] = size(reference_image) ;
t = target_image(index_i:index_i+block_size-1, index_j:index_j+block_size-1,:);

for k = -range : range
    for l = -range :range
        if(index_i+k>=1 && index_j+l >= 1 && index_i+k <= (h-block_size+1)&& index_j+l <= (w-block_size+1))
           
           r = reference_image(index_i+k:index_i+k+block_size-1 , index_j+l:index_j+l+block_size-1,:);
            
           SAD =sum(sum(sum(abs(t-r)))) ;
          
        if(SAD < min)
            min = SAD ;
            vector = [k,l];
        end
        
        end
    end
end


TotalSAD = min ; 
output = reference_image(index_i+vector(1): index_i+vector(1)+block_size-1, index_j+vector(2):index_j+vector(2)+block_size-1,:);



end

