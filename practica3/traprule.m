function [t,x]=traprule(f,x0,t0,tf,h)
  t=[t0:h:tf];
  x=zeros(length(x0),length(t));
  x(:,1)=x0;
  for k=1:length(t)-1
    F=@(xk1) xk1-x(:,k)-0.5*h*(f(xk1,t(k)+h)+f(x(:,k),t(k)));
    x(:,k+1)=fsolve(F,x(:,k));
  endfor
endfunction


# Rep ej5:
# h = 0.1 -> nrm1 = 9.0615e-05
#            nrm = 1.1439e-03

# h = 0.01 -> nrm1 = 8.4156e-08
#             nrm = 1.1451e-05

# Rep ej6:
# b = 1 -> h = [..2)
# b = 10 -> h = inf
# b = 0 -> h = ? suponemos marginalmente estable


