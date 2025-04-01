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


#align(center, [#text(30pt)[Tarea 2] \ #text(13pt)[Mecánica Estadística Fuera del Equilibrio]
])
= Pregunta 1:

Las fases hexáticas son estados de la materia que presentan un orden orientacional de 6 elementos ("six fold orientational symmetry"). Esto es, un orden que es menos estricto que un cristal en una grilla hexagonal, pero más estricto que un gas o un líquido. Uno lo puede pensar en analogía con los cristales líquidos, que presentan un orden orientacional de 2 elementos (estoy intentando traducir el numero de "folds" como número de elementos del grupo de simetría orientacional, no sé si es muy correcto), osea donde si conozco la orientación de una molécula del cristal líquido en fase nemática conozco la orientación de sus vecinos, aunque no conozco la posición de sus vecinos, y además este orden orientacional no tiene un alcance infinito, puede variar a lo largo del sistema (ya sea con defectos topológicos o de manera continua). En una fase hexática (2 dimensional a modo de ejemplo) si conozco la posición de una molécula y alguno de sus primeros vecinos, entonces conozco la posición de sus primeros vecinos con cierta seguridad. Además conozco la orientación del hexágono que tienen mis primeros vecinos. Sin embargo, en la fase hexática esta orientación no es constante a lo largo del sistema, lo que la distingue de un cristal. Es más análogo al orden orientacional quasi-local de los cristales líquidos. Si hablamos en términos de las correlaciones de orden orientacional y de posiciones a las distintas distancias tenemos:

#table(
  columns: 4,
  [],[*Cristal*], [*Hexática*], [*Líquido*],
  [*Correlación Espacial*], [Rangos Largos], [Rangos Cortos], [Rangos Cortos],
  [*Correlación Orientacional*], [Infinita], [Rangos Largos], [Rangos Cortos]
)

Rangos cortos implica nula correlación a largas distancias obviamente.

El estudio de esta fase fue importante para entender las transiciones de sólido líquido y como aplicación de la topología para el estudio de estas transiciones. Resulta que en los años 70 en la física estadística existían contradicciones entre resultados experimentales y el conocimiento teórico de la época sobre la existencia de una transición de fase sólido-líquido en 2D. Esto es debido a que se creía que debido al efecto de fonones de baja energía (que ocurrirían sin problema debido a fluctuaciones térmicas), que se sabía destruían el orden espacial de un cristal en 2 dimensiones, no podía existir una transición ya que la fase sólida perfecta no podía existir en sistemas 2D. O en verdad sólo se podría a temperatura nula donde estos fonones no podrían aparecer. Sin embargo, experimentalmente se observaban indices de una transición de fase. Resulta que la no existencia de un estado perfectamente ordenado no quita que se puede estudiar un orden menos estricto, es aquí donde uno puede empezar a medir el orden de un sistema de manera más relajada mediante algunas invariantes topológicas.

El orden topológico mide por ejemplo, cuántos vórtices existen en un fluido, o cuantas veces da vueltas la orientación de un modelo de ising 2D (en el sentido de que los espines viven en un circulo, en vez del estándar de +-1 o la esfera del modelo de Heisenberg). Estas son constantes que en varios casos están protegidas energéticamente, requeriendo de temperaturas más altas o simplemente fluctuaciones más improbables para transicionar de un valor a otro. La transición entre estados con invariantes topológicas protegidas a algun estado donde estas pueden cambiar es lo que resultó estar detrás de las transiciones observadas en líquidos o sólidos en sistemas 2D.

Aquí es donde entra la teoría KTHNY. Esta logra predecir las temperaturas críticas resolviendo unas ecuaciones de autoconsistencia, vinculadas a la probabilidad de crear o cambiar defectos topológicos (se puede usar para estudiar vórtices en un superfluido o la mencionada transición de sólido líquido). Si uno trabaja las ecuaciones bien (que se escapan un poco de lo que actualmente manejo, al utilizar métodos de los inicions de la teoría de grupos de renormalización, y creo que no es el foco de la pregunta). Se predice una fase sólida, luego una fase hexática entre medio, para finalmente llegar a la fase líquida isotrópica. Esto fue difícil de confirmar experimentalmente, debido a que es una teoría para 2 dimensiones sin considerar efectos de sustrato, ante los cuales la teoría es altamente sensible. Entonces se requieren experimentos delicados donde estos efectos puedan ser lo más mínimos posible.




= Pregunta 2:

La posición después de $n$ pasos la podemos expresar como suma de variables aleatorias independientes:

$
  R = sum_(i = 1)^n r_i
$

Donde $r_i$ son vectores aleatorios iid cuya función densidad de probabilidad está dada por $p(r_i = X) = p(norm(X))/(Omega_d norm(X)^(d - 1))$ con $d$ la dimensión del espacio y $Omega_d$ la superficie de la bola unitaria $d$-dimensional. ¿Cuál es la función densidad de probabilidad de $R$ entonces? Si $p$ es una función razonable, esta resulta ser estimable gracias al TCL. El teorema central del límite nos permite estimar que si $n$ es suficientemente grande, podemos simplemente asignarle una distribución gaussiana a $R$. Esto sería en general una muy buena estimación de esta distribución, con la cual después podemos calcular el valor esperado de $norm(R)^2$.

