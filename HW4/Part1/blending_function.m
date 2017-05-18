function [output] = blending_function(p0, p1, p2, p3,T, Level)


output = zeros(length(T),2);


output(:,1) = ((1-T).^3)*p0(1) + 3*T.*(1-T).^2*p1(1) + 3*(T.^2).*(1-T)*p2(1) + T.^3*p3(1);

output(:,2) = ((1-T).^3)*p0(2) + 3*T.*(1-T).^2*p1(2) + 3*(T.^2).*(1-T)*p2(2) + T.^3*p3(2);


