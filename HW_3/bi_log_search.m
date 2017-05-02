function [output,TotalSAD] = bi_log_search( index_i , index_j,range , block_size , reference_image,reference_image2,target_image)

SAD = realmax ;
SAD2 = realmax ;
mini = realmax ;
min = realmax ;
index_i2 = index_i ;
index_j2 = index_j ;
vector = [0,0] ;
output = zeros(block_size,block_size,3);
output  = im2double(output);  

output1 = zeros(block_size,block_size,3);
output1  = im2double(output1); 

output2 = zeros(block_size,block_size,3);
output2  = im2double(output2);
[h,w,d] = size(reference_image) ;

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


len = log2(range);
n = max(2,2^(len-1)) ;
n2 = max(2,2^(len-1)) ;
t = target_image(index_i:index_i+block_size-1, index_j:index_j+block_size-1,:);
m = {[-n , 0] , [n , 0] , [0,0] , [0,n] , [0,-n]} ;
m2 = {[-n2 , 0] , [n2 , 0] , [0,0] , [0,n2] , [0,-n2]} ;

while n > 1

vector = [0,0];   

for i = 1 :5
 
    if(index_i+m{i}(1)>=bound_i && index_i+m{i}(1)<= bound_i2 && index_j+m{i}(2)>=bound_j && index_j+m{i}(2) <=bound_j2)
        r = reference_image(index_i+m{i}(1):index_i+m{i}(1)+block_size-1 , index_j+m{i}(2):index_j+m{i}(2)+block_size-1,:);
        SAD = sum(sum(sum(abs(t-r)))) ;
        
        if(SAD < mini)
            mini = SAD ;
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
                   SAD = sum(sum(sum(abs(t-r))));
                   if(SAD < mini)
                       mini = SAD ;
                       vector = [k,m];
                   end             
             end
         end
 end
 
output1 = reference_image(index_i+vector(1): index_i+vector(1)+block_size-1, index_j+vector(2):index_j+vector(2)+block_size-1,:); 
 
while n2 > 1

vector = [0,0];   

for i = 1 :5
 
    if(index_i2+m2{i}(1)>=bound_i && index_i2+m2{i}(1)<= bound_i2 && index_j2+m2{i}(2)>=bound_j && index_j2+m2{i}(2) <=bound_j2)
        r2 = reference_image2(index_i2+m2{i}(1):index_i2+m2{i}(1)+block_size-1 , index_j2+m2{i}(2):index_j2+m2{i}(2)+block_size-1,:);
        SAD2 = sum(sum(sum(abs(t-r2)))) ;
  
  
        if(SAD2 < min)
          min = SAD2 ;
          vector = [m2{i}(1),m2{i}(2)];               
        end
    
    end
 
end

index_i2 = index_i2 + vector(1);
index_j2 = index_j2 + vector(2);


if(vector(1) == 0 && vector(2)==0)
     
    n2 = n2 /2 ;
    
    m2 = {[-n2 , 0] , [n2 , 0] , [0,0] , [0,n2] , [0,-n2]} ;
    
end


end

 for k = -1 :1
         for m  = -1 :1
             if(index_i2 + k >=1 && index_i2 + k <=(h-block_size+1)&& index_j2 +m >=1 && index_j2 + m<=(w-block_size+1))
                   r2 = reference_image2(index_i2+k:index_i2+k+block_size-1 , index_j2+m:index_j2+m+block_size-1,:);
                   SAD2 = sum(sum(sum(abs(t-r2))));
                   if(SAD2 < min)
                       min = SAD2 ;
                       vector = [k,m];
                   end             
             end
         end
 end
 
output2 = reference_image2(index_i2+vector(1): index_i2+vector(1)+block_size-1, index_j2+vector(2):index_j2+vector(2)+block_size-1,:); 
 
 

if (mini < min)
    output = output1;
    TotalSAD = mini ;
else
    output = output2;
    TotalSAD = min ;
end


end







