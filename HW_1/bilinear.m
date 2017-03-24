function [ output ] = bilinear(input)

tic % count runtime

% some variables we need
finetune = 1e-5;
[h,w,d] = size(input) ;
disp(h);
H = h * 4;
disp(H);
W = w * 4;
output = zeros(H, W, d, 'uint8');

% find the real factor
h_factor = (h-1) / (H-1);

%disp(h_factor);

w_factor = (w-1) / (W-1);

for i = 1:H
    % find the coordinate point in original image
    x = (i-1)*h_factor + 1 ;
    x1 = floor(x + finetune);
    x2 = ceil(x - finetune);
      
    
    for j = 1:W
        % find the coordinate point in original image
        y = (j-1)*w_factor + 1  ;
        y1 = floor(y + finetune);
        y2 = ceil(y - finetune);
        
        % use the interpolation method
        a = x - x1;
        b = y - y1;
        if(d == 1) % grayscale
            x1y1 = input(x1, y1);
            x1y2 = input(x1, y2);        
            x2y1 = input(x2, y1);
            x2y2 = input(x2, y2);
            output(i, j) = (1-a) * ((1-b)*x1y1 + b*x1y2) + a * ((1-b)*x2y1 + b*x2y2);
        else % RGB
            x1y1 = input(x1, y1, :);
            x1y2 = input(x1, y2, :);
            x2y1 = input(x2, y1, :);
            x2y2 = input(x2, y2, :);
            output(i, j, :) = (1-a) * ((1-b)*x1y1 + b*x1y2) + a * ((1-b)*x2y1 + b*x2y2);
        end
    end
end
toc
end