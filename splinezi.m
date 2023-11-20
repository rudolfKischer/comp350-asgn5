function [h,b,z] = splinzi(x,y)
% This function is used to determine the zi value for the spline given the
%  x and y values of the spline
%  x and y are arrays with the x and y values of the spline
n = length(x);
h = zeros(1,n-1);
b = zeros(1,n-1);
for i = 1:n-1
    h(i) = x(i+1)-x(i);
    b(i) = (y(i+1)-y(i))/h(i);
end
% forward elimnation
u = zeros(1,n);
v = zeros(1,n);
u(2) = 2*(h(1)+h(2));
v(2) = 6*(b(2)-b(1));
for i = 3:n-1
  m = h(i)/u(i-1);
  u(i) = 2*(h(i)+h(i-1))-m*h(i-1);
  v(i) = 6*(b(i)-b(i-1))-m*v(i-1);
end
% backward substitution
z = zeros(1,n+1);
z(n+1) = 0;
for i = n-1:-1:2
    z(i) = (v(i)-h(i)*z(i+2))/u(i);
end
z(1) = 0;

end

