function [A,B,C,D, T] = splinefull(x,y)
%SPLINE_EVAL
%  returns the A_i , B_i, C_i, D_i , and T vectors for the spline
% T is the vector of the x values of the knots

A = zeros(1,length(x)-1);
B = zeros(1,length(x)-1);
C = zeros(1,length(x)-1);
D = zeros(1,length(x)-1);
T = zeros(1,length(x)-1);

for i = 1:length(x)-1
    [A_i, B_i, C_i, D_i] = splinei(x, y, i);
    A(i) = A_i;
    B(i) = B_i;
    C(i) = C_i;
    D(i) = D_i;
    T(i) = x(i);
end


end

