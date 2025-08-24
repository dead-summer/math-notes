#import "../book.typ": *

#show: book-page.with(
  title: "3.5 Monetone functions"
)

== Monetone functions

=== achallenge to the Fundamental Theorem of Calculus

acentral result in elementary calculus is the #strong[Fundamental Theorem of Calculus];, which states that if $F$ is continuously differentiable on $[a , b]$, then $integral_a^b F' (x) dif x = F (b) - F (a)$. A natural question arises: can we relax the condition of continuous differentiability? For instance, does this relationship hold if we only know that $F$ is differentiable?

Consider the #strong[Cantor function];, also known as the "Devil's Staircase," denoted by $Phi (x)$ on $[0 , 1]$. This function is:
- #strong[Continuous] on $[0 , 1]$.
- #strong[Monotonically increasing] from $Phi (0) = 0$ to $Phi (1) = 1$.
- #strong[Differentiable almost everywhere];, with a derivative $Phi' (x) = 0$ for all $x$ not in the Cantor set (which has Lebesgue measure zero).

If the Fundamental Theorem of Calculus were to hold, we would expect:

$ integral_0^1 Phi' (x) dif x = integral_0^1 0 dif x = 0. $

However, $Phi (1) - Phi (0) = 1 - 0 = 1$. The discrepancy $0 eq.not 1$ shows that the classical Fundamental Theorem of Calculus does not apply to all continuous, monotone functions. This motivates a deeper investigation into the properties of such functions within the framework of Lebesgue integration.

=== Differentiability of Monotone Functions

A foundational result by Henri Lebesgue states that a monotone function, despite possibly having many points of non-differentiability, must be differentiable "almost everywhere".

#theorem[
A monotone function $f : [a , b] arrow.r bb(R)$ is differentiable almost everywhere with respect to the Lebesgue measure $cal(L)^1$.
]

#proof[
Let's assume $f$ is monotonically increasing. The proof for a monotonically decreasing function is analogous. The set of points where $f$ is not differentiable can be partitioned into three disjoint subsets:

- $E_1 = { x in [a , b] : f "is discontinuous at" x }$. For a monotone function, the set of discontinuities is at most countable, so its Lebesgue measure is zero, i.e., $cal(L)^1 (E_1) = 0$.

