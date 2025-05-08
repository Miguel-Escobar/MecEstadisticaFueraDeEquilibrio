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

Considerando la discretización propuesta calculamos la energía libre, teniendo $psi = (psi_i)_(i in ZZ)$ ahora un vector en un espacio de dimensión numerable. También podemos verla como una función $phi$ de $ZZ times RR$ a $RR$ donde $phi(z, t) = psi_z (t)$. Creo que esta visión me permite trabajar un poco más fácil así que le daré con eso. Sea $partial_x$ el operador derivada discretizada simétrica (es decir, $partial_x phi (z) = (phi (z + 1) - phi (z - 1))/(2 h)$), donde $h$ es el espaciado de la malla. Ahora, si consideramos la medida $mu$ definida por: $forall z in ZZ, mu({z}) = h$ (notemos que es absolutamente continua con respecto a la medida cuenta puntos).

$
  F[psi] = integral_(ZZ) [f(phi)(x) + gamma/2 (partial_x phi (x))^2] dif mu (x)
$

Escrito de manera equivalente:

$
  F[phi] = sum_(ZZ) [f(phi)(x) + gamma/2 ((phi (x + 1) - phi (x - 1))/(2 h))^2] h
$

Ahora para obtener la ecuación de movimiento, me gustaría hacerlo de una manera general en verdad lo más posible antes de tener que diferenciar entre modelo A y modelo B.

