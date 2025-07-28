#import "../book.typ": *

#show: book-page.with(
  title: "5.1 Baire Category Theorem"
)

== Baire Category Theorem
<an-introduction-to-the-baire-category-theorem>
In mathematics, particularly in topology and analysis, we often need to classify the "size" of a set. There are two primary perspectives for this classification: one is measure-theoretic, and the other is topological.

+ #strong[Analytic Perspective (Measure Theory):] This viewpoint uses the concept of measure. A set is considered "small" if it is a #strong[null set] (a set of measure zero). A typical element of a space is then a #strong[random point];, understood in the context of a probability measure.
+ #strong[Topological Perspective (Baire Category):] This viewpoint uses topological properties like denseness and interior. A set is considered "small" if it is a #strong[meagre set];. A typical element of a space is one belonging to a #strong[generic set] (a residual set).

The Baire Category Theorem is a cornerstone of the topological perspective.

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,left,),
    table.header([], [#strong[Topological Size (Category)];], [#strong[Analytical Size (Measure)];],),
    table.hline(),
    [#strong[Small];], [Meagre Set (First Category)], [Null Set (Measure Zero)],
    [#strong[Big];], [Residual Set (Second Category)], [Set of Positive Measure],
  )]
  , kind: table,
  caption: [A set is big or small from different perspectives]
  )


=== The Baire Category Theorem and Its Corollaries

Let $(X, d)$ be a metric space.

#definition[
A subset $E subset.eq X$ is called #strong[nowhere dense] if its closure $overline(E)$ has an empty interior. That is, $ interior(overline(E)) = nothing. $
]

#example[
The Cantor set $C$ in $[0, 1]$ is nowhere dense. It is a closed set ($C = overline(C)$), and it can be shown that it contains no open interval, so its interior is empty.
]

#example[
The set of rational numbers $bb(Q)$ is #strong[not] nowhere dense in $bb(R)$. While its interior is empty ($interior(bb(Q)) = nothing$), its closure is the entire real line ($overline(bb(Q)) = bb(R)$), so $interior(overline(bb(Q))) = interior(bb(R)) = bb(R) eq.not nothing$.
]

#definition[
A subset $E subset.eq X$ is #strong[meagre] (or of the #strong[first category];) if it can be expressed as a countable union of nowhere dense sets. $ E = union.big_(n = 1)^oo E_n, $
where each $E_n$ is nowhere dense.
]

#example[
The set of rational numbers $bb(Q)$ is meagre in $bb(R)$. We can write $bb(Q)$ as a countable union of singletons: $bb(Q) = union.big_(q in bb(Q)) { q }$. Each singleton ${ q }$ is a closed set with an empty interior, so it is nowhere dense. Since $bb(Q)$ is countable, this is a countable union.
]

#definition[
- A set $E subset.eq X$ is #strong[residual] (or #strong[comeagre];) if its complement $X \\ E$ is meagre.
- A set that is not meagre is called #strong[of the second category].
]

Let $X$ be a metric space.

#proposition[
1. Any subset of a meagre set is meagre.
2. The collection of meagre sets is closed under countable unions.
3. The collection of residual sets is closed under countable interinterions.
4. In a metric space $X$, any countable interinterion of dense open sets is a residual set.
]<prp:meagre-residual>

#note-box[
  $X \\ interior(A) = overline(X \\ A), interior((X \\ B)) = X \\ overline(B)$.
  
]

#proof(title: [Proof of 4])[
Let ${ O_n }_(n = 1)^oo$ be a sequence of dense open sets in $X$. We want to show that their interinterion, $E = inter.big_(n = 1)^oo O_n$, is residual.

Using De Morgan's laws, we have: $ X \\ E = X \\ (inter.big_(n = 1)^oo O_n) = union.big_(n = 1)^oo \( X \\ O_n \) $ Let $F_n = X \\ O_n$. To show that $X \\ E$ is meagre, we need to show that each $F_n$ is nowhere dense. Since $O_n$ is an open set, $F_n$ is a closed set, so $overline(F_n) = F_n$. The interior of $F_n$ is given by:

