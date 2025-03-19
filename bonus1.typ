#import "./preamble.typ": *

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


#align(center, [#text(30pt)[Bonus 1] \ #text(13pt)[Opti No Lineal]
])
= Independencia Lineal implica Mangasarian Fromovitz

Sea $x$ en el conjunto factible que cumple independencia lineal, es decir, tenemos independencia lineal de ${grad g_i (x) | i in I(x)} union {grad h_j (x) | j in J}$.

Busquemos un vector $d in RR^n$ tal que:
$
 forall i in I(x), thick angle.l grad g_i (x), d angle.r < 0 and
 forall j in J, thick angle.l grad h_j (x), d angle.r = 0
$

Si $|{grad g_i (x) | i in I(x)} union {grad h_j (x) | j in J}|$ es menor que la dimensión del espacio $n$, podemos extender este conjunto con nuevos vectores $a_k, k in K$ linealmente independientes hasta tener una base de $RR^n$. Ahora, consideramos la matriz $M$ cuyas filas sean los vectores de nuestra base, con las primeras $|I(x)|$ filas siendo los ${grad g_i (x) | i in I(x)}$, las siguientes $|J|$ siendo los ${grad h_j (x) | j in J}$, y las últimas $|K|$ siendo los ${a_k}$.

$
  M = vec(..., (grad g_i)^T,..., (grad h_j)^T, ..., (a_k)^T)
$

Esta es una matriz cuadrada de vectores l.i., luego es invertible, luego podemos escoger $d = M^(-1) vec(-1, ..., -1, 0, ..., 0)$ (las primeras $|I(x)|$ coordenadas del vector ese son $-1$, el resto $0$). Luego, notando que el producto punto $angle.l grad g_i (x), d angle.r$ es simplemente la coordenada i-ésima del vector $M d$, y $angle.l grad h_j (x), d angle.r$ la coordenada $|I(x)| + j$-ésima, podemos concluir que (reemplazando el $d$ propuesto) se cumplen las condiciones de Mangasarian Fromovitz (recordando que ${grad h_j (x) | j in J}$ es l.i. por hipótesis).

= Conexión entre Slater y Mangasarian Fromovitz

Slater implica Mangasarian Fromovitz, gracias a la convexidad de $g$ y afinidad de $h$. Basta usar que por convexidad, $0 = g(x_0) >= g(x) + angle.l grad g(x), x_0 - x angle.r$. Las condiciones de Slater y de que $g$ sea activa permiten concluir la primera parte de Mangasarian Fromovitz, con $d = x_0 - x$. Además al ser $h$ una función afín con mismos valores en $x$ y en $x_0$, el gradiente en la dirección $x_0 - x$ es $0$. Con esto, tenemos la segunda mitad de Mangasarian Fromovitz.