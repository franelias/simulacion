# Entrega Práctica 3

## Francisco Elías. E-1217/3
## Sebastián Morales. M-6501/3 
---

## Problema 1

Al expresar el problema en la forma `x'(t) = A*x(t) + B*u` se tiene que la matriz A es el escalar `-a`, mientras que `B*u = 0` dado que no hay entradas. Por lo tanto, la solución analítica estará dada por:

```
dx/dt = -a*x(t)
dx/x(t) = -a*dt
int(dx/x(t)) = int(-a*dt)
logn(abs(x(t))) = -a*t + C
abs(x) = e^(-a*t + C) = e^C * e^(-a*t)

Sea k = e^C

abs(x(t)) = e^(-a*t)*k
=><exponencial positivo>=>
x(t) = k*e^(-a*t)

x(0) = k*e^(-a*0) = x0
     = k*e^0 = k = x0
```

Donde int(x) es integral de x, logn(x) es el logaritmo natural de x y abs(x) el valor absoluto de x.

En la figura puede apreciarse que la implementación de la solución analítica en Octave resulta en la curvatura exponencial esperada.

![Fármaco](./img/ej1.jpeg)

---

## Problema 2

La implementación de ltiSolve emplea la ecuación 2b en cada valor del arreglo de tiempo eficientemente, haciendo uso del método `expm` para calcular la exponencial matricial necesaria.

![ltisolve](./img/ej2.jpeg)

---

## Problema 3

De las ecuaciones de estado pueden obtenerse los siguientes valores para la solución analítica.

```
A = [0 1; -k/m -b/m]
B = [0; F/m]
u = 1
``` 

El valor inicial x0 será `[0; 0]`.

Con b = 1:

![Resorte con ltisove, b = 1](./img/ej3_1.jpeg)


Con b = 0 oscila indefinidamente debido a que el rozamiento es nulo.

![Resorte con ltisove, b = 0](./img/ej3_2.jpeg)


Con b = 10 resulta en un movimiento muy lento debido a la elevada fricción con el suelo.

![Resorte con ltisove, b = 10](./img/ej3_3.jpeg)

---

## Problema 4.

Los resultados de las simulaciones hechas con la implementación de Forward Euler tienen una evolución muy similar a las soluciones analíticas vistas anteriormente.

Problema del fármaco.

![Fármaco con forward euler](./img/ej4_1.jpeg)

Problema del resorte.

![Resorte con forward euler](./img/ej4_2.jpeg)

---

## Problema 5.

Debajo se encuentran los errores obtenidos para las simulaciones con las dos longitudes de paso solicitadas. A partir de los resultados se podría afirmar que Forward Euler es un algoritmo de primer orden, ya que al disminuir 10 veces la longitud de paso se obtiene un error de primer paso 10^2 veces menor, pero un error máximo 10 veces menor.

| Paso (h)  | Error primer paso  | Error máximo  |
|---|---|---|
| 0.1  | 9.8293e-03  | 0.066139  |
| 0.01  | 9.9833e-05  | 6.1432e-03  |

---

## Problema 6.

Los resultados experimentales para cada coeficiente de roce b fueron los siguientes:
- b = 1: simulación marginalmente estable con un paso h = 1. Con valores menores es estable, mientras que con valores mayores se vuelve inestable.
- b = 0: los resultados fueron inestables para todas las longitudes de paso empleadas.
- b = 10: con h = 0.1 los valores se estabilizan. Con un h mayor resultan inestables. 

TODO: análisis de autovalores.

---

## Problema 7.

Para Backward Euler, si bien los errores obtenidos fueron menores que con Forward, no hay una mejora sustancial.

| Paso (h)  | Error primer paso  | Error máximo  |
|---|---|---|
| 0.1  | 9.0896e-03  | 0.056461  |
| 0.01  | 9.9157e-05  | 6.0471e-03  |


TODO: análisis de autovalores.

---

## Problema 8.

Para Heun sí se nota una mejora sustancial en la precisión respecto a los dos métodos de Euler anteriormente vistos. Se comprueba que es un método de segundo orden, ya que el error del primer paso disminuye tres órdenes de magnitud y el máximo en dos órdenes al disminuir diez veces la longitud de paso h.


| Paso (h)  | Error primer paso  | Error máximo  |
|---|---|---|
| 0.1  | 1.7067e-04  | 2.4063e-03  |
| 0.01  | 1.6708e-07  | 2.3020e-05  |

TODO: análisis de autovalores.

---

## Problema 9.

Los errores obtenidos con la regla trapezoidal son de los mismos órdenes de magnitud que los obtenidos con Heun, lo cual es esperable para otro método de segundo orden. 

| Paso (h)  | Error primer paso  | Error máximo  |
|---|---|---|
| 0.1  | 9.0615e-05  | 1.1439e-03  |
| 0.01  | 8.4156e-08  | 1.1451e-05  |

TODO: análisis de autovalores.

---

## Problema 10.

Como se vio previamente, el método de Heun se vuelve inestable con longitudes de paso h altas en el sistema masa-resorte con coeficiente de roce b = 1. Es esperable entonces el resultado obtenido, en donde el paso h oscila entre 2 y 4, ya que no puede agrandar más su valor mientras mantiene el error dentro de los valores admitidos.

![RK23, b = 1](./img/ej10_1.jpeg)
![RK23, b = 1](./img/ej10_2.jpeg)

Para b = 100, solo puede mantenerse la estabilidad con valores de paso h muy pequeños, donde estos oscilan entre 0.02 y 0.04.

![RK23, b = 100](./img/ej10_3.jpeg)
![RK23, b = 100](./img/ej10_4.jpeg)

---

## Problema 11.

A diferencia del problema anterior, el usar un método implícito permite preservar la estabilidad numérica del sistema original. En consecuencia, las simulaciones con coeficientes de roce b = 1 y b = 100 no tienen inconvenientes de errores grandes y pueden utilizar longitudes de paso considerablemente mayores a los logrados por RK23.


![Implícito, b = 1](./img/ej11_1.jpeg)
![Implícito, b = 1](./img/ej11_2.jpeg)
![Implícito, b = 100](./img/ej11_3.jpeg)
![Implícito, b = 100](./img/ej11_4.jpeg)

El caso del coeficiente de roce b = 0 es particular, ya que al preservar la estabilidad marginal es necesario usar un tamaño de paso pequeño debido a la frecuencia de oscilación de las variables de estado. Como los valores se modifican con frecuencia, no puede emplearse una longitud de paso h significativa respecto a la frecuencia de las curvas, porque probablemente se tenga un error alto si se las deforma.

![Implícito, b = 100](./img/ej11_5.jpeg)
![Implícito, b = 100](./img/ej11_6.jpeg)
