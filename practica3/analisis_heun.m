function eigen=analisis_heun(b,h)
  k = 1;
  m = 1;
  I = eye(2,2);
  A = [0 1; -k/m -b/m];
  Ad = I + h*A + 0.5*(h*A)*(h*A)
  eigen = eig(Ad);
endfunction


# b = 1 ->
# b = 10 ->
# b = 0 ->
