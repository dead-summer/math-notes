#import "../book.typ": *

#show: book-page.with(
  title: "2.2 Integration of Nonnegative Functions"
)

== Integration of Nonnegative Functions

Fix a measure space $(X , cal(F) , mu)$, set

$ cal(L)_(+)^0 (X , cal(F), mu) := { f : X arrow.r [0 , + oo] "measurable"} . $

Goal: define an integral

$ integral : cal(L)^0_+ arrow.r [0 , oo] . $

The integral of simple functions is defined below.

#definition[
For simple $f in cal(L)^0_+$, with canonical representation

$  f = sum_(j = 1)^n alpha_j bb(1)_E_j $
with $alpha_j$ distinct and $E_j$ disjoint. Define
$
integral_X f dif mu := sum_(j = 1)^n alpha_(j) mu (E_j) .
$

]

#proposition[
The integral $integral : {"simple functions in" cal(L)^0_+} arrow.r [0 , oo]$ is $RR_+$ linear and monotone: $phi lt.eq psi arrow.r.double integral phi lt.eq integral psi$.Moreover, $A arrow.r.bar integral_A phi dif mu equiv integral_X phi bb(1)_A dif mu$ defines a measure.
]

#proof[
Additivity: Let $phi = sum_(j = 1)^n a_j bb(1)_(epsilon_j) , psi = sum_(j = 1)^m b_j bb(1)_(F_j)$ s.t. ${E_j}_1^n , {F_k}_1^m$ are disjoint and

$ union.big_(j = 1)^n E_j = X = union.big_(k = 1)^m F_k . $

Then $phi + psi = sum_(i = 1)^n sum_(j = 1)^m (a_i + b_j) bb(1)_(E_i inter F_j)$. Moreover,

$ integral_X phi dif mu + integral_X psi dif mu & = sum_(i = 1)^n a_i mu (E_i) + sum_(j = 1)^m b_j mu (F_j)\
 & = sum_(i = 1)^n a_i sum_(j = 1)^m mu (E_i inter F_j) + sum_(j = 1)^m b_j sum_(i = 1)^n mu (E_i inter F_j)\
 & = sum_(i = 1)^n sum_(j = 1)^m (a_i + b_j) mu (E_i inter E_j) = integral_X (phi + psi) dif mu . $
]



Recall : $f in cal(L)^0_+$ can be approximately monotonically from below by simple functions.

We now can extend the integral to all functions $f in cal(L)^0_+$. Define
$ integral_X f dif mu &:= sup {integral_X phi dif mu : 0 lt.eq phi lt.eq f , phi "is simple"} \
&equiv sup {sum_(j = 1)^n alpha_j mu (E_j), "if" phi = sum_1^n alpha_j L_(E_j)} .
$

Note: If $lambda gt.eq 0 , integral_X (lambda f) dif mu = lambda integral_X f dif mu$. If $f lt.eq g$ in $cal(L)_(+)^0$, then $integral_X f dif mu lt.eq integral_X g dif mu$.

#theorem(title: [Monotone Convergence Theorem])[
Let ${f_n} subset cal(L)_(+)^0$ be s.t. $f_n lt.eq f_(n + 1)$, then

$ integral_X lim_(n arrow.r oo) f_n dif mu = lim_(n arrow.r oo) integral_X f_n dif mu . $
]<thm:MCT>

#proof[
$lim_(n arrow.r oo) f_n = : f$ exists since $f_n$ is an increasing and $[0 , oo]$-valued function, and so is ${integral f_n}$ (possibly equal to $oo$ ) .

#box(stroke: .5pt, inset: 3pt, baseline: 25%,)[$>=$] : $integral f dif mu gt.eq integral_X f_n dif mu , forall n in bb(N)$. Send $n -> infinity$, the inequation still preserves.

#box(stroke: .5pt, inset: 3pt, baseline: 25%,)[$<=$] : Pick any $0 < alpha < 1$ and any simple function $ phi in cal(L)^0_+$ with $0 lt.eq phi lt.eq f $. Consider ${f_n gt.eq alpha phi} = : E_n$, then
$ E , subset E_2 subset dots.h.c "with" union.big_(n = 1)^oo E_n = X . $
Observe that $integral_(E_n) phi dif mu arrow.r integral_X phi dif mu$, since $rho : A arrow.r.bar integral_A phi dif mu$ is a measure, $lim_(n arrow.r oo) rho (E_n) = rho (union.big_(n = 1)^infinity E_n) = rho (X)$. But
$
integral_(E_n) phi dif mu &= integral_X phi bb(1)_(E_n) dif mu \
& = integral_X phi bb(1)_({f_n gt.eq alpha phi}) dif mu\
 & lt.eq integral_X (alpha^(- 1) f_n) bb(1)_({f_n gt.eq alpha phi}) dif mu\
 & lt.eq 1 / alpha integral_X f_n dif mu
