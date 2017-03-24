src3 = imread('img_LR.png') ;
src4 = imread('img_HR.png') ;
u =  bilinear(src3) ;  

%c = imresize(src3, 4, 'bilinear');
psnr1 = computePSNR(src4 ,u);
disp(psnr1) ;
%imshow(u) ;
%imwrite(u ,'NN.png') ;