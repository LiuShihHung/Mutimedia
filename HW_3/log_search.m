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

while n > 1

vector = [0,0];   

for i = 1 :5
 
    if(index_i+m{i}(1)>=1 && index_i+m{i}(1)<= (h-block_size+1) && index_j+m{i}(2)>=1 && index_j+m{i}(2) <=(w-block_size+1))
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







