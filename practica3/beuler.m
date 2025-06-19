function [t,x]=beuler(f,x0,t0,tf,h)
  t=[t0:h:tf];
  x=zeros(length(x0),length(t));
  x(:,1)=x0;
  for k=1:length(t)-1
    F=@(xk1) xk1-x(:,k)-h*f(xk1,t(k)+h); %function que debe ser cero
    x(:,k+1)=fsolve(F,x(:,k));
  endfor
endfunction

# [t,x] = beuler(@masares_base, [0;0], 0, 10, 0.1)
# [ta,xa] = ltiSolve([0 1; -1 -1], [0;1], 1, [0; 0], t)

# ej7 - repetición ej5
# h = 0.1 -> norm(x(:,2)-xa(:,2),1) = 9.0896e-03
# h = 0.01 -> norm(x(:,2)-xa(:,2),1) = 9.9157e-05

# h = 0.1 -> norm(x-xa,1) = 0.056461
# h = 0.01 -> norm(x-xa,1) = 6.0471e-03

# ej7 - repetición ej6

# m = k = 1
# b = 1 -> max h =
# A = [0 1; -k/m -b/m]
# [t,x] = beuler(@masares_base, [0;0], 0, 100, h)
# [ta,xa] = ltiSolve(A, [0;1], 1, [0; 0], t)
# plot(t,x,ta,xa)
