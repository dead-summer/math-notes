#import "../book.typ": *

#show: book-page.with(
  title: "1.3 Measures"
)

== Measures

=== Fundamental Properties of Measures

In mathematics, a #strong[measure] is a function that systematically assigns a "size", "volume", or "probability" to subsets of a given set. To define a measure, we must first specify the collection of subsets we intend to measure. This collection is known as a $sigma$-algebra.

#definition(title: "Measurable Space")[
Let $X$ be a non-empty set and $cal(F)$ be a $sigma$-algebra on $X$. The pair $(X , cal(F))$ is called a #strong[measurable space];, and the sets in $cal(F)$ are called #strong[measurable sets];.
]

With the structure of a measurable space, we can now define a measure.

#definition(title: "Measure")[
Let $(X , cal(F))$ be a measurable space. A function $mu : cal(F) arrow.r [ 0 , + oo ]$ is called a #strong[measure] on $(X , cal(F))$ if it satisfies the following two properties:
1. #strong[Null Empty Set:] $mu (nothing) = 0$.
2. #strong[Countable Additivity (or $sigma$-additivity):] For any sequence ${ E_j }_(j = 1)^oo$ of pairwise disjoint sets in $cal(F)$ (i.e., $E_j inter E_k = nothing$ for $j eq.not k$), we have
   $ mu (union.big.sq_(j = 1)^oo E_j) = sum_(j = 1)^oo mu (E_j). $
]

The triplet $(X , cal(F) , mu)$ is called a #strong[measure space];.

Several key properties are direct consequences of the definition of a measure.

#proposition[
Let $(X , cal(F) , mu)$ be a measure space.
1. #strong[Monotonicity:] If $E , F in cal(F)$ and $E subset.eq F$, then $mu (E) lt.eq mu (F)$.
2. #strong[Countable Subadditivity:] If ${ E_j }_(j = 1)^oo$ is any sequence of measurable sets in $cal(F)$ (not necessarily disjoint), then
   $ mu (union.big_(j = 1)^oo E_j) lt.eq sum_(j = 1)^oo mu (E_j). $
3. #strong[Continuity from Below:] If ${ E_j }_(j = 1)^oo$ is an increasing sequence of measurable sets (i.e., $E_1 subset.eq E_2 subset.eq dots.h$), then
   $ mu (union.big_(j = 1)^oo E_j) = lim_(j arrow.r oo) mu (E_j). $
4. #strong[Continuity from Above:] If ${ E_j }_(j = 1)^oo$ is a decreasing sequence of measurable sets (i.e., $E_1 supset.eq E_2 supset.eq dots.h$) and $mu (E_1) < oo$, then
   $ mu (inter.big_(j = 1)^oo E_j) = lim_(j arrow.r oo) mu (E_j). $
]

#proof[
1. Since $E subset.eq F$, we can write $F = E union (F \\ E)$, where $E$ and $F \\ E$ are disjoint measurable sets. By additivity, $mu (F) = mu (E) + mu (F \\ E)$. Since $mu (F \\ E) gt.eq 0$, we have $mu (F) gt.eq mu (E)$.
2. Define a new sequence of pairwise disjoint sets ${ F_j }_(j = 1)^oo$ by $F_1 = E_1$ and $F_j = E_j \\ union.big_(i = 1)^(j - 1) E_i$ for $j > 1$. Then $union.big_(j = 1)^oo F_j = union.big_(j = 1)^oo E_j$ and each $F_j subset.eq E_j$. By countable additivity and monotonicity, $mu (union.big_(j = 1)^oo E_j) = mu (union.big_(j = 1)^oo F_j) = sum_(j = 1)^oo mu (F_j) lt.eq sum_(j = 1)^oo mu (E_j)$.
]

#remark[
The condition $mu (E_1) < oo$ in property (4) is essential. For example, consider the Lebesgue measure $cal(L)^1$ on $bb(R)$ and the sets $E_n = \[ n , + oo \)$. Then $E_1 supset.eq E_2 supset.eq dots.h$, and $mu (E_n) = oo$ for all $n$. However, $inter.big_(n = 1)^oo E_n = nothing$, so $mu (inter.big_(n = 1)^oo E_n) = 0$, while $lim_(n arrow.r oo) mu (E_n) = oo$.
]

Measures are often classified based on the "total size" of the space $X$.

#definition[
Let $(X , cal(F) , mu)$ be a measure space.

+ $mu$ is *finite* if $mu (X) < oo$.

+ $mu$ is *$sigma$-finite* if there exists a sequence of sets ${E_j}_(j = 1)^oo subset.eq cal(F)$ such that $X = union.big_(j = 1)^oo E_j$ and $mu (E_j) < oo$ for all $j gt.eq 1$.

