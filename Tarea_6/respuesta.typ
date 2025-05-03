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


#align(center, [#text(30pt)[Tarea 6] \ #text(13pt)[Mecánica Estadística Fuera del Equilibrio]
])

= Pregunta 1 en archivo adjunto.
= Pregunta 2:
== Inciso a)
Antes de graficar estudiemos el comportamiento de los mínimos de esta función:

$
  f'(phi) = 0 iff r(phi - phi_0) + 4 u (phi^3 - phi_0^3) = 0
$

Dividiendo ese polinomio por $phi - phi_0$ (pues ya conocemos esa solución) obtenemos:

$
    4u(phi^2 + phi_0 phi + phi_0^2) + r = 0 \
    phi^2 + phi_0 phi + phi_0^2 + r/(4u) = 0
$

Estudiando su discriminante obtenemos que existen otros mínimos (locales) ssi $r <= -3 u phi_0^2$, con punto de inflexión existente cuando se cumple la igualdad. Grafiquemos un par de estos casos (tomar distintas temperaturas es equivalente a tomar distintos r sujeto a no tomar $r < T_c$, por lo que en esta pregunta sólo estudio la temperatura en términos de $r$):

#figure(
  image("image-1.png", width: 50%),
  caption: [Caso $r = -1, u = 0.2$. Observamos que la función en este caso presenta 2 mínimos locales. $phi_0$ en este caso no corresponde a un estado de equilibrio, pero sí es metaestable.]
)

#figure(
  image("image-2.png", width: 50%),
  caption: [Caso $r = -0.6, u = 0.2$. Surge un punto de inflexión. Es uno de los puntos que separan la región que presenta un estado metaestable, distinto a $phi_0$ (que por lo demás ahora es un estado estable) de la región donde $phi_0$ es el único estado estable.]
)

#figure(
  image("image-3.png", width: 50%),
  caption: [Caso $r = 0, u = 0.2$. En este caso $phi_0$ es el único mínimo presente.]
)

Estudiemos más de cerca la estabilidad del estado $phi_0$:

$
  f''(phi_0) = r + 12 u phi_0^2 
$

Vemos que si $u$ es suficientemente pequeño en relación a $u$, entonces es posible que con cambios de temperatura cambie la estabilidad de $phi_0$ (incluso puede dejar de ser un mínimo). El punto de inflexión se da cuando $r = -12 u phi_0^2$. Esto al ser negativo naturalmente significa que la temperatura a la que ocurre esto es menor a la temperatura crítica. Esta es entonces la temperatura espinodal (o en verdad el r espinodal que es lo mismo).


== Inciso b)

Sabemos que la dinámica de modelo B sigue de:
$
  partial_t phi = lambda nabla^2 (delta F)/(delta phi)
$

Esto es ignorando efectos estocásticos. Calculemos entonces la derivada funcional esa pues. Tomemos $h(x)$ como una perturbación que se anula en infinito. Estudiamos entonces la parte lineal en h de:

$
  integral_(Omega) f(phi + h) + c/2 (nabla phi + nabla h)^2 dif mu \
  = integral_Omega f(phi) + partial_phi f(phi) h + c/2 [(nabla phi)^2 + 2 nabla phi dot nabla h] + "h.o.t " dif mu \
  = integral_Omega f(phi) + partial_phi f(phi) h + c/2 [(nabla phi)^2 - 2 nabla^2 phi h] + "h.o.t " dif mu \
  = integral_Omega f(phi) + c/2 (nabla phi)^2 dif mu + angle.l partial_phi f(phi) - c nabla^2 phi, h angle.r
$
Donde $angle.l dot , dot angle.r$ denota el producto interno en $L^2 (RR^3)$, con lo que la derivada funcional entonces resulta: 
$
  (delta F)/(delta phi) = partial_phi f(phi) - c nabla^2 phi
$

Luego la ecuación para el campo es:

$
  partial_t phi &= lambda [nabla^2 partial_phi f(phi) - c nabla^4 phi] \
  &= lambda nabla^2[r(phi - phi_0) + 4 u (phi^3 - phi_0^3) - c nabla^2 phi] \
  &= lambda [r nabla^2 phi + 4 u nabla^2 (phi^3) - c nabla^4 phi] \
  &= lambda [r nabla^2 phi + 12 u nabla dot (phi^2 nabla phi) - c nabla^4 phi] \
  &= lambda [r nabla^2 phi + 24 u phi (nabla phi)^2 + 12 u phi^2 nabla^2 phi - c nabla^4 phi]
$

Si tomamos $phi = phi_0 + h = phi_0 + phi_1(t) e^(i k x)$ con $h$ chica en comparación a $phi_0$ podemos linearizar la ecuación de movimiento en torno a $phi_0$:

$
  partial_t h &= lambda [r nabla^2 h + 12 u phi_0^2 nabla^2 h - c nabla^4 h] \
  &= lambda [partial_phi^2 f(phi_0) nabla^2 h - c nabla^4 h] 
$

Debo decir que comparado con el libro esto tiene un factor de $-1/2$ faltante. No sé de donde podría salir. Voy a seguir con mi cálculo por si no importa, pero de faltar el factor, lo agregaría pensando en que tuve un error de cálculo en esta etapa.

