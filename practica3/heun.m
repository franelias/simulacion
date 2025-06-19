function [t,x]=heun(f,x0,t0,tf,h)
   t=[t0:h:tf];
   x=zeros(length(x0),length(t));
   x(:,1)=x0;
   for k=1:length(t)-1
     k1=f(x(:,k),t(k));
     k2=f(x(:,k)+h*k1,t(k)+h);
     x(:,k+1)=x(:,k)+h/2*(k1+k2);
   endfor
endfunction

# h = 0.1
# [t,x] = heun(@masares_base, [0;0], 0, 100, h)
# [ta,xa] = ltiSolve(A, [0;1], 1, [0; 0], t)

# Ej8 - repetición ej5
# h = 0.1     -> norm(x(:,2)-xa(:,2),1) = 1.7067e-04
#             -> norm(x-xa,1) = 2.4063e-03
# h = 0.01    -> norm(x(:,2)-xa(:,2),1) = 1.6708e-07
#             -> norm(x-xa,1) = 2.3020e-05

# repeticion ej6

# m = k = 1
# A = [0 1; -k/m -b/m]
# b = 1 -> max h = [1.4, 1.5]
# b = 0 -> max h =
