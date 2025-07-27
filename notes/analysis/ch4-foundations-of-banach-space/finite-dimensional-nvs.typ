#import "../book.typ": *

#show: book-page.with(
  title: "4.3 Finite Dimensional Normed Vector Space"
)

== Finite Dimensional Normed Vector Space

#theorem[
Any finite-dimensional normed vector space over $bb(F) = bb(R)$ or $bb(C)$ is a Banach space. Indeed $X tilde.equiv bb(F)^d$ as an normed vector space isomorphism.
]

#proof[
Fix any basis $cal(B) = { e_1 , . . . , e_d }$ for $X$. Consider
$
Lambda : FF^d & -> X \
{lambda_i} & |-> sum_(i=1)^(d) lambda_i e_i .
$
Clearly, $Lambda$ is a vector space isomorphism. It is bounded since
$
norm(Lambda (lambda_1 , dots.h , lambda_d)) _X & lt.eq sum_(i = 1)^d abs(lambda_i)  norm(e_i) _X \
&lt.eq  (lambda_1 , dots.h , lambda_d) _oo (sum_(i = 1)^d  norm(e_i) _X) \
&=: d dot (lambda_1 , dots.h , lambda_d) _oo . $
To see that $Lambda^(- 1)$ is bounded, prove by contradiction. Suppose $exists { x_n } subset X$ s.t.
$
cases(
norm(Lambda^(- 1) x_n)  arrow.r oo \, & n arrow.r oo\
norm(x_n)  = 1 \, & forall n
)
$
Set $a_n = frac(Lambda^(- 1) x_n,  norm(Lambda^(- 1) x_n))$, they have norm $1$ in $bb(F)^d$. By Heine-Borel property in $bb(F)^d$, $exists$ subsequence, ${ a_(n_j) } arrow.r tilde(a)$ with $norm(tilde(a)) = 1$ in $bb(F)^d$ . But $Lambda$ is continuous ($Lambda$ is bounded),
$
Lambda tilde(a) = lim_(j arrow.r oo) Lambda a_(n_j) = lim_(j arrow.r oo) frac(x_(n_j),  norm(Lambda^(- 1) x_(n_j)) ) = 0
$
Here $Lambda$ is invertible (in $cal(L) (bb(F)^d , X)$) , hence $tilde(a) = 0$. This contradicts $norm(tilde(a)) = 1$ .

]

#definition[
Let $ norm(dot.op)^((1))$ , $norm(dot.op)^((2))$ be norms on vector space $X$. They are equivalent iff $exists 0 < c < oo$, s.t.
$
1 / c  norm(x)^((2)) lt.eq  norm(x)^((1)) lt.eq c norm(x)^((2)) , quad forall x in X .
$
So they have the same topologies.
]


*Notation*: $norm(dot.op) ^((1)) lt.tilde norm(dot.op) ^((2))$ if $ norm(x)^((1)) lt.eq c  norm(x) ^((2))$. Further, $A lt.tilde B$ and $B lt.tilde A arrow.l.r.double A approx B$ .

Now let's consider quotient spaces. Let $X$ be a normed vector space, $Y lt.eq X$ be a closed subspace. Given $x in X$. Write $[x] = x + Y in X$. Define
$
norm([x])_(X \/ Y)  := inf {norm(tilde(x))_X : [tilde(x)] = [x] }
$
for $[x] in X \/ Y$. Then
$
norm([x])  &= inf { norm(tilde(x)) : tilde(x) in [x]} \
&= inf { norm(x - y) : y in Y }\
&= dist(x , Y) .
$
So $norm([x])$ depend only on $[x]$.

Further, $norm(dot.op)_(X \/ Y)$ makes $X \/ Y$ an normed vector space:

- Nondegeneracy: note that if $norm([x])  = 0$, then $dist(x , Y) = 0 arrow.r.double x in overline(Y)$. But $Y$ is closed, so $x in Y <=> [x] = 0$.
- 1-homogeneity:
  $
  norm(lambda [x]) = norm([lambda x]) = inf{norm(lambda x - lambda y), y in Y} = abs(lambda) norm([x]) .
  $
- Triangel inequality:
  $
  norm([x_1] + [x_2]) &= norm([x_1 + x_2]) \
  &= dist(x_1 + x_2, Y) \
  &<= dist(x_1, Y) + dist(x_2, Y) \
  &= norm([x_1]) + norm([x_2]) .
  $
  

The following theorem shows that $X \/ Y$ is a Banach space under the quotient norm.

#theorem[
Let $X$ be a Banach space and $Y lt.eq X$ be a closed subspaces. Then $X \/ Y$ is a Banach space under the quotient norm.
]

#proof[
Let ${ [x_n] } subset X \/ Y$ be Cauchy. Then $norm([x_k] - [x_l]) arrow.r 0$ as $k , l arrow.r oo$. Take a subsequence ${ [x_(n_k)] }$ s.t.
$
& norm([x_(n_(k + 1))] - [x_(n_k)])  < 2^(- k) ,\
arrow.r.double & inf_(y in Y) norm(x_(n_(k + 1)) - x_(n_k) - y)  < 2^(- k) .
$

Thus, $exists w_(n_k) in [x_(n_k)]$ s.t. $norm(w_(n_(k + 1)) - w_(n_k)) < 2^(- k)$ for each $k$. Hence ${w_(n_k) }$ is Cauchy in $X$, say $w_(n_k) arrow.r x$ for some $x in X$. Then
$
norm([x_(n_k)] - [x]) lt.eq  norm(w_(n_k) - x)  arrow.r 0 .
$
This completes the proof since Cauchy sequence converges iff it has a convergent subsequence.
]


