#import "../book.typ": *

#show: book-page.with(
  title: "4.5 Application of Hahn-Banach Theorem"
)

== Application of Hahn-Banach Theorem

=== Existence of Norming Functionals

A primary application of the Hahn-Banach theorem is to prove that the dual space $X^*$ is non-trivial for any non-trivial normed space $X$. More specifically, it guarantees the existence of functionals that "sense" the norm of any given vector.

#proposition[
Let $X$ be a normed vector space. For any non-zero element $x_0 in X$, there exists a continuous linear functional $f in X^*$ such that:
1. $f (x_0) = norm(x_0)$.
2. $norm(f) = 1$.

Such a functional $f$ is known as a #strong[norming functional] for the element $x_0$.
]<prp:norming-functional>

#proof[
Let $x_0$ be a non-zero element in $X$. Consider the one-dimensional subspace $M = span{ x_0 }$. Define a linear functional $g : M arrow.r bb(F)$ by the rule:

$ g (lambda x_0) = lambda norm(x_0) quad "for any scalar" lambda in bb(F). $

This functional is well-defined on $M$. For any element $m = lambda x_0 in M$, we have: $ abs(g (m)) = abs(g (lambda x_0)) = abs(lambda) norm(x_0) = norm(lambda x_0) = norm(m) $ This shows that the operator norm of $g$ on $M$ is $norm(g)_(M^*) = sup_(m in M , norm(m) = 1) abs(g (m)) = 1$.

By the Hahn-Banach theorem, there exists a linear functional $f in X^*$ that extends $g$ to all of $X$ and preserves the norm. This means:
- $f (x_0) = g (x_0) = 1 dot.op norm(x_0) = norm(x_0)$.
- $norm(f)_(X^*) = norm(g)_(M^*) = 1$.

This completes the proof.
]

=== Duality of Norms and the Canonical Embedding

The existence of norming functionals leads to a profound result: the norm of a vector in $X$ can be completely characterized by the functionals in the dual space $X^*$.

#proposition[
Let $X$ be a non-trivial normed vector space. For any $x in X$, its norm is given by:

$ norm(x)_X = sup { abs(f (x)) : f in X^* , norm(f)_(X^*) lt.eq 1 }. $
]<prp:duality-of-norms>

#proof[
First, for any functional $f in X^*$ with $norm(f) lt.eq 1$, the definition of the operator norm implies $abs(f (x)) lt.eq norm(f) dot.op norm(x) lt.eq norm(x)$. Taking the supremum over all such functionals gives:

$ sup { abs(f (x)) : f in X^* , norm(f) lt.eq 1 } lt.eq norm(x). $

To prove the reverse inequality, we consider two cases. If $x = 0$, the equality holds trivially. If $x eq.not 0$, @prp:norming-functional guarantees the existence of a norming functional $f_0 in X^*$ such that $norm(f_0) = 1$ and $f_0 (x) = norm(x)$. This specific functional $f_0$ belongs to the set ${ f in X^* : norm(f) lt.eq 1 }$. Therefore, the supremum must be at least as large as $abs(f_0 (x))$:

$ sup { abs(f (x)) : f in X^* , norm(f) lt.eq 1 } gt.eq abs(f_0 (x)) = norm(x). $

Combining the two inequalities establishes the equality.
]

This duality allows us to define a natural mapping from a space into its #strong[bidual] (or second dual), $X^(**) = (X^*)^*$.

#definition(title: "Canonical Embedding")[
The #strong[canonical embedding] is the map $J : X arrow.r X^(**)$ that associates each vector $x in X$ with a functional $J (x)$ on $X^*$, defined by:

$ (J (x)) (f) = f (x) quad "for all" f in X^*. $

$J (x)$ is often denoted as $hat(x)$.
]

@prp:duality-of-norms demonstrates that this embedding is an #strong[isometry];.

#theorem[
The canonical embedding $J : X arrow.r X^(**)$ is an isometry.
]

#proof[
For any $x in X$, the norm of $J (x)$ in the bidual space $X^(**)$ is:

$ norm(J (x))_(X^(**)) = sup { abs((J (x)) (f)) : f in X^* , norm(f)_(X^*) lt.eq 1 }. $

By the definition of $J$, this is:

$ norm(J (x))_(X^(**)) = sup { abs(f (x)) : f in X^* , norm(f)_(X^*) lt.eq 1 }. $

From @prp:duality-of-norms, this is precisely the norm of $x$ in $X$:

$ norm(J (x))_(X^(**)) = norm(x)_X. $

Since $J$ preserves the norm, it is an isometry.
]

As a direct consequence, $J$ is injective, because if $J (x) = 0$, then $norm(x)_X = norm(J (x))_(X^(**)) = 0$, which implies $x = 0$.

#definition(title: "Reflexivity")[
A Banach space $X$ is said to be #strong[reflexive] if the canonical embedding $J : X arrow.r X^(**)$ is a surjective map (and thus an isometric isomorphism).
]

#remark[
It is crucial to distinguish reflexivity from the case where a space $X$ is merely isometrically isomorphic to its bidual $X^(**)$. Reflexivity specifically requires that the #strong[canonical map] $J$ itself is the isometric isomorphism.
]

