#import "../book.typ": *

#show: book-page.with(
  title: "4.6 Separation"
)

== Separation


#definition[
Let $X$ be a nor vector space, $A subset X$. The Minkowski functional of $A$:
$
mu_A : X &arrow.r [0 , oo] \
x &arrow.r.bar inf { t > 0 : x in t A }.
$
]

#definition[
A set $A subset X$ is absorbing iff $forall x in X , exists t in (0 , oo)$, s.t. $x in t A$.
]

#definition[
A set $B subset X$ is balanced, if $lambda B subset B   forall lambda in bb(F)$ with $abs(lambda) lt.eq 1$.
]

#remark[
If $A subset X$ absorbing, then $mu_A in \[ 0 , oo \)$.
]

Any (open) neighborhood of $O$ in a topological vector space is absorbing.

// We've introduced: seminorm, sublinear, functional, Minkowski functional.

#theorem[
Let $p$ be a seminorm on a vector space $X$. Then $p (0) = 0$, $ abs(p (x) - p (y)) lt.eq p (x - y) , p gt.eq 0$, and ${ p = 0 } $ is a subspace of $X$. Moreover $bold(B) = { p < 1 }$ is a convex, absorbing, balanced neighborhood of $0$, and $mu_bold(B) = p$.
]

#proof[
We see $p (0) = p (0 dot.op x) = 0 dot.op p (x) = 0$. $p (x) = p (x - y + y) lt.eq p (x - y) + p (y)$.

So $p (x) - p (y) lt.eq p (x - y)$. Then interchange $x$ and $y$ to get

$ abs(p (x) - p (y)) lt.eq p (x - y). $

Take $y = 0$, we obtain $abs(p (x)) lt.eq p (x)$.

For any $x , y in { p = 0 }$, $lambda , eta in bb(F)$,
$ 0 lt.eq p (lambda x + eta y) lt.eq p (lambda x) + p (eta y) lt.eq abs(lambda) p (x) + abs(eta) p (y) = 0 $

Then ${ p = 0 }$ is a subspace.

$bold(B)$ is balanced by 1-homogeneity of $p$. $bold(B)$ is convex since $forall x , y in bold(B) = { p < 1 }$, $theta in (0 , 1)$, we have $theta x + (1 - theta) y in bold(B)$ since
$ p (theta x + (1 - theta) y) lt.eq theta p (x) + (1 - theta) p (y) < 1. $

Absorbing: $forall x in X$, $p (x) < s$ for some $s in (0 , oo)$. Then $p (x / s) = 1 / s p (x) < 1$, so $x / s in bold(B)$.

Finally, we check that $p = mu_bold(B)$. The above shows $mu_B lt.eq p$. Conversely, show: $a > mu_B (x) arrow.r.double a > p (x)$. Indeed, for any $0 < a lt.eq p (x)$, then $p (x / a) gt.eq 1 arrow.r.double x in.not a bold(B) arrow.r.double a lt.eq mu_bold(B) (x)$.
The last arrow holds since one can note if $bold(B)$ is balanced, then $x in a_1 bold(B) arrow.r.double x in a_2 bold(B)$, $forall a_1 < a_2$.
]

#theorem[
Let $X$ be a vector space and $A subset X$ be absorbing and convex. Then $mu_A$ is a sublinear functional: $mu_A (x + y) lt.eq mu_A (x) + mu_A (y)$ $mu_A (lambda x) = lambda mu_A (x)$, $forall lambda gt.eq 0$.
If, in addition, A is balanced, then $mu_A$ is a subnorm with ${ mu_A < 1 } subset A subset { mu_A lt.eq 1 }$.
]

#proof[
Positive 1-homogeneity: $mu_A (lambda x) = lambda mu_A (x)$, $forall lambda gt.eq 0$,
by definition of $mu_A$.

Subadditivity: take $t = mu_A (x) + epsilon.alt$, $s = mu_A (y) + epsilon.alt$, for some $epsilon.alt > 0$ arbitrarily small. Then $x in t A$, $y in s A$, and by convexity of $A$, $frac(x + y, t + s) = frac(t, t + s) x / t + frac(s, t + s) y / s in A$. Then $mu_A (x + y) lt.eq t + s = mu_A (x) + mu_A (y) + 2 epsilon.alt$. Send $epsilon.alt arrow.r 0$, the result as follows.

