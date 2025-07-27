#import "../book.typ": *

#show: book-page.with(
  title: "2.3 Integration of Complex Functions"
)

== Integration of Complex Functions

Extend the definition of $integral$ :

$  integral : cal(L)^0 (X, cal(F) , mu) = { f : (X, cal(F) , mu) arrow.r overline(bb(R)) } arrow.r overline(bb(R)) $

where $integral_X f dif mu := (integral_X f^(+) dif mu) - (integral_X f^(-) dif mu)$ with $f = f^(+) - f^(-)$.

#definition[
Say $f in cal(L)^0 (X, cal(F) , mu)$ is integrable, i.e., $f in L^1 (X, cal(F) , mu)$, if 

$ integral_X abs(f) dif mu < oo , $
in other words, $integral_X f^(+) dif mu < oo upright(" and ") integral_X f^(-) dif mu < oo$.
]

#proposition[
$L^1 (X, cal(F) , mu)$ is a vector -space. $integral : L^1 (X, cal(F) , mu) arrow.r bb(R)$ is a linear operator
]

#proof[
For any $alpha , beta in bb(R) , f , g , in L^1$,
$ integral_X abs(alpha f + beta g) dif mu &lt.eq integral_X abs(alpha) abs(f) + abs(beta) abs(g) dif mu \
&= abs(alpha) integral_X abs(f) dif mu + abs(beta) integral_X abs(g) dif mu < infinity . $
Thus $L^1 (X, cal(F) , mu)$ is a vector -space.

For the operator $integral$, $alpha integral_X f dif mu = integral_X (alpha f) dif mu$ is clear. Now we check the Additivity.

For $f , g in L^1 , h = f + g$, say

$ f = f^(+) - f^(-) , g = g^(+) - g^(-) , h = h^(+) - h^(-) = (f^(+) + g^(+)) - (f^(-) + g^(-)) . $

Then

$
& h^(+) + f^(-) + g^(-) = h^(-) + f^(+) + g^(+) \
arrow.r.double & integral h^(+) + integral f^(-) + integral g^(-) = integral h^(-) + integral f^(+) + integral g^(+)\
arrow.r.double & integral h^(+) - integral h^(-) = integral f^(+) - integral f^(-) + integral g^(+) - integral g^(-) . $
]


Finally, we extend the integral operator to $bb(C)$-valued functions. Say $f : (X , cal(F) , mu) arrow.r bb(C)$ is measurable, if $Re (f) , Im (f) : (X , cal(F) , mu) arrow.r bb(R)$ are both measurable. Define

$ integral_X f dif mu = {integral_X Re (f) dif mu} + sqrt(- 1) {integral Im (f) dif mu} $

We say that $f$ is integral if $integral abs(f) < oo$. Since $abs(f) < abs(Re(f)) + abs(Im(f))$, $f$ is integral iff $Re(f)$ and $Im(f)$ are both integral.

#proposition[
If $f , g in L^1$, then the following are equivalent:
1. $integral_E f = integral_E g , forall E in cal(F)$.
2. $g = f$, a.e.
3. $integral_E abs(f - g) dif mu = 0$.
]

This proposition shows that for the purposes of integration it makes no difference if we alter functions on null sets. Indeed, one can integrate functions $f$ that are only defined on a measurable set $E$ whose complement is null simply by defining $f$ to be zero (or anything else) on $E^c$. In this fashion we can treat $overline(bb(R))$ -valued functions that are finite a.e. as real-valued functions for the purposes of integration.

With this in mind, we shall find it more convenient to redefine $L^1 (mu)$ to be the set of equivalence classes of a.e.-defined integrable functions on $X$, where $f$ and $g$ are considered equivalent iff $f = g$ a.e. This new $L^1 (mu)$ is still a complex vector space (under pointwise a.e. addition and scalar multiplication). Although we shall henceforth view $L^1 (mu)$ as a space of equivalence classes, we shall still employ the notation "$f in L^1 (mu)$" to mean that $f$ is an a.e.-defined integrable function. This minor abuse of notation is commonly accepted andif rarely causes any confusion.


