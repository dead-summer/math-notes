#import "../book.typ": *

#show: book-page.with(
  title: "2.4 On the Density of Functions"
)

== On the Density of Functions

In functional analysis and measure theory, a fundamental concept is the #strong[density] of a subspace of functions within a larger function space. A subset $S$ of a metric space $X$ is said to be #strong[dense] in $X$ if every element of $X$ can be arbitrarily well-approximated by elements of $S$. Formally, for any $x in X$ and any $epsilon > 0$, there exists an $s in S$ such that the distance $dist(x , s) < epsilon$.

The significance of density lies in its powerful utility for proofs. If a property holds for all functions in a dense subset and this property is preserved under the limiting process (i.e., it is continuous with respect to the space's topology), then the property can be extended to the entire space.



=== Density of Simple Functions in $L^1 (mu)$

Simple functions are functions that take on only a finite number of values. They are the foundational elements upon which the theory of Lebesgue integration is built. It is a crucial and foundational result that these "simple" building blocks are sufficient to approximate any integrable function.

#proposition[
The set of integrable simple functions is dense in $L^1 (mu)$.

That is, for any function $f in L^1 (mu)$, there exists a sequence of simple functions ${ phi.alt_n }_(n = 1)^oo$ such that: $ lim_(n arrow.r oo) norm(phi.alt_n - f)_(L^1) = lim_(n arrow.r oo) integral abs(phi.alt_n - f) thin d mu = 0 . $
]

#proof[
+ #strong[Decomposition of $f$:] Let $f$ be a function in $L^1 (mu)$. We can decompose $f$ into its real and imaginary parts, $f = Re(f) + imUnit Im(f)$. Furthermore, any real-valued function can be expressed as the difference of its positive and negative parts, e.g., $Re(f) = (Re(f))^(+) - (Re(f))^(-)$. If we can find sequences of simple functions that converge in the $L^1$ norm to each of these four non-negative components, then a linear combination of these sequences will converge to $f$. Therefore, without loss of generality, we can assume $f$ is a real-valued, non-negative function, i.e., $f gt.eq 0$.

+ #strong[Pointwise Approximation from Below:] A standard theorem in measure theory states that for any non-negative measurable function $f$, there exists a sequence of non-negative simple functions ${ phi.alt_n }_(n = 1)^oo$ satisfying:

  - $0 lt.eq phi.alt_1 (x) lt.eq phi.alt_2 (x) lt.eq dots.h.c lt.eq phi.alt_n (x) lt.eq dots.h.c lt.eq f (x)$ for all $x$.
  - $lim_(n arrow.r oo) phi.alt_n (x) = f (x)$ for every $x$.

+ #strong[Application of the Dominated Convergence Theorem:] We need to show that this pointwise convergence implies convergence in the $L^1$ norm. Consider the sequence of non-negative functions ${ f - phi.alt_n }_(n = 1)^oo$.

  - #strong[Pointwise Convergence:] From the construction above, $lim_(n arrow.r oo) (f (x) - phi.alt_n (x)) = 0$ for all $x$.
  - #strong[Domination:] Since $0 lt.eq phi.alt_n lt.eq f$, we have $0 lt.eq f - phi.alt_n lt.eq f$. The function $f$ itself serves as an integrable dominant function, as we assumed $f in L^1 (mu)$.

  By Lebesgue's Dominated Convergence Theorem, we are permitted to interchange the limit and the integral: $ lim_(n arrow.r oo) norm(f - phi.alt_n)_(L^1) = lim_(n arrow.r oo) integral abs(f - phi.alt_n) thin d mu = lim_(n arrow.r oo) integral (f - phi.alt_n) thin d mu $ $ = integral lim_(n arrow.r oo) (f - phi.alt_n) thin d mu = integral 0 thin d mu = 0 . $ This completes the proof.
]


=== Density of Continuous Functions with Compact Support

For function spaces defined on topological spaces such as $bb(R)^n$, an even more powerful result is that the space of continuous functions with compact support is dense. This allows the techniques of classical analysis to be applied to the more abstract framework of Lebesgue integration.

#definition[
The space $C^0_c (bb(R))$ consists of all continuous functions $f : bb(R) arrow.r bb(R)$ for which the support of $f$, defined as $supp(f) := overline({ x in bb(R) : f (x) eq.not 0 })$, is a compact set.
]

#theorem[
Let $mu$ be a Lebesgue-Stieltjes measure on $(bb(R) , cal(B) (bb(R)))$. The space $C^0_c (bb(R))$ is dense in $L^1 (mu)$.
]

#proof[
The proof proceeds by a multi-stage approximation, using the triangle inequality. For any $f in L^1 (mu)$ and any $epsilon > 0$, we seek a function $g in C^0_c (bb(R))$ such that $norm(f - g)_(L^1) < epsilon$. We aindicatoreve this by finding an intermediate simple function $phi.alt$. The goal is to show: $ norm(f - g)_(L^1) lt.eq norm(f - phi.alt)_(L^1) + norm(phi.alt - g)_(L^1) < epsilon . $

+ #strong[Approximate $f$ with a Simple Function:] From the previous theorem, we know that simple functions are dense in $L^1 (mu)$. Thus, for a given $epsilon > 0$, we can find a simple function $phi.alt = sum_(j = 1)^n alpha_j indicator_(E_j)$ such that $norm(f - phi.alt)_(L^1) < epsilon \/ 2$. We can construct $phi.alt$ such that each set $E_j$ has finite measure.

+ #strong[Approximate the Simple Function with a Continuous Function:] By the linearity of the integral and the triangle inequality, it suffices to approximate each characteristic function $indicator_(E_j)$ by a continuous function with compact support.

  This is possible due to a key property of Lebesgue-Stieltjes measures: #strong[regularity];. A measure $mu$ is regular if for any measurable set $E$ with $mu (E) < oo$, and any $delta > 0$, there exists a compact set $K$ and an open set $O$ such that: $ K subset.eq E subset.eq O quad "and" quad mu (O \\ K) < delta . $

  Using this property, we can construct a continuous function $g_j$ that "bridges the gap" between $K$ and $O$. By #strong[Urysohn's Lemma] (or by direct construction in $bb(R)$), there exists a continuous function $g_j : bb(R) arrow.r [0 , 1]$ such that $g_j (x) = 1$ for all $x in K$ and $g_j (x) = 0$ for all $x in.not O$. Since $O$ can be chosen to be bounded (as $mu (E)$ is finite), $g_j$ will have compact support.

  The $L^1$ distance between $indicator_(E_j)$ and $g_j$ can then be bounded: $ norm(indicator_(E_j) - g_j)_(L^1) = integral abs(indicator_(E_j) (x) - g_j (x)) thin d mu (x) . $ The integrand is non-zero only on the set $O \\ K$. On this set, $abs(indicator_(E_j) (x) - g_j (x)) lt.eq 1$. Therefore: $ integral_(O \\ K) abs(indicator_(E_j) - g_j) thin d mu lt.eq integral_(O \\ K) 1 thin d mu = mu (O \\ K) < delta . $ By choosing $delta$ appropriately small for each $j$, we can construct a function $g = sum_(j = 1)^n alpha_j g_j in C^0_c (bb(R))$ such that $norm(phi.alt - g)_(L^1) < epsilon \/ 2$.

Combining these two approximation steps establishes that for any $f in L^1 (mu)$, we can find $g in C^0_c (bb(R))$ such that $norm(f - g)_(L^1) < epsilon$, which proves the density.
]

