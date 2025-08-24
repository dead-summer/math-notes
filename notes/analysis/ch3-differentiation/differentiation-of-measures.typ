#import "../book.typ": *

#show: book-page.with(
  title: "3.1 Differentiation of Measures"
)

== Differentiation of Measures

In elementary calculus, the derivative of a function $f : bb(R) arrow.r bb(R)$ at a point $x$ is defined as: $ f' (x) := lim_(h arrow.r 0) frac(f (x + h) - f (x), h) = lim_(r arrow.r 0) frac(integral_(x - r)^(x + r) f' (t) dif t, 2 r) $ This concept describes the local behavior of the function. The derivative $f' (x)$ is determined entirely by the values of $f$ in an arbitrarily small neighborhood of $x$.

The goal of this chapter is to generalize this notion to define a derivative of one measure with respect to another. This derivative will represent the #strong[local density] of one measure relative to another. To rigorously study these local properties, we first need a powerful geometric tool: the Vitali Covering Theorem. For simplicity, we will initially focus on the Lebesgue measure $cal(L)^n$ on $bb(R)^n$.

=== The Vitali Covering Theorem

The Vitali Covering Theorem provides a way to select a countable, disjoint subcollection from a given collection of balls that still "covers" the original set in a specific sense.

To formally state the theorem, we first need to define the relevant concepts.

#definition[
A closed ball $overline(ball) (x, r) subset bb(R)^n$ with center $x$ and radius $r$ is called #strong[nondegenerate] if its radius is strictly positive, i.e., $r > 0$.
]

#definition[
A collection of closed balls $cal(F)$ is a #strong[cover] of a set $A subset.eq bb(R)^n$ if $A subset.eq union.big_(overline(ball) in cal(F)) overline(ball)$.
]

#definition[
A collection $cal(F)$ is a #strong[fine cover] (or #strong[Vitali cover];) of a set $A$ if for every $x in A$ and every $epsilon > 0$, there exists a ball $overline(ball) in cal(F)$ such that $x in overline(ball)$ and $diam(overline(ball)) < epsilon$.
]

For a closed ball $overline(ball) (x , r)$, we denote its "enlargement" as $c overline(ball) := overline(ball) (x , c dot r)$.

#theorem(title: "Vitali Covering Theorem")[
Let $cal(F)$ be any collection of nondegenerate closed balls in $bb(R)^n$ such that their diameters are uniformly bounded, i.e., $ D = sup { diam(overline(ball)) : overline(ball) in cal(F) } < oo . $ Then, there exists a countable subcollection $cal(G) subset.eq cal(F)$ of pairwise disjoint balls such that $ union.big_(overline(ball) in cal(F)) overline(ball) subset.eq union.big_(overline(ball)' in cal(G)) 5 overline(ball)' . $
]<thm:vitali-covering>

#proof[
The proof employs a greedy algorithm.

+ #strong[Partition the Collection:] For each integer $j gt.eq 1$, define a subcollection based on diameter:
  
  $ cal(F)_j := {overline(ball) in cal(F) : D / 2^j < diam(overline(ball)) lt.eq D / 2^(j - 1)} . $

+ #strong[Construct the Disjoint Subcollection $cal(G)$:]

  - Let $cal(G)_1$ be any maximal disjoint subcollection of $cal(F)_1$.
  - Inductively, having chosen $cal(G)_1 , dots.h , cal(G)_(k - 1)$, let $cal(G)_k$ be a maximal disjoint subcollection of balls in $cal(F)_k$ that are also disjoint from all balls in $union.big_(j = 1)^(k - 1) cal(G)_j$. That is, $ cal(G)_k subset.eq {overline(ball) in cal(F)_k : overline(ball) inter overline(ball)' = nothing upright(" for all ") overline(ball)' in union.big_(j = 1)^(k - 1) cal(G)_j} . $
  - Set $cal(G) := union.big_(k = 1)^oo cal(G)_k$. By construction, $cal(G)$ is a collection of disjoint balls from $cal(F)$. Since $bb(R)^n$ is a separable space, each $cal(G)_k$ must be countable, and thus $cal(G)$ is countable.