*Notation* : $tilde(L^1) equiv L^1$ where $tilde$ represents an equivalence relation, that is a.e. equal. $integral_X [f] dif mu = integral_X f dif mu$ where $[f]$ is the equivalence class of $f$.

*Fact* : $L^1 (X , cal(F) , mu)$ is a normed vector space with

$ norm(f)_(L^1) := integral_X abs(f) dif mu . $
Similarly, $L^p (x , cal(F), mu) := {f in cal(L)^0 (X, cal(F) , mu) : norm(f)_(L^p) < oo}$ is a normed vector space with $norm(f)_(L^p) := (integral_X abs(f)^p dif mu)^(1 / p) , quad 1 lt.eq p < oo$. $L^oo (X, cal(F), mu) := {f in cal(L)^0 (X, cal(F) , mu) : norm(f)_(L^oo) < oo}$ is a normed vector space with 

$
norm(f)_(L^oo) : & = "ess sup"_(x in X) abs(f (x))\
&= inf { M > 0 : abs(f (x)) lt.eq M , "for" mu "-a.e." x in X }
$

$norm(f)_(L^oo)$ is called the essential supremum of $abs(f)$. 

#theorem(title: [Lebesgue Dominated Convergence Theorem])[

Assume ${f_n} subset L^1 (X, cal(F) , mu)$ and $f_n arrow.r f mu$-a.e. Suppose $exists g in L^1$ s.t. $abs(f_n) lt.eq g mu$-a.e. Then $lim_(n arrow.r oo) integral_X f_n dif mu = integral_X f dif mu$.
]

#proof[
Clearly $f$ is measurable and $abs(f) lt.eq g , mu$-a.e. Since $g in L^1$, we have $f in L^1$. Also, $g plus.minus f_n gt.eq 0$-a.e. So by Fatou Lemma,
$
liminf_(n arrow.r oo) integral_X g + f_n dif mu gt.eq integral_X g + f dif mu ,
$

$
liminf_(n arrow.r oo) integral_X g - f_n dif mu gt.eq integral_X g - f dif mu ,
$
then
$
integral g + liminf_(n arrow.r oo) integral f_n gt.eq integral (g + f) = integral g + integral f ,
$

$
f g - limsup_(n arrow.r oo) integral f_n gt.eq integral (g - f) = integral g - integral f .
$

Since $integral_X g dif mu < oo$, we have

$ limsup_(n arrow.r oo) integral_X f_n dif mu lt.eq integral_X f dif mu lt.eq liminf_(n arrow.r oo) integral_X f_n dif mu . $

and the result follows.
]

#theorem[
Suppose $f_n , g_n , f , g in L^1 (n)$. Assume $f_n arrow.r f$ a.e. $g_n arrow.r g$ a.e. $abs(f_n) lt.eq g_n$ and $integral g_n arrow.r integral g$. Then $integral f_n arrow.r integral f$.
]<thm:3.2>

#proof[
Applying Fatou Lemma to $g_n plus.minus f_n$, we get

$ 
integral f + integral g = integral liminf_(n arrow.r oo) (g_n + f_n) lt.eq liminf_(n arrow.r oo) integral g_n + f_n = integral g + liminf_(n arrow.r oo) integral f_n
$<eq:1>
$
integral g - integral f = integral liminf_(n arrow.r oo) f (g_n - f_n) lt.eq liminf_(n arrow.r oo) integral (g_n - f_n) = integral g - limsup_(n arrow.r oo) integral f_n
$<eq:2>
Since $g in L^1 (mu)$, by adding up (@eq:1) and (@eq:2), we obtained.

$ 0 lt.eq liminf_(n arrow.r oo) integral.double f_n - limsup_(n arrow.r oo) integral f_n $

Hence, $lim_(n -> infinity) integral f_n$ exists, and

$  & (1) arrow.r.double integral f lt.eq lim_(n -> infinity) integral f_n\
 & (2) arrow.r.double - integral f lt.eq - lim_(n -> infinity) integral f_n $