- $E_2 = { x in [a , b] : f "is continuous at" x "and " f' (x) = oo }$.

- $E_3 = { x in [a , b] : f "is continuous at" x "and" f' (x) "does not exist and is not" oo }$.

We need to show that $cal(L)^1 (E_2) = 0$ and $cal(L)^1 (E_3) = 0$.

1. #strong[Showing $cal(L)^1 (E_2) = 0$:] Let $E_(2 , M) = { x in [a , b] : f' (x) > M }$ for some large $M > 0$. Then $E_2 = inter.big_(M = 1)^oo E_(2 , M)$. For any $x in E_(2 , M)$, the difference quotient $(f (y) - f (z)) \/ (y - z) > M$ for all sufficiently small intervals $(z , y)$ containing $x$. By the #strong[Vitali Covering Theorem];, for any $epsilon > 0$, we can find a finite collection of disjoint open intervals ${ I_k }_(k = 1)^N$ with $I_k = (a_k , b_k)$ that covers a significant portion of $E_(2 , M)$, such that $sum_(k = 1)^N cal(L)^1 (I_k) > cal(L)^1 (E_(2 , M)) - epsilon$. For each such interval, we have $f (b_k) - f (a_k) > M (b_k - a_k) = M cal(L)^1 (I_k)$.

  Summing over these disjoint intervals, and using the monotonicity of $f$:
  
  $ sum_(k = 1)^N (f (b_k) - f (a_k)) lt.eq f (b) - f (a). $
  
  Combining the inequalities:
  
  $ M sum_(k = 1)^N cal(L)^1 (I_k) < sum_(k = 1)^N (f (b_k) - f (a_k)) lt.eq f (b) - f (a). $
  
  Thus, $M (cal(L)^1 (E_(2 , M)) - epsilon) < f (b) - f (a)$, which implies $cal(L)^1 (E_(2 , M)) < (f (b) - f (a)) \/ M + epsilon$. Since $epsilon$ is arbitrary, $cal(L)^1 (E_(2 , M)) lt.eq (f (b) - f (a)) \/ M$. As $M arrow.r oo$, we have $cal(L)^1 (E_(2 , M)) arrow.r 0$. Since $E_2$ is a subset of $E_(2 , M)$ for all $M$, we conclude that $cal(L)^1 (E_2) = 0$.

2. #strong[Showing $cal(L)^1 (E_3) = 0$:] For $x in E_3$, the limit of the difference quotient does not exist, meaning the liminf and limsup of the quotient differ. Let
  
  $ D_I (f) = frac(f (b) - f (a), b - a) $
  
  for an interval $I = (a , b)$. The set $E_3$ can be expressed as:
  
  $ E_3 = union.big_(r , s in bb(Q) , s > r) E_(r , s), $
  
  where
  
  $ E_(r , s) = {x in [a , b] : liminf_(h arrow.r 0) frac(f (x + h) - f (x), h) < r < s < limsup_(h arrow.r 0) frac(f (x + h) - f (x), h)}. $
  
  It suffices to show that $cal(L)^1 (E_(r , s)) = 0$ for all rational $r , s$ with $s > r$.

  Fix $r , s$ and let $epsilon > 0$. For any $x in E_(r , s)$, there are arbitrarily small intervals $I$ containing $x$ such that $D_I (f) < r$. Using the Vitali Covering Theorem on $E_(r , s)$, we can find a finite collection of disjoint intervals ${ I_k }_(k = 1)^N$ such that $D_(I_k) (f) < r$ for all $k$, and $cal(L)^1 (E_(r , s) \\ union.big_(k = 1)^N I_k) < epsilon$. This implies $sum_(k = 1)^N cal(L)^1 (I_k) gt.eq cal(L)^1 (E_(r , s)) - epsilon$.

  Now consider the set $A = E_(r , s) inter (union.big_(k = 1)^N I_k)$. For each $x in A$, there are arbitrarily small intervals $J$ containing $x$ such that $D_J (f) > s$. Again, by the Vitali Covering Theorem on $A$, we can select a finite collection of disjoint intervals ${ J_j }_(j = 1)^M$ such that each $J_j subset union.big I_k$, $D_(J_j) (f) > s$ for all $j$, and $sum_(j = 1)^M cal(L)^1 (J_j) gt.eq cal(L)^1 (A) - epsilon = cal(L)^1 (E_(r , s)) - 2 epsilon$.

  Now, we compare the variations of $f$ over these collections of intervals:
  
  $ s sum_(j = 1)^M cal(L)^1 (J_j) <= sum_(j = 1)^M (f (sup J_j) - f (inf J_j)). $
  
  Since ${ J_j }$ are disjoint and contained in $union.big I_k$, and $f$ is monotone increasing:
  
  $ sum_(j = 1)^M (f (sup J_j) - f (inf J_j)) lt.eq sum_(k = 1)^N (f (sup I_k) - f (inf I_k)). $
  
  And from our first selection of intervals:
  
  $ sum_(k = 1)^N (f (sup I_k) - f (inf I_k)) <= r sum_(k = 1)^N cal(L)^1 (I_k). $
  
  Combining these gives: $s sum_(j = 1)^M cal(L)^1 (J_j) <= r sum_(k = 1)^N cal(L)^1 (I_k)$. Substituting our measure estimates: $s (cal(L)^1 (E_(r , s)) - 2 epsilon) <= r (cal(L)^1 (E_(r , s)) + epsilon)$. Since this holds for any $epsilon > 0$, we can let $epsilon arrow.r 0$ to get $s cal(L)^1 (E_(r , s)) lt.eq r cal(L)^1 (E_(r , s))$. As $s > r$, this inequality can only hold if $cal(L)^1 (E_(r , s)) = 0$. Since this is true for all pairs of rational numbers $r < s$, we conclude that $cal(L)^1 (E_3) = 0$.

  With $cal(L)^1 (E_1) = cal(L)^1 (E_2) = cal(L)^1 (E_3) = 0$, we have shown that $f$ is differentiable almost everywhere.
]

Since the derivative $f'$ exists a.e., we can consider its Lebesgue integral.

#theorem[
If $f : [a , b] arrow.r bb(R)$ is monotone increasing, then $f' in L^1 ([a , b])$ and $ integral_a^b f' (x) dif x lt.eq f (b) - f (a). $
]

