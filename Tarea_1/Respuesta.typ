#import "../preamble.typ": *

#set text(
  font: "JetBrainsMono NF",
  fill: textcolors.at(0), 
  lang: "es")
#let up = sym.arrow.t
#let down = sym.arrow.b
#show emph: set text(textcolors.at(1))
#show strong: set text(textcolors.at(2))
#show: thmrules

#set page(fill: backgroundcolor)

// #show heading.where(level: 1): set text(headingcolors.at(0))
// #show heading.where(level: 2): set text(headingcolors.at(1))
// #show heading.where(level: 3): set text(headingcolors.at(2))
// #show heading.where(level: 4): set text(headingcolors.at(3))


#set math.equation(numbering: "(1)")
#set par(justify: true)
#set table(stroke: tablecolor)


#align(center, [#text(30pt)[Tarea 1] \ #text(13pt)[Mecánica Estadística Fuera del Equilibrio]
])

= Pregunta 1:

En este modelo las partículas se ubican en una grilla (que para esta pregunta limitaré al caso de 1 dimensión, y asumiré que es una grilla infinita) sin posibilidad de superponerse. Cada partícula tiene una dirección de movimiento asociada (izq o derecha). A cada paso de tiempo se escoge un ordenamiento de las $M$ partículas presentes en la grilla. Luego, recorremos las partículas en el ordenamiento escogido tal que con una probabilidad $alpha$ se escoge aleatoriamente una nueva dirección para esta partícula, de lo contrario preserva la anterior. Si el sitio vecino al que apunta la dirección de la partícula se encuentra vacío, la partícula es movida hacia ese nuevo sitio. De lo contrario, se queda en el lugar.

Veamos que este proceso es irreversible temporalmente mediante un contraejemplo. Es decir, busquemos 2 microestados $Gamma_1, Gamma_2$ tal que $PP(Gamma^t = Gamma_1 | Gamma^(t - 1) = Gamma_2) != PP(Gamma^t = Gamma_2 | Gamma^(t - 1) = Gamma_1)$. Notemos que los microestados pueden ser caracterizados por las funciones: $Gamma in{ gamma in  {-1,0,1}^ZZ | |{i in ZZ | gamma (i) != 0}| = M}$, donde el signo de $gamma(i)$ caracteriza la dirección de la partícula en el sitio $i$.

Esto es sencillo gracias a la persistencia o direccionalidad de las partículas. Fijemos $alpha = 0$ por simplicidad, luego la dirección de las partículas es fija. Tomemos $M = 1$ y caracterizemos $Gamma_1$ y $Gamma_2$ como:

$
  Gamma_1 (0) = 1\
  Gamma_2(1) = 1
$

No hay interacción entre las partículas ni procesos de tumbling (pues $M = 1, alpha = 0$) luego la probabilidad de pasar de $Gamma_1$ a $Gamma_2$ es 1. Sin embargo, la probabilidad de pasar de $Gamma_2$ a $Gamma_1$ es 0, ya que la partícula sólo se mueve a la derecha. Luego el proceso es irreversible. Esto se puede haber dicho en lenguaje menos explícito como "la presencia de un flujo persistente es un indicador de irreversibilidad temporal".


= Pregunta 2

La dificultad acá radica en pasar de la distribución maxwelliana al parámetro $V_0$. Podemos partir con otra expresión para $sin(k x)$ que lo vincula de vuelta con la transformada de Fourier de la corriente. Esto es:

$
  arrow(J) (arrow(r)) &= rho_0 V_0 sin( k x) hat(y) \
  &= rho_0 V_0 [e^(i k x) - e^ (- i k x)]/(2 i) hat(y) \
  &= ( rho_0 V_0 )/( 2 i ) hat(y) [e^(i k x) - e^ (- i k x)]\
  &= V rho_0 / (2 i) [1/V integral dif r V_0 delta(r - x) e^(i k r) - 1/V integral dif r V_0 delta(r + x) e^(i k r)]
$

Fijamos un x y nos damos cuenta que estas son 2 partículas con masas $(rho_0 V)/2$, una en $x$ y otra en $-x$ que tienen velocidad $V_0 hat(y)$ en direcciones opuestas (me queda un $i$ flotando que no sé donde meterlo en verdad). Bajo el supuesto de independencia podemos calcular la probabilidad de esto como:

$
  p(arrow(J)) = p(V_0 hat(y)) dot p(-V_0 hat(y)) = (m/(2 pi k T))^(3) e^(-(m V_0^2)/(k T))
$

Aquí m es constante para las 2 supuestas partículas. Podemos decir que está dado por $(rho_0 V)/ 2$.

