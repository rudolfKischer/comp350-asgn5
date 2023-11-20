function [A_i,B_i,C_i,D_i] = splinei(x,y, i)
%This function is resonsible for returning the coefficients of the spline i
%   

[h,b,z] = splinezi(x,y);
% fprintf('i = %f\n',i);
% fprintf('h = %f\n',h(i));
% fprintf('b = %f\n',b(i));
% fprintf('z = %f\n',z(i));

A_i = y(i);
B_i = (-h(i) * z(i+1) / 6) - (h(i)*z(i)/3) + (y(i+1) - y(i))/h(i);
C_i = z(i)/2;
D_i = (z(i+1) - z(i)) / (6*h(i));


end

