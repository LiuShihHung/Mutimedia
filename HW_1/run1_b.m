src = imread('lalaland.png') ;

n = 8; 
src = im2double(src) ;
out3 =   YIQ(src) ;
%imwrite(out3 ,'1_b1.png') ;
[out1, out2] = DCT(out3 , n) ;
out9 =  IYIQ(out2) ;  
psnr1 = computePSNR(out9 , src) ;
disp(psnr1) ;
%imwrite(out9 ,'YIQ2.png') ;
%imwrite(out9 ,'1_b2.png') ;
%imshow(yiq) ;