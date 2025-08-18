#import "../book.typ": *

#show: book-page.with(
  title: "2.2 Integration of Nonnegative Functions"
)

== Integration of Nonnegative Functions

Let $(X , cal(F) , mu)$ be a measure space. We denote the set of all non-negative measurable functions $f : X arrow.r [0 , + oo]$ by $L^+$. Our objective is to define the integral for any function $f in L^+$, which will be a map from $L^+$ to the extended non-negative real line $[0 , + oo]$.

This construction, known as the #strong[Lebesgue integral];, is foundational to modern analysis. We will build it in two steps: first for simple functions, and then for all functions in $L^+$ by an approximation argument.

=== The Integral of Simple Functions

First, we define the integral for the simplest class of non-negative measurable functions.

#definition[
The integral of a simple function $phi.alt = sum_(j = 1)^n alpha_j indicator_(E_j) (x)$ is defined as:
$ integral_X phi.alt dif mu := sum_(j = 1)^n alpha_j mu (E_j). $
]

By convention, we set $0 dot.op oo = 0$. This definition is analogous to the area of a collection of rectangles, where $alpha_j$ is the height and $mu (E_j)$ is the measure of the base.

#proposition[
The integral for simple functions in $L^+$ has the following properties:
1. #strong[Linearity:] For any simple functions $phi.alt , psi in L^+$ and any constant $c gt.eq 0$:
  $ integral_X (phi.alt + psi) dif mu = integral_X phi.alt dif mu + integral_X psi dif mu, $
  $ integral_X (c phi.alt) dif mu = c integral_X phi.alt dif mu. $
2. #strong[Monotonicity:] If $phi.alt , psi in L^+$ are simple functions such that $phi.alt (x) lt.eq psi (x)$ for all $x in X$, then: $ integral_X phi.alt dif mu lt.eq integral_X psi dif mu. $
3. #strong[Measure Property:] For a simple function $phi.alt in L^+$, the set function $nu (A) = integral_A phi.alt dif mu := integral_X phi.alt indicator_A dif mu$ for $A in cal(F)$ defines a measure on $(X , cal(F))$.
]

#proof[
To prove additivity, let $phi.alt = sum_(i = 1)^n a_i indicator_(E_i)$ and $psi = sum_(j = 1)^m b_j indicator_(F_j)$. We consider a common refinement of the partitions, ${ E_i inter F_j }$, on which $phi.alt + psi$ has the constant value $a_i + b_j$.
$ phi.alt + psi = sum_(i = 1)^n sum_(j = 1)^m (a_i + b_j) indicator_(E_i inter F_j). $
Using the finite additivity of $mu$ (e.g., $mu (E_i) = sum_j mu (E_i inter F_j)$), the result follows by direct calculation: Homogeneity and monotonicity are proven similarly.
]


=== The Integral of General Nonnegative Functions

A key theorem in measure theory states that any non-negative measurable function $f in L^+$ can be expressed as the pointwise limit of a monotonically increasing sequence of simple functions. This allows us to extend the definition of the integral to all functions in $L^+$.

#definition[
For any function $f in L^+$, its #strong[Lebesgue integral] with respect to the measure $mu$ is defined as:
$ integral_X f dif mu := sup {integral_X phi.alt dif mu : 0 lt.eq phi.alt lt.eq f , phi.alt "is a simple function"}. $
]

This definition is consistent with the previous one for simple functions and inherits its properties of linearity and monotonicity.

#theorem(title: "Monotone Convergence Theorem")[
Let ${ f_n }_(n = 1)^oo$ be a sequence of functions in $L^+$ such that $0 lt.eq f_1 (x) lt.eq f_2 (x) lt.eq dots.h$ for all $x in X$. Let $f (x) = lim_(n arrow.r oo) f_n (x)$. Then $f$ is measurable and:
$ integral_X f dif mu = lim_(n arrow.r oo) integral_X f_n dif mu. $
In other words, the integral and the limit can be interchanged for a monotone sequence of non-negative functions.
]

#proof[
- *$gt.eq$:* Since $f_n lt.eq f$ for every $n$, the monotonicity of the integral implies $integral_X f_n dif mu lt.eq integral_X f dif mu$. Taking the limit as $n arrow.r oo$, we get $lim_(n arrow.r oo) integral_X f_n dif mu lt.eq integral_X f dif mu$.

- *$lt.eq$:* Let $phi.alt$ be any simple function such that $0 lt.eq phi.alt lt.eq f$, and let $alpha in (0 , 1)$. Define the sets $E_n = { x in X : f_n (x) gt.eq alpha phi.alt (x) }$. Since ${ f_n }$ is increasing, ${ E_n }$ is an increasing sequence of sets, and $union.big E_n = X$.

  By monotonicity,
  $ integral_X f_n dif mu gt.eq integral_(E_n) f_n dif mu gt.eq alpha integral_(E_n) phi.alt dif mu. $
  As $n arrow.r oo$, $integral_(E_n) phi.alt dif mu arrow.r integral_(union E_n) phi.alt dif mu = integral_X phi.alt dif mu$ by continuity of the measure $nu (A) = integral_A phi.alt dif mu$. Thus,
  $ lim_(n arrow.r oo) integral_X f_n dif mu gt.eq alpha integral_X phi.alt dif mu. $
  This holds for any $alpha in (0 , 1)$, so we can let $alpha arrow.r 1^(-)$, giving
  $ lim_(n arrow.r oo) integral_X f_n dif mu gt.eq integral_X phi.alt dif mu. $
  Since this is true for any simple function $phi.alt lt.eq f$, taking the supremum over all such $phi.alt$ yields $lim_(n arrow.r oo) integral_X f_n dif mu gt.eq integral_X f dif mu$. Combining both inequalities proves the theorem.
]

