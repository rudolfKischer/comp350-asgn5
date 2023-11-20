function [c] = fitls(x,y,g)
%LS Least squares fit of a polynomial to data.
%g = highest degree basis function
%x = x val of data points
%y = y val of data points

n = g + 1;
m = length(x);

A = zeros(m,n);
for i = 1:m
    for j = 1:n
        A(i,j) = x(i)^(j-1);
    end
end

c = A\y';

end