+ #strong[Verify the Covering Property:] Let $overline(ball) in cal(F)$ be an arbitrary ball. We must show that $overline(ball) subset.eq 5 overline(ball)'$ for some $overline(ball)' in cal(G)$. Suppose $overline(ball) in cal(F)_k$ for some $k gt.eq 1$. By the maximality in our construction, $overline(ball)$ must interinter some ball in $union.big_(j = 1)^k cal(G)_j$. (If it did not, $overline(ball)$ could have been added to $cal(G)_k$, contradicting the maximality of $cal(G)_k$). Let $overline(ball)' in cal(G)_j$ for some $j lt.eq k$ be the first such ball that $overline(ball)$ interinters. Let $overline(ball) = overline(ball) (y , r)$ and $overline(ball)' = overline(ball) (y' , r')$. From the definitions of $cal(F)_k$ and $cal(F)_j$, we have:
  
  $
  diam(overline(ball)) &lt.eq D / 2^(k - 1) arrow.r.double r lt.eq D / 2^k, \
  diam(overline(ball)') &> D / 2^j arrow.r.double r' > D / 2^(j + 1).
  $
  
  Since $j lt.eq k$, it follows that $r' > D \/ 2^(k + 1) gt.eq r \/ 2$, or $2 r' > r$.

  Since $overline(ball)$ and $overline(ball)'$ interinter, the distance between their centers satisfies $abs(y - y') lt.eq r + r'$. For any point $x in overline(ball)$, we can bound its distance to $y'$:
  $ abs(x - y') lt.eq abs(x - y) + abs(y - y') lt.eq r + (r + r') = 2 r + r'. $
  
  Using the inequality $r < 2 r'$, we get:
  
  $ abs(x - y') < 2 (2 r') + r' = 5 r'. $
  
  This implies that every point $x in overline(ball)$ is contained in the open ball $overline(ball) (y' , 5 r')$, so $overline(ball) subset.eq overline(ball) (y' , 5 r') = 5 overline(ball)'$. This completes the proof.
]

#remark[
The constant $5$ in the theorem is not optimal. By refining the partition of $cal(F)$, it can be improved. For instance, if we define the subcollections using a geometric progression with ratio $delta > 1$,

$ cal(F)_j := {overline(ball) in cal(F): D / delta^j < diam(overline(ball)) lt.eq D / delta^(j - 1)}, $

the same argument yields the inequality $r < delta r'$. The final covering condition then becomes:

$ abs(x - y') lt.eq 2 r + r' < 2 (delta r') + r' = (2 delta + 1) r'. $

Thus, $overline(ball) subset.eq (2 delta + 1) overline(ball)'$. By choosing $delta$ arbitrarily close to $1$, the constant $(2 delta + 1)$ can be made arbitrarily close to $3$.
]

#corollary(title: "Covering Almost Everywhere")[
Let $A subset.eq bb(R)^n$ be a set with finite outer Lebesgue measure, $cal(L)^n (A) < oo$, and let $cal(F)$ be a Vitali cover of $A$. Then there exists a countable, disjoint subcollection $cal(G) subset.eq cal(F)$ such that $A$ is covered by $cal(G)$ almost everywhere. That is, $ cal(L)^n (A \\ union.big_(overline(ball) in cal(G)) overline(ball)) = 0 . $
]<cor:covering-almost-everywhere>

#proof[

]

#corollary(title: "Paving Open Sets")[
Let $U subset.eq bb(R)^n$ be an open set and $delta > 0$. There exists a countable collection $cal(G)$ of disjoint closed balls contained in $U$, such that $diam(overline(ball)) lt.eq delta$ for all $overline(ball) in cal(G)$, and the remaining portion of $U$ has zero Lebesgue measure: $ cal(L)^n (U \\ union.big_(overline(ball) in cal(G)) overline(ball)) = 0 . $
]

#proof[
First, we can write $U$ as a countable union of open sets with finite measure, for example $U = union.big_(k = 1)^oo (U inter overline(ball) (0 , k))$. By proving the result for each part and taking the union of the collections of balls, we can assume without loss of generality that $cal(L)^n (U) < oo$.

