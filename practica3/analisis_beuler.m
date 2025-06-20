function eigen=analisis_beuler(b,h)
  k = 1;
  m = 1;
  I = eye(2,2);
  A = [0 1; -k/m -b/m];
  Ad = inv(I-h*A)
  eigen = eig(Ad);
endfunction

