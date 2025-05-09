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

Ahora se nos pide pasar a la ecuación de Fokker-Planck asociada. Sin embargo, ahora no podemos derivar como tal. Es ahora que en verdad también debemos especificar que si bien $eta$ sigue siendo un ruido blanco en el tiempo, ya no tiene sentido que lo sea en el espacio. Para ver bien qué es lo que puede ser usaré una definición del ruido blanco que utilizé en una tarea anterior, es decir un proceso estocástico gaussiano indexado por funciones cuadrado integrables. Lo que yo digo es que ahora en vez de considerar $eta$ como aquel indexado por las cuadrado integrables de espacio y tiempo, tomo simplemente en espacio las inicatrices de $[x, x+h]$ (debido a la discretización del espacio) y multiplico por cualquier función cuadrado integrable en el tiempo. Esto significa que ahora la correlación es $angle.l eta(x, t), eta(x', t') angle.r = Gamma h delta_(x, x') delta(t - t')$ (creo, cierto?). La ecuación de Fokker-Planck no es más que una ecuación maestra asociada a este proceso (de acuerdo con Van-Kampen). Sin embargo, igual en algún momento queremos tirar un límite de $h$ pequeño así que también ignoro los ordenes más que lineales en $h$. UFFFF qué cálculo.

$
  partial_t P(phi, t) =  
$