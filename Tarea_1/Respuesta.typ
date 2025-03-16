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

+ La dificultad acá radica en pasar de la distribución maxwelliana al parámetro $V_0$. Podemos partir con otra expresión para $sin(k x)$ que lo vincula de vuelta con la transformada de Fourier de la corriente. Esto es:

$
  arrow(J) (arrow(r)) &= rho_0 V_0 sin( k x) hat(y) \
  &= rho_0 V_0 [e^(i k x) - e^ (- i k x)]/(2 i) hat(y) \
  &= ( rho_0 V_0 )/( 2 i ) hat(y) [e^(i k x) - e^ (- i k x)]\
  &= V rho_0 / (2 i) [1/V integral dif r V_0 delta(r - x) e^(i k r) - 1/V integral dif r V_0 delta(r + x) e^(i k r)]
$

Fijamos un x y nos damos cuenta que estas son 2 partículas, una en $x$ y otra en $-x$ que tienen velocidad $V_0$ en direcciones opuestas. Bajo el supuesto de independencia podemos calcular la probabilidad de esto como:

$
  p(arrow(J)) = p(V_0 hat(y)) dot (p(-V_0 hat(y))) = (m/(2 pi k T))^(3/2) e^(-(m V_0^2)/(k T))
$

Aquí m es constante para las 2 supuestas partículas. Podemos decir que está dado por $(rho_0 V)/ 2$.