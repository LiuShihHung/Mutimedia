src3 = imread('img_LR.png') ;
src4 = imread('img_HR.png') ;
u =  NN(src3) ;  
c = imresize(src3, 4, 'nearest');
psnr1 = computePSNR(src4 ,u);
disp(psnr1) ;
%imshow(u) ;