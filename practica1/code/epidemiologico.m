function [t,P]=epidemiologico(S0,I0,R0,ti,tf)
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

[t,P] = epidemiologico(power(10,6)-10, 10,0 ,0,100)

