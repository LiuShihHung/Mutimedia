reference_image = im2double(imread('frame72.jpg'));
target_image = im2double(imread('frame73.jpg'));
reference_image2 = im2double(imread('frame85.jpg'));

range =8;
block_size = 8 ;
[h ,w,d] = size(target_image) ;
out = zeros(h ,w ,3);
out1 = zeros(h ,w ,3);
out2 = zeros(h ,w ,3);
out3 = zeros(h ,w ,3);
out4 = zeros(h ,w ,3);
out5 = zeros(h ,w ,3);
out6 = zeros(h ,w ,3);
out7 = zeros(h ,w ,3);
TotalSAD = 0 ;
TotalSAD1 = 0 ;
TotalSAD2 = 0 ;
TotalSAD3 = 0 ;
TotalSAD4 = 0 ;
TotalSAD5 = 0 ;
TotalSAD6 = 0 ;
TotalSAD7 = 0 ;
    

for i = 1 : 8 :  h 
    for j = 1 : 8 :w     
        [out(i : i +8-1,j : j+8 -1, :),SAD] = full_search( i , j, 8 ,8 , reference_image  ,target_image ) ;
        %[out(i : i +block_size-1,j : j+block_size -1, :),SAD] = log_search( i , j, range , block_size , reference_image  ,target_image ) ;
        TotalSAD  = TotalSAD  +  SAD ;  
    end
end

psnr = computePSNR(target_image , out);
figure;
imshow(sum(abs(out - target_image),3));
disp(psnr) ;
disp(TotalSAD) ;

imwrite(sum(abs(out - target_image),3) , 'full_search_a_8_8.jpg' ) ;


for i = 1 : 8 :  h 
    for j = 1 :8 :w     
        [out1(i : i +8-1,j : j+8 -1, :),SAD1] = full_search( i , j, 16, 8 , reference_image  ,target_image ) ;
        %[out(i : i +block_size-1,j : j+block_size -1, :),SAD] = log_search( i , j, range , block_size , reference_image  ,target_image ) ;
        TotalSAD1  = TotalSAD1  +  SAD1 ;  
    end
end

psnr1= computePSNR(target_image , out1);
figure;
imshow(sum(abs(out1 - target_image),3));
disp(psnr1) ;
disp(TotalSAD1) ;

imwrite(sum(abs(out1 - target_image),3) , 'full_search_a_16_8.jpg' ) ;

for i = 1 : 16:  h 
    for j = 1 : 16 :w     
        [out2(i : i +16-1,j : j+16 -1, :),SAD2] = full_search( i , j, 8 , 16 , reference_image  ,target_image ) ;
        %[out(i : i +block_size-1,j : j+block_size -1, :),SAD] = log_search( i , j, range , block_size , reference_image  ,target_image ) ;
        TotalSAD2  = TotalSAD2  +  SAD2 ;  
    end
end
psnr2 = computePSNR(target_image , out2);
figure;
imshow(sum(abs(out2 - target_image),3));
disp(psnr2) ;
disp(TotalSAD2) ;

imwrite(sum(abs(out2 - target_image),3) , 'full_search_a_8_16.jpg' ) ;


for i = 1 : 16 :  h 
    for j = 1 : 16 :w     
        [out3(i : i +16-1,j : j+16 -1, :),SAD3] = full_search( i , j, 16 , 16 , reference_image  ,target_image ) ;
        %[out(i : i +block_size-1,j : j+block_size -1, :),SAD] = log_search( i , j, range , block_size , reference_image  ,target_image ) ;
        TotalSAD3 = TotalSAD3  +  SAD3 ; 
    end
end

psnr3 = computePSNR(target_image , out3);
figure;
imshow(sum(abs(out3 - target_image),3));
disp(psnr3) ;
disp(TotalSAD3) ;

imwrite(sum(abs(out3 - target_image),3) , 'full_search_a_16_16.jpg' ) ;

for i = 1 : 8 :  h 
    for j = 1 : 8 :w     
       % [out(i : i +8-1,j : j+8 -1, :),SAD] = full_search( i , j, 8 ,8 , reference_image  ,target_image ) ;
        [out4(i : i +block_size-1,j : j+block_size -1, :),SAD4] = log_search( i , j, 8 , 8 , reference_image  ,target_image ) ;
        TotalSAD4  = TotalSAD4  +  SAD4 ;  
    end
end

psnr4 = computePSNR(target_image , out4);
figure;
imshow(sum(abs(out4 - target_image),3));
disp(psnr4) ;
disp(TotalSAD4) ;
imwrite(sum(abs(out4 - target_image),3) , 'log_search_a_8_8.jpg' ) ;

for i = 1 : 8 :  h 
    for j = 1 :8 :w     
        %[out1(i : i +8-1,j : j+8 -1, :),SAD1] = full_search( i , j, 16, 8 , reference_image  ,target_image ) ;
        [out5(i : i +8-1,j : j+8 -1, :),SAD5] = log_search( i , j, 16 , 8, reference_image  ,target_image ) ;
        TotalSAD5  = TotalSAD5  +  SAD5 ;  
    end
end

psnr5= computePSNR(target_image , out5);
figure;
imshow(sum(abs(out5 - target_image),3));
disp(psnr5) ;
disp(TotalSAD5) ;
imwrite(sum(abs(out5 - target_image),3) , 'log_search_a_16_8.jpg' ) ;

for i = 1 : 16:  h 
    for j = 1 : 16 :w     
       % [out2(i : i +16-1,j : j+16 -1, :),SAD2] = full_search( i , j, 8 , 16 , reference_image  ,target_image ) ;
        [out6(i : i +16-1,j : j+16 -1, :),SAD6] = log_search( i , j,8, 16 , reference_image  ,target_image ) ;
        TotalSAD6  = TotalSAD6  +  SAD6 ;  
    end
end
psnr6 = computePSNR(target_image , out6);
figure;
imshow(sum(abs(out6 - target_image),3));
disp(psnr6) ;
disp(TotalSAD6) ;
imwrite(sum(abs(out6 - target_image),3) , 'log_search_a_8_16.jpg' ) ;

for i = 1 : 16 :  h 
    for j = 1 : 16 :w     
        %[out3(i : i +16-1,j : j+16 -1, :),SAD3] = full_search( i , j, 16 , 16 , reference_image  ,target_image ) ;
        [out7(i : i +16-1,j : j+16 -1, :),SAD7] = log_search( i , j, 16 , 16 , reference_image  ,target_image ) ;
        TotalSAD7 = TotalSAD7  +  SAD7 ; 
    end
end

psnr7 = computePSNR(target_image , out7);
figure;
imshow(sum(abs(out7 - target_image),3));
disp(psnr7) ;
disp(TotalSAD7) ;
imwrite(sum(abs(out7 - target_image),3) , 'log_search_a_16_16.jpg' ) ;