Exploremos un poco a ver si es posible hacer un cálculo más exacto o de otra manera:

$
  angle.l R dot R angle.r = sum_(i = 1)^n sum_(j = 1)^n angle.l r_i dot r_j angle.r
$

$r_i, r_j$ son iid, luego su distribución es simplemente el producto de ambas. Esto permite efectivamente realizar el cálculo para, aprovechando un paso a esféricas. Primero el caso $i != j$:

$
 angle.l r_i dot r_j angle.r = Omega_d^(-1) integral_(RR^d) dif r_i integral_(RR^d) dif r_j r_i dot r_j (p(norm(r_i)) p(norm(r_j)))/((norm(r_i) norm(r_j))^(d -1)) \
 = Omega_d^(-1) integral_0^oo dif rho_1  rho_1^(d -1)integral_0^oo dif rho_2 rho_2^(d -1)integral_(Omega) dif Omega_1 integral_(Omega) dif Omega_2 rho_1 rho_2 f(Omega_1, Omega_2) (p(rho_1) p(rho_2))/((rho_1 rho_2)^(d -1)) \
 = Omega_d^(-1) angle.l rho angle.r^ 2 integral_(Omega) dif Omega_1 integral_(Omega) dif Omega_2 f(Omega_1, Omega_2) 
$

La función $f$ viene del producto punto entre 2 vectores y representa la parte que depende del ángulo entre ellos (por ejemplo en 2D donde el ángulo sólido es sólo el ángulo, sería $cos(theta_1 - theta_2)$). En general no recuerdo si es simple de escribir tal que sea integrable, y su integral no sé si debiera ser nula. Me voy a hacer la vida más simple y calcular esa integral para $d = 1, 2, 3$, y dejar el resto quizás expresado nomás.

Para $d = 1$ es simplemente $0$ ($1 -1 +1 -1$). Para $d = 2$, es la integral de $cos(theta_1 - theta_2)$, pero para cualquier $theta_1$, la integral dobre $theta_2$ da nula al ser integrar sobre un periodo. Luego en 2 dimensiones también es nula. Para $d = 3$ tenemos un resultado similar, ahí podemos para cada $Omega_1$ fijar el origen de $Omega_2$ tal que el eje z apunta en la dirección de $Omega_1$, haciendo la integral mucho más sencilla con $f(Omega_1, Omega_2) = f(0, Omega_2) =  cos(theta_2)$ que multiplicado por el $dif Omega_2 = sin(theta_2) dif phi_2 dif theta_2$ nos da una integral de $sin(2 theta_2)$ que en $(0, pi)$ se anula nuevamente. Me parece que este procedimiento se podría repetir para cualquier dimensión en general. Y ahora que lo pienso me parece que se sigue directamente de la independencia. En fin, nos sobrevive sólo el caso de $i = j$:

$
 angle.l r_i dot r_i angle.r = Omega_d^(-1) integral_(RR^d) dif r_i norm(r_i)^2 p(norm(r_i))/norm(r_i)^(d -1) \
 = integral_0^oo rho^2 p(rho) dif rho \
 = angle.l rho^2 angle.r
$

Okey con esto tenemos que el desplazamiento cuadrático medio sólo depende de $n$ y el segundo momento de la distribución $p$ como $angle.l R^2 angle.r = n M_2 (p)$.

A partir de esto podemos calcular el coeficiente de difusión utilizando la relación de Einstein:

$
  n M_2 (p) = 2 d D (n Delta t) \
  iff D = (M_2(p)) /(2 d Delta t)
$

Osea que para que $D$ sea finito necesitamos que $p$ sea una distribución con varianza finita. Como por ejemplo la distribución exponencial $p(l) = (1/L) e^(-l/L)$ cuyo segundo momento es $2L^2$. Luego:

$
  D = (L^2) /(d Delta t)
$


= Pregunta 3:
== Ítem a):

$I_(2, n)$ son variables estocásticas gaussianas al ser un límite de suma de variables aleatorias (pensando en la integral como límite de sumas de Riemann). El teorema central del límite nos justifica entonces que es de esperar que esta integral sea una variable aleatoria gaussiana. Sin embargo, este argumento es algo que se podría prestar a error, ya que en verdad el ruido blanco no tenemos como asegurar que sea Riemann integrable (de hecho diría que no lo es), y para otras nociones de integrabilidad es más complicado definir bien las medidas de este proceso, y también punto a punto el ruido blanco no tiene varianza finita, por lo que fallaría una hipótesis del TCL. Voy a intentar ver si con más rigor puedo justificar mejor que efectivamente se puede aplicar.

=== Definición alernativa de un proceso estocástico gaussiano general y del ruido blanco

Es posible definir un proceso estocástico gaussiano indexado con cualquier cosa (nosotros usaremos funciones para indexar).

