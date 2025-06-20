function dx=masares_base(x,t)
  k=1;
  m=1;
  b=100;
  F=1;
  dx=[x(2); 1/m*(-k*x(1)-b*x(2)+F)];
end

 # con masares_base:
 # [t,x] = feuler(@masares_base, [0;0], 0, 10, 0.01)
 # [ta,xa] = ltiSolve([0 1; -1 -1], [0;1], 1, [0; 0], t)
 # norm(x-xa,1)
 #  h = 0.1 -> = 0.066139
 #  h = 0.01 -> = 6.1432e-03
