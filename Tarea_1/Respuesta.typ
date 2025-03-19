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

+ La dificultad acá radica en pasar de la distribución maxwelliana al parámetro $V_0$. Primero voy a intentar jugar con la expresión para la corriente a ver si se me ilumina la mente. Esto es:

$
  arrow(J) (x) &= rho_0 V_0 sin( k x) hat(y) \
  &= rho_0 V_0 [e^(i k x) - e^ (- i k x)]/(2 i) hat(y) \
  &= ( rho_0 V_0 )/( 2 i ) hat(y) [e^(i k x) - e^ (- i k x)]
$

Y en verdad, ¿qué significa calcular la probabilidad de $V_0$? Significa que queremos ver todas las maneras posibles de tener $N$ partículas con distribución maxwelliana tal que la corriente quede caracterizada con el factor buscado. Bueno, esto es que:

$
  sum_i m_i arrow(v_i) delta(arrow(r) - arrow(r_i)) = rho_0 V_0 sin(k x) hat(y)
$

En verdad esto no me está haciendo mucho sentido... Creo que hay un typo y lo que se nos pasa es la transformada de fourier de la corriente no?

O sea que en verdad sería:

$
  1/V sum_j m_j arrow(v_j) e^(- i arrow(k) arrow(r)_j) = rho_0 V_0 sin(k x) hat(y)
$

Okey ahora sí estamos llegando a algún lado creo. Porque okey digamos que $rho_0 = 1/V sum_i m_i = N m /V$, y todas las masas son iguales. Luego:

$
  rho_0/N sum_j arrow(v_j) e^(- i arrow(k) arrow(r)_j) = rho_0 V_0 sin(k x) hat(y)
$

Okey se me va el $rho_0$ y me queda que:

$
  1/N sum_j arrow(v_j) e^(- i arrow(k) arrow(r)_j) =  V_0 sin(k x) hat(y)
$

Tenemos que bajo supuesto de independencia, la densidad de probabilidad del vector aleatorio $(v_1, v_2, ..., v_n)$ es la multiplicación de Maxwellianas. Entonces si integramos esta medida producto sobre el conjunto $A = {(v_i)_(i in [N]) in (RR^(3))^N | 1/N sum_j arrow(v_j) e^(- i arrow(k) arrow(r)_j) =  V_0 sin(k x) hat(y)}$ nos dará la probabilidad de encontrar configuraciones con esa densidad de corriente. Okey no creo que sea por acá. Ya pero digamos que ya estamos en un conjunto donde sigue esa forma, es decir que ya estamos en una configuración de onda de cizalle. Osea $1/N sum_j arrow(v_j) e^(- i arrow(k) arrow(r)_j)$ ya es de la forma $A sin(k x) hat(y)$. 