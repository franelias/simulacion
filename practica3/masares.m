function dx=masares(x,t)
  # parece ok
  k=1;
  m=1;
  b=1;
  F=1;
  dx=[x(2); 1/m*(-k*x(1)-b*x(2)+F)];
end
