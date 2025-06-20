function [t,x,aches]=ej10(reltol, abstol)
  #[t,x,aches] = rk23(@masares_base, [0;0], 0, 10, reltol, abstol)
  [t,x,aches] = traprulevs(@masares_base, [0;0], 0, 100, reltol, abstol)
  plot(t,x,t,aches)
endfunction

# con rk23:
# para b = 1, el h oscila entre [2,4] a partir de x = 20 aprox.
# para b = 100, siendo mucho más estable, se requieren mayor cantidad de pasos con h mucho más chicos
# que para b = 1, siendo h un valor que oscila entre [0.02,0.04]

# con traprulevs:
# para b = 1, el algoritmo tiende a el h óptimo (que es (tf-ti/10) debido a que a partir de x = 7x
# hasta x = 9x aprox no encuentra errores en los cálculos.
# para b = 0, la curva que describen los distintos valores de h va a la par con la oscilación
# que describen las curvas de masa y resorte, en donde dicho rango de valores es muy acotado
# ([0.13, 0.16]). Esto tiene sentido porque la frecuencia de oscilación de las curvas es mucho mayor
# debido a que la amortiguación es nula.
# para b = 100, no se observan errores muy grandes, más aún, constantemente busca un h cada vez
# mayor hasta llegar a h=2 aprox.

# Con el método implícito, en comparación con RK23, no muestra errores significativamente grandes
# y permite utiizar tamaños de paso h mayores a los logrados anteriormente.

# TODO: Gráfico para comparar aches entre métodos.