$ interior(F_n) = interior((X \\ O_n)) = X \\ overline(O_n). $

Because $O_n$ is dense in $X$, therefore, $ interior(overline(F_n)) = interior(F_n) = X \\ X = nothing $ This shows that each $F_n$ is nowhere dense. Consequently, their countable union, $X \\ E$, is a meagre set. Thus, $E$ is a residual set.
]

#theorem(title: [Baire Category Theorem])[
Let $(X, d)$ be a nonempty, complete metric space. If ${ U_n }_(n = 1)^oo$ is a sequence of dense open subsets of $X$, then their interinterion $inter.big_(n = 1)^oo U_n$ is also dense in $X$.
]<thm:BCT>

#proof[
To show that $E = inter.big_(n = 1)^oo U_n$ is dense in $X$, we must show that for any nonempty open set $W subset.eq X$, the interinterion $E inter W$ is nonempty.

Let $W$ be an arbitrary nonempty open set. Since $U_1$ is dense and open, the interinterion $W inter U_1$ is also a nonempty open set. Therefore, we can find a point $x_1$ and a radius $r_1 > 0$ such that the closed ball $overline(B \( x_1 \, r_1 \))$ satisfies:
$ overline(B \( x_1 \, r_1 \)) subset.eq W inter U_1 quad upright("and") quad 0 < r_1 < 1. $

Now, since $U_2$ is dense and open, the interinterion $B \( x_1 \, r_1 \) inter U_2$ is a nonempty open set. We can choose a point $x_2$ and radius $r_2 > 0$ such that:
$ overline(B \( x_2 \, r_2 \)) subset.eq B \( x_1 \, r_1 \) inter U_2 quad upright("and") quad 0 < r_2 < 1 \/ 2. $

We proceed inductively. Assume we have constructed a nested sequence of closed balls $overline(B \( x_k \, r_k \))$ for $k = 1 \, dots.h \, m$, such that:
$ overline(B \( x_k \, r_k \)) subset.eq B \( x_(k - 1) \, r_(k - 1) \) inter U_k quad upright("and") quad 0 < r_k < 1 \/ k. $

Since $U_(m + 1)$ is dense and open, $B \( x_m \, r_m \) inter U_(m + 1)$ is a nonempty open set. We can thus find a closed ball $overline(B \( x_(m + 1) \, r_(m + 1) \))$ such that:
$ overline(B \( x_(m + 1) \, r_(m + 1) \)) subset.eq B \( x_m \, r_m \) inter U_(m + 1) quad upright("and") quad 0 < r_(m + 1) < 1 \/ \( m + 1 \). $

This construction yields a nested sequence of non-empty closed balls $overline(B_1) supset.eq overline(B_2) supset.eq overline(B_3) supset.eq dots.h$, where $B_k = B \( x_k \, r_k \)$. The sequence of centers ${ x_n }$ is a Cauchy sequence, since for $m > n$, both $x_m$ and $x_n$ are in $B_(n - 1)$, so $d \( x_n \, x_m \) < 2 r_(n - 1) < 2 \/ \( n - 1 \)$, which approaches 0 as $n arrow.r oo$.

Since $X$ is a complete metric space, the sequence ${ x_n }$ converges to a limit $x in X$. For any $k gt.eq 1$, the point $x$ is the limit of the sequence ${ x_n }_(n = k)^oo$, which is entirely contained in the closed ball $overline(B_k)$. Thus, $x in overline(B_k)$ for all $k gt.eq 1$.

By our construction, $x in overline(B_1) subset.eq W inter U_1$, so $x in W$. Also, for every $k gt.eq 1$, we have $x in overline(B_k) subset.eq U_k$. This implies $x in inter.big_(k = 1)^oo U_k = E$. Therefore, $x in E inter W$, proving that $E inter W$ is nonempty. Since $W$ was an arbitrary nonempty open set, $E$ is dense in $X$.
]

#corollary[
A non-empty, complete metric space is of the second category in itself (i.e., it is non-meagre).
]