#proof[
Extend the definition of $f$ by setting $f (x) = f (b)$ for $x > b$. For each $n in bb(N)$, define the sequence of functions:

$ g_n (x) = n [f (x + 1 / n) - f (x)]. $

Since $f$ is monotone increasing, $g_n (x) gt.eq 0$. As $f$ is differentiable a.e., $g_n (x) arrow.r f' (x)$ for almost every $x in [a , b]$. By #strong[Fatou's Lemma];:

$ integral_a^b f' (x) dif x = integral_a^b liminf_(n arrow.r oo) g_n (x) dif x lt.eq liminf_(n arrow.r oo) integral_a^b g_n (x) dif x. $

Let's evaluate the integral of $g_n$:

$ integral_a^b g_n (x) dif x = n integral_a^b f (x + 1 / n) dif x - n integral_a^b f (x) dif x. $

Using achange of variables $u = x + 1 \/ n$:

$
integral_a^b g_n (x) dif x &= n integral_(a + 1 \/ n)^(b + 1 \/ n) f (u) dif u - n integral_a^b f (x) dif x \
&= n [integral_b^(b + 1 \/ n) f (u) dif u - integral_a^(a + 1 \/ n) f (u) dif u] \
&= f (b) - n integral_a^(a + 1 \/ n) f (u) dif u.
$

Since $f$ is continuous a.e., the mean value theorem for integrals implies that for large $n$, $integral_a^(a + 1 \/ n) f (u) dif u approx 1 / n f (a)$. Formally, $lim_(n arrow.r oo) n integral_a^(a + 1 \/ n) f (u) dif u = f (a)$ at points of continuity. Thus, $liminf_(n arrow.r oo) integral_a^b g_n (x) dif x = f (b) - f (a)$. Substituting back into the Fatou's Lemma inequality, we get:

$ integral_a^b f' (x) dif x lt.eq f (b) - f (a). $
]

=== Functions of Bounded Variation

The class of monotone functions can be generalized to functions of bounded variation.

#definition(title: "Bounded Variation")[
A function $f : [a , b] arrow.r bb(R)$ is of #strong[bounded variation];, denoted $f in bv([a , b])$, if its total variation is finite. The #strong[total variation] of $f$ on $[a , b]$ is defined as:

$ tv (f ; [a , b]) := sup_P sum_(i = 1)^n abs(f (x_i) - f (x_(i - 1))), $

where the supremum is taken over all finite partitions $P = { a = x_0 < x_1 < dots.h < x_n = b }$ of the interval $[a , b]$.
]

#example[
- If $f$ is monotone increasing on $[a , b]$, its total variation is simply $tv (f ; [a , b]) = f (b) - f (a)$. Thus, all monotone functions are in $bv$.
- The function $f (x) = sin (1 \/ x)$ on $\( 0 , 1 ]$ is continuous but is #strong[not] of bounded variation. Its oscillations near zero are too rapid, causing the variation sum to diverge.
]

The key structural property of BV functions is that they can be expressed as a difference of two monotone functions.

#theorem(title: "Jordan Decomposition")[
A function $f in bv([a , b])$ if and only if it can be written as the difference of two monotone increasing functions.
]

#proof[
- *$arrow.l.double$:* If $f = g - h$ where $g , h$ are monotone increasing, then for any partition $P$,
  
  $
  sum abs(f (x_i) - f (x_(i - 1))) &lt.eq sum abs(g (x_i) - g (x_(i - 1))) + sum abs(h (x_i) - h (x_(i - 1))) \
  &= sum (g (x_i) - g (x_(i - 1))) + sum (h (x_i) - h (x_(i - 1))) \
  &= [g (b) - g (a)] + [h (b) - h (a)] < oo.
  $
  
  Thus, $f in bv([a , b])$.

