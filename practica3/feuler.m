function [t,x]=feuler(f,x0,t0,tf,h)
  t=[t0:h:tf];
  x=zeros(length(x0),length(t));
  x(:,1)=x0;
  for k=1:length(t)-1
    x(:,k+1)=x(:,k)+h*f(x(:,k), t(k));
  endfor
 end

 # [t,x] = feuler(@farmaco_base, 1, 0, 10, 0.1)

# ej6
# b = 1 -> máx h = 1
# b = 10 -> máx h = 0.1
# b = 0 -> no existe h
