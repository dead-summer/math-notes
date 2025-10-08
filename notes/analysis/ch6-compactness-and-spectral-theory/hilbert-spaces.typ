#import "../book.typ": *

#show: book-page.with(
  title: "6.5 Hilbert Spaces"
)

== Hilbert Spaces


=== Inner Product Spaces
<inner-product-spaces>
An inner product space is the foundational structure upon which a Hilbert space is built. It endows a vector space with a geometric structure involving notions of length and angle.

#definition[
Let $X$ be a vector space over a field $bb(F)$, where $bb(F)$ is either $bb(R)$ or $bb(C)$. An #strong[inner product] on $X$ is a function $angle.l dot.op , dot.op angle.r : X times X arrow.r bb(F)$ that satisfies the following axioms for all vectors $x , y , x_1 , x_2 , y_1 , y_2 in X$ and any scalar $alpha in bb(F)$:

+ #strong[Sesquilinearity:] The inner product is linear in its first argument and conjugate linear in its second argument.
  - $angle.l x_1 + x_2 , y angle.r = angle.l x_1 , y angle.r + angle.l x_2 , y angle.r$.
  - $angle.l alpha x , y angle.r = alpha angle.l x , y angle.r$.
  - $angle.l x , y_1 + y_2 angle.r = angle.l x , y_1 angle.r + angle.l x , y_2 angle.r$.
  - $angle.l x , alpha y angle.r = overline(alpha) angle.l x , y angle.r$.
+ #strong[Conjugate Symmetry:] $angle.l x , y angle.r = overline(angle.l y \, x angle.r)$.
+ #strong[Positive-Definiteness:]
  - $angle.l x , x angle.r gt.eq 0$.
  - $angle.l x , x angle.r = 0$ if and only if $x = 0$.
]


A vector space $X$ equipped with an inner product $angle.l dot.op , dot.op angle.r$ is called an #strong[inner product space];.

Every inner product naturally induces a norm on the vector space, defined as:

$ norm(x) = sqrt(angle.l x \, x angle.r). $

This induced norm satisfies the triangle inequality, a fact that follows directly from the #strong[Cauchy-Schwarz Inequality];:
$ abs(angle.l x \, y angle.r) lt.eq norm(x) norm(y). $

Indeed, for any $x , y in X$, we have:
$
norm(x + y)^2 &= angle.l x + y , x + y angle.r = angle.l x , x angle.r + angle.l x , y angle.r + angle.l y , x angle.r + angle.l y , y angle.r \
&= norm(x)^2 + norm(y)^2 + angle.l x , y angle.r + overline(angle.l x \, y angle.r) \
&= norm(x)^2 + norm(y)^2 + 2 Re angle.l x \, y angle.r.
$
By the Cauchy-Schwarz inequality, $2 Re angle.l x \, y angle.r lt.eq 2 abs(angle.l x \, y angle.r) lt.eq 2 norm(x) norm(y)$, so:
$ norm(x + y)^2 lt.eq norm(x)^2 + norm(y)^2 + 2 norm(x) norm(y) = (norm(x) + norm(y))^2. $
Taking the square root of both sides yields $norm(x + y) lt.eq norm(x) + norm(y)$.


A normed vector space $(X , norm(dot.op))$ is an inner product space (i.e., its norm is induced by an inner product) if and only if the norm satisfies the #strong[Parallelogram Law];: $ norm(x + y)^2 + norm(x - y)^2 = 2 (norm(x)^2 + norm(y)^2). $ for all $x , y in X$.

If the Parallelogram Law holds, the inner product can be recovered from the norm using the #strong[Polarization Identity];:
- If $bb(F) = bb(R)$: $angle.l x , y angle.r = 1 / 4 (norm(x + y)^2 - norm(x - y)^2)$.
- If $bb(F) = bb(C)$: $angle.l x , y angle.r = 1 / 4 (norm(x + y)^2 - norm(x - y)^2 + imUnit norm(x + imUnit y)^2 - imUnit norm(x - imUnit y)^2)$.



