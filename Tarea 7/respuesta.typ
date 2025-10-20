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


#align(center, [#text(30pt)[Tarea 7] \ #text(13pt)[Mecánica Estadística Fuera del Equilibrio]
])

= Pregunta 1

Considerando la discretización propuesta calculamos la energía libre, teniendo $psi = (psi_i)_(i in ZZ)$ ahora un vector en un espacio de dimensión numerable. También podemos verla como una función $phi$ de $ZZ times RR$ a $RR$ donde $phi(z, t) = psi_z (t)$. Creo que esta visión me permite trabajar un poco más fácil así que le daré con eso. Sea $tilde(partial)_x$ el operador derivada discretizada simétrica (es decir, $tilde(partial)_x phi (z) = (phi (z + 1) - phi (z - 1))/(2 h)$), donde $h$ es el espaciado de la malla. Ahora, si consideramos la medida $mu$ definida por: $forall z in ZZ, mu({z}) = h$ (notemos que es absolutamente continua con respecto a la medida cuenta puntos).

$
  F[phi] = integral_(ZZ) [f(phi)(x) + gamma/2 (tilde(partial)_x phi (x))^2] dif mu (x)
$

Escrito de manera equivalente:

$
  F[phi] = sum_(ZZ) [f(phi)(x) + gamma/2 ((phi (x + 1) - phi (x - 1))/(2 h))^2] h
$

Ahora para obtener la ecuación de movimiento, me gustaría hacerlo de una manera general en verdad lo más posible antes de tener que diferenciar entre modelo A y modelo B. Pero para saber qué es lo que tienen en común estos modelos necesito trabajar un poco qué es lo que pasa. Lo bueno de todas maneras es que el cálculo de variaciones sigue la misma idea. Estudiemos una pequeña perturbación $eta: ZZ -> RR$ y encontremos la respuesta lineal de $F$ a esta perturbación en $phi$:

