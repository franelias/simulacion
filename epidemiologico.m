    function [t,P]=modelo(S0,I0,R0,ti,tf)
        N=S0+I0+R0;
        a=1;
        g=0.5;
        t=[ti:tf];
        P=[zeros(1,length(t));zeros(1,length(t));zeros(1,length(t))]
        P(1, 1)=S0
        P(2, 1)=I0
        P(3, 1)=R0

        for k=1:length(t)-1
            frac = (a*P(1,k)*P(2,k)) / N

            P(1,k+1) = P(1,k) - frac
            P(2,k+1) = P(2,k) + frac - g*P(2,k)
            P(3,k+1) = P(3,k) + g*P(2,k)
        end
    end

[t,P] = modelo(power(10,6)-10, 10,0 ,0,100)


function [t,x] = dtsim(f,x0,ti,tf)
    t=[ti:tf];
    x(:,1)=x0;
    for k=1:length(t)-1
        x(:,k+1)=f(x(:,k),t(k));
    end
end

function x=discreteSIR(pre_x,t)
    al=1;
    gam=0.5;
    N=1e6;
    pre_S=pre_x(1);
    pre_I=pre_x(2);
    pre_R=pre_x(3);
    S = pre_S - al * pre_S * pre_I / N;
    I = pre_I + al * pre_S * pre_I / N - gam * pre_I;
    R = pre_R + gam * pre_I;
    x=[S;I;R];
endfunction

[t,x] = dtsim(@discreteSIR, [power(10,6)-10; 10;0], 0,10)