Ahora para $P(V_0)/P(0) = e^(-(m V_0^2)/(k T))$, tomemos valores de un líquido en un recipiente con $rho_0 V = 2 "kg"$ (redondeando los cálculos potentemente para que yo sea feliz, como por ejemplo $k = 10^(-23)$). Osea $T = 100 "K"$, $m = 1 "kg"$, $k T = 10^(-21)$ y no sé, digamos que $V_0 = 1 "m" dot "s"^(-1)$. Entonces $P(V_0)/P(0) = e^(- 10^21)$ approx, que es muy muy chico prácticamente $0$. De hecho es menor que la resolución de la calculadora online que iba a usar (luego menor que $2^(-64)$, que es un poco obvio si lo escribo). Es tan ridículamente chico que en verdad sospecho que me equivoqué en el razonamiento.


== Pregunta 3:

Voy a basarme en el capítulo 6 del libro _Nonequilibrium Statistical Physics: A modern persepctive_ de la bibliografía del curso.

En general, los exponentes de crecimiento de dominios surgen del estudiio de sistemas templados, es decir, donde en un sistema que presenta una transición de fase, los parámetros del sistema cambian repentínamente y drásticamente de una zona del diagrama de fases a otra. 

Por ejemplo, en un iman con temperatura por sobre la transición ferromagnética, disminuir rápidamente la temperatura por debajo de la transición provoca la aparición de dominios localmente ordenados que crecen, debido a que repentinamente el estado ordenado presenta menor energía. 

Sin embargo, a diferencia de una transición adiabática de la temperatura, en el templado pueden coexistir regiones con magnetización distinta, debido a que la magnetización no tuvo tiempo de ser homogeneizada en el punto crítico, donde las correlaciones entre distintas regiones del imán aumentan y provocan que el imán entero se magnetize on una única magnetización. No pasar por este proceso hace que los dominios aparezcan debido a fluctuaciones que permanecen locales, permitiendo así la aparición de distintos dominios en distintas secciones del material.

Una característica principal de estos procesos es la existencia de leyes de reescalamiento (para tiempos grandes) donde un sistema adecuadamente reescalado presenta las mismas propiedades estadísticas que otro. Esto es el fenomeno de autosimilitud. En este caso, el reescalamiento necesario para un sistema en 2 tiempos distintos sólo dependerá de la diferencia temporal. 

== Caso 1-dimensional:

En un modelo de Ising, la dinámica 1 dimensional es particular en que su transición ocurre en temperatura nula, no permitiendo el proceso de templado antes descrito. Sin embargo, se puede estudiaar el caso del crecimiento de dominios al aumentar repentinamente el largo de correlación (bajando la temperatura). Esto provocará dinámica de coarsening, aunque una vez que el largo típico de los dominios alcanza la longitud de correlación este proceso se detiene. Para estudiar este proceso resulta ser importante considerar si queremos que la magnetización se conserve o no. Pensando el modelo de Ising fuera del contexto de los imanes, sino como un modelo de condensación por ejemplo, existen casos donde si se esperaría conservar la magnetización total. Esto lleva a 2 exponentes de reescalamiento distintos. En el caso de conservación, se obtiene un exponente $1/3$, mientras que sin conservación el crecimiento es más rápido, obteniendo un exponente $1/2$.

== Otras dimensiones

El exponente de coarsening resulta *no depender de la dimensión*. Esto es contraintuitivo si uno piensa en otros exponentes críticos, que sí suelen depender de la dimensión. Sin embargo, usando un formalismo basado en al energía libre de Landau, se puede confirmar este resultado, al menos para el caso no conservaivo, ya que obtenemos que la ecuación para la evolución del tamaño de un dominio esférico de radio $R(t)$ es:

$
  dot(R) = -(d-1)/R + xi
$

Donde $xi$ es un ruido blanco gaussiano. Luego, si el radio inicial  es $R(0) = L$, obtendremos el reescalamiento si intentamos calcular el tiempo promedio que toma $R$ en decaer a 0. En general, el tiempo de primera pasada a 0 en 1D de un caminante aleatorio (simétrico) va cuadrático con la condición inicial. Esto también lo vimos en clases para los procesos difusivos. Si despreciamos el ruido, resulta ser que la solución de la ecuación determinista también va cuadrática con el tiempo. Luego, uno espera que la ecuación con ambos términos en verdad tenga el mismo comportamiento cuadrático. Invirtiendo la relación para obtener $L(t)$ obtenemos el exponente $1/2$ para todas las dimensiones.

El caso conservativo es más complicado, debido a que la dinámica es más restringida. Sin embargo, es posible llegar a un resultado similar, permitiendo concluir que la dimensión no es relevante para el proceso de coarsening.