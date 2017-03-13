src1 = imread('thinker_gray_noised.jpg') ;


size = 3 ;

s =   median_filter (src1 ,size) ;

%imwrite(s ,'2_a.png') ;

%imshow(s) ;