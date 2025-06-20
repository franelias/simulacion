function eigen=analisis_trap(b,h)
  k = 1;
  m = 1;
  I = eye(2,2);
  A = [0 1; -k/m -b/m];
  Ad = inv(I-0.5*h*A)*(I+0.5*h*A)
  eigen = eig(Ad);
endfunction


# b = 1 -> estable con cualquier h
# b = 10 -> estable con cualquier h
# b = 0 -> ?
