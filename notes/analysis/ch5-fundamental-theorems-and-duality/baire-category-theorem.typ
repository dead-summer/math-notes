#import "../book.typ": *

#show: book-page.with(
  title: "5.1 Baire Category Theorem"
)

== Baire Category Theorem

Let $X$ be a nonempty, complete, metric space.

#remark[
Most of the results in this interion carry over to compact Hausdorff space.

]

*Philosophy*: A set is big or small can be viewed from:

1. Topology: Baire Category

2. Analytic : Measure.

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([], [Topology], [Analytic]),
    table.hline(),
    [Small], [Meagre Set], [Null Set],
    [Big], [Generic Set], [Random Point],
  )]
  , kind: table,
  caption: [A set is big or small from different perspectives]
)

#definition[
$E subset X$ is nowhere dense iff $overline(E)$ has empty interior. I.e. nowhere dense $arrow.l.r.double circle(overline(E)) = nothing$.
]

#example[
Cantor set in $[0 , 1]$ is nowhere dense. Rationals are dense ($overline(QQ) = RR$).
]

A simple example $circle(bb(Q)) = nothing$ shows that $circle(overline(E)) eq.not overline(circle(E))$.

#definition[
$E subset X$ is meagre (or of the first category) iff $E$ is a countable union of nowhere dense sets.
]

#definition[
$E subset X$ is residual/comeagre iff $X without E$ is meagre.
]

#definition[
$E subset X$ is of the second category if $E$ is not meagre.
]

#example[
$bb(Q)$ is not nowhere dense. But $bb(Q)$ is meagre. $bb(Q) = union.big_(q in bb(Q)) { q }$.
]

#example[
Let ${ gamma_n }$ be arcs in $[0 , 1]^2 subset bb(R)^2$. E.g., Brownian motion trajectories. $union.big_(n in bb(N)) gamma_n$ is meagre.
]

Prp: (a) If $E subset X$ meagre, $F subset E$, then $F$ is meagre. (b) {meagre sets} is closed under countable unions. (c) {residual sets} is closed under countable interinterion (d) A countable interinterion of dense open sets is residual.

Note: $X without A^(̊) = overline(A)^c$, $(X without B^(̊)) = X without overline(B)$.

Proof: (d): Let ${ O_n }_(n = 1)^oo$ be dense open sets in X. We need to check that $X without (inter.big_(n = 1)^oo O_n)$ is meagre. Indeed, $ X without (inter.big_(n = 1)^oo O_n) = union.big_(n = 1)^oo (X without O_n) $ $ i n t e r i o r (overline(X without O_n)) = i n t e r i o r (X without O_n) = X without overline(O_n) = nothing $ This proves (d).

#strong[Theorem (Baire Category Theorem):] Let $X$ be a nonempty, complete metric space. Let ${ U_n }$ be dense open subsets in $X$. Then $inter.big_n U_n$ is dense.

Recall: $inter.big_n O_n$ with $O_n$ open is a $G_delta$-set.

#strong[BST] Residual $arrow.l.r.double$ containing dense $G_delta$

#strong[Proof:] To see that $inter.big_n U_n$ is dense, then take any ball $B_0 = B (x , delta)$ and show that $B_0 inter inter.big_n U_n eq.not nothing$.

First, since $U_1$ is open and dense, then $B_0 inter U_1$ contains $B_1 = B (x_1 , delta / 2) subset upright("Subset") med B_0 inter U_1 med (upright("ECF") arrow.r.double.long upright("ECF"))$ for some $x_1 in U_1$, $delta > 0$. Then $B_1 inter U_1$ is nonempty open, so $exists B_1 = B (x_1 , delta / 2) subset B_0 inter U_1$.

Suppose $B_m$ is chosen, s.t. $B_0 supset B_1 supset dots.h supset B_m$ where $B_k$ is an open metric ball, s.t. $overline(B_k) subset B_k inter U_k$ with radius($B_k$) $< 1 / k$. Then pick $B_(m + 1) = B (x_(m + 1) , delta_(m + 1) / 2)$, s.t. $overline(B_(m + 1)) subset B_m inter U_(m + 1)$. Hence, the sequence ${ x_n }$ is Cauchy, hence converging to some $x in X$.

By construction, $x in B_0 inter inter.big_(n gt.eq 1) U_n$.

$tilde(B C T)$

Proof: $arrow.l.double$: If E is a dense $G_delta$, i.e., $E = inter.big_(n = 1)^oo U_n$ dense for $U_n$ open, then each $U_n$ is dense. By prop (d), E is residual. $arrow.r.double$: If E is residual, then $X without E$ is meagre. Hence, $X without E = union.big_(n = 1)^oo M_n$, $M_n$ nowhere dense.