#corollary[
For a sequence ${ h_n }_(n = 1)^oo$ of functions in $L^+$, we have:
$ integral_X (sum_(n = 1)^oo h_n) dif mu = sum_(n = 1)^oo integral_X h_n dif mu. $
]

#proof[
Apply the Monotone Convergence Theorem to the sequence of partial sums $f_k = sum_(n = 1)^k h_n$. This is a non-decreasing sequence of non-negative measurable functions.
]

#theorem(title: "Fatou's Lemma")[
For any sequence of functions ${ f_n }_(n = 1)^oo$ in $L^+$, we have:
$ integral_X (liminf_(n arrow.r oo) f_n) dif mu lt.eq liminf_(n arrow.r oo) integral_X f_n dif mu. $
]

#proof[
For each $k in bb(N)$, define the function $g_k (x) = inf_(n gt.eq k) f_n (x)$. The sequence ${ g_k }_(k = 1)^oo$ is a non-decreasing sequence of non-negative measurable functions. By definition,
$ lim_(k arrow.r oo) g_k (x) = sup_k (inf_(n gt.eq k) f_n (x)) = liminf_(n arrow.r oo) f_n (x). $
Applying the Monotone Convergence Theorem to ${ g_k }$ gives:
$ integral_X (lim_(k arrow.r oo) g_k) dif mu = lim_(k arrow.r oo) integral_X g_k dif mu. $
By construction, $g_k lt.eq f_m$ for any $m gt.eq k$, so $integral_X g_k dif mu lt.eq integral_X f_m dif mu$. This implies $integral_X g_k dif mu lt.eq inf_(m gt.eq k) integral_X f_m dif mu$. Taking the limit as $k arrow.r oo$:
$ lim_(k arrow.r oo) integral_X g_k dif mu lt.eq lim_(k arrow.r oo) (inf_(m gt.eq k) integral_X f_m dif mu) = liminf_(k arrow.r oo) integral_X f_k dif mu. $
Combining these steps yields the lemma.
]

=== Properties Related to "Almost Everywhere"

A key concept in measure theory is that sets of measure zero are "negligible."

#definition[
A property is said to hold #strong[almost everywhere] (a.e.) with respect to a measure $mu$ if the set of points where the property fails has measure zero.
]

#proposition[
For a function $f in L^+$, we have: $ integral_X f dif mu = 0 quad arrow.l.r.double quad f (x) = 0 "for" mu "-a.e." x in X. $
]

#proof[
- *$arrow.r.double$:* Suppose $integral_X f dif mu = 0$. The set ${ x : f (x) > 0 } = union.big_(n = 1)^oo { x : f (x) > 1 \/ n }$. For any $n$, let $E_n = { x : f (x) > 1 \/ n }$. Then $0 = integral_X f dif mu gt.eq integral_(E_n) f dif mu gt.eq integral_(E_n) 1 / n dif mu = 1 / n mu (E_n)$. This implies $mu (E_n) = 0$ for all $n$. By subadditivity, $mu ({ x : f (x) > 0 }) lt.eq sum_(n = 1)^oo mu (E_n) = 0$.

- *$arrow.l.double$:* Suppose $f = 0$ a.e. Let $phi.alt$ be any simple function such that $0 lt.eq phi.alt lt.eq f$. Then $phi.alt$ must also be 0 a.e. If $phi.alt = sum alpha_j upright(bold(1))_(E_j)$, then for any $alpha_j > 0$, we must have $mu (E_j) = 0$. Thus, $integral_X phi.alt dif mu = sum alpha_j mu (E_j) = 0$. Since this holds for all simple functions $phi.alt lt.eq f$, the supremum in the definition of the integral is $0$. Therefore, $integral_X f dif mu = 0$.
]

#proposition(title: "Markov's Inequality")[
For any $f in L^+$ and any constant $k > 0$: $ mu ({ x in X : f (x) gt.eq k }) lt.eq 1 / k integral_X f dif mu. $
]

#proof[
We observe that $k dot indicator_({ f gt.eq k }) lt.eq f$. By monotonicity of the integral,
$ integral_X k dot.op indicator_({ f gt.eq k }) dif mu lt.eq integral_X f dif mu. $
The left side is $k dot.op mu ({ f gt.eq k })$. Dividing by $k$ yields the result.
]

#proposition[
If ${ f_n } subset L^+$ is a non-decreasing sequence of functions and $f_n (x) arrow.r f (x)$ for $mu$-a.e. $x in X$, then $lim_(n arrow.r oo) integral_X f_n dif mu = integral_X f dif mu$.
]

#proof[
If $lim_(n arrow.r oo) f_n = f$ for $x in E$ where $mu (E^c) = 0$, then $f - f bb(1)_E = 0$ a.e. and $ f_n - f bb(1)_E = 0$ a.e.
so
$
integral_X f - f bb(1)_E dif mu = 0 , quad integral_X f_n - f_n bb(1)_E dif mu = 0.
$
By the Monotone Convergence Theorem, we have
$ integral_X f dif mu = integral_X f bb(1)_E dif mu = lim_(n arrow.r oo) integral_X f_n bb(1)_E dif mu = lim_(n arrow.r oo) integral_X f_n dif mu. $
]

