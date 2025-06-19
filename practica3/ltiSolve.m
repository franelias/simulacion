function [t,x]=ltiSolve(A,B,u,x0,t)
  x=zeros(length(x0),length(t));
  x(:,1)=x0;
  I=eye(length(x0));
  iA = inv(A);
  for k=2:length(t)
    eAt=expm(A*t(k));
    x(:,k)=eAt*x0+iA*(eAt-I)*B*u;
  endfor
endfunction


# [t,x] = ltiSolve([0 1; -1 -1], [0;1], 1, [0; 0], [0:10])

# masares con ltiSolve
# [t2,x2] = ltiSolve([0 1; -k/m -b/m], [0; F(t)/m], 1, [0;0], [0:10])
# b = 1
# [t2,x2] = ltiSolve([0 1; -1/1 -b/1], [0; 1/1], 1, [0;0], [0:100])