Then, $E = X without (union.big_(n = 1)^oo M_n) = inter.big_(n = 1)^oo (X without M_n) supset inter.big_(n = 1)^oo (X without overline(M_n))$.

Claim: $X without overline(M_n)$ is dense. Indeed, $X without overline(M_n) = X without overline(M_n) = X without nothing = X$.

So E is dense by BCT and $inter.big_(n = 1)^oo (X without overline(M_n))$ is a $G_delta$ set.

Cor: A countable interinterion of dense $G_delta$ is a dense $G_delta$.

Cor: If M $subset$ X is meagre, then $X without M$ is dense.

Dense $arrow.r.double.not$ residual : consider $bb(Q)$.

Recall

$f (x) = cases(delim: "{", 0 & upright("on ") bb(R) without bb(Q), 1 & upright("at ") 0, 1 / n & upright("at ") q = m / n in bb(Q) , m , n in bb(Z) , gcd (m , n) = 1 .)$

is continuous at every $x in bb(R) without bb(Q)$, but discontinuous on $bb(Q)$.

Thm: There is no function $f : [0 , 1] arrow.r bb(R)$ that is continuous on $bb(Q)$ but discontinuous on $bb(R) without bb(Q)$.

Proof: Let $C = { x in [0 , 1] : f upright(" is continuous at ") x }$ $= { x in [0 , 1] : forall epsilon.alt > 0 , exists delta > 0 , forall y in [0 , 1] , lr(|f (x) - f (y)|) < epsilon.alt upright(" when ") lr(|x - y|) < delta }$ $= inter.big_n union.big_m { x in [0 , 1] : f (B (x , 1 / m)) subset B (f (x) , 1 / n) }$

Then $C$ is a $G_delta$ set. If $C = bb(Q)$, then $bb(Q)$ is a dense $G_delta$, hence residual, which leads to a contradiction.

$arrow.r$ residual set of

Thm: A generic continuous function on $[0 , 1]$ is nowhere differentiable.

Cor: $C^k subset C^(k - 1)$ (since $lr(||) f lr(||)_(C^k) = sup_(1 lt.eq j lt.eq k) lr(||) D^j f lr(||)_(C^0)$) is meagre.

Let $cal(D) = { f in C [0 , 1] : f upright(" is differentiable at ") gt.eq upright(" one point on ") [0 , 1] }$ $= union.big_(n_1) union.big_(m_1) { f in C [0 , 1] : exists x in [0 , 1] , forall y in [0 , 1] , upright("If ") 0 < lr(|x - y|) < 1 / n , upright(" then ") lr(|frac(f (y) - f (x), y - x)|) < M }$

We prove that $cal(D)_(n , m)$ is nowhere dense, (then $cal(D)$ is meagre). Fix $n$, $m$, $forall epsilon.alt > 0$, $forall f in cal(D)_(n , m)$, we can find $phi in C ([0 , 1]) without cal(D)_(n , m)$.

s.t. $parallel phi - f parallel_C < epsilon.alt$.

definition: $x in bb(R)$ is $alpha$-Diophantine iff $forall p / q in bb(Q)$, $lr(|x - p / q|) > c / q^alpha$ for some universal $C > 0$.

Prop: $forall x in bb(R) without bb(Q)$, $exists oo$-many rationals $p / q$, s.t. $lr(|x - p / q|) lt.eq 1 / q^2$.

Proof: Consider.

$x , 2 x , 3 x , . . . , n x #h(0em) mod med 1$

For any $0 lt.eq n_1 < n_2 lt.eq n$, $0 lt.eq (n_2 - n_1) x #h(0em) mod med 1 lt.eq frac(1, n - n_1)$

$arrow.r.double exists p in bb(Z)$, s.t. $lr(|p - (n_2 - n_1) x|) lt.eq frac(1, n - n_1)$

So take $q = n_2 - n_1$, then $lr(|x - p / q|) lt.eq 1 / q^2$

Prop: D-algebraic irrationals are d-Diophantine.

Let $X$ be nonempty complete metric space. Let ${ O_n }$ be a sequence of open dense subsets of $X$. Then $inter.big_(n gt.eq 1) O_n$ is dense.

Cor: Let $X$ be nonempty complete metric space. Then $X$ is non-meagre in itself.

#strong[Cor] Let $X$ be a Banach space. Either $dim X < oo$, or $X$ has no countable Hamel basis.