#definición("Proceso Gaussiano")[Decimos que una colección de variables aleatorias indexadas por elementos en el conjunto $I$, es decir $(X_i)_(i in I)$ es un _proceso estocástico Gaussiano_ si esque para cualquier subconjunto finito de índices $i_1, ..., i_n$ el vector $(X(i_1), ..., X(i_n))$ es un vector aleatorio Gaussiano.]

Usando esta definición puedo definir el ruido blanco de manera equivalente como:

#definición("Ruido blanco")[Un ruido blanco sobre tiempo positivo $[0, oo)$ es un proceso estocástico gaussiano $xi$ indexado por las funciones cuadrado integrables ($L^2 ([0,oo))$) con media nula y kernel de covarianza:
$
  "Cov"(xi(phi_1), xi(phi_2)) = Gamma integral_0^oo phi_1 (t) phi_2 (t) dif t
$
]

Esta definición pucha igual es difícil de trabajar. Sin embargo, uno la puede pensar como que podemos acceder a información sobre $xi$ sólo mediante su efecto sobre $phi$, es decir $xi (phi)$. Esta es una variable estocástica gaussiana (con varianza finita) por definición. Si consideramos la función cuadrado integrable indicatriz $bb(1)_([a, b]) (x) = 1 "si" x in [a, b], 0 "si no"$, obtenemos que $xi (bb(1)_([a, b]))$ es una variable estocástica gaussiana con varianza finita. Esto es lo que interpretaremos como la integral $integral_a^b tilde(xi)(t)  dif t$ (donde $tilde(xi)(t)$ no es la indexación de la definición, sino una interpretación de $xi$ como una función generalizada). Esto me permite concluir que efectivamente las integrales del ruido blanco son variables aleatorias gaussianas.

Veamos que esta definición coincide con aquella que trabajamos en el curso. Para esto notamos que la función de autocorrelación es también una función generalizada, luego en estricto rigor sólo la conocemos por su acción al ser integrada con una función más razonable. O sea  $angle.l tilde(xi)(t)tilde(xi)(s) angle.r = Gamma delta(t - s)$ es lo mismo que decir que para cualquier función razonable $phi_1$, $integral_0^oo  angle.l tilde(xi)(t)tilde(xi)(s) angle.r phi_1 (t) dif t = Gamma phi_1 (s)$, lo cual equivale a $angle.l integral_0^oo  angle.l tilde(xi)(t)tilde(xi)(s) phi_1 (t) dif t angle.r = Gamma phi_1 (s)$ y para dejar de usar la noción de $xi$ como función generalizada hay que integrar respecto a la otra variable ($s$) multiplicando por otra función $phi_2(s)$. O sea que la definición en verdad es decir que para cualquier par de funciones cuadrado integrables $phi_1, phi_2$, $ angle.l integral_0^oo integral_0^oo  tilde(xi)(t)tilde(xi)(s) phi_1(t) dif t  phi_2 (s) dif s angle.r = Gamma integral_0^oo phi_1 (s) phi_2 (s) dif s$. Es ahora que el LHS se puede escribir de manera más rigurosa, simplemente como $angle.l xi(phi_1) xi(phi_2) angle.r$ que no es más que el kernel de covarianza que definimos. Entonces, ¡en verdad es la misma definición! sólo que escrita de la manera más rara me permite disipar mis dudas sobre si hay una varianza finita o no al escribir las integrales. Y la respuesta es que sí. Además de paso veo que todas las integrales del ruido blanco son gaussianas (pues no son más que $xi$ indexado por indicatrices).

== Ítem b):

Las propiedades estadísticas de $I_2$ se siguen de que la esperanza puede entrar a la integral. Esto permite concluir que el promedio de $I_2$ es nulo. Además de la definición del ítem anterior ya tenemos el kernel de covarianza, notamos que $I_(2, n) = xi (bb(1)_([n h, (n + 1) h]))$, de lo que $angle.l I_(2, n) I_(2, m) angle.r = Gamma integral_0^oo bb(1)_([n h, (n + 1) h]) (t) bb(1)_([m h, (m + 1) h]) (t) dif t = Gamma h delta_(n m)$.

== Ítem c):

De lo anterior tenemos todo lo necesario para definir completamente la distribución que sigue $I_(2, n)$, es decir una gaussiana centrada en $0$ con varianza $Gamma h$. Esto nos permite muestrear realiaciones de $I_(2, n)$ a partir de realizaciones de una normal centrada en 0 con varianza 1 $J_n$, simplemente multiplicando $J_n$ por la desviación estándar buscada ($sqrt(Gamma h)$). La integral $I_(1, n)$ se puede aproximar de manera explícita mediante el método de Euler, obteniendo $I_(1, n) approx f(x_n) h$. Luego reemplazando ambas en la expresión de partida del enunciado obtenemos que podemos obtener una realización de $x_(n + 1)$ a partir de una realización de $x_n$ y una normal estándar $J_n$ usando:

$
  x_(n + 1) = x_n + f(x_n) h + sqrt(Gamma h) J_n
$

Siendo este un método numérico explícito de integración.