- *$arrow.r.double$:* Assume $f in bv[a , b])$. We define two functions, the #strong[positive variation function] $P_f (x)$ and the #strong[negative variation function] $N_f (x)$, for $x in [a , b]$ as follows:

  $ P_f (x) = sup_P sum_(i = 1)^n max { f (x_i) - f (x_(i - 1)) , 0 }, $

  $ N_f (x) = sup_P sum_(i = 1)^n max { f (x_(i - 1)) - f (x_i) , 0 }, $

  where the supremum is taken over all finite partitions $P$ of the interval $[a , x]$. It can be shown that both $P_f$ and $N_f$ are well-defined, non-negative, and monotone increasing functions on $[a , b]$.

  Furthermore, it can be proven that for any $x in [a , b]$, the following identity holds: $ f (x) - f (a) = P_f (x) - N_f (x) . $ Let's define $g (x) = P_f (x) + f (a)$ and $h (x) = N_f (x)$. Both $g$ and $h$ are monotone increasing functions, and we have $f (x) = g (x) - h (x)$. This completes the proof.
]

An immediate and powerful consequence is:

#corollary[
If $f in bv([a , b])$, then $f$ is differentiable almost everywhere, and its derivative $f'$ is Lebesgue integrable, i.e., $f' in L^1 ([a , b])$.
]

=== Absolutely Continuous Functions

We saw that for a monotone function (and thus for a BV function), we only have the inequality $integral_a^b f' lt.eq f (b) - f (a)$. To achieve equality and fully restore the Fundamental Theorem of Calculus, we need a stronger condition than continuity or bounded variation. This condition is absolute continuity.

#definition(title: "Absolute Continuity")[
A function $f : [a , b] arrow.r bb(R)$ is #strong[absolutely continuous];, denoted $f in ac([a , b])$, if for every $epsilon > 0$, there exists a $delta > 0$ such that for any finite collection of pairwise disjoint subintervals $(a_k , b_k) subset [a , b]$: if

$ sum_(k = 1)^n (b_k - a_k) < delta, $

then

$ sum_(k = 1)^n abs(f (b_k) - f (a_k)) < epsilon. $
]

An absolutely continuous function is uniformly continuous and of bounded variation. Therefore, $ac([a , b]) subset C^0 ([a , b]) inter bv([a , b])$.

#example[
The Cantor function is an example of a function that is continuous and of bounded variation but is not absolutely continuous.
]

We first consider a special subset of $ac([a , b])$: Lipschitz continuous functions.

#definition[
A function $f$ is *Lipschitz continuous* if there exists a constant $M > 0$ such that for all $x, y in [a, b]$,
$
abs(f(x) - f(y)) <= M abs(x - y).
$
]

Let's establish two facts:

#proposition[
If $f in L^oo ([a , b])$ with $norm(f)_(L^oo) lt.eq M$, then its integral $F = I (f)$ is Lipschitz continuous with a Lipschitz constant at most $M$.
]<prp:lip1>

#proof[
For any $x , y in [a , b]$ with $y > x$:

$ abs(F (y) - F (x)) = abs(integral_x^y f (t) dif t) lt.eq integral_x^y abs(f (t)) dif t lt.eq M (y - x). $
]

#proposition[
If $F in ac([a , b])$ and its derivative $F'$ is bounded, i.e., $F' in L^oo ([a , b])$, then $integral_a^c F' (x) dif x = F (c) - F (a)$ for all $c in [a , b]$.
]

#proof[
The derivative $F' (x)$ exists almost everywhere. We can write $F' (x)$ as the limit of difference quotients:

$ F' (x) = lim_(n arrow.r oo) F_n (x) , quad "where" quad F_n (x) = n [F (x + 1 / n) - F (x)]. $

Since $F$ is Lipschitz with constant $M$, we have $abs(F_n (x)) lt.eq n dot.op M dot.op 1 / n = M$. Because the sequence $F_n$ is uniformly bounded and converges pointwise a.e. to $F'$, we can apply the Dominated Convergence Theorem:

