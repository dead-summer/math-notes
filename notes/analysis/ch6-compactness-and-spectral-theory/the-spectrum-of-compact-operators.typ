#import "../book.typ": *

#show: book-page.with(
  title: "6.3 The Spectrum of Compact Operators"
)

== The Spectrum of Compact Operators

To rigorously discuss the spectrum of a compact operator, we first establish the foundational definitions within the context of a Banach space $X$ over the complex field $bb(C)$.

#definition[
- #strong[Spectrum of an Operator:] For an operator $T in cal(B) (X)$, its spectrum, denoted $sigma (T)$, is the set of all complex numbers $lambda in bb(C)$ for which the operator ($lambda I - T)$ is not invertible in $cal(B) (X)$, where $I$ is the identity operator.
- #strong[Point Spectrum (Eigenvalues):] A subset of the spectrum, denoted $sigma_p (T)$, consisting of all $lambda in bb(C)$ for which the kernel of $(lambda I - T)$ is non-trivial. That is:
  $ sigma_p (T) := { lambda in bb(C) mid(|) ker (lambda I - T) eq.not { 0 } }. $
  Any such $lambda$ is called an #strong[eigenvalue];.
- #strong[Eigenvector and Eigenspace:] For a given eigenvalue $lambda in sigma_p (T)$, any non-zero vector $x$ satisfying $T x = lambda x$ is called an #strong[eigenvector] corresponding to $lambda$. The set of all vectors (including the zero vector) that satisfy this equation forms a closed subspace of $X$, known as the #strong[eigenspace] for $lambda$, denoted $E_lambda$.
  $ E_lambda = { x in X mid(|) (lambda I - T) x = 0 } = ker (lambda I - T). $
]

#proposition[
Eigenvectors corresponding to distinct eigenvalues are linearly independent.
]

Let $T in cal(K)(X)$ be a compact linear operator on a complex Banach space $X$. The spectrum of $T$ has the following properties:

#theorem[
Let $T in cal(K)(X)$ be a compact operator on a Banach space $X$.
1. Every non-zero spectral value is an eigenvalue. That is, $sigma (T) \\ { 0 } = sigma_p (T) \\ { 0 }$.
2. If $X$ is infinite-dimensional, then $0 in sigma (T)$.
3. The set of eigenvalues $sigma_p (T)$ is at most countable, and if it is infinite, it converges to 0.
]

#proof[
1. Let $lambda in sigma (T)$ with $lambda eq.not 0$. We want to show that $lambda$ is an eigenvalue. This is equivalent to showing that $ker (lambda I - T) eq.not { 0 }$.

  Let's write the operator as $A = lambda I - T = lambda (I - lambda^(- 1) T)$. Since $T$ is a compact operator and $lambda eq.not 0$, the operator $K = lambda^(- 1) T$ is also compact. According to the #strong[Fredholm Alternative];, for a compact operator $K$, the operator $(I - K)$ is a Fredholm operator of index 0. This means that the dimension of its kernel is equal to the codimension of its range:
  $ dim(ker (I - K)) = codim(ran(I - K)). $
  This implies that $(I - K)$ is injective if and only if it is surjective.

  Since $lambda in sigma (T)$, the operator $A = lambda I - T$ is, by definition, not invertible. Because $lambda eq.not 0$, the operator $(I - lambda^(- 1) T)$ must also be non-invertible. A non-invertible operator cannot be both injective and surjective (i.e., bijective). Since the operator $I - lambda^(- 1) T$ has an index of 0, it cannot be injective without also being surjective. Therefore, it must not be injective.

  Non-injectivity means that its kernel is non-trivial: $ ker (I - lambda^(- 1) T) eq.not { 0 }. $ This is equivalent to $ker (lambda I - T) eq.not { 0 }$. Thus, $lambda$ is an eigenvalue of $T$.

