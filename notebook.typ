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
  Mecánica Estadística Fuera del Equilibrio] \ #text(13pt)[Notas de clase]
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

= Clase 2

== Balance detallado

Algunas definiciones útiles:

#definición[ Dado un microestado $Gamma = {q_i, p_i}$ vamos a definir:
- Su evolución temporal: $Gamma^t$
- Su inversión temporal: $overline(Gamma) = {q_i, - p_i}$
]

Rápidamente, tenemos varias propiedades:

#propiedad[
  + $overline(overline(Gamma)) = Gamma$
  + $dif Gamma = dif overline(Gamma)$ (entendido como diferencial de volumen, aunque debo preguntar al final de la clase esto)
  + $dif Gamma^t = dif Gamma$
  + $(overline(Gamma^t))^t = overline(Gamma)$
]

Ahora en adelante también usaremos supuestos simplificantes:
- Hamiltoniano es par en $p_i$
- Observables pares (denotados $A_Gamma$)

Notación: $A_Gamma (t)$ es la evolución temporal del observable.

#propiedad[Gracias a los supuestos podemos concluir que:
+ $A_(overline(Gamma))(0) = A_Gamma (0)$ por probabilidad.
+ $A_(overline(Gamma)) (t)= A_Gamma (-t)$ aplicando (1) de los operadores y la prop (4) de la inversión temporal.]

Ahora volvamos al supuesto de equilibrio térmico:
-  $F_(e q) = f(H)$ (no más cantidades conservadas)
-  $implies F_(e q)(overline(Gamma)) = F_( e q) (Gamma)$ por paridad de $H$.

Más definiciones:

#definición("Distribuciones de probablidad varias")[
  + $P_( e q)(a) = integral dif Gamma F_( e q) (Gamma) delta(A_Gamma - a)$
  + $P_(e q) (a_1,, t_1, a_2, t_2) = integral dif Gamma F_(e q) (Gamma) delta(A_(Gamma^(t_1)) - a_1) delta(A_(Gamma^(t_2)) - a_2)$
]
Estas definiciones uno las puede manipular para concluir la propiedad de balance detallado:

#align(center)[#bloque[$P_(e q) (a_1,, t_1, a_2, t_2) = P_(e q) (a_2, t_1, a_1, t_2)$]]

Del balance detallado podemos sacar otras conclusiones, como por ejemplo, *en un sistema en equilibrio no pueden haber flujos de cantidades*, pues el flujo inverso es tan probable como el flujo directo, luego se deberían cancelar.

Libro para grupo de renormalización: Cardy Scaling laws in physics o algo así. Es tipo Landau.

== Universalidad

La universalidad se refiere a encontrar _leyes universales_, por ejemplo, la ley de Ohm o los líquidos en el punto crítico. Notemos que no es que una misma ecuación con los mismos parámetros describa un fenómeno en todas sus posibles realizaciones, pero sí que la estructura de la ecuación se mantenga (por ejemplo, mantener el mismo exponente crítico, o que la corriente depende lineal con el campo). El tipo/orden de dependencia no debería cambiar.


= Ecuación de Difusión:

Si tenemos un fluido con partículas suspendidas *no interactuantes* podemos describir su difusión mediante $n(arrow(r), t)$, interpretable o bien como densidad de partículas o bien como una densidad de probabilidad de que una partícula marcada esté en $arrow(r)$ en el tiempo $t$. En cualquier caso, la ecuación es:

$
  partial_t n = D nabla^2 n
$

Consideremos 1 sóla partícula browniana, con la misma configuración de la ecuación de Langevin (materia que no está en este apunte). Esto es:

$
  n(arrow(r), 0) = delta (arrow(r))
$

Esto es un proceso de no equilibrio, el más sencillo. La solución utilizando la transformada de Fourier es:

$
  n(arrow(r), t) = 1/(4 pi D t)^(d/2) e^(- norm(arrow(r))^2 /(4 D t))
$

#pagebreak()

Calculemos promedios:
#bloque[
$
  angle.l arrow(r) angle.r = 0 " por cálculo directo" \
  angle.l norm(arrow(r))^2 angle.r = 2 d D t " La fórmula de Einstein"
$
]

Esto es distinto a la predicción de Langevin, diferencia que se debe a la inercia que puede tener la partícula browniana en tiempos cortos (muy cortos en efectos prácticos). La partícula difusiva no tiene inercia, lo que hace altiro dominar el comportamiento lineal del desplazamiento cuadrático medio. En estricto rigor, la fórmula de Einstein entonces se expresa correctamente como:

$
  D = lim_(t arrow oo) (angle.l Delta r^2(t) angle.r)/(2 d t)
$

En simulaciones numéricas uno usa otra variación de la fórmula:

$
  D = lim_(t arrow oo) partial_t (angle.l Delta r^2(t) angle.r)/(2 d)
$

De aquí uno puede seguir matraqueando y obtener la relación de Green-Kubo:

$
  D = 1/d integral_0^oo C_v (s) dif s
$

Donde $C_v$ es la función de correlación de las velocidades ($C_v (s) = angle.l arrow(v)(s) dot arrow(v)(0) angle.r$)