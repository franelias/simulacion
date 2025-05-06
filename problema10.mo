model problema10
  parameter Real L = 1, h=0.1;
  discrete Real x, y, theta, v, psi, a, w;
algorithm
  when sample(0, h) then
  x := pre(x) + h * (cos(pre(theta)) * cos(pre(psi)) * pre(v));
  y := pre(y) + h * (sin(pre(theta)) * cos(pre(psi)) * pre(v));
  theta := pre(theta) + h * ((sin(pre(psi)) * pre(v)) / L);
  v := pre(v) + h * pre(a);
  psi := pre(psi) + h * pre(w);
  
  if time<1 then
    a:=1;
    w:=0.1;
  elseif time>=2 then
    w:=0;
    a:=0;
  else
    a:=1;
    w:=-0.1;
  end if;
  
  end when;

equation

end problema10;
