
function [ output ] = bilinear(input)

tic % count runtime

% some variables we need
finetune = 1e-5;
[h,w,d] = size(input) ;


H = h * 4;

W = w * 4;
output = zeros(H, W, d, 'uint8');

% find the real factor
h_factor = (h) / (H);

%disp(h_factor);

w_factor = (w) / (W);

for i = 1:H
    % find the coordinate point in original image
    x = (i-0.5)*h_factor + 0.5 ;
    x1 = floor(x );
    x2 = ceil(x );
      
    
    for j = 1:W
        % find the coordinate point in original image
        y = (j-0.5)*w_factor + 0.5  ;
        y1 = floor(y );
        y2 = ceil(y );
        
        
        if(x1<1)
            x1 = x1+1; 
        end
        if(y1<1)
            y1=y1+1;
        end
        if(x2>h)
            x2 = x2-1;
        end
        if(y2>w)
            y2 = y2-1;
        end
        
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