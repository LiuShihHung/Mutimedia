function [ output ] = bilinear(input)

tic % count runtime

% some variables we need
finetune = 1e-5;
ori_h = size(input, 1);
ori_w = size(input, 2);
new_h = floor(ori_h * 4);
new_w = floor(ori_w * 4);
new_d = size(input, 3);
resultedImage = zeros(new_h, new_w, new_d, 'uint8');

% find the real factor
h_factor = (ori_h-1) / (new_h-1);
w_factor = (ori_w-1) / (new_w-1);

for i = 1:new_h
    % find the coordinate point in original image
    x = h_factor * (i-1) + 1;
    x1 = floor(x + finetune);
    x2 = ceil(x - finetune);
    
    for j = 1:new_w
        % find the coordinate point in original image
        y = w_factor * (j-1) + 1;
        y1 = floor(y + finetune);
        y2 = ceil(y - finetune);
        
        % use the interpolation method
        a = x - x1;
        b = y - y1;
        if(new_d == 1) % grayscale
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