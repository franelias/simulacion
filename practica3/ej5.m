function [nrm1, nrm]=ej5(metodo, b, h)
  k = m = 1;
  A = [0 1; -k/m -b/m];
  # CAMBIAR b EN masares_base ANTES DE CORRER.
  [t,x] = metodo(@masares_base, [0;0], 0, 100, h)
  [ta,xa] = ltiSolve(A, [0;1], 1, [0; 0], t)
  nrm1 = norm(x(:,2)-xa(:,2),1)
  nrm = norm(x-xa,1)
  plot(t,x,ta,xa)
endfunction