#proof[
Suppose for contradiction that $X$ is meagre. Then $X = union.big_(n = 1)^oo F_n$ where each $F_n$ is nowhere dense. Let $U_n = X \\ overline(F_n)$. Since $overline(F_n)$ has an empty interior, $U_n$ is a dense open set. By @thm:BCT, $inter.big U_n$ is dense in $X$ and thus nonempty. But $inter.big U_n = inter.big \( X \\ overline(F_n) \) = X \\ union.big overline(F_n) subset.eq X \\ union.big F_n = X \\ X = nothing$, a contradiction.
]

#corollary(title: [Characterization of Residual Sets])[
In a complete metric space $X$, a set $E subset.eq X$ is residual if and only if it contains a dense $G_delta$ subset. 
]<cor:characterization-of-residual-sets>

#proof[
($arrow.r.double$) If $E$ is residual, its complement $X \\ E$ is meagre. So, $X \\ E = union.big_(n = 1)^oo M_n$, where each $M_n$ is nowhere dense. Then $E = inter.big_(n = 1)^oo \( X \\ M_n \)$.

Let $U_n = X \\ overline(M_n)$. Each $U_n$ is a dense open set. Indeed, $overline(U_n) = X \\ interior(overline(M_n)) = X$. Let $G = inter.big_(n = 1)^oo U_n$. Then $G$ is a $G_delta$ set. By @thm:BCT, $G$ is dense. Furthermore, since $M_n subset.eq overline(M_n)$, we have $X \\ overline(M_n) subset.eq X \\ M_n$, which implies $G subset.eq E$. So $E$ contains a dense $G_delta$ set.

($arrow.l.double$) If $E$ contains a dense $G_delta$ set $G = inter.big_(n = 1)^oo U_n$, where each $U_n$ is open. Since $G$ is dense, each $U_n$ must also be dense. By (4) of @prp:meagre-residual, $G$ is a residual set. Since $X \\ E subset.eq X \\ G$ and $X \\ G$ is meagre, $X \\ E$ is also meagre (as a subset of a meagre set). Thus, $E$ is residual.
]

Further Corollaries:

#corollary[
In a complete metric space, a countable intersection of dense $G_delta$ sets is also a dense $G_delta$ set.
]

This follows because such an intersection is itself a countable intersection of dense open sets.

#corollary[
If $Y subset X$ is a meagre set in a complete metric space $X$, then its complement $X \\ Y$ is dense in $X$.
]

This is because $X \\ Y$ is residual and thus contains a dense subset.

#note-box[
A dense set is not necessarily residual. For example, $QQ$ is dense in $RR$ but is meagre, not residual.
]

=== Applications of the Baire Category Theorem

==== The Set of Points of Continuity.
Let $f : X arrow.r Y$ be a function between metric spaces. The set of points where $f$ is continuous is always a $G_delta$ set. This fact, combined with @thm:BCT, yields powerful results.

#theorem[
There is no function $f : [0, 1] arrow.r bb(R)$ that is continuous at every rational point in $[0, 1]$ and discontinuous at every irrational point in $[0, 1]$.
]

#proof[
Assume such a function $f$ exists. Let $C subset.eq [0, 1]$ be the set of points where $f$ is continuous. The set $C$ can be shown to be a $G_delta$ set in $[0, 1]$:

$
C &= {x in [0, 1]: forall epsilon > 0, exists delta > 0,
"s.t." forall y in {abs(x - y) < delta}, abs(f(x) - f(y)) < epsilon} \
&= inter.big_(n=1)^infinity union.big_(m=1)^infinity {x in [0, 1]: f(B(x, 1/m)) subset B(f(x), 1/n)}.
$

So, if $C = bb(Q) inter [0, 1]$, then $C$ would be a dense $G_delta$ subset of $[0, 1]$. By @cor:characterization-of-residual-sets, this would imply that $bb(Q) inter [0, 1]$ is a residual set in $[0, 1]$. However, we know that $bb(Q) inter [0, 1]$ is a meagre set. This is a contradiction. Therefore, no such function can exist.
]

The Baire Category Theorem shows that, in a topological sense, most continuous functions are nowhere differentiable.

#theorem[
In the space $(C ([0,1]), norm(dot.op)_infinity)$, the set of functions that are differentiable at #emph[at least one point] is a meagre set.
]

