function [ output ] = Bezier( ctrlPointList, Level)

if(Level == 0)
    T = [0 , 0.2  , 0.4 ,0.6 ,0.8 ,1];   
else
    T = 0 : 0.01 : 1;   
end

[h,w] = size(ctrlPointList) ;

[h1 ,w1] = size(T) ;

output = [];



for i = 1 : 3 : h-2
    
    if(i+3 == h+1)
        
    output = [output ;blending_function(ctrlPointList(i,:) , ctrlPointList(i+1,:),ctrlPointList(i+2,:),ctrlPointList(1,:),T,Level) ]; 
    
    else
        
    output = [output ;blending_function(ctrlPointList(i,:) , ctrlPointList(i+1,:),ctrlPointList(i+2,:),ctrlPointList(i+3,:),T,Level) ]; 
   
    end
   
end

end