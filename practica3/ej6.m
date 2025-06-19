function [t,x,ta,xa]=ej6(metodo, b, h)
  k = m = 1;
  A = [0 1; -k/m -b/m];
  # CAMBIAR b EN masares_base ANTES DE CORRER.
  [t,x] = metodo(@masares_base, [0;0], 0, 100, h)
  [ta,xa] = ltiSolve(A, [0;1], 1, [0; 0], t)
  plot(t,x,ta,xa)
endfunction