This implies that a "generic" continuous function is nowhere differentiable.

#proof[
Let $cal(D)$ be the set of functions in $C ([0,1])$ that are differentiable at one or more points. We want to show $cal(D)$ is meagre. For integers $n \, m gt.eq 1$, define the set $E_(n, m)$ as:

$ E_(n, m) = {f in C ([0,1]):& exists x in [0, 1] "s.t."\
&forall y in \( x - 1 \/ n \, x + 1 \/ n \) inter [0, 1] \, lr(|frac(f \( y \) - f \( x \), y - x)|) lt.eq m} $

The set of all functions differentiable at some point is contained in the union $cal(D) subset.eq union.big_(m = 1)^oo union.big_(n = 1)^oo E_(n, m)$. We need to show that each set $E_(n, m)$ is a #strong[nowhere dense] subset of $C ([0,1])$. 

$E_(n, m)$ *is closed*: Let $(f_k)_(k=1)^infinity$ be a sequence in $E_(n,m)$ that converges uniformly to a function $f in C([0, 1])$. For each $f_k$, there exists a point $x_k in [0, 1]$ satisfying the condition for $E_(n, m)$. Since $[0, 1]$ is compact, the sequence ${x_k}$ has a convergent subsequence ${x_k_j}$ that converges to some point $x in [0, 1]$. Because the convergence of $f_k$ to $f$ is uniform, we can show that $f$ and $x$ satisfy the condition. Thus, $f in E_(n, m)$, which proves that $E_(n, m)$ is a closed set.

$E_(n, m)$ *has an empty interior*: For any function $f in E_(n, m)$ and any $epsilon.alt > 0$, one can construct a "sawtooth" or "zigzag" function $g$ with a very small amplitude (so that $norm(g)_oo < epsilon$) but a very high frequency (so its derivative, where it exists, is very large). The function $f + g$ is then close to $f$ (i.e., in the $epsilon$-ball around $f$) but is not in $E_(n, m)$ because the steep slopes of $g$ ensure the difference quotient of $f + g$ exceeds $m$ everywhere. This shows that no open ball in $C([0,1])$ is contained within $E_(n, m)$.

Since $cal(D)$ is a subset of a countable union of nowhere dense sets, it is meagre.
]

#corollary[
For any integer $k >=1$, the space of $k$-times continuously differentiable functions, $C^k([0,1])$, is a meagre subset of $C^(k-1)([0, 1])$. Here, the space $C^k([0,1])$ is equipped with the norm:
$
norm(f)_(C^k) := sup_(1 <= j <= k) norm(f^((j)))_infinity,
$
where $f^((j))$ is the $j$-th derivative and $f^((0)) = f$.

]

==== Hamel Bases in Banach Spaces

#theorem[
An infinite-dimensional Banach space cannot have a countable Hamel basis.
]

#proof[
Let $X$ be an infinite-dimensional Banach space. A Hamel basis is a maximal linearly independent set, such that every vector in $X$ is a #emph[finite] linear combination of basis vectors. Assume for contradiction that $X$ has a countable Hamel basis ${ e_n }_(n = 1)^oo$. For each $k in bb(N)$, define the subspace $X_k = upright("span") { e_1 \, e_2 \, dots.h \, e_k }$. By definition of a Hamel basis, we can write the entire space as the union of these subspaces: $ X = union.big_(k = 1)^oo X_k $ Each $X_k$ is a finite-dimensional subspace of the normed space $X$. Since
- Any finite-dimensional subspace of a normed space is a #strong[closed set].
- In an infinite-dimensional normed space, any proper finite-dimensional subspace has an #strong[empty interior];. 

Therefore, each $X_k$ is a closed set with an empty interior, which means each $X_k$ is a #strong[nowhere dense] set. This implies that $X = union.big_(k = 1)^oo X_k$ is a meagre set. However, since $X$ is a Banach space, it is a complete metric space. By Corollary 1 of the BCT, $X$ must be of the second category in itself (i.e., non-meagre). This is a contradiction. Thus, an infinite-dimensional Banach space cannot have a countable Hamel basis.
]