Thus $quad integral f = lim_(n -> infinity) integral f_n$.
]

Recall Fatou's Lemma,

$ 0 lt.eq f_n in L^1 (mu) & arrow.r.double integral liminf_(n arrow.r oo) f_n lt.eq liminf_(n arrow.r oo) integral f_n\
&arrow.long.r.double^(f_n arrow f "a.e.") integral f lt.eq liminf_(n arrow.r oo) integral f_n
 $

Strict inequalities holds for

$ f_n = 
cases(
- n^2 x + n \, & 0 lt.eq x lt.eq 1 / n\
0 \, & x > 1 / n
)
$

Well give the missing term in the inequality.

#theorem[
Suppose that $f_n , f in L^1 (n)$ and $f_n arrow.r f$ a.e. Then

$ integral abs(f_n - f) dif mu arrow.r 0 arrow.l.r.double integral abs(f_n) arrow.r integral abs(f) . $
]

#proof[
$==>$ :
$ abs(integral abs(f_n) - integral abs(f) ) &= abs(integral abs(f_n) -  abs(f)) \
& lt.eq integral abs(f_n) - abs(f) lt.eq integral divides f_n - f . $

$<==$ : Set $g_n (x) = abs(f_n) + abs(f) >= abs(f_n - f)$. Then $g_n arrow.long.r^("a.e.") 2 (f) = : g in L^1$. By assumption $integral g_n arrow.r integral g$, apply @thm:3.2 to $abs(f_n - f)$, we can obtain

$ lim_(n arrow.r oo) integral abs(f_n - f) = integral lim_(n arrow.r oo) abs(f_n - f) = 0 . $
]

More generally, we have the following result.

#theorem[
If $f_n -> f$ a.e. and if $integral abs(f_n)^p dif mu lt.eq C_0 < oo$, for some $0< p < oo$, then

$ lim_(n arrow.r oo) integral_X abs(f_n)^p - abs(f)^p - abs(f_n - f)^p  dif mu = 0 . $<eq:3>
]

#proof[
_Claim_ : $forall epsilon > 0 , exists C_epsilon > 0$, s.t. $forall a , b in bb(C)$, we have

$ abs(abs(a + b)^p - abs(b)^p) lt.eq epsilon abs(b)^p + C_epsilon abs(a)^p . $
To see the claim: Case 1: $0 < p lt.eq 1$ :

$ abs(a + b)^p - \|b^p lt.eq abs(a)^p . $

Case 2: $p > 1$, by the convexity of $t arrow.r t^p$ for $t > 0$, we have

$ abs(a + b)^p & lt.eq (abs(a) + abs(b))^p\
 & = (1 - lambda) (frac(abs(a), 1 - lambda))^p + lambda (abs(b) / lambda)^p\
 & = (1 - lambda)^(1 - p) abs(a)^p + lambda^(1 - p) abs(b)^p $
for $lambda$ in $(0 , 1)$ (to be determined). So $abs(a + b)^p - abs(b)^p lt.eq (1 - lambda)^(1 - p) abs(a)^p + (lambda^(1 - p) - 1) abs(b)^p$. Choose $epsilon = lambda^(1 - p) - 1$ ($lambda = (1 + epsilon)^(- frac(1, p - 1))$ ) and $C_epsilon = (1 - lambda)^(1 - p)$, we can conclude the claim.

Set $g_n = f_n - f$, then $g_n arrow.r 0$ a.e. Then
$
L_n &:= abs(abs(f_n)^p - abs(f)^p - abs(f_n - f)^p) = abs(abs(f + g_n)^p - abs(f)^p - abs(g_n)^p) \
&<= abs(abs(f + g_n)^p - abs(g_n)^p) + abs(f)^p \
&<= epsilon abs(g_1)^p + (1 + C_epsilon) abs(f)^p , quad forall epsilon > 0 .
$
Set $(L_n - epsilon abs(g_n)^p)^(+) = : phi_(n , epsilon)$, then

