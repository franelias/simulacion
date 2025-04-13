function [t,x] = dtsim(f,x0,ti,tf)
    t=[ti:tf];
    x(:,1)=x0;
    for k=1:length(t)-1
        x(:,k+1)=f(x(:,k),t(k));
    end
end

function x=discreteSEIR2(pre_x,t)
    N=1e6;
    pre_S=pre_x(1);
    pre_E=pre_x(2);
    pre_I=pre_x(3);
    pre_R=pre_x(4);
    pre_NE = pre_x(5:length(pre_x))

    TR=length(pre_x)-4
    TI=3
    R0=1.5

    NEaux=R0/(TR-TI)*pre_S*pre_I/N

    S = pre_S-NEaux
    E = pre_E+NEaux-pre_NE(TI)
    I = pre_I+pre_NE(TI)-pre_NE(TR)
    R = pre_R+pre_NE(TR)

    NE=[NEaux;pre_NE(1:TR-1)]

    x=[S;E;I;R;NE];
endfunction

[t,x] = dtsim(@discreteSEIR2, [1e6-10;10;0;0;[10;zeros(11,1)]], 0,100)