$
Sending  $alpha -> 1$, taking the supremum over all simple $phi lt.eq f$, and sending $n arrow.r oo$, we obtain that $integral_X f dif mu lt.eq lim_(n arrow.r oo) integral_X f_n dif mu$.
]



The monotonicity in the theorem is essential, otherwise take

$ f_n = cases(
- n^2 x + 1 / n \, & 0 < x < 1 /n \
0 \, & x gt.eq 1 / n .
)
$
then $f_(n) arrow.r f equiv 0$ on $X =\(0 , oo)$, but $integral_0^oo f_(n) dif x equiv 1 / 2 eq.not 0 = integral_0^oo f dif x$.

#corollary[
For ${h_n} subset cal(L)^0_+$, we have

$ integral_X (sum_(n = 1)^oo h_n) dif mu = sum_(n = 1)^oo integral_X h_n dif mu . $
]

#proof[
Take $f_n equiv sum_(i = 1)^n h_i$ in @thm:MCT.
]


A property holds "$mu$-a.e." iff the set ${"the property does not hold"}$ is $mu$-null.

#proposition[
For $f in cal(L)^0_+ , integral_X f dif mu = 0 arrow.l.r.double f = 0$, a.e. .
]

#proof[
#box(stroke: .5pt, inset: 3pt, baseline: 25%,)[$arrow.l.double$] : trivial.

#box(stroke: .5pt, inset: 3pt, baseline: 25%,)[$arrow.r.double$] : Note that ${ f eq.not 0 } = union.big_(n = 1)^oo {f > 1 / n}$, then
$ & 0 lt.eq integral_({f > 1 / n}) f dif mu lt.eq integral_X f dif mu = 0 \
=> & 1 / n mu {f > 1 / n} = 0 , forall n in bb(N) .
$
Thus $mu ({ f eq.not 0 }) lt.eq sum_(n = 1)^oo mu {f > 1 / n} = 0$.
]

Note: The Markov/Chebyshev inequation:

$ mu { lr(|f|) gt.eq k } & = integral_X bb(1)_({ lr(|f|) gt.eq k }) dif mu\
 & lt.eq integral_X lr(|f|) / k bb(1)_({ lr(|f|) gt.eq k }) dif mu\
 & lt.eq 1 / k integral_X lr(|f|) dif mu . $

#corollary[
If ${f_n} , f subset cal(L)^0_+ , f_n arrow.tr f, mu$-a.e., then

$ lim_(n arrow.r oo) integral_X f_n dif mu = integral_X f dif mu . $
]

#proof[
If $lim_(n arrow.r oo) f_n = f$ for $x in E$ where $mu (E^c) = 0$, then $f - f bb(1)_E = 0 "a.e." f_n - f bb(1)_E = 0 "a.e."$.
so
$
integral_X f - f bb(1)_E dif mu = 0 , quad integral_X f_n - f_n bb(1)_E dif mu = 0 .
$
By the @thm:MCT, we have
$
integral_X f dif mu = integral_X f bb(1)_E dif mu = lim_(n arrow.r oo) integral_X f_n bb(1)_E dif mu = lim_(n arrow.r oo) integral_X f_n dif mu . $
]

#lemma(title: [Fatou's Lemma])[
Let ${f_n} subset cal(L)^0_+$, then

$ integral_X liminf_(n arrow.r oo) f_n dif mu lt.eq liminf_(n arrow.r oo) integral_X f_n dif mu . $
]

#proof[
Set $g_k = inf_(n gt.eq k) f_n$, then $sup_(k in bb(N)) g_k = liminf_(n arrow.r oo) f_n = lim_(k arrow.r oo) g_k$.


Then
$
"LHS" &= integral_X lim_(k arrow.r oo) g_k dif mu \
& =^("MST") lim_(k arrow.r oo) integral_X g_k dif mu\
& lt.eq liminf_(n arrow.r oo) integral_X f_k dif mu = "RHS"
$
]