Podemos acá buscar la evolución de $phi_1 (t)$:

$
  dot(phi_1) = - lambda [partial_phi^2 f(phi_0) k^2 + c k^4] phi_1
$

Es decir, la tasa de decaimiento de las perturbaciones es $Lambda_k = lambda [partial_phi^2 f(phi_0) k^2 + c k^4]$. Si estamos sobre la temperatura spinodal entonces $partial_phi^2 f(phi_0) > 0$ (creo que entendí la tasa de decaimiento al revés que el enunciado, es decir para mi si decae con tasa 2 significa que evoluciona con exponente $-2 t$, ya tengo todo escrito así que dejo esta aclaración por si acaso), y por lo tanto la tasa de decaimiento es siempre positiva, indicando que la perturbación decae. De ser negativa, es decir estar un poco por debajo de la temperatura espinodal entonces habría un crecimiento exponencial para perturbaciones con vector de onda cercano a 0. Esto lo podemos observar al graficar esta tasa:

#figure(
  image("image-4.png"),
  caption: [Tasa de decaimiento de las perturbaciones en función de la magnitud del vector de onda para temperaturas justo por debajo de la temperatura espinodal. Podemos ver que existe una zona con decaimiento negativo (es decir crecimiento exponencial) para $k$ pequeño, indicando inestabilidad ante estas perturbaciones.]
)

= Pregunta 3:

A modo de comentario, quisiera hacer un pequeño resúmen de las ideas que me llaman la atención presentes en el artículo.

La materia activa, como ya hemos visto, se caracteriza por salir del equilibrio mediante inyección a escala microscópica de energía (en verdad, la transformación de energía química u de otra índole a trbajo mecánico). En este contexto, los cristales nemáticos activos son modelos experimentales y teóricos simplificados de la materia activa elongada que se puede observar en poblaciones bacterianas como la Escherichia Choli o algunas partículas intracelulares, con inyección de energía mediante crecimiento o contracción a lo largo de su eje de orientación. El objetivo de su estudio es encontrar sistemas activos simples que puedan replicar aspectos dinámicos observables en materia activa real. En este caso, los nemáticos activos se benefician de poder apoyarse en la teoría de cristales líquidos que ya existe, aunque debido a su actividad presentan nueva fenomenología, como creación y aniquilación persistente de defectos topológicos, la desaparición de un orden nemático a largas distancias, y el fenómeno asociado de turbulencia activa, denominado así por la similitud visual con la turbulencia en fluidos.

Es posible estudiar los nemáticos activos mediante un montaje experimental bastante interesante: Se utilizan moléculas ensambladas en microtúbulos junto con motores protéicos con 2 cabezas que se mueven a lo largo de ellos. Además, al medio se le agrega un agente que propicia la aglomeración de microtúbulos en estructuras con orden orientacional, donde los motores protéicos ubican sus 2 cabezas entre microtúbulos distintos, proporcionandole motilidad a la estructura, que se deforma en el proceso, se rompe y luego vuelve a formarse. Este proceso es mantenido mientras siga estando presente una fuente de energía en forma de ATP. Ubicando el sistema en un film sobre agua es posible observar la dinámica generada mediante rastreo de partículas, obteniendo el campo de velocidades dinámico asociado, indicativo de la denominada turbulencia activa. Esto es lo que podemos observar en el video del material suplementario.

También es posible un estudio teórico-computacional basado en un conjunto de ecuaciones nemato-hidrodinámicas para el parámetro de orden nemático $Q$ y el campo de velocidades $u$. Bajo supuestos de inercia nula y dominancia de estreses debido a la actividad por sobre estreses debido a elasticidad, se puede reducir el sistema de ecuaciones a las siguientes 3:

$
  (D Q)/(D t) - S = 1/("Pe") nabla^2 Q, \
  nabla dot u = 0, \
  0 = nabla dot (Pi_"visc" - 1/chi Pi_"act")
$

Acá, $Pi$ son tensores que representan estreses, $chi, "Pe"$ son parámetros del modelo, y $S$ es un término que da cuenta de la respuesta de una partícula elongada a un flujo que varía a su largo. Resultados de simulaciones de estas ecuaciones logran reproducir el fenómeno de turbulencia activa observado experimentalmente.

Este fenómeno presenta creación y aniquilación constante de defectos topológicos de carga $plus.minus 1/2$. Una diferencia importante de la dinámica de estos defectos en comparación con los cristales activos (aparte de que se generan continuamente) es que en nemáticos activos los defectos con carga +1/2 obtienen una velocidad de propulsión propia debido a la actividad. El sentido de la auto-propulsión depende de la naturaleza del material, ya sea actividad por extensividad o por compresibilidad.

Finalmente, un área de interés en los nemáticos activos es poder confinar la dinámica de la turbulencia activa de distintas maneras, ya sea mediante confinamiento geométrico o mediante transferencia de momento desde el material a su substrato o similar. En el caso del confinamiento a un tubo de largo infinito es posible observar distintos regímenes diferenciados por los régimenes estables que presentan, ya sean un baile con varias rondas pequeñas de defectos +1/2, un flujo laminar, o pequeños parches de turbulencia activa.