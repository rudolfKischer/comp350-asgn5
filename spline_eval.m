function y = spline_eval(x, A, B, C, D, T)
  %This function is resonsible for returning the value of the spline at x
  %   
  
  %Find the interval that x is in using binary search
  i = 1;
  j = length(T) + 1;
  while (j - i > 1)
    k = floor((i + j)/2);
    if (x > T(k))
      i = k;
    else
      j = k;
    end
  end

  %Evaluate the spline at x
  y = A(i) + B(i)*(x - T(i)) + C(i)*(x - T(i))^2 + D(i)*(x - T(i))^3;
  end