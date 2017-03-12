function psnr = computePSNR(input1 , input2)

[h,w,d] =  size(input1) ;


input1 = im2double(input1) ;
input2 = im2double(input2) ;


MSER = sum(sum((input1(:,:,1) - input2(:,:,1)).^2)) / h / w;
MSEG = sum(sum((input1(:,:,2) - input2(:,:,2)).^2)) / h / w;
MSEB = sum(sum((input1(:,:,3) - input2(:,:,3)).^2)) / h / w;

MSE = (MSER+MSEG+MSEB)/3 ;

%disp(MSE) ;

psnr = 10 * log10(1 / MSE);

%disp(psnr) ;

end