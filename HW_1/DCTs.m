function R = DCTs(s , mat , n)

R = zeros(8,8);
R = mat*s*mat';

for i = n+1 : 8
    for j = n+1 : 8
        R(i,j) = 0;
    end
end
