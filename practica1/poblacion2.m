function [t, P]=poblacion2(P0,ti,tf)
    b=0.1;
    d=0.02;
    a=0.01
    t=[ti:tf];
    P=zeros(1,length(t));
    P(1)= P0;
    for k=1:length(t)-1
        P(k+1) = P(k) + b*P(k) - a*P(k)*P(k)
    end
end

[t,P] = poblacion2(1,0,100)
plot(t,P)
xlabel("Tiempo")
ylabel("Población")
