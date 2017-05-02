function [output,TotalSAD] = log_search( index_i , index_j,range , block_size , reference_image,target_image)

SAD = 0 ;
min = realmax ;
vector = [0,0] ;
output = zeros(block_size,block_size,3);
output  = im2double(output);  

[h,w,d] = size(reference_image) ;

len = log2(range);
n = max(2,2^(len-1)) ;
t = target_image(index_i:index_i+block_size-1, index_j:index_j+block_size-1,:);
m = {[-n , 0] , [n , 0] , [0,0] , [0,n] , [0,-n]} ;


if(index_i - range < 1 )
    bound_i = 1;
else
    bound_i = index_i - range ;
end


if(index_j - range < 1 )
    bound_j = 1;
else
    bound_j = index_j - range ;
end

if(index_i + range <= h-block_size+1 )
    bound_i2 = index_i + range;
else
    bound_i2 = h-block_size+1 ;
end


if(index_j + range <= w-block_size+1 )
    bound_j2 =  index_j + range;
else
    bound_j2 = w-block_size+1 ;
end



while n > 1

vector = [0,0];   

for i = 1 :5
 
    if(index_i+m{i}(1)>=bound_i && index_i+m{i}(1)<= bound_i2 && index_j+m{i}(2)>=bound_j && index_j+m{i}(2) <=bound_j2)
    r = reference_image(index_i+m{i}(1):index_i+m{i}(1)+block_size-1 , index_j+m{i}(2):index_j+m{i}(2)+block_size-1,:);
    SAD = sum(sum(sum(abs(t-r)))) ;
  
    if(SAD < min)
            min = SAD ;
            vector = [m{i}(1),m{i}(2)];
               
    end
    
    end
end

index_i = index_i + vector(1);
index_j = index_j + vector(2);


if(vector(1) == 0 && vector(2)==0)
     
    n = n /2 ;
    
    m = {[-n , 0] , [n , 0] , [0,0] , [0,n] , [0,-n]} ;
    
end


end

 for k = -1 :1
         for m  = -1 :1
             if(index_i + k >=1 && index_i + k <=(h-block_size+1)&& index_j +m >=1 && index_j + m<=(w-block_size+1))
                   r = reference_image(index_i+k:index_i+k+block_size-1 , index_j+m:index_j+m+block_size-1,:);
                   SAD = sum(sum(sum(abs(t-r)))) ;
                   if(SAD < min)
                       min = SAD ;
                       vector = [k,m];
                   end             
             end
         end
     end

TotalSAD = min ;
output = reference_image(index_i+vector(1): index_i+vector(1)+block_size-1, index_j+vector(2):index_j+vector(2)+block_size-1,:);

end