$
cases(
0 lt.eq phi_(n , epsilon) lt.eq (1 + C_epsilon) abs(f)^p in L^1 \

phi_(n , epsilon) arrow.r 0 "as" n arrow.r oo
)
$

By Dominated Convergence Theorem, $integral phi_(n , epsilon) arrow.r 0$ as $n arrow.r oo , forall epsilon > 0$.

To improve this to $integral f_n arrow.r 0$, we check that $integral abs(g_n)^p lt.eq C$ for some uniform $C$. Assume this, then
$
& integral L_n lt.eq integral phi_(n , epsilon) + epsilon integral abs(g_n)^p lt.eq integral phi_(n , epsilon) + C dot.op epsilon \
&  arrow.r.double limsup_(n arrow.r oo) integral l_n lt.eq 2 C dot.op epsilon
$

But $epsilon > 0$ is arbitrary, so $integral L_(n arrow.r 0)$.

Finally, we check that $integral abs(g_n)^p lt.eq C$. Indeed,

$ abs(g_n)^p = abs(f_n - f)^p lt.eq 2^p (abs(f_n)^p + abs(f)^p) . $

Hence $integral abs(g_n)^p lt.eq 2^p (integral abs(f_1)^p + integral abs(f)^p) lt.eq 2^(p + 1) C_0$.
]

#remark[
1. By Fatou's Lemma, $integral abs(f)^p lt.eq liminf_(n -> infinity) integral abs(f_n)^p lt.eq C_0$.
2. Since
$
(3) arrow.l.r.double integral abs(f_n)^p = integral abs(f^p + integral) f_n - f\|^p + epsilon_n
$
where $epsilon_n arrow.r 0$ as $n arrow.r oo$, so $integral abs(f_n - f)^p$ is the missing term in Futou's Lemma.

]

#example[
Find $I = lim_(k arrow.r oo) integral_0^k x^n (1 - x / k)^k dif x$.
]

#solution[
Note that $I = lim_(k arrow.r oo) integral_0^oo f_k^n (x) dif x$ where

$ f_k^n (x) := x^n (1 - x / k)^k bb(1)_([0 , k]) (x) . $

Here $(1 - x / k)^k 1_([0 , k]) (x) arrow.tr e^(- x)$ pointwise. Hence, by Monotone Convergence Theorem,

$ I = integral_0^oo lim_(k arrow.r oo) f_k^n = integral_0^oo x^n e^(- x) dif x = Gamma (n + 1) = n ! $
]

#theorem[
Consider $f : (X , cal(F) , mu) times [a , b] arrow.r bb(C)$, where $- oo < a < b < + oo$, s.t. $f (dot.op , t) in L^1 (mu) , forall t in [a , b]$. Set $F (t) = integral_X f (x , t) dif mu (x)$. Assume that $frac(partial f, partial t)$ exists and $exists g in L^1 (mu)$, s.t. $abs(frac(partial f, partial t) (x , t)) lt.eq g (x) , forall (x, t) in X times [a, b]$. Then $F$ is differentiable, and $F^(') (t) = integral_X frac(partial f, partial t) (x , t) dif mu (x)$.
]

The proof is left as an exercise.

#example[
Show that $integral_(bb(R)) x^(2 n) e^(- x^2) dif x = sqrt(pi) frac((2 n) !, n ! 4^n)$.
]

#solution[
Since
$ integral_(- oo)^(+ oo) e^(- x^2) dif x & = (integral_(- oo)^(+ oo) integral_(- oo)^(+ oo) e^(- x^2 - y^2) dif x dif y)^(1 / 2)\
 & = (integral_0^(2 pi) integral_0^oo e^(- r^2) r dif r dif theta)^(1 / 2)\
 & = sqrt(pi) . 
$
so $integral_(- oo)^(+ oo) e^(- t x^2) = sqrt(pi \/ t) , t > 0 .$