$
  F[phi + eta] &= integral_(ZZ) [f(phi) + partial_phi f (phi) eta + gamma/2 (tilde(partial)_x (phi + eta))^2] + h.o.t. med dif mu (x) \

  &= integral_(ZZ) [f(phi) + partial_phi f (phi) eta + gamma/2 ((tilde(partial)_x phi)^2 + 2 tilde(partial)_x phi tilde(partial)_x eta ] + h.o.t. med dif mu (x) \

  &= F[phi] + integral_(ZZ) [partial_phi f (phi) eta + gamma (tilde(partial)_x phi) (tilde(partial)_x eta)] med dif mu (x) \

  &= F[phi] + integral_(ZZ) [partial_phi f (phi) eta + gamma (tilde(partial)_x phi) (eta(x + 1) - eta(x - 1))/(2 h)] med dif mu (x) \

  &= F[phi] + integral_(ZZ) partial_phi f (phi) eta dif mu (x) + gamma/(2 h)[integral_ZZ tilde(partial)_x phi (x - 1) eta(x) dif mu(x) -  integral_ZZ tilde(partial)_x phi(x + 1) eta(x) med dif mu (x)] \

  &= F[phi] + integral_(ZZ) partial_phi f (phi) eta dif mu (x) - gamma integral_ZZ tilde(partial)^2_x phi (x) eta(x) dif mu(x)\
$

Esto nos permite concluir que en este caso la variación sigue una forma similar al caso no discretizado:

$
  (delta F)/(delta phi) = partial_phi f (phi) - gamma tilde(partial)^2_x phi
$

¡Súper! Ahora, aún con el sueño de sacar los dos casos de una vez, consideremos $D$ un operador lineal sobre este espacio que puede o bien ser la derivada discreta o bien ser la identidad. Notemos que podemos considerarla una matriz de tres bandas (osea, puede ser una matriz cuyos 3 elementos diagonales son $(-1/(2 h), 0, 1/(2 h))$). Consideremos también un ruido blanco $eta$. Entonces ambas dinámicas pueden ser escritas como:

$
  partial_t phi = lambda D^2 (delta F)/(delta phi) + D eta
$

Acá también aprovecho que $-eta$ también sería un ruido blanco con las mismas propiedades, y permito que $lambda$ sea negativo. Notemos que en efecto $D eta$ siempre será sólo una combinación lineal (posiblemente numerable) de ruidos blancos. Si el operador es razonable, los coeficientes de esta combinación lineal serán sumables. Este es el caso de los operadores de diferencia finita por ejemplo. Esto entonces es simplemente, ¡otro ruido blanco! pero con la constante $Gamma$ de correlación cambiada adecuadamente (veremos esto más adelante). Entonces en efecto esta ecuación es sólo una ecuación de Langevin más. 

Ahora se nos pide pasar a la ecuación de Fokker-Planck asociada. Sin embargo, no podemos derivar como tal ya que estamos en un espacio más raro. Es ahora que en verdad también debemos especificar que si bien $eta$ sigue siendo un ruido blanco en el tiempo, ya no tiene sentido que lo sea en el espacio. Para ver bien qué es lo que puede ser usaré una definición del ruido blanco que utilizé en una tarea anterior, es decir un proceso estocástico gaussiano indexado por funciones cuadrado integrables. Lo que yo digo es que ahora en vez de considerar $eta$ como aquel indexado por las cuadrado integrables de espacio y tiempo, tomo simplemente en espacio las inicatrices de $[x, x+h]$ con $x in h ZZ$ (debido a la discretización del espacio) y multiplico por cualquier función cuadrado integrable en el tiempo. Esto significa que ahora la correlación es $angle.l eta(x, t), eta(x', t') angle.r = Gamma h delta_(x, x') delta(t - t')$ (creo, cierto?). También, en algún momento queremos tirar un límite de $h$ pequeño así que si es necesario puedo ignorar los ordenes más que lineales en $h$.

Partamos entonces a buscar la ecuación de Fokker-Planck. Para esto me apoyo de la noción que da Van-Kampen de esta como una ecuación maestra. Para poder formular la ecuación entonces, debería entender cuales son los flujos de probabilidad entrantes y salientes a un estado $phi( dot , t) in RR^ZZ$ en un $t$ fijo. Esto marcará el inicio de mi descenso a un cálculo que seguramente es mucho más simple pero mi cabeza es muy pequeña para sacar si no es con la matraca. Para esto, vamos a considerar la probabilidad de que en un tiempo $dif t$ el sistema o bien entre o salga de un estado $phi(dot , t)$ a un estado $phi'(dot, t)$. Notamos que esto depende de una densidad de probabilidad dada por integrar en un intervalo $dif t$ un ruido blanco. Entonces depende de variables aleatorias que distribuyen como $N(0, tilde(Gamma) dif t)$ donde $tilde(Gamma)$ es la constante de correlación en el tiempo de los ruidos blancos (que recordemos puede ser distinta de $Gamma$ por la acción del operador $D$). Considerando $dif t arrow.r 0$, los únicos saltos que mantienen un orden lineal en $dif t$ entonces serán aquellos entre estados que difieren en una sola coordenada. Son estos entonces los que pueden contribuir y quitar densidad de probabilidad. Denoto $phi^i_(xi)$ como la función que es $phi$ en todas las coordenadas menos la $i$-ésima, donde toma el valor $xi in RR$.

$
   P(phi(dot, t + dif t)) - P(phi(dot, t)) =& 1/C(dif t) sum_(i in ZZ) integral_(RR) P(phi^i_xi, t) exp( - (xi + partial_t phi^i_xi (i, t) dif t - phi(i, t))^2 / (2 Gamma dif t)) \
  &- P(phi(dot, t)) exp(- (phi(i, t) + partial_t phi (i, t) dif t - xi)^2 / (2 Gamma dif t)) dif xi
$

Donde $C(dif t)$ es la constante de normalización asociada a la normal. Podemos separar las dos integrales y hacer cambios de variables, $y_i = xi + partial_t phi^i_xi (i, t) dif t$ en la primera integral y $y'_i = xi - partial_t phi (i, t) dif t$ en la segunda:

$
  =& 1/C(dif t) sum_(i in ZZ) [integral_(RR) P(phi^i_xi, t) exp( - (xi + partial_t phi^i_xi (i, t) dif t - phi(i, t))^2 / (2 Gamma dif t)) dif xi \
  &- integral_RR P(phi(dot, t)) exp(- (phi(i, t) + partial_t phi (i, t) dif t - xi)^2 / (2 Gamma dif t)) dif xi] \
  =& 1/C(dif t) sum_(i in ZZ) [integral_(RR) P(phi^i_xi, t) exp( - (y_i - phi(i, t))^2 / (2 Gamma dif t)) (1 + partial_xi partial_t phi^i_xi (i, t) dif t)^(-1) dif y_i \
  &- integral_RR P(phi(dot, t)) exp(-(y'_i - phi(i, t))^2 / (2 Gamma dif t)) dif y'_i] \
$

Como vamos a querer sacar sólo cosas lineales en $dif t$ puedo hacer una truquería en el siguiente término: $partial_xi partial_t phi^i_xi (i, t) dif t = partial_y_i partial_t phi^i_(y_i) (i, t) dif t + O(dif t^2)$. Reemplazando y juntando las integrales:

$
  =& 1/C(dif t) sum_(i in ZZ) integral_(RR) exp(-(y_i - phi(i, t))^2 / (2 Gamma dif t))[P(phi^i_xi, t)(1 + partial_y_i partial_t phi^i_(y_i) (i, t) dif t + O(dif t^2))^(-1) \
  &- P(phi(dot, t))] dif y_i
$

Podemos ahora volver a meter el término $1/C(dif t) = 1/sqrt(2 pi Gamma dif t)$ con la esperanza de empezar a sacar los términos de orden superior.

$
  =& sum_(i in ZZ) integral_(RR) 1/sqrt(2 pi Gamma dif t) exp(-(y_i - phi(i, t))^2 / (2 Gamma dif t))[P(phi^i_xi, t)(1 - partial_y_i partial_t phi^i_(y_i) (i, t) dif t + O(dif t^2)) \
  &- P(phi(dot, t))] dif y_i
$