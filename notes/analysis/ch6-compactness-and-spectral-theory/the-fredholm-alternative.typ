#import "../book.typ": *

#show: book-page.with(
  title: "6.4 The Fredholm Alternative"
)

== The Fredholm Alternative

=== Introduction to the Solvability of Operator Equations

In functional analysis, a fundamental question is determining the conditions under which an operator equation has a solution. Specifically, for a given linear operator $T$ on a Banach space $X$, a scalar $lambda$, and a vector $y in X$, we seek to understand the solvability of the equation:

$ (T - lambda I) x = y. $

Here, $I$ denotes the identity operator. The existence and uniqueness of the solution $x$ depend critically on the properties of the operator $(T - lambda I)$.

- If the operator $(T - lambda I)$ is invertible, a unique solution $x = (T - lambda I)^(- 1) y$ exists for any given $y in X$. 
- The more complex case, which the Fredholm Alternative addresses, is when the operator $(T - lambda I)$ is not invertible.  In this scenario, we must investigate the conditions that $y$ must satisfy for a solution to exist.

To fully understand the Fredholm Alternative, we must first introduce the concepts of the adjoint operator and compact operators.

#definition[
For a bounded linear operator $T in cal(B)(X)$, its #strong[adjoint operator];, denoted by $T^* : X^* arrow.r X^*$, is defined by the relation:

$ angle.l T x , f angle.r = angle.l x , T^* f angle.r quad "for all" x in X "and" f in X^* $

Here, $angle.l x , f angle.r$ is another notation for $f (x)$, representing the action of the functional $f$ on the vector $x$. The adjoint operator $T^*$ is itself a bounded linear operator on the dual space $X^*$.
]

This leads us to the adjoint equation. The adjoint of the operator $(T - lambda I)$ is $(T - lambda I)^* = T^* - overline(lambda) I$. The corresponding adjoint equation is:

$ (T^* - overline(lambda) I) f = g. $

where $f , g in X^*$. The connection between the original equation and its adjoint is fundamental to the theory.

=== The Fredholm Alternative

The foundation for the Fredholm Alternative is provided by the Riesz-Schauder Theorem, which relates the properties of a compact operator to its adjoint.

#theorem(title: "Riesz-Schauder")[
Let $X$ be a Banach space and $T in cal(K)(X)$ be a compact linear operator.  For any non-zero scalar $lambda in bb(C)$, the following hold: 

+ The kernels of $(T - lambda I)$ and $(T^* - overline(lambda) I)$ are finite-dimensional:
  $ dim(ker(T - lambda I)) = dim(ker(T^* - overline(lambda) I)) < oo. $
+ The range of $(T - lambda I)$ is a closed subspace of $X$.
+ The range of $(T - lambda I)$ is the pre-annihilator of the kernel of $(T^* - overline(lambda) I)$:
  $ ran(T - lambda I) &= preann((ker(T^* - overline(lambda) I))) \
  &= { y in X : f (y) = 0 "for all" f in ker(T^* - overline(lambda) I) }. $
+ Similarly, the range of the adjoint operator $(T^* - overline(lambda) I)$ is the annihilator of the kernel of $(T - lambda I)$:
  $ ran(T^* - overline(lambda) I) = ann((ker(T - lambda I))). $
]

Building upon the Riesz-Schauder Theorem, the Fredholm Alternative provides a clear dichotomy for the solvability of equation when $T$ is a compact operator.

#theorem(title: "Fredholm Alternative")[
Let $X$ be a Banach space, $T in cal(K)(X)$ be a compact operator, and $lambda eq.not 0$. Then exactly one of the following two statements is true:

+ #strong[Homogeneous equation has only the trivial solution:] The equation $(T - lambda I) x = 0$ has only the solution $x = 0$. In this case, the adjoint equation $(T^* - overline(lambda) I) f = 0$ also has only the trivial solution $f = 0$. Consequently, the equation $(T - lambda I) x = y$ has a unique solution for every $y in X$.

+ #strong[Homogeneous equation has non-trivial solutions:] The equation $(T - lambda I) x = 0$ has a non-trivial (non-zero) solution. In this case, the dimension of the solution space (kernel) is finite. The equation $(T - lambda I) x = y$ has a solution if and only if $y$ is orthogonal to every solution $f$ of the adjoint homogeneous equation $(T^* - overline(lambda) I) f = 0$. That is: 

  $ (T - lambda I) x = y arrow.l.r.double f (y) = 0 "for all" f in ker(T^* - overline(lambda) I). $
  If this condition is met, the solution is not unique.
]
