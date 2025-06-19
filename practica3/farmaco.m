function [t,x]=farmaco(a,x0,to,tf)
  # Rari, revisar
  t = [to:tf];
  x = zeros(length(x0), length(t));
  x(:,1) = x0;
  for k=1:length(t)-1
    x(:,k+1) = exp(-a*t(k+1)) * x0;
  endfor
endfunction


# dx/dt = -a*x(t)
#dx/x(t) = -a*dt
#int(dx/x(t)) = int(-a*dt)
#logn(abs(x(t))) = -a*t + C
#abs(x) = e^(-a*t + C) = e^C * e^(-a*t)

#k = e^C

#abs(x(t)) = e^(-a*t)*k
#=<exponencial positivo>
#x(t) = k*e^(-a*t)

#x(0) = k*e^(-a*0) = x0
#     = k*e^0 = k = x0

# [t2,x2] = farmaco(1,1,0,10)
