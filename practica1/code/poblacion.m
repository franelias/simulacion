function [t, P]=poblacion(P0,ti,tf)
    b=0.1;
    d=0.02;
    t=[ti:tf];
    P=zeros(1,length(t));
    P(1)= P0;
    for k=1:length(t)-1
        P(k+1) = P(k) + b*P(k) - d*P(k)
    end
end

[t,P] = poblacion(1,0,100)
plot(t,P)
xlabel("Tiempo")
ylabel("Población")

Puntos fijos:
P = P + b *P + a * P * P
Resultados
P = 0
P = b/a