*Facts*: For normed vector spaces $X$ and $Y$, $(X plus.circle Y) \/ X tilde.equiv Y$, $(X plus.circle Y) \/ Y tilde.equiv X$, but $X tilde.equiv.not Y plus.circle (X \/ Y)$ in general.

#lemma(title: "Riesz Lemma")[
Let $X$ be a normed vector space, $Y lt.eq X$, $Y eq.not X$ be a closed subspace. Then $forall epsilon.alt in (0 , 1)$, $exists x in cal(S)_(1, X) := partial bold(B)_(1, X)$, s.t. $dist(x , Y) gt.eq 1 - epsilon.alt$.
]

#proof[
Take $xi in X \/ Y eq.not { 0 }$, s.t. $1 > norm(xi) > 1 - epsilon.alt$. Pick any representation $z$ of $xi$, s.t. $norm(z) lt.eq 1$. And set $x = frac(z, norm(z))$. Then
$
dist(x , Y) = frac(dist(z , Y), norm(z)) >= dist(z , Y) =  norm(xi)  > 1 - epsilon.alt .
$
]

#theorem(title: "F. Riesz")[
Let $X$ be a normed vector space over $bb(R)$. Then $X$ is finite-dimensional $arrow.l.r.double$ $overline(bold(B))_(1) = { x in X ,  norm(x)  lt.eq 1 }$ is compact (in the norm topology).
]

#proof[
$arrow.r.double$ : Since $X tilde.equiv bb(R)^d$ as a normed vector space, then $overline(bold(B))_(1)$ is compact by Heine - Borel.

$arrow.l.double$ : If $overline(bold(B))_1$ is compact, suppose $X$ is infinite dimensional $X$. By Riesz lemma we can take a sequence ${ x_n } subset cal(S)_(1, X)$, s.t. $forall n in bb(N)$. $ dist(x_n , span{ x_1 , dots.h , x_(n-1) }) gt.eq 1 / 2 . $ So ${ x_n }$ has no convergent subsequence. I.e., $cal(S)_(1, X)$ (hence $overline(bold(B))_(1)$) is incompact. This contradicts $overline(bold(B))_1$ is compact. 
]



*Fact*: Let $E$ be a metric space, $(C_b (E, RR), norm(dot.op)_infinity)$ is a Banach algebra. ($norm(f dot g) <= norm(f) dot norm(g)$ where $f dot g (x) = f(x) dot g(x)$ ). Let $cal(A) subset C_b (E, RR)$ be a subalgebra, then $overline(cal(A))$ is a subalgebra.

#theorem(title: "Stone-Weierstrass")[
Let $E$ be a compact metric space. Let $cal(A) subset C (E, RR)$ be a Banach subalgebra. If $cal(A)$ separates points ( $forall x eq.not y in E, exists f in cal(A)$, s.t. $f(x) eq.not f(y)$), and $cal(A)$ contains constant functions, then $overline(cal(A)) = C (E, RR)$.
]

#example[
Let $E subset RR^d$ be a compact subset, $cal(A) = {p|_E: p in RR[x_1, x_2, ..., x_d]}$ be a polynomial subspace of $C(E, RR)$ . Then $cal(A)$ is a Banach subalgebra and $overline(cal(A)) = C (E, RR)$.
]

The Stone-Weierstrass theorem is false for $CC$. For example, let
$
K = {z in CC: 1/2 <= abs(z) <= 3/2} .
$
and $f(z) = 1/z$ continuous. We know that

$
integral_(cal(S)_1) f(z) dif z = 2 pi sqrt(-1) ,
$
and
$
integral_(cal(S)_1) p(z) dif z = 0 ,
$
for any polynomial $p in CC[z]$ .

Given the above $f in C(K, CC)$, suppose there exists polynomials ${p_n}$, s.t. $p_n -> f$ uniformly. But observe that

$ 0 = integral_(S^1) p dif z arrow.r.not integral_(S^1) f dif z = 2 pi sqrt(-1) . $

So there are no such polynomials. The above holds for $CC [z , overline(z)]$. Similarly in theorem, if $cal(A)$ satisfies $forall f in cal(A)$, s.t. $overline(f) in cal(A)$, then theorem holds for $CC$.

In general, the theorem is correct assuming either

+ $cal(A)$ is closed under complex conjugation.
+ $K$ is simply-connected ($arrow.l.r.double bb(C) without K$ is connected).

#example[
For $E = cal(S)_1 subset bb(C)$, set a generic point $x = e^(upright(i) theta)$, $theta in \[ 0 , 2 pi \)$. Let
$
cal(A) &= { sum_(n = - N)^N c_n e^(upright(i) n theta) : c_n in bb(C), -N <= n <=N, N in bb(N) } \
&= span_(bb(C)) { e_n (theta) , n in bb(Z)} ,
$
where $e_n (theta) equiv e^(upright(i) n theta) $ be the algebra of trigonometric polynomial. Then $cal(A)$ is dense in $C (E , bb(C))$.
]

#corollary[
$2 pi$-periodic continuous functions $bb(R) arrow.r bb(R)$ can be uniformly approximated by
$
sum_(k = 1)^oo a_k sin (k x) + sum_(l = 0)^oo b_l cos (l x) , quad a_k , b_l in bb(R), k>=1, l >= 0 .
$
]
