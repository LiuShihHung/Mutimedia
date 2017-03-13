src1 = imread('thinker_gray_noised.jpg') ;

H = fspecial('gaussian',[3 3] ,  0.3);
G = fspecial('gaussian',[9 9] , 1.0);

s =  Gaussian (src1 , G) ;

%imwrite(s ,'2_a.png') ;

%imshow(s) ;