$
integral_a^c F' (x) dif x &= lim_(n arrow.r oo) integral_a^c F_n (x) dif x \
&= lim_(n arrow.r oo) n integral_a^c [F (x + 1 / n) - F (x)] dif x \
&= lim_(n arrow.r oo) n (integral_(a + 1 \/ n)^(c + 1 \/ n) F (u) d u - integral_a^c F (x) dif x) \
&= lim_(n arrow.r oo) n (integral_c^(c + 1 \/ n) F (u) d u - integral_a^(a + 1 \/ n) F (u) d u).
$

By the continuity of $F$, this limit evaluates to $F (c) - F (a)$.
]


#theorem(title: "Complete Characterization of AC Functions")[
The differentiation operator $D : F mapsto F'$ defines a vector space isomorphism from the quotient space $ac([a , b]) \/ bb(R)$ to $L^1 ([a , b])$.
]

#proof[
Define the integration operator $I$ as:
$ (I f) (x) = integral_a^x f (t) dif t $

To prove this theorem, we will demonstrate that $D$ and $I$ are inverse operators when acting on the specified spaces. Specifically, we need to prove two main points:

- For any $f in L^1 ([a , b])$, $D (I f) = f$ almost everywhere.
- For any $F in ac([a , b])$, $I (D F) = F$ up to an additive constant.

The proof is structured in the following steps.

+ #strong[The Operator $I$ Maps $L^1$ to $ac$:] A standard result in Lebesgue theory is that if $f in L^1 ([a , b])$, then its indefinite integral $F (x) = integral_a^x f (t) dif t$ is an absolutely continuous function. Furthermore, the operator $I$ is injective. If $(I f) (x) = 0$ for all $x in [a , b]$, then $integral_a^x f (t) dif t = 0$. By the Lebesgue Differentiation Theorem, this implies $f (x) = 0$ for almost every $x$, so $f$ is the zero element in $L^1 ([a , b])$.
  
+ #strong[Proving $D compose I = upright("id")$ on $L^1 ([a , b])$:] We now show that for any $f in L^1 ([a , b])$, the derivative of its integral $F = I f$ is equal to $f$ a.e. (i.e., $D (I f) = f$).

  By the linearity of the operators, we can assume $f gt.eq 0$. Consider the sequence of bounded functions $f_n (x) = min (f (x) , n)$. Each $f_n in L^oo ([a , b])$, and by the Monotone Convergence Theorem, $integral f_n arrow.r integral f$.

  Let $F_n = I f_n$. From @prp:lip1, we know that $F_n$ is Lipschitz and $D F_n = f_n$ a.e. Now, let $F = I f$. We have:
  
  $ F (x) = integral_a^x f (t) dif t gt.eq integral_a^x f_n (t) dif t = F_n (x). $
  
  This implies that the function $G_n (x) = F (x) - F_n (x)$ is non-decreasing, and thus its derivative $G'_(n) (x)$ exists a.e. and is non-negative.

  Therefore, $F' (x)$ exists a.e. and satisfies:
  
  $ F' (x) = F'_(n) (x) + G'_(n) (x) = f_n (x) + G'_(n) (x) gt.eq f_n (x). $
  
  Since this holds for all $n$, taking the limit as $n arrow.r oo$ gives $F' (x) gt.eq f (x)$ a.e.

  On the other hand, by Fatou's Lemma for derivatives, $integral_a^b F' (x) dif x lt.eq F (b) - F (a)$. We also know that $F (b) - F (a) = integral_a^b f (x) dif x$. Combining these gives: $ integral_a^b F' (x) dif x lt.eq integral_a^b f (x) dif x $ Since we have already shown that $F' (x) gt.eq f (x)$ a.e., the above inequality can only hold if $F' (x) = f (x)$ a.e. This completes the proof that $D compose I = upright("id")$.