=== Hilbert Spaces

A Hilbert space is an inner product space that is also a complete metric space with respect to the metric induced by its norm.

#definition[
An inner product space $(X , angle.l dot.op , dot.op angle.r)$ is called a #strong[Hilbert space] if it is a complete space with respect to the induced norm $norm(x) = sqrt(angle.l x \, x angle.r)$. Completeness means that every Cauchy sequence in $X$ converges to a limit that is also in $X$.
]

#example(title: "Examples of Hilbert Spaces")[
+ #strong[Finite-Dimensional Euclidean and Unitary Spaces:] $bb(R)^d$ and $bb(C)^d$ with the standard inner product $angle.l x , y angle.r = sum_(i = 1)^d x_i overline(y_i)$ are Hilbert spaces.

+ #strong[Sequence Space $ell^2$:] The space of all square-summable sequences of complex numbers, with the inner product $angle.l { x_n } , { y_n } angle.r = sum_(n = 1)^oo x_n overline(y_n)$.

+ #strong[Function Space $L^2 (mu)$:] The space of square-integrable functions with respect to a measure $mu$ on a set $Omega$, with the inner product $angle.l f , g angle.r = integral_Omega f (x) overline(g (x)) dif mu$.

+ #strong[Closed Subspaces:] Any closed subspace of a Hilbert space is itself a Hilbert space.

+ #strong[Bergman Space $A^2 (disc)$:] The subspace of $L^2 (disc, bb(C))$ consisting of holomorphic functions on the unit disc $disc subset bb(C)$. This is a closed subspace of a Hilbert space and is therefore itself a Hilbert space.
]





=== Orthogonality

The concept of orthogonality is central to the theory of Hilbert spaces.

#definition[
Let $(X , angle.l dot.op , dot.op angle.r)$ be an inner product space.
- Two vectors $x , y in X$ are #strong[orthogonal];, denoted $x perp y$, if $angle.l x , y angle.r = 0$.
- A vector $x$ is #strong[orthogonal to a set] $S subset.eq X$, denoted $x perp S$, if $x perp y$ for all $y in S$.
- The #strong[orthogonal complement] of a set $S subset.eq X$ is the set $S^perp$ (read "S perp") defined as: $ S^perp = { x in X : x perp S }. $
]

#proposition[
+ For any subset $S subset.eq X$, $S^perp$ is a closed subspace of $X$.
+ If $H$ is a Hilbert space and $S subset.eq H$ is a subset, then $S^(perp perp) = overline(span(S))$, where $overline(span(S))$ is the closed linear span of $S$.
]

A cornerstone of Hilbert space theory is the ability to project any point onto a closed convex subset.

#theorem(title: "Nearest Point Projection")[
Let $H$ be a Hilbert space and let $C subset.eq H$ be a non-empty, closed, and convex subset. Then for any $x in H$, there exists a unique vector $y_0 in C$ such that:
$ norm(x - y_0) = inf_(y in C) norm(x - y). $
This value is denoted as $dist(x , C)$. The vector $y_0$ is called the #strong[projection] of $x$ onto $C$.
]

