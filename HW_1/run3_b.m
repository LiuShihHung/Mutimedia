src3 = imread('img_LR.png') ;
src4 = imread('img_HR.png') ;

src3=double(src3);
u =  bilinear(src3) ; 

%c = im2double(c) ;
%c = imresize(src3, 4, 'bilinear');



psnr1 = computePSNR(u , src4);
disp(psnr1) ;
%imshow(u) ;