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


#align(center, [#text(30pt)[
  Mecánica Estadística Fuera del Equilibrio] \ #text(13pt)[Clase 1]
])

= Introducción y repaso de meca y mesta clásicas

#bloque[*Duda*: ¿Cuál era la razón tras el paralelo de Liouville - Von Neumann?]

== Mesta en equilibrio:

Supuestos:
- Cuando $t arrow.r oo$, la distribución de probabilidad tiende a una distribución estacionaria cuyo corchete de poisson / von-neumann es $0$.
- Para esta distribución, sólo hay dependencias en cantidades conservadas. Es decir, si sabemos la energía y esta está fija tenemos el microcanónico.
- Asumimos una propiedad que creo que es la mezcla: si $Gamma_1$ y $Gamma_2$ tienen la misma energía, entonces: $ exists t_0, thick Gamma_1 (t_0) = Gamma_2 $

La propiedad obviamente se tiene en reversa.

== Fuera de equilibrio:

No se han descubierto expresiones generales para la función distribución, ni siquiera la estacionaria.

¿Cómo uno genera un estado fuera del equilibrio?

- Por condición inicial: Recordemos que hay que considerar un límite de tiempo infinito para aplicar la solución estacionaria. Nosotros truncamos ese límite. Cuándo lo truncamos depende de la escala de la dinámica dle sistema, por ejemplo no necesariamente corresponde a escalas tamaño universo. Hay habitualmente una relajación exponencial.

#bloque[Hay alguna manera estructurada de escoger cuales son los estados raros/normales? Porque por balance detalado en verdad la prob de ir de uno a otro es la misma que del otro a uno, sólo que no aplica para un conjunto en sí, o para particiones. Pero si yo quiero puedo armarme otras particiones que quizás me interesen más y tienen resultados distintos.]
- Por condiciones de borde: Podemos por ejemplo fijar temperaturas distintas a los bordes de una barra o cosas así.

#bloque[ Para el ejemplo de la turbulencia, son todos los ejemplos de este tipo caóticos en algún sentido?]
- Medios Granulares: Las interacciones entre sus partículas no son conservativas.
- Materia Activa: Inyección y disipación de energía a distintas escalas.

En los últimos 2 modelos uno puede pensar que existen grados de libertad internos que absorben la energía y todo.