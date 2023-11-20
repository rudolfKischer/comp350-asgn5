function y = ls(x,c,g)
  %LS Least squares fit of a polynomial to data.
  %g = highest degree basis function
  %c = coefficients of the polynomial
  %x = data points
  
y = 0;

  for i = 1:g+1
    y = y + c(i)*x.^(i-1);
  end


  
end