Fix a constant $theta$ such that $1 - 5^(- n) < theta < 1$. Let $cal(F)_1 = { overline(ball) subset.eq U : diam(overline(ball)) < delta }$. This is a fine cover of $U$. By the Vitali Covering Theorem, there exists a countable disjoint subcollection $cal(G)_1 subset.eq cal(F)_1$ such that $U subset.eq union.big_(overline(ball) in cal(G)_1) 5 overline(ball)$. Then, $ cal(L)^n (U) lt.eq cal(L)^n (union.big_(overline(ball) in cal(G)_1) 5 overline(ball)) lt.eq sum_(overline(ball) in cal(G)_1) cal(L)^n (5 overline(ball)) = sum_(overline(ball) in cal(G)_1) 5^n cal(L)^n (overline(ball)) = 5^n cal(L)^n (union.big_(overline(ball) in cal(G)_1) overline(ball)) . $ This implies $cal(L)^n (union.big_(overline(ball) in cal(G)_1) overline(ball)) gt.eq 5^(- n) cal(L)^n (U)$. Because $cal(L)^n (U) < oo$, the series $sum_(overline(ball) in cal(G)_1) cal(L)^n (overline(ball))$ converges. Thus, we can choose a finite subcollection ${ overline(ball)_1 , dots.h , overline(ball)_(J_1) } subset.eq cal(G)_1$ such that $sum_(i = 1)^(J_1) cal(L)^n (overline(ball)_i) > (1 - theta) cal(L)^n (U)$. Let $U_1 = U \\ union.big_(i = 1)^(J_1) overline(ball)_i$. Then $cal(L)^n (U_1) < theta cal(L)^n (U)$.

We now repeat this argument on the open set $U_1$. This yields a finite disjoint collection of balls ${ overline(ball)_(J_1 + 1) , dots.h , overline(ball)_(J_2) }$ in $U_1$ such that if $U_2 = U_1 \\ union.big_(i = J_1 + 1)^(J_2) overline(ball)_i$, then $cal(L)^n (U_2) < theta cal(L)^n (U_1) < theta^2 cal(L)^n (U)$.

Continuing this process inductively, we construct a sequence of disjoint finite collections of balls. Let $cal(G)$ be the union of all these balls. This collection is countable and consists of disjoint closed balls in $U$. After $k$ steps, the remaining volume is $cal(L)^n (U_k) < theta^k cal(L)^n (U)$. As $k arrow.r oo$, since $theta < 1$, the measure of the remaining set goes to zero.
]


=== Differentiation of Measures

To define the derivative of a measure, we first specify the class of measures we will work with.

#definition[
- An outer measure $mu$ on $bb(R)^n$ is #strong[Borel regular] if for every set $A subset.eq bb(R)^n$, there exists a Borel set $B subset.eq bb(R)^n$ such that $A subset.eq B$ and $mu (A) = mu (B)$.
- A measure $mu$ is a #strong[Radon measure] if it is Borel regular and is finite on all compact sets, i.e., $mu (K) < oo$ for all compact $K subset.eq bb(R)^n$.
]


We denote the space of non-negative Radon measures on $bb(R)^n$ by $cal(M)^(+) (bb(R)^n)$.

#definition[
Let $mu , nu in cal(M)^(+) (bb(R)^n)$. For any $x in bb(R)^n$, the #strong[upper] and #strong[lower derivatives] of $nu$ with respect to $mu$ at $x$ are defined as:

$ overline(cal(D))_mu nu (x) := limsup_(r arrow.r 0) frac(nu (ball(x, r)), mu (ball(x, r))), $

$ underline(cal(D))_mu nu (x) := liminf_(r arrow.r 0) frac(nu (ball(x, r)), mu (ball(x, r))), $

where we adopt the convention that the ratio is $+ oo$ if $mu (ball(x, r)) = 0$.

If $overline(cal(D))_mu nu (x) = underline(cal(D))_mu nu (x)$ and this value is finite, we say that $nu$ is #strong[differentiable] with respect to $mu$ at $x$. The common value is called the #strong[derivative] of $nu$ with respect to $mu$ at $x$, denoted by $cal(D)_mu nu (x)$.
]