+ #strong[Proving $I compose D = upright("id")$ on $ac([a , b]) \/ bb(R)$:] Finally, we show that for any $F in ac([a , b])$, integrating its derivative returns the original function (up to aconstant):
  
  $ F (x) - F (a) = integral_a^x F' (t) dif t. $
  
  To prove this, we only need to show that if $G in ac([a , b])$ has a derivative that is zero almost everywhere, then $G$ must be a constant function.

  Let $G in ac([a , b])$ with $G' = 0$ a.e. We want to show $G (c) = G (a)$ for any $c in (a , b ]$. Let $E = { x in [a , c] : G' (x) "does not exist or" G' (x) eq.not 0 }$. By our assumption, the Lebesgue measure of $E$ is zero, $cal(L)^1 (E) = 0$. For any $epsilon > 0$, since $G$ is absolutely continuous, there exists a $delta > 0$ such that for any finite collection of disjoint intervals $(a_k , b_k)$ with $sum (b_k - a_k) < delta$, we have $sum abs(G (b_k) - G (a_k)) < epsilon$. Since $cal(L)^1 (E) = 0$, we can cover $E$ with a finite collection of disjoint open intervals $(a_k , b_k)$ such that $sum (b_k - a_k) < delta$. Then, by the definition of absolute continuity, the total variation of $G$ over these intervals is arbitrarily small:
  
  $ sum_(k = 1)^n abs(G (b_k) - G (a_k)) < epsilon . $

  Consider the remaining part of the interval $[a , c]$, which is $[a , c] \\ union.big_(k = 1)^n (a_k , b_k)$. On this set, the derivative of $G$ is $0$. This implies that $G$ is constant on each subinterval of this remaining set, and thus the total variation of $G$ on this set is $0$. Since $[a , c]$ is the union of these two types of sets, and the total variation of $G$ on a finite union of sets is bounded by the sum of the total variations on each set, we have:
  
  $ abs(G (c) - G (a)) lt.eq sum abs(G (b_k) - G (a_k)) + tv (G ; ([a , c] \\ union.big (a_k , b_k))) < epsilon + 0 = epsilon . $
  
  Since $epsilon$ can be chosen arbitrarily small, we must have $abs(G (c) - G (a)) = 0$, which means $G (c) = G (a)$. Therefore, $G$ is a constant function.

This completes the proof of the main theorem.
]

#remark[
1. Every $L^1$ function has an absolutely continuous indefinite integral. , unique up to a constant, given by:
$ (D^(-1) f) (x) = integral_a^x f(y) dif y, quad forall f in L^1([a, b]). $

2. he space $ac([a,b])$ is a Banach space when equipped with the norm:

  $
  norm(F)_ac := norm(F)_(L^infinity) + norm(F')_(L^1).
  $
  
  Moreover, $ac([a,b])$ is a closed subspace of the larger space of functions of bounded variation, $bv([a,b])$.
]

The relationship between these function spaces can be understood more deeply through the lens of measure theory.

- #strong[Structure of the Derivative of a BV Function];: For a function $F in bv( [ a , b ] )$, its derivative in the sense of distributions, $D F$, is a finite Radon measure. This measure can be decomposed via the Radon-Nikodym theorem into two parts with respect to the Lebesgue measure $cal(L)^1$:

  $ D F = F' cal(L)^1 + mu_"s". $

  where $F' in L^1$ is the absolutely continuous part (the part that we integrate) and $mu_"s"$ is the singular part, which is concentrated on a set of Lebesgue measure zero. The failure of the FTC for general BV functions is due to the presence of a non-zero singular part $mu_"s"$. For the Cantor function, $F'$ is zero a.e., and its entire "growth" is captured by a singular measure.

- #strong[Generalization to Higher Dimensions];: The concept of bounded variation can be extended to functions defined on a domain $Omega subset bb(R)^d$. A function $F in L^1 (Omega)$ is in $bv(Omega)$ if its distributional derivative $D F$ is a vector-valued Radon measure with finite total mass on $Omega$. That is,

  $ F in bv(Omega) arrow.l.r.double D F in cal(M) ( Omega). $
  
  This generalization is fundamental in areas like geometric measure theory, calculus of variations, and the study of partial differential equations.