+ $mu$ is *semifinite* if for every set $E in cal(F)$ with $mu (E) = oo$, there exists a subset $F in cal(F)$ with $F subset.eq E$ such that $0 < mu (F) < oo$.
]

#exercise[
Every $sigma$-finite measure is semifinite, but the converse is not true.
]

#proof[
- *$sigma$-finite $arrow.r.double$ semifinite:* Let $mu$ be $sigma$-finite, so $X = union.big_(j = 1)^infinity E_j$ with $mu (E_j) < oo$. Let $A in cal(F)$ be a set with $mu (A) = oo$. Then $A = A inter X = union.big_(j = 1)^oo (A inter E_j)$. By subadditivity, $mu (A) lt.eq sum_(j = 1)^oo mu (A inter E_j)$. Since $mu (A) = oo$, there must be at least one $j$ for which $mu (A inter E_j) > 0$. Let $F = A inter E_j$. Then $F subset.eq A$ and by monotonicity, $mu (F) = mu (A inter E_j) lt.eq mu (E_j) < oo$. Thus, we have found a set $F$ such that $0 < mu (F) < oo$.

- *semifinite $arrow.r.double.not$ $sigma$-finite*: Let $X$ be an uncountable set and $cal(F) = cal(P) (X)$ be the power set of $X$. Consider the counting measure $mu$ on $(X , cal(F))$. For any set $E subset.eq X , mu (E)$ is the number of elements in $E$.

  - This measure is semifinite: If $mu (E) = oo$, then $E$ is an infinite set. We can pick any single element $x in E$ and let $F = { x }$. Then $F subset.eq E$ and $0 < mu(F) = 1 < infinity$.
  - This measure is not $sigma$-finite: An uncountable set cannot be expressed as a countable union of finite sets. Any set $E_j$ with $mu (E_j) < oo$ must be finite. A countable union of finite sets is countable, but $X$ is uncountable.
]


#example[
1. #strong[Counting Measure:] For any set $X$ with $sigma$-algebra $cal(P) (X)$, the counting measure is defined as:
   $ mu (E) = cases(delim: "{",
   abs(E) & "if" E "is finite",
   oo & "if" E "is infinite"
   ) $
   This is often denoted by $cal(H)^0$, the 0-dimensional Hausdorff measure.
2. #strong[Dirac Measure:] Let $X$ be any set and fix a point $x_0 in X$. The Dirac measure centered at $x_0$ is defined on $(X , cal(P) (X))$ as:
   $ delta_(x_0) (E) = cases(delim: "{",
   1 & "if" x_0 in E,
   0 & "if" x_0 in.not E
   ) $
   This can also be written using the indicator function as $delta_(x_0) (E) := indicator_E (x_0)$.
3. #strong[Lebesgue Measure:] The Lebesgue measure $cal(L)^n$ on $bb(R)^n$ is the standard way of assigning a volume to subsets of Euclidean space. It is the unique measure that assigns a volume of $product_(i = 1)^n (b_i - a_i)$ to any rectangular box $product_(i = 1)^n [ a_i , b_i ]$.
4. #strong[Hausdorff Measure:] The $k$-dimensional Hausdorff measure $cal(H)^k$ generalizes the notion of length, area, and volume to non-integer dimensions and is defined on any metric space. On $bb(R)^n$, the Hausdorff measure $cal(H)^n$ coincides with the Lebesgue measure $cal(L)^n$.
5. #strong[Restriction of a Measure:] Let $(X , cal(F) , mu)$ be a measure space and let $E in cal(F)$ be a fixed measurable set. We can define a new measure $mu_E$ on $(X , cal(F))$ by
   $ mu_E (F) := mu (E inter F) quad "for any" F in cal(F). $
]

=== The Completion of a Measure

A key practical consideration is how a measure space handles subsets of "zero-measure" sets.

#definition[
Let $(X , cal(F) , mu)$ be a measure space. A set $E in cal(F)$ is called a #strong[$mu$-null set] if $mu (E) = 0$.
]

#definition(title: "Complete Measure Space")[
A measure space $(X , cal(F) , mu)$ is said to be #strong[complete] if for any $mu$-null set $N in cal(F)$, every subset of $N$ is also a member of $cal(F)$. That is, if $N in cal(F)$ with $mu (N) = 0$, and $B subset.eq N$, then $B in cal(F)$ (which implies $mu (B) = 0$ by monotonicity).
]

Completeness is a desirable property because it ensures that all subsets of negligible sets are themselves measurable and negligible, which aligns with intuition. The Lebesgue measure is a complete measure.

If a measure space is not complete, it can always be extended to a complete one. This process is called completion.

