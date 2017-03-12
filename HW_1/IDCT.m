function R = IDCT(s,mat)
R = zeros(8,8);
R = inv(mat)*s*inv(mat');