#example[
For $1 < p < oo$, the space $ell^p$ is reflexive. This is because its dual space $(ell^p)^*$ is isometrically isomorphic to $ell^q$, where $1 \/ p + 1 \/ q = 1$. The dual of $ell^q$, in turn, is $(ell^q)^*$, which is isometrically isomorphic to $ell^p$. In this case, it can be shown that the canonical map $J : ell^p arrow.r (ell^p)^(**)$ is indeed surjective.
]

=== Separation Properties

The Hahn-Banach theorem also provides powerful "separation" results, which have significant geometric implications.

#proposition(title: "Separation of Points")[
Let $X$ be a normed vector space. For any two distinct points $x , y in X$, there exists a functional $f in X^*$ such that $f (x) eq.not f (y)$.
]

#proof[
Let $x , y in X$ with $x eq.not y$. Consider the non-zero vector $z = x - y$. By @prp:norming-functional, there exists a norming functional $f in X^*$ for $z$ such that $f (z) = norm(z) eq.not 0$. By linearity, this means: $ f (x - y) = f (x) - f (y) eq.not 0 $ Therefore, $f (x) eq.not f (y)$, and the functional $f$ separates the points $x$ and $y$.
]

#proposition(title: "Separation of a Point from a Closed Subspace")[
Let $Y$ be a closed proper subspace of a normed vector space $X$. For any point $x_0 in X \\ Y$, there exists a functional $f in X^*$ such that:
1. $f (y) = 0$ for all $y in Y$ (i.e., $f mid(|)_Y = 0$).
2. $f (x_0) = dist(x_0 , Y)$.
3. $norm(f) = 1$.
]<prp:separation-of-a-point-from-a-closed-subspace>

#proof[
Let $x_0 in X \\ Y$. Since $Y$ is a closed subspace, the distance from $x_0$ to $Y$, defined as $delta = dist(x_0 , Y) = inf_(y in Y) norm(x_0 - y)$, is strictly positive.

Consider the subspace $M = Y plus.circle span{ x_0 }$, whose elements are of the form $y + alpha x_0$ for $y in Y$ and $alpha in bb(F)$. Define a linear functional $g : M arrow.r bb(F)$ by:

$ g (y + alpha x_0) = alpha delta. $

By construction, $g (y) = 0$ for all $y in Y$ (by setting $alpha = 0$) and $g (x_0) = delta$ (by setting $y = 0 , alpha = 1$).

We now show that $norm(g)_M = 1$. For any element $m = y + alpha x_0 in M$ with $alpha eq.not 0$:

$ norm(m) = norm(y + alpha x_0) = abs(alpha) norm(y / alpha + x_0) = abs(alpha) norm(x_0 - (- y / alpha)). $

Since $- y \/ alpha in Y$, we have $norm(x_0 - (- y \/ alpha)) gt.eq inf_(z in Y) norm(x_0 - z) = delta$. Thus, $norm(m) gt.eq abs(alpha) delta = abs(g (m))$. This inequality also holds trivially for $alpha = 0$. This implies $norm(g)_M = sup_(m eq.not 0) frac(abs(g (m)), norm(m)) lt.eq 1$.

To establish the reverse inequality, note that by the definition of the infimum, there exists a sequence ${ y_n } subset Y$ such that $norm(x_0 - y_n) arrow.r delta$. Let $m_n = x_0 - y_n$. Each $m_n$ is in $M$, and we have $g (m_n) = g (x_0 - y_n) = delta$. The ratio is: $ frac(abs(g (m_n)), norm(m_n)) = frac(delta, norm(x_0 - y_n)) arrow.r 1 upright(" as ") n arrow.r oo $ This shows that $sup_(m eq.not 0) frac(abs(g (m)), norm(m)) gt.eq 1$. Therefore, $norm(g)_M = 1$.

Finally, by the Hahn-Banach theorem, we can extend $g$ to a functional $f in X^*$ with $norm(f)_(X^*) = norm(g)_M = 1$. This functional $f$ satisfies all the required properties.
]



=== Geometric Structure of Kernels

The Hahn-Banach theorem also illuminates the geometric structure of subspaces defined by linear functionals.

#lemma[
Let $X$ be a vector space and let $f : X arrow.r bb(F)$ be a non-zero linear functional. Then the kernel of $f$, $ker(f) = { x in X : f (x) = 0 }$, is a subspace of codimension $1$.
]

#proof[
Since $f$ is non-zero, its range is all of $bb(F)$, so there exists an element $x_0 in X$ such that $f (x_0) eq.not 0$. Let us normalize this element by setting $z_0 = x_0 \/ f (x_0)$, which yields $f (z_0) = 1$.

We claim that any vector $x in X$ can be uniquely decomposed as $x = y + lambda z_0$, where $y in ker(f)$ and $lambda in bb(F)$. Let $x in X$ be arbitrary. Define $lambda = f (x)$ and let $y = x - lambda z_0$. We verify that $y$ is in the kernel of $f$:

$ f (y) = f (x - lambda z_0) = f (x) - lambda f (z_0) = f (x) - f (x) dot.op 1 = 0. $

Thus, $y in ker(f)$, and we have the decomposition $x = y + f (x) z_0$. This shows that $X = ker(f) + span{ z_0 }$. Since $z_0 in.not ker(f)$, this sum is a direct sum, $X = ker(f) plus.circle span{ z_0 }$. This implies that the quotient space $X \/ ker(f)$ is one-dimensional, meaning $ker(f)$ has codimension $1$ in $X$.
]
