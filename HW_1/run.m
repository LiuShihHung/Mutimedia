src = imread('lalaland.png') ;

src1 = imread('thinker_gray_noised.jpg') ;

src2 = imread('img_LR.png') ;

src3 = imread('img_HR.png') ;


H = fspecial('gaussian',[3 3] ,  0.3);
G = fspecial('gaussian',[9 9] , 1.0);

n = 8; 

size = 3 ;

src = im2double(src) ;
%s =  Gaussian (src1 , H) ;
%t =  median_filter (src1 ,size) ;

%u =  NN(src2) ;   
%out = src ; 

v = bilinear(src2) ;

%[out1, out2] = DCT(src , n) ;

%imshow(out1) ;
%out3 =   YIQ(src) ;

%[out1, out2] = DCT(out3 , n) ;


%out9 = IYIQ(out2) ;
imwrite(v ,'bilinear.png') ;
%[peaksnr,snr] = psnr(src3,v)
%disp(snr) ;

psnr1 = computePSNR(src3 , v) ;
disp(psnr1) ;


%imshow(v) ;