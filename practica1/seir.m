function [t,x] = seir(f,x0,ti,tf)
    t=[ti:tf];
    x(:,1)=x0;
    for k=1:length(t)-1
        x(:,k+1)=f(x(:,k),t(k));
    end
end

function x=discreteSEIR(pre_x,t)
    al=1;
    gam=0.5;
    N=1e6;
    pre_S=pre_x(1);
    pre_E=pre_x(2);
    pre_I=pre_x(3);
    pre_R=pre_x(4);
    S = pre_S - al * pre_S * pre_I / N;
    E = pre_E + al * pre_S * pre_I / N - gam * pre_E;
    I = pre_I + gam * pre_E - gam * pre_I;
    R = pre_R + gam * pre_I;
    x=[S;E;I;R];
endfunction

[t,x] = seir(@discreteSEIR, [power(10,6)-10;0; 10;0], 0,100)
