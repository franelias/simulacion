model problema102
  parameter Real L = 1, h=0.1, kv = 1, kpsi = 2, ky= 0.5, lo=4, vref = 2, yref = 1;
  discrete Real x, y, theta, v, psi, a, w, psiref ;
algorithm
  when sample(0, h) then
  x := pre(x) + h * (cos(pre(theta)) * cos(pre(psi)) * pre(v));
  y := pre(y) + h * (sin(pre(theta)) * cos(pre(psi)) * pre(v));
  theta := pre(theta) + h * ((sin(pre(psi)) * pre(v)) / L);
  v := pre(v) + h * pre(a);
  psi := pre(psi) + h * pre(w);
  
  a := kv * (vref - pre(v));
  w := kpsi * (pre(psiref) - pre(psi));
  psiref := ky * (atan(yref - pre(y)) / lo - pre(theta));
  
  end when;

equation

end problema102;
