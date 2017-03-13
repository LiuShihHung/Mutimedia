src = imread('lalaland.png') ;

n = 8; 
src = im2double(src) ;
[out1, out2] = DCT(src , n) ;
psnr1 = computePSNR(src , out2) ;
disp(psnr1) ;
imwrite(out2 ,'DCT.png') ;