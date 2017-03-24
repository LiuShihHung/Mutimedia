src = imread('lalaland.png') ;

n = 8  ; 
src = im2double(src) ;
[out1, out2] = DCT(src , n) ;



src = im2uint8(src);
out1 = im2uint8(out1);
out2 = im2uint8(out2);

%imwrite(out1 ,'DCT8.png') ;
%imwrite(out2 ,'IDCT8.png') ;
%imshow(out1);

psnr1 = computePSNR(out2, src) ;
disp(psnr1) ;