If A is also balanced, then $forall alpha in bb(F) without { 0 }$, $mu_A (alpha x) = mu_A (abs(alpha) alpha / abs(alpha) x) = abs(alpha) mu_A (alpha / abs(alpha) x) = abs(alpha) mu_A (x)$.

Finally, let's denote $B = { mu_A < 1 }$, $C = { mu_A lt.eq 1 }$. Then $B subset A$: if $x in B arrow.r.double x in t A$ for some $0 < t < 1$, then $x = t x / t + (1 - t) 0/(1-t) in A$ since $A$ is convex. $A subset C$ is clear. Now $B subset A subset C$, so $mu_C lt.eq mu_A lt.eq mu_B$. Fix $x in X$, and prove that $mu_B (x) lt.eq t$, $forall t > mu_C (x)$. Indeed, $forall s$, s.t., $mu_C (x) < s < t$. Then

$ s > mu_C (x) &arrow.r.double x in s C "for" C "convex" \
&arrow.r.double mu_A (x / s) lt.eq 1 "by definition of" C \
&arrow.r.double mu_A (x / s) = 1 / s mu_A (x) lt.eq 1 \
&arrow.r.double 1 / s lt.eq 1 \
&arrow.r.double x / t in B arrow.r.double mu_B (x) lt.eq t .
$

Hence, $mu_A = mu_B = mu_C$.

]

#example[
Let $X = bb(R)^2$, $p (x) = dist(x , bb(R) times { 0 }) = abs(x_2)$ where $x = (x_1 , x_2)$.
Then $p = mu_bold(B)$ for $bold(B) = { p < 1 }$. The slab $bold(B)$ is the open unit ball of $p$.
]


#theorem(title: [Hahn-Banach Separation Theorem])[
Let $X$ be a normed vector space over $bb(R)$. Let $A , B subset X$ be nonempty, disjoint, convex subsets.
1. If A is open, then $exists f in X^(*) , lambda in bb(R)$, s.t., $f (a) < lambda lt.eq f (b)$, $forall a in A , b in B$.
2. If $A$ is compact, $B$ is closed, then $exists g in X^(*) , c_1 , c_2 in bb(R)$, s.t., $g (a) lt.eq c_1 < c_2 lt.eq g (b)$, $forall a in A , b in B$.
]

#proof[
(1): Take any $a_0 in A$, $b_0 in B$. Set $x_0 = b_0 - a_0$. Consider

$ Omega &:= A - B + x_0 = (A - a_0) - (B - b_0) \
&= union.big_(b in B) (A - b + x_0) .
$
Then, $0 in Omega$ and $Omega$ is open. So $Omega$ is an open, convex neighborhood of $0$. Also $x_0 in.not Omega$, otherwise $0 in A - B$, contradicting $A inter B = nothing$.
By previous theorem, the Minkowski functional $mu_Omega$ is a sublinear functional with $mu_Omega (x_0) gt.eq 1$. Take
$
f_0 : span(x_0) &arrow.r bb(R) \
lambda x_0 &arrow.r.bar lambda.
$
Then $f_0 (x_0) = 1$ and
$ f_0 (lambda x_0) = cases(delim: "{", lambda lt.eq lambda mu_Omega (x_0) = mu_Omega (lambda x_0) & upright(" if ") lambda gt.eq 0, 0 lt.eq mu_Omega (lambda x_0) & upright(" if ") lambda < 0) $
That is, $f_0 lt.eq mu_Omega$ on $span(x_0) subset.eq X$. Thus, by Hahn-Banach Extension Theorem, $exists f in X'$, s.t. $f lt.eq mu_Omega$ on $X$. Here
$ &f (x) = - f (- x) gt.eq - mu_Omega (- x) , quad forall x in X \
arrow.r.double & norm(f)_(X') lt.eq sup { mu_Omega (x) : norm(x)_X lt.eq 1 } lt.eq 1 / rho $

for some $rho > 0$, s.t. $bold(B)(0, rho) subset Omega , bold(B)(0, rho)$ is the open ball. Hence $f in X^(*)$. To see that $f$ separates $A$ and $B$, take any $a in A , b in B$. Then

$
f (a) - f (b) &= f (a - b + x_0) - 1 \
&lt.eq mu_Omega (a - b + x_0) - 1 \
& < 1.
$
The last inequality holds since $Omega$ is open, $mu_Omega (a - b + x_0) < 1$. Therefore, $ f (a) < c := sup_A f <= f(b) $ because $f (A)$ and $f (B)$ are convex disjoint subsets of $bb(B)$.

(2): exercise.
]

