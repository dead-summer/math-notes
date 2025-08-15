#import "../book.typ": *

#show: book-page.with(
  title: "1.1 Motivation for Measure Theory"
)

== Motivation for Measure Theory

In analysis, we often seek to generalize the intuitive concepts of length, area, and volume to more complex sets in $bb(R)^n$. The #strong[Lebesgue measure];, denoted by $cal(L)^n$, is a formal construction that accomplishes this. Ideally, we would want this generalized "n-dimensional volume" function to satisfy a few natural properties.

Let's consider a function $mu : cal(P) (bb(R)^n) arrow.r [ 0 , oo ]$, where $cal(P) (bb(R)^n)$ is the power set of $bb(R)^n$ (the set of all subsets of $bb(R)^n$). We desire this function to have the following properties:

+ #strong[Countable Additivity];: For any #strong[countable collection] of #strong[pairwise disjoint] sets ${ E_i }_(i = 1)^oo$, where $E_i subset.eq bb(R)^n$ for all $i$, the measure of the union should be the sum of the measures. $ mu (union.big.sq_(i = 1)^oo E_i) = sum_(i = 1)^oo mu (E_i). $

+ #strong[Invariance under Isometries];: The measure of a set should not change if the set is translated, rotated, or reflected. If a set $E subset.eq bb(R)^n$ is congruent to another set $E' subset.eq bb(R)^n$, then their measures must be equal. $ mu (E) = mu (E'). $

+ #strong[Normalization];: The measure of the unit hypercube must be 1. This sets the scale for our volume function. $ mu ([ 0 , 1 ]^n) = 1. $

A pivotal result in set theory reveals that it is #strong[impossible] to construct a function that satisfies all three of these properties simultaneously if its domain is the entire power set $cal(P) (bb(R)^n)$ for $n gt.eq 1$.

To resolve this impossibility, we must abandon the goal of measuring #emph[every] subset of $bb(R)^n$. Instead, we restrict the domain of our measure function to a smaller, more "well-behaved" collection of subsets. This collection is known as a #strong[$sigma$-algebra] (or sigma-field). The members of this collection are called #strong[measurable sets];.

Therefore, the objective of measure theory is to define a measure, such as the Lebesgue measure $cal(L)^n$, on a suitable $sigma$-algebra of subsets of $bb(R)^n$ that is large enough to include all the sets we typically encounter in analysis (e.g., open sets, closed sets, intervals) while still satisfying the desired properties of countable additivity, isometry invariance, and normalization.