Heuristically,
$
frac(dif, dif t) integral_(- oo)^(+ oo) e^(- t x^2) dif x = integral_(- oo)^(+ oo) - x^2 e^(- t x^2) dif x = sqrt(pi) frac(dif, dif t) (t^(- 1 / 2)) = - 1 / 2 sqrt(pi) t^(- 3 / 2) .
$
Take $frac(dif, dif t)$ again,
$
& integral_(- oo)^(+ oo) x^4 e^(- t x^2) dif x = 1 / 2 dot.op 3 / 2 sqrt(pi) t^(- 5 / 2) \
& ... \
=> &integral_(- oo)^(+ oo) x^(2 n) e^(- t x^2) dif x = 1 / 2 dot.op 3 / 2 dots.h.c frac(2 n - 1, 2) sqrt(pi) t^(- frac(2n + 1, 2))
$
Let $t = 1$, the result follows.
]

#example[
Find I $= integral_(- oo)^(+ oo) e^(- x^2) cos (a x) dif x , a > 0$.
]

#solution[
By Taylor expansion,

$  & I = integral_(- oo)^(+ oo) e^(- x^2) sum_(n = 0)^oo frac((- 1)^n (a x)^n, (2 n) !) dif x
$
Let
$
f_n := frac((- 1)^n (a x)^n, (2 n) !) e^(- x^2)
$

Observe that If $f_n in L^1 (n) , forall n in bb(N)$, and $sum_n^oo integral abs(f_n) < oo$, then $sum_n^oo integral f_n = integral sum_n^oo f_n$. Here
$
integral_(- oo)^(+ oo) abs(f_n) &= integral_(- oo)^(+ oo) frac((a x)^n, (2 n) !) e^(- x^2) dif x \
& = frac(a^(2 n), (2 n) !) integral_(- oo)^(+ oo) x^(2 n) e^(- x^2) dif x\
 & = frac(sqrt(pi) a^(2 n), n ! 4^n)\
arrow.r.double sum_(n = 0)^(+ oo) integral_(- oo)^(+ oo) abs(f_n) & = sum_(n = 0)^(+ oo) frac((a^2 / 4)^n, n !) sqrt(pi) = e^(a^2 / 4) sqrt(pi) < oo .
$

Thus, by the previous observation,

$ I & = integral_(- oo)^(+ oo) sum_(n = 0)^oo f_n = sum_(n = 0)^oo integral_(- oo)^(+ oo) f_n = sum_(n = 0)^oo integral_(- oo)^(+ oo) frac((-1)^n (a x)^(2 n), (2 n) !) e^(- x^2) dif x\
 & = sum_(n = 0)^(+ oo) frac((pi)^n a^(2 n), (2 n) !) integral_(- oo)^(+ oo) x^(2 n) e^(- x^2) dif x\
 & = sum_(n = 0)^(+ oo) (- 1)^n frac(sqrt(pi) a^(2 n), n ! 4^n) = e^(- a^2 / 4) sqrt(pi) $
]

One can try to consider $frac(partial, partial a) {integral_(- oo)^(+ oo) e^(- x^2) cos (a x) dif x}$.

#corollary[
Let ${f_j} subset L^1 (mu)$ be s.t. $sum_(j=1)^oo integral abs(f_j) < oo$, then $sum_(j=1)^oo f_j$ converges a.e. to a function in $L^1$ and

$ integral sum_(j=1)^oo f_j = sum_(j=1)^oo integral f_j $
]

#proof[
First observe that by Monotone Convergence Theorem,

$ integral sum_(j=1)^oo abs(f_j) = sum_(j=1)^oo integral abs(f_j) < oo $

Let $S_N := sum_(j = 1)^N f_j$, then $abs(S_N) lt.eq sum_(j = 1)^oo abs(f_j) in L^1$. By Dominated Convergence Theorem, $lim_(N arrow.r oo) S_N = sum_(j = 1)^oo f_j$ is a well-defined $L^1$-function, with

$ integral (sum_(j = 1)^oo f_j) & = lim_(N arrow.r oo) integral S_N = lim_(N arrow.r oo) integral sum_(j = 1)^N f_j\
 & = lim_(N arrow.r oo) sum_(j = 1)^N integral f_j\
 & = sum_(j = 1)^oo integral f_j . $
]
