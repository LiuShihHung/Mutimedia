src = imread('lalaland.png') ;

src1 = imread('thinker_gray_noised.jpg') ;

src2 = imread('img_LR.png') ;


H = fspecial('gaussian',[3 3] ,  0.3);
G = fspecial('gaussian',[9 9] , 1.0);


%s =  Gaussian (src1 , G) ;
%t =  median_filter (src1) ;

%u =  NN(src2) ;   
%out = src ; 

v = bilinear(src2) ;

%[out1, out2] = DCT(src) ;

%imshow(out1) ;
%out3 =   YIQ(src) ;




imshow(v) ;