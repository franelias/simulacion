function dx=farmaco_base(x,t)
  a=1;
  dx = -a*x;
endfunction

# [t,x] = feuler(@farmaco_base, 1, 0, 10, 0.1)