This leads to two fundamental questions:
1. When does $cal(D)_mu nu$ exist?
2. If it exists, can we recover the measure $nu$ by integrating its derivative? That is, does the following "fundamental theorem of calculus" hold?

$ nu (E) eq.quest integral_E cal(D)_mu nu (x) dif mu (x). $

To answer these, we need a crucial lemma.

#lemma[
Let $mu , nu in cal(M)^(+) (bb(R)^n)$ and $0 < alpha < oo$.

1. If $A subset.eq { x : underline(cal(D))_mu nu (x) lt.eq alpha }$, then $nu (A) lt.eq alpha mu (A)$.
2. If $A subset.eq { x : overline(cal(D))_mu nu (x) gt.eq alpha }$, then $nu (A) gt.eq alpha mu (A)$.
]<lem:measure-comparison>

#proof[
Without loss of generality, we can assume that $mu$ and $nu$ are finite measures. If they are not, we can consider their restrictions to a large ball $ball (0, R)$ and then let $R arrow.r oo$.


1. Fix an arbitrary $epsilon > 0$. Since $mu$ is a Radon measure, it is outer regular. Therefore, for any $delta > 0$, there exists an open set $U supset.eq A$ such that $mu (U) < mu (A) + delta$.

  Consider the collection of closed balls $cal(F)$ defined as:
  
  $ cal(F) = { overline(ball) (x, r) : x in A, overline(ball) (x, r) subset.eq U, "and" nu (overline(ball) (x, r)) < (alpha + epsilon) mu (overline(ball) (x, r)) }. $
  
  For any point $x in A$, we have $underline(cal(D))_mu nu (x) lt.eq alpha < alpha + epsilon$. By the definition of the $liminf$, for any $x in A$, we can find balls centered at $x$ with arbitrarily small radii that satisfy the inequality $frac(nu (ball (x, r)), mu (ball (x, r))) < alpha + epsilon$. Assuming $mu$ and $nu$ assign zero measure to the boundaries of these balls (a common property for Radon measures), this applies to closed balls as well. Since $U$ is open, for each $x in A$, we can find balls small enough to be contained within $U$. Thus, $cal(F)$ constitutes a #strong[fine cover] of the set $A$.

  By @cor:covering-almost-everywhere, we can extract a countable, disjoint subcollection of balls ${ overline(ball)_i }_(i = 1)^oo subset.eq cal(F)$ such that the portion of $A$ not covered by these balls has $nu$-measure zero. That is,
  
  $ nu (A \\ union.big_(i = 1)^oo overline(ball)_i) = 0. $

  From the covering property, we can write:
  
  $ nu (A) = nu (A inter union.big_(i = 1)^oo overline(ball)_i) lt.eq nu (union.big_(i = 1)^oo overline(ball)_i). $
  
  Since the balls $overline(ball)_i$ are disjoint, the measure of their union is the sum of their measures:
  
  $ nu (A) lt.eq sum_(i = 1)^oo nu (overline(ball)_i). $
  
  By the definition of our collection $cal(F)$, every ball $overline(ball)_i$ satisfies $nu (overline(ball)_i) < (alpha + epsilon) mu (overline(ball)_i)$. Substituting this into the sum gives:
  
  $ nu (A) < sum_(i = 1)^oo (alpha + epsilon) mu (overline(ball)_i) = (alpha + epsilon) sum_(i = 1)^oo mu (overline(ball)_i). $
  
  Again using the disjointness of the balls:
  
  $ nu (A) < (alpha + epsilon) mu (union.big_(i = 1)^oo overline(ball)_i). $
  
  Since each ball $overline(ball)_i$ was chosen to be a subset of the open set $U$, their union must also be a subset of $U$:
  
  $ union.big_(i = 1)^oo overline(ball)_i subset.eq U. $
  
  By the monotonicity of measure, $mu (union.big_(i = 1)^oo overline(ball)_i) lt.eq mu (U)$. This leads to:
  
  $ nu (A) < (alpha + epsilon) mu (U). $
  
  Finally, recall our choice of $U$, which satisfied $mu (U) < mu (A) + delta$. Therefore,
  
  $ nu (A) < (alpha + epsilon) (mu (A) + delta) = (alpha + epsilon) mu (A) + (alpha + epsilon) delta. $

  The inequality $nu (A) < (alpha + epsilon) mu (A) + (alpha + epsilon) delta$ holds for any arbitrarily small $delta > 0$. We can therefore let $delta arrow.r 0$, which yields:
  
  $ nu (A) lt.eq (alpha + epsilon) mu (A). $
  
  This relation holds for any $epsilon > 0$. Letting $epsilon arrow.r 0$, we arrive at the desired conclusion:
  
  $ nu (A) lt.eq alpha mu (A). $