#proposition[
Let $(X , cal(F) , mu)$ be a measure space. Let $cal(Z) = { N in cal(F) : mu (N) = 0 }$ be the collection of $mu$-null sets. Define the collection of sets $overline(cal(F))$ by
$ overline(cal(F)) := { A union B : A in cal(F) "and" B subset.eq N "for some" N in cal(Z) }. $
Then $overline(cal(F))$ is a $sigma$-algebra, and there exists a unique measure $overline(mu)$ on $overline(cal(F))$ such that: 
- $overline(mu)$ is an extension of $mu$ (i.e., $overline(mu) (A) = mu (A)$ for all $A in cal(F)$).
- The measure space $(X , overline(cal(F)) , overline(mu))$ is complete.
]

#proof[
1. #strong[Prove that $overline(cal(F))$ is a $sigma$-algebra.]
  - #strong[Closure under countable unions:] Let ${ E_j = A_j union B_j }_(j = 1)^oo$ be a sequence in $overline(cal(F))$, where $A_j in cal(F)$ and $B_j subset.eq N_j in cal(Z)$. Then $union.big E_j = (union.big A_j) union (union.big B_j)$. Since $cal(F)$ is a $sigma$-algebra, $union.big A_j in cal(F)$. Further, $union.big B_j subset.eq union.big N_j$. Since $mu (union.big N_j) lt.eq sum mu (N_j) = 0$, $union.big N_j in cal(Z)$. Thus, $union.big E_j in overline(cal(F))$.
  - #strong[Closure under complementation:] Let $E = A union B in overline(cal(F))$, with $A in cal(F)$ and $B subset.eq N in cal(Z)$. The complement is
   $ X \\ (A union B) &= (X \\ A) inter (X \\ B) \
   &= (X \\ A) inter ((X \\ N) union (N \\ B) ) \
   &= underbrace(((X \\ A) inter (X \\ N)), in cal(F)) union underbrace(((X \\ A) inter (N \\ B)), subset.eq N in cal(Z))). $
   This shows $X \\ E in overline(cal(F))$. Since $overline(cal(F))$ is closed under countable unions and complementation, it is a $sigma$-algebra.
2. #strong[Show the existence and properties of $overline(mu)$.]
  - #strong[Definition:] For any $E = A union B in overline(cal(F))$ (with $A in cal(F)$, $B subset.eq N in cal(Z)$), we define $overline(mu) (E) := mu (A)$.
  - #strong[Well-definedness:] Suppose $A_1 union B_1 = A_2 union B_2$, where $B_i subset.eq N_i in cal(Z)$. Then $A_1 subset.eq A_2 union B_2 subset.eq A_2 union N_2$. By monotonicity and subadditivity of $mu$, $mu (A_1) lt.eq mu (A_2 union N_2) lt.eq mu (A_2) + mu (N_2) = mu (A_2)$. By symmetry, $mu (A_2) lt.eq mu (A_1)$. Therefore, $mu (A_1) = mu (A_2)$, and $overline(mu)$ is well-defined.
  - #strong[$overline(mu)$ is a measure:] It is straightforward to show that $overline(mu) (nothing) = 0$ and that $overline(mu)$ is countably additive (using the fact that if ${ A_i union B_i }$ are disjoint, then the sets ${ A_i }$ must also be disjoint).
  - #strong[Completeness:] Let $E in overline(cal(F))$ with $overline(mu) (E) = 0$. By definition, $E = A union B$ where $mu (A) = 0$ and $B subset.eq N in cal(Z)$. Thus $E subset.eq A union N$. Since $mu (A union N) lt.eq mu (A) + mu (N) = 0$, $A union N in cal(Z)$. Any subset $tilde(E) subset.eq E$ is also a subset of $A union N$. We can write $tilde(E) = nothing union tilde(E)$, where $nothing in cal(F)$. This shows $tilde(E) in overline(cal(F))$. Hence, $(X , overline(cal(F)) , overline(mu))$ is complete.
2. #strong[Prove uniqueness.] Suppose $nu$ is another measure on $overline(cal(F))$ that extends $mu$ and is complete. For any $E = A union B in overline(cal(F))$, we have $A subset.eq E subset.eq A union N$. By monotonicity of $nu$, $nu (A) lt.eq nu (E) lt.eq nu (A union N)$. Since $nu$ extends $mu$, $nu (A) = mu (A)$ and $nu (N) = mu (N) = 0$. Thus $nu (A union N) lt.eq nu (A) + nu (N) = mu (A)$. This implies $mu (A) lt.eq nu (E) lt.eq mu (A)$, so $nu (E) = mu (A) = overline(mu) (E)$. The measure is unique.

The measure $overline(mu)$ is called the #strong[completion] of $mu$, and $overline(cal(F))$ is the #strong[completion] of $cal(F)$ with respect to $mu$.
]
