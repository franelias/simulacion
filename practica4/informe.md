# Problema 1. Biela-manivela

Se puede ver en el gráfico de la masa cómo se desplaza la masa en el eje x describiendo un comportamiento senoidal. Al principio la manivela inicia en velocidad cero y a medida que pasa el tiempo acelera hasta lograr que la masa se desplace de forma constante.

imagen ej1

# Problema 2. Válvula de una vía

El comportamiento del problema se puede analizar independientemente sus cuatro componentes principales. 

Por un lado el tanque, que inicia con un volumen inicial de 1 m3 y va descendiendo de forma constante. Esto quiere decir que el agua desciende hacia el sistema de válvulas.

imagen tanque

El gráfico de la válvula muestra un comportamiento muy similar al descripto sobre el tanque, ya que el caudal refleja el volumen de agua que sale del mismo.

imagen valve

En checkValve-1, se muestra un caudal despreciable debido a que no pasa agua por ahí. En cambio en checkValve-2 describe un gráfico idéntico al de la válvula, indicando que todo el caudal pasa por dicho componente a diferencia del anterior, siendo esto consistente con el comportamiento descripto en el enunciado. 

imagenes checkvalve12

# Problema 3. Bomba hidráulica

Se optó por mostrar el comportamiento del caudal que entra y sale de la bomba hidráulica. Para esto, el siguiente gráfico describe los caudales que pasan por los dos checkValve presentes en el ejemplo. 

imagen 3

Se puede apreciar cierta alternancia entre los checkValves de entrada y salida de la bomba: primero entra cierto caudal que luego es impulsado hacia fuera con mayor intensidad. El mismo pasa por la válvula conectada a la bomba y vuelve hacia la misma, repitiendo el proceso. Esto aumenta de forma paulatina el caudal del sistema. Se puede afirmar esto a partir del gráfico que describe picos cada vez más altos.


# Problema 4. Sistema completo.

(simulado con 100 s y 500 intervalos)

Para el análisis del sistema completo, se describe el comportamiento de cuatro componentes.

El gráfico de la columna muestra que pasa cierto caudal por el mismo de forma periódica. Esto se debe a que la bomba impulsa dicho caudal por la columna.

imagen columna

El tanque, por su parte, muestra que se va llenando de agua gracias al caudal dispuesto por la columna.

imagen tanque

La válvula recibe cierto caudal, cuya curva describe una pendiente muy similar a la del tanque. 

imagen válvula

En el gráfico de los checkValves de entrada y salida de la bomba, se puede apreciar que el pico de caudal es constante en cada bombeo. Esto se debe a que la velocidad a la que gira la manivela es constante y por lo tanto la presión con la que la bomba succiona agua de la fuente y la empuja hacia la columna también lo es.

imagen bomba
