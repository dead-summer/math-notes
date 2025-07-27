#import "../book.typ": *

#show: book-page.with(
  title: "4.5 Application of Hahn-Banach Theorem"
)

== Application of Hahn-Banach Theorem

#proposition[
Let X be a normed vector space. For every $x in X without { 0 }$, $exists f in X^(*)$, s.t. $f (x) = norm(x)$, $norm(f) = 1$. $f$ is so-called norming functional.
]<proposition:norm-func>

#proof[
Define $g in span(x)^(*)$ by $g (lambda x) = lambda norm(x)$, $forall lambda in bb(R)$. Then $g (x) = norm(x)$ and $norm(g) = sup { abs(g(lambda x)) : norm(lambda x) lt.eq 1 } = 1$. Extend $g$ to $X$ by Hahn-Banach extension.
]

#proposition[
Let $X eq.not { 0 }$ be a normed vector space.
1. $forall f in X^(*)$, $norm(f)_(X^(*)) = sup { abs(f (x)) : norm(x) lt.eq 1, x in X}$
2. $forall x in X$, $norm(x)_X = sup { abs(f (x)) : f in X^(*) , norm(f)_(X^(*)) lt.eq 1}$.
]

#proof(title: "Proof of 2")[
Observe that
$
abs(f(x)) <= norm(f) dot norm(x) <= norm(x), quad forall f in X^*, norm(f) <=1.
$
So $sup { abs(f (x)) : f in X^(*) , norm(f)_(X^(*)) lt.eq 1} <= norm(x)$.

On the other hand, by @proposition:norm-func, for any $x in X, exists f in X^*$, s.t. $f(x) = norm(x), norm(f) = 1$. Hence $sup { abs(f (x)) : f in X^(*) , norm(f)_(X^(*)) lt.eq 1} = norm(x)$.
]

Consider
$
J : X &arrow.r X^(* *) \
x &arrow.r.bar J (x) = [f in X^(*) arrow.r.bar f (x)] .
$
Then $J(x) in X^(* *)$ since $forall f in X^(*)$, $x in X$,
$
norm(J (x))_(X^(* *)) &= sup { abs((J (x)) (f)) : f in X^(*) , norm(f)_(X^(*)) lt.eq 1 } \
&= sup { abs(f (x)) : f in X^(*) , norm(f)_(X^(*)) lt.eq 1 }\
&= norm(x)_X
$

Note that if $J (x) = 0$ in $X^(**)$, then

$
& (J (x)) (f) = 0 , forall f in X^(*)\
<=> & f (x) = 0, forall f in X^(*) \
arrow.l.r.double & x = 0 .
$
The last equivalence holds because $norm(x) = sup { abs(f (x)) : f in X^(*) , norm(f)_(X^(*)) lt.eq 1} = 0$. Then $J : X arrow.r X^(* *)$ is injective and isometric.

#definition[
A Banach space $X$ is reflexive iff
$
J : X &arrow.r X^(* *) \
x &arrow.r.bar J (x) = [f in X^(*) arrow.r.bar f (x)] .
$
is an isometric isomorphism.
]

#example[
Let $X = ell^p$, $1 < p < oo$, then $X^(*) = ell^q , 1 / p + 1 / q = 1$. $X^(* *) = (ell^q)^* = ell^p = X$, so $ell^p$ are reflexive, $1 < p < oo$.
]

*Comment*: $X tilde.equiv X^(* *) arrow.r.double.not X$ is reflexive where $tilde.equiv$ means isometric isomorphism. This is because if $X tilde.equiv X^(* *)$, it does not mean that $J$ is an isometric isomorphism.

#proposition[
Let $X$ be a normed vector space. Then $X^(*) = bold(cal(B)) (X , bb(F))$ separates points, i.e., $forall x eq.not y$ in $X$, $exists f in X^(*)$, s.t. $f (x) eq.not f (y)$.
]

#proof[
Let $f$ be the norming functional of $x - y$.
]

#lemma[
Let $X$ be a normed vector space, $f in X' without { 0 }$. Then $forall x_0 in X without ker(f)$, we have

$
span(ker(f), {x_0}) = X,
$
i.e., $codim ker(f) = 1$.
]

#proof[
$forall x in X$, we can rewrite $x$ by $x = (x - frac(f (x), f (x_0)) x_0) + frac(f (x), f (x_0)) x_0$ and note that $x - frac(f (x), f (x_0)) x_0 in ker f$.
]

#proposition[
Let $X$ be a normed vector space, then $X^(*)$ separates points from closed subspaces.
]

#proof[
_Claim_: Let $X$ be a Banach space. Let ${ 0 } eq.not Y subset.neq X$ be a closed subspace. Then $forall x in X without Y , exists f in X^(*)$, s.t. $norm(f) = 1 $, $f|_Y = 0$ and $f (x) = dist(x, Y)$. The proof of this claim is as follows:

Set $delta = dist(x_0, Y) > 0$. Define

$
g : Y plus.circle span(x_0) & arrow.r bb(R)\
y + alpha x_0 & arrow.r.bar alpha delta .
$

Then $g in (Y plus.circle span(x_0))^(*)$. Observe that
$
abs(alpha delta) <= abs(alpha) norm(y / alpha + x_0) = norm(y + alpha x_0), forall alpha eq.not 0.
$
So $norm(g) <= 1$. On the other hand, since $delta = dist(x_0, Y) = inf{norm(y - x_0): y in Y}$,
there exists ${y_n} in Y$, s.t.
$
norm(y_n / alpha + x_0) < delta + 1/n 
=> norm(y_n + alpha x_0) - abs(alpha) / n < abs(alpha) delta.
$
Thus $norm(g) >= sup{(abs(alpha) delta) / (norm(y_n + alpha x_0)): lim_(n -> oo)norm(y_n + alpha x_0) = alpha delta} >= 1$.
Hence $norm(g) = 1$.

Note that $g (x_0) = delta , g|_Y = 0$. Then extend $g$ to $f in X^(*)$ by Hahn-Banach extension.
]