#proof[
+ #strong[Existence:] Let $delta = inf_(y in C) norm(x - y)$. We can find a sequence ${ y_n }_(n = 1)^oo$ in $C$ such that $norm(x - y_n) arrow.r delta$.
  
  To prove that ${ y_n }$ converges, we must show it is a Cauchy sequence. We do this by applying the Parallelogram Law to the vectors $(x - y_n)$ and $(x - y_m)$ for any integers $n , m$:
  $ norm((x - y_n) - (x - y_m))^2 + norm((x - y_n) + (x - y_m))^2 = 2 (norm(x - y_n)^2 + norm(x - y_m)^2). $
  Simplifying the terms inside the norms gives:
  $ norm(y_m - y_n)^2 + norm(2 x - y_n - y_m)^2 = 2 (norm(x - y_n)^2 + norm(x - y_m)^2). $
  We can rewrite the second term on the left-hand side as: $ norm(2 x - y_n - y_m)^2 = 4 norm(x - frac(y_n + y_m, 2))^2. $
  Since $C$ is a #strong[convex set] and $y_n , y_m in C$, their midpoint $(y_n + y_m)\/ 2$ must also be in $C$. Therefore, by the definition of $delta$ as the infimum distance, we have: $ norm(x - frac(y_n + y_m, 2))^2 gt.eq delta^2. $
  Now, substitute this back into our rearranged Parallelogram Law equation:
  $ norm(y_m - y_n)^2 &= 2 (norm(x - y_n)^2 + norm(x - y_m)^2) - 4 norm(x - frac(y_n + y_m, 2))^2 \
   &lt.eq 2 (norm(x - y_n)^2 + norm(x - y_m)^2) - 4 delta^2. $
  This implies that $lim_(n , m arrow.r oo) norm(y_m - y_n)^2 = 0$, which means ${ y_n }$ is a #strong[Cauchy sequence];.
  By the continuity of the norm, we can conclude that the limit point $y_0$ achieves the minimum distance:
  $ norm(x - y_0) = norm(x - lim_(n -> oo)y_n) = lim_(n -> oo) norm(x - y_n) = delta. $
  
+ #strong[Uniqueness:] Assume there are two such points, $y_0$ and $tilde(y)_0$, that minimize the distance. By applying the Parallelogram Law to $(x - y_0)$ and $(x - tilde(y)_0)$, one can show that $norm(y_0 - tilde(y)_0)^2 lt.eq 0$, which implies $y_0 = tilde(y)_0$.
]

#theorem(title: "Orthogonal Decomposition Theorem")[
Let $H$ be a Hilbert space and $Y subset.eq H$ be a closed subspace. Then every vector $x in H$ can be uniquely decomposed as: $ x = y + z $ where $y in Y$ and $z in Y^perp$. This is denoted as $H = Y plus.circle Y^perp$, the #strong[orthogonal direct sum] of $Y$ and its orthogonal complement.
]

#proof[
1. #strong[Decomposition:] For any $x in H$, let $y_0$ be its unique nearest point projection onto the closed subspace $Y$. We must show that the vector $z = x - y_0$ belongs to $Y^perp$.

  By the nature of the projection, for any $y in Y$ and $t in bb(R)$, we have $norm(x - y_0)^2 lt.eq norm(x - (y_0 - t y))^2$. Expanding this inequality leads to
  
  $ 2 t Re(angle.l x - y_0 , y angle.r) + t^2 norm(y)^2 gt.eq 0. $
  
  For this quadratic in $t$ to always be non-negative, the linear term must be zero, implying $Re(angle.l x - y_0 , y angle.r) = 0$. A similar argument with $t$ replaced by $imUnit t$ (for complex scalars) shows that the imaginary part is also zero. Thus, $angle.l x - y_0 , y angle.r = 0$ for all $y in Y$, so $x - y_0 in Y^perp$.
2. #strong[Uniqueness:] If $x = y_1 + z_1 = y_2 + z_2$ where $y_1 , y_2 in Y$ and $z_1 , z_2 in Y^perp$, then $y_1 - y_2 = z_2 - z_1$. The left side is in $Y$ and the right side is in $Y^perp$. Since $Y inter Y^perp = { 0 }$, both sides must be zero, so $y_1 = y_2$ and $z_1 = z_2$.
]

This property that every closed subspace $Y$ has a complementary subspace $Y^perp$ such that $H = Y plus.circle Y^perp$ is a defining feature of Hilbert spaces.

A famous result by Lindenstrauss and Tzafriri states that if every closed subspace of an infinite-dimensional Banach space is complemented, then that space must be isomorphic to a Hilbert space.