#definition[
A topological space $X$ is separable iff $X$ has a countable dense subset $D = { x_1 , x_2 , . . . }$ s.t. $overline(D) = X$.
]

#example[
On $ell^p (1 lt.eq p < oo)$, $c_0$ and $c_1$ are separable.

Note $c_00$ is dense in $c_0$ and $cal(D) = { {a_j} in c_00 : a_j in bb(Q) , forall j }$
is the countable dense subset of $c_0$, $ell^p (p < oo)$.
For any $x in ell^p$, $epsilon.alt > 0$, $exists N = N (epsilon.alt , p , x)$, s.t. $ sum_(n = N + 1)^oo abs(x_i)^p < epsilon.alt^p / 2 $

Then find $a_1 , . . . , a_N in bb(Q)$, s.t. $abs(x_i - a_i)^p < frac(epsilon.alt^p, 2 N)$, $forall i in N$.
Hence $norm(x - (a_1 , . . . , a_N , 0 , . . .))_(ell^p) < epsilon.alt^p$.
]

#example[
On $ell^p ([0 , 1] , cal(L)^1)$, $C ([0 , 1])$ and $C^1 ([0 , 1])$ are separable.
]

#example[
$ell^oo$ is non-separable.

Suppose there exists a countable dense $cal(D) subset ell^oo$. Then for $F = cal(P) (bb(N))$, consider the 0-1 sequence $chi_F$ (E.g. $F = { 2 , 3 , 5}$, $chi_F = (0 , 1 , 1 , 0 , 1 , 0 , dots.h)$). Then
$ norm(chi_F - chi_(F'))_(ell^infinity) = 1 quad forall F eq.not F'. $
By density of $cal(D)$ in $ell^oo$, there exists function $ pi : cal(P) (bb(N)) &arrow.r D subset.eq ell^oo \
F &arrow.r.bar pi (F) $
s.t. $norm(chi_F - pi (F)) < 1 / 100$. Hence, for $F eq.not F'$, $ norm(pi (F) - pi (F '))_(ell^infinity) > 49 / 50 . $ So $pi$ is 1-1, which is a contradiction.
]

Similarly, $C ([0 , 1])^(*)$ is not separable. Since $forall x_1 eq.not x_2 in [0 , 1]$, by Riesz Representation Theorem, $norm(delta_(x_1) - delta_(x_2)) = 1$.

#proposition[
Let $X$ be a Banach space. If $X^(*)$ is separable, then $X$ is separable.
]

#proof[
Let ${ f_n }$ be a dense set of $bb(S)_(X^(*)) = partial bold(B)_(X^(*)) (0, 1)$. Then $forall n in bb(N)$. $exists x_n in bb(S)_X = partial bold(B)_X (0, 1)$, s.t. $f_n (x_n) > 1 / 2$.

_Claim_: $X eq.not overline(span{ x_n })$. Indeed, if not, $exists g in X^(*)$, s.t. $norm(g) = 1$, $g|_(overline(span{ x_n })) = 0$ by Hahn-Banach Separation. Then $exists n in bb(N)$, s.t. $norm(f_n - g) < 1 / 100$. But then

$ 0 = n(g (x_n)) &gt.eq n(f_n (x_n)) - n(f_n (x_n) - g (x_n))\
&gt.eq 1 / 2 - 1 / 100 > 0. $

which leads to a contradiction.
]

*Note*: The converse is false. E.g. $(c_0)^(*) tilde.equiv ell^1$, $(ell^1)^(*) tilde.equiv ell^oo$.

#corollary[
$(ell^oo)^(*)$ is not separable, so $(ell^oo)^(*) tilde.equiv.not ell^1$ and hence $ell^1$ is not reflexive.
]