2. The proof for the second statement is analogous, using the set ${ x : overline(cal(D))_mu nu (x) gt.eq alpha }$ and the condition $nu (overline(ball)) > (alpha - epsilon) mu (overline(ball))$.
]

#theorem[
Let $mu , nu in cal(M)^(+) (bb(R)^n)$. Then the derivative $cal(D)_mu nu (x)$ exists and is finite for $mu$-almost every $x in bb(R)^n$. Furthermore, the function $x mapsto cal(D)_mu nu (x)$ is Borel measurable.
]

#proof[
Assume without loss of generality that $mu (bb(R)^n) + nu (bb(R)^n) < oo$. The set where the derivative fails to exist or is infinite is the union of two sets:
1. $I = { x : cal(D)_mu nu (x) = oo }$
2. $J = { x : underline(cal(D))_mu nu (x) < overline(cal(D))_mu nu (x) }$

For the set $I$, we have $I subset.eq { x : overline(cal(D))_mu nu (x) gt.eq M }$ for any $M > 0$. By @lem:measure-comparison, this implies $nu (I) gt.eq M mu (I)$. Since $nu (I)$ is finite, if we had $mu (I) > 0$, we could choose $M > nu (I) \/ mu (I)$, leading to the contradiction $nu (I) > nu (I)$. Thus, we must have $mu (I) = 0$.

For the set $J$, we can write it as a countable union of sets where the upper and lower derivatives are separated by a rational gap:

$ J = union.big_(a , b in bb(Q)\
0 < a < b) { x : underline(cal(D))_mu nu (x) < a < b < overline(cal(D))_mu nu (x) } . $

Let $J_(a , b) = { x : underline(cal(D))_mu nu (x) < a < b < overline(cal(D))_mu nu (x) }$. From the definitions, $J_(a , b) subset.eq { x : underline(cal(D))_mu nu (x) lt.eq a }$ and $J_(a , b) subset.eq { x : overline(cal(D))_mu nu (x) gt.eq b }$. Applying both parts of @lem:measure-comparison to the set $J_(a , b)$, we get:

$ nu (J_(a , b)) lt.eq a dot.op mu (J_(a , b)) quad "and" quad nu (J_(a , b)) gt.eq b dot.op mu (J_(a , b)) . $

Combining these inequalities gives $b dot.op mu (J_(a , b)) lt.eq nu (J_(a , b)) lt.eq a dot.op mu (J_(a , b))$. Since $a < b$ and measures are non-negative, this can only hold if $mu (J_(a , b)) = 0$. Since $J$ is a countable union of such null sets, we have $mu (J) = 0$. Therefore, the derivative $cal(D)_mu nu$ exists and is finite $mu$-a.e.

For measurability, for each $r > 0$, define the function:

$
f_r (x) := cases(delim: "{",
frac(nu (ball(x, r)), mu (ball(x, r))) & "if " mu (ball(x, r)) > 0,
+ oo & "if " mu (ball(x, r)) = 0)
$

The functions $x mapsto nu (ball(x, r))$ and $x mapsto mu (ball(x, r))$ can be shown to be lower semi-continuous, and hence Borel measurable. Therefore, $f_r (x)$ is a Borel measurable function for each $r$. The derivative is given by $cal(D)_mu nu (x) = lim_(k arrow.r oo) f_(1 \/ k) (x)$ for $mu$-a.e. $x$. The limit of a sequence of measurable functions is measurable. Thus, $cal(D)_mu nu$ is a $mu$-measurable function.
]