2. We will prove the contrapositive: If $0 in.not sigma (T)$, then $X$ must be finite-dimensional.

  If $0 in.not sigma (T)$, then the operator $(0 dot.op I - T) = - T$ is invertible. This means $T$ has a bounded inverse $T^(- 1) in cal(B) (X)$. Consider the identity operator $I$. We can write it as $I = T^(- 1) T$. Since $T$ is a compact operator and $T^(- 1)$ is a bounded operator, their composition $I = T^(- 1) T$ is a compact operator.

  The identity operator on a normed space $X$ is compact if and only if the closed unit ball $overline(ball)$ in $X$ is compact. By the #strong[F. Riesz Lemma];, this is true if and only if the space $X$ is finite-dimensional. Therefore, if $0 in.not sigma (T)$, the space $X$ must be finite-dimensional. This completes the proof.

3. To prove this, we show that for any real number $epsilon > 0$, the set of eigenvalues $lambda$ with $abs(lambda) gt.eq epsilon$ is finite.

  Assume for the sake of contradiction that there exists an $epsilon_0 > 0$ for which there are infinitely many distinct eigenvalues ${ lambda_n }_(n = 1)^oo$ satisfying $abs(lambda_n)  gt.eq epsilon_0$ for all $n$. Let $x_n$ be an eigenvector corresponding to each $lambda_n$.

  Eigenvectors corresponding to distinct eigenvalues are linearly independent. Let's define a sequence of nested subspaces $H_n = span{ x_1 , x_2 , dots.h , x_n }$. Since the eigenvectors are independent, each $H_n$ is a proper subspace of $H_(n + 1)$, i.e., $H_n subset.neq H_(n + 1)$.

  By the #strong[F. Riesz Lemma];, we can construct a sequence of vectors ${ y_n }_(n = 1)^oo$ such that $y_n in H_n$, $norm(y_n) = 1$, and the distance from $y_n$ to the subspace $H_(n - 1)$ is at least $1 \/ 2$. That is, $norm(y_n - z)  gt.eq 1 \/ 2$ for all $z in H_(n - 1)$.

  Now, let's examine the sequence ${ T y_n }$. For any $n > m$, consider the norm of the difference:
  $ norm(T y_n - T y_m). $
  Let's analyze the term $T y_n$. Since $y_n in H_n$, we can write $y_n = sum_(i = 1)^n c_i x_i$. Then $T y_n = T (sum_(i = 1)^n c_i x_i) = sum_(i = 1)^n c_i T (x_i) = sum_(i = 1)^n c_i lambda_i x_i$.

  Let's rewrite $T y_n$ as: $ T y_n = lambda_n y_n - (lambda_n y_n - T y_n). $ The vector $v_n = lambda_n y_n - T y_n = lambda_n sum_(i = 1)^n c_i x_i - sum_(i = 1)^n c_i lambda_i x_i = sum_(i = 1)^(n - 1) c_i (lambda_n - lambda_i) x_i$. As $v_n$ is a linear combination of ${ x_1 , dots.h , x_(n - 1) }$, it belongs to the subspace $H_(n - 1)$.

  Also, since $m < n$, we have $y_m in H_m subset H_(n - 1)$, which implies $T y_m in H_(n - 1)$. Therefore, the vector $z = T y_m + v_n$ is in $H_(n - 1)$.

  Now we can evaluate the norm of the difference:
  $ norm(T y_n - T y_m) = norm(lambda_n y_n - z) = abs(lambda_n ) norm(y_n - z / lambda_n). $
  Since $z \/ lambda_n in H_(n - 1)$, the property from the F. Riesz Lemma applies:
  $ norm(y_n - z / lambda_n) gt.eq 1 / 2. $
  This gives us:
  $ norm(T y_n - T y_m) gt.eq abs(lambda_n )  dot.op 1 / 2 gt.eq epsilon_0 / 2. $
  This inequality holds for all $n > m$. This means the sequence ${ T y_n }$ cannot be a Cauchy sequence, and therefore it cannot contain any convergent subsequence. This contradicts the assumption that $T$ is a compact operator.

  Thus, our initial assumption must be false. The set of eigenvalues with magnitude greater than or equal to any $epsilon > 0$ must be finite. This implies that the set of all eigenvalues is at most countable and, if infinite, the sequence of eigenvalues must converge to 0.
]

