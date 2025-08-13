#import "../book.typ": *

#show: book-page.with(
  title: "6.1 Compact Operators"
)

== Compact Operators

=== Definition and Fundamental Properties

We begin by introducing the concept of a compact linear operator, which is a crucial class of operators in functional analysis, particularly in the study of integral equations and spectral theory.

#definition[
A set $A$ in a metric space is called #strong[precompact] (or totally bounded) if its closure $overline(A)$ is compact.
]

An equivalent and often more intuitive characterization of a precompact set is that for every $epsilon > 0$, the set $A$ can be covered by a finite number of open balls of radius $epsilon$. This property highlights the "finite-dimensional" nature of precompact sets.

#definition[
Let $X$ and $Y$ be Banach spaces. A linear operator $T : X arrow.r Y$ is said to be #strong[compact] if, for every bounded subset $E subset X$, the image set $T (E)$ is precompact in $Y$.
]

The set of all compact operators from $X$ to $Y$ is denoted by $cal(K) (X , Y)$. If $X = Y$, we denote the space by $cal(K) (X)$.


There are several equivalent characterizations of a compact operator $T in cal(B) (X , Y)$, the space of bounded linear operators from $X$ to $Y$.

- #strong[Sequential Criterion:] An operator $T in cal(B) (X , Y)$ is compact if and only if for every bounded sequence ${ x_n } subset X$, the sequence ${ T x_n } subset Y$ contains a convergent subsequence.
- #strong[Image of the Unit Ball:] An operator $T in cal(B) (X , Y)$ is compact if and only if it maps the open (or closed) unit ball in $X$ to a precompact set in $Y$. That is, $T (ball_X)$ is precompact in $Y$.

#example(title: "The Identity Operator")[
The identity operator $I : X arrow.r X$ is compact if and only if the space $X$ is finite-dimensional.
]

#proof[
If $I$ is compact, then the image of the unit ball $ball_X$, which is $ball_X$ itself, must be precompact, meaning $overline(ball)_X = ball_X$ is compact. By the Riesz Lemma, the closed unit ball in a normed linear space is compact only if the space is finite-dimensional.

Conversely, if $X$ is finite-dimensional, then the closed unit ball is closed and bounded, and by the Heine-Borel theorem, it is compact. Thus, $I$ is a compact operator.
]

#example(title: "Finite-Rank Operators")[
An operator $T in cal(B) (X , Y)$ is a #strong[finite-rank operator] if its range, $ran(T)$, is a finite-dimensional subspace of $Y$. Every finite-rank operator is compact.
]

#proof[
Let $T$ be a finite-rank operator and ${ x_n }$ be a bounded sequence in $X$. Since $T$ is a bounded operator, the sequence ${ T x_n }$ is a bounded sequence in the finite-dimensional subspace $ran(T)$. By the Heine-Borel theorem, any closed and bounded subset of a finite-dimensional space is compact. Therefore, the sequence ${ T x_n }$ is contained in a compact set and must have a convergent subsequence. Thus, $T$ is compact.
]

=== The Space of Compact Operators

A fundamental result is that the space of compact operators is a closed subspace of the space of bounded operators.

#theorem[
Let $X$ and $Y$ be Banach spaces. The space of compact operators $cal(K) (X, Y)$ is a closed subspace of $cal(B) (X , Y)$ with respect to the operator norm.
]

#proof[
Let ${ T_m }_(m = 1)^oo$ be a sequence of compact operators in $cal(K) (X, Y)$ that converges to an operator $T in cal(B) (X , Y)$. This means $norm(T_m - T) arrow.r 0$ as $m arrow.r oo$. We must show that the limit operator $T$ is also compact.

To do this, we use the sequential characterization of compactness. Let ${ x_n }_(n = 1)^oo$ be an arbitrary bounded sequence in $X$. Let $M = sup_n norm(x_n) < oo$. Our goal is to show that the sequence ${ T x_n }$ has a convergent subsequence.

We employ a diagonalization argument.
1. Since $T_1$ is compact, there exists a subsequence ${ x_(n_k)^((1)) }$ of ${ x_n }$ such that ${ T_1 x_(n_k)^((1)) }$ converges.
2. Since $T_2$ is compact, there exists a subsequence ${ x_(n_k)^((2)) }$ of ${ x_(n_k)^((1)) }$ such that ${ T_2 x_(n_k)^((2)) }$ converges.
3. Continuing this process, for each $j in bb(N)$, we find a subsequence ${ x_(n_k)^((j + 1)) }$ of ${ x_(n_k)^((j)) }$ such that ${ T_(j + 1) x_(n_k)^((j + 1)) }$ converges.

Now, define the diagonal subsequence ${ y_k }$ by $y_k = x_(n_k)^((k))$. For any fixed $j in bb(N)$, the sequence ${ T_j y_k }_(k = j)^oo$ is a subsequence of ${ T_j x_(n_k)^((j)) }_(k = j)^oo$ and therefore converges as $k arrow.r oo$.

We will now show that ${ T y_k }$ is a Cauchy sequence in $Y$. Let $epsilon > 0$. Since $T_m arrow.r T$ in the operator norm, we can choose an integer $j$ such that $norm(T - T_j) < frac(epsilon, 3 M)$. For this fixed $j$, we know that ${ T_j y_k }$ is a convergent sequence, and thus a Cauchy sequence. Therefore, there exists an integer $N$ such that for all $k , l gt.eq N$, we have $norm(T_j y_k - T_j y_l) < epsilon / 3$.

Now, for any $k , l gt.eq N$, we use the triangle inequality:
$
norm(T y_k - T y_l) &lt.eq norm(T y_k - T_j y_k) + norm(T_j y_k - T_j y_l) + norm(T_j y_l - T y_l) \
&lt.eq norm(T - T_j) norm(y_k) + norm(T_j y_k - T_j y_l) + norm(T_j - T) norm(y_l) \
&< (frac(epsilon, 3 M)) M + epsilon / 3 + (frac(epsilon, 3 M)) M = epsilon / 3 + epsilon / 3 + epsilon / 3 = epsilon.
$
This shows that ${ T y_k }$ is a Cauchy sequence. Since $Y$ is a Banach space (and thus complete), the sequence ${ T y_k }$ converges.

We have shown that for an arbitrary bounded sequence ${ x_n }$, its image ${ T x_n }$ contains a convergent subsequence. Therefore, $T$ is a compact operator, and $cal(K) (X, Y)$ is a closed subspace of $cal(B) (X , Y)$.
]

The norm-limit of a sequence of finite-rank operators is always a compact operator (every finite-rank operator is compact, and the space $cal(K)(X,Y)$ is a closed). A natural question arises: is the converse true? Can every compact operator be approximated in norm by finite-rank operators?

If $H$ is a Hilbert space, then every compact operator $T in K (H)$ is the norm-limit of a sequence of finite-rank operators. However, this statement is #strong[false for general Banach spaces];. There exist Banach spaces and compact operators on them that cannot be approximated by finite-rank operators. This famous counterexample was constructed by Per Enflo in 1973, solving a long-standing open problem in functional analysis. A Banach space for which this property holds is said to have the "Approximation Property".

=== Analytical and Algebraic Properties

Compact operators have several important properties that distinguish them from general bounded operators.

#proposition[
If $T in cal(K) (X, Y)$ and a sequence ${ x_n } subset X$ converges weakly to $x in X$ (denoted $x_n weakTo x$), then the sequence ${ T x_n }$ converges strongly to $T x$ in $Y$ (i.e., $norm(T x_n - T x) arrow.r 0$).
]

#proof[
Assume for contradiction that ${ T x_n }$ does not converge strongly to $T x$. Then there exists an $epsilon > 0$ and a subsequence ${ x_(n_k) }$ such that $norm(T x_(n_k) - T x) gt.eq epsilon$ for all $k$. Since ${ x_n }$ converges weakly, it is a bounded sequence. As $T$ is compact, there must be a further subsequence, which we will also denote by ${ x_(n_k) }$, such that ${ T x_(n_k) }$ converges strongly to some $y in Y$. However, since $x_n weakTo x$ and $T$ is a bounded operator, we have $T x_(n_k) -> T x$. The uniqueness of the limit implies that $y = T x$. This means ${ T x_(n_k) }$ converges strongly to $T x$, which contradicts our initial assumption.
]

#proposition[
Let $W , X , Y , Z$ be Banach spaces. Consider operators $R in cal(B) (W , X)$, $T in cal(K) (X, Y)$, and $S in cal(B) (Y , Z)$. The composition of a compact operator with bounded operators results in a compact operator. Specifically:
1. The operator $S compose T : X arrow.r Z$ is compact.
2. The operator $T compose R : W arrow.r Y$ is compact.
]

#proof[
1. Let ${ x_n }$ be a bounded sequence in $X$. Since $T$ is compact, there exists a subsequence ${ x_(n_k) }$ such that ${ T x_(n_k) }$ converges to some $y in Y$. Since $S$ is a bounded operator, it is continuous. Therefore, $S (T x_(n_k)) arrow.r S (y)$ as $k arrow.r oo$. Thus, ${ S (T x_n) }$ has a convergent subsequence, and $S compose T$ is compact.
2. Let ${ w_n }$ be a bounded sequence in $W$. Since $R$ is a bounded operator, the sequence ${ R w_n }$ is bounded in $X$. Since $T$ is compact, the sequence ${ T (R w_n) }$ has a convergent subsequence. Thus, $T compose R$ is compact.
]

#corollary[
The space of compact operators on a Banach space $X$, denoted $cal(K) (X)$, forms a closed, two-sided ideal wi the algebra of bounded operators $cal(B) (X)$.
]


A classic and highly important example of compact operators arises from integral equations.

Let $Omega subset bb(R)^n$ be a compact set and consider the Hilbert space $L^2 (Omega)$. Let $K (x, y) in L^2 (Omega times Omega)$ be a square-integrable function called the kernel. We define the integral operator $T_K : L^2 (Omega) arrow.r L^2 (Omega)$ by: $ (T_K f) (x) := integral_Omega K (x, y) f (y) dif y , quad "for" f in L^2 (Omega). $

Such an operator is often called a Hilbert-Schmidt operator.

#proposition[
The integral operator $T_K$ with an $L^2$ kernel is a compact operator, i.e., $T_K in cal(K) (L^2 (Omega))$.
]

#proof[
The proof proceeds in two steps. First, we show $T_K$ is bounded. Second, we show it is a norm-limit of finite-rank operators.

+ #strong[Boundedness of $T_K$];: We compute the norm of $T_K f$:
  $ norm(T_K f)_(L^2(Omega))^2 = integral_Omega abs((T_K f) (x))^2 dif x = integral_Omega abs(integral_Omega K (x, y) f (y) dif y)^2 dif x. $
  By applying the Cauchy-Schwarz inequality to the inner integral (with respect to $y$), we get:
  $ abs(integral_Omega K (x, y) f (y) dif y)^2 lt.eq (integral_Omega abs(K (x, y))^2 dif y) (integral_Omega abs(f (y))^2 dif y) = norm(K (x , dot.op))_(L^2(Omega))^2 norm(f)_(L^2(Omega))^2. $
  Substituting this back and integrating with respect to $x$:
  $
  norm(T_K f)_(L^2(Omega))^2 &lt.eq integral_Omega norm(K (x , dot.op))_(L^2(Omega))^2 norm(f)_(L^2(Omega))^2 dif x \
  &= norm(f)_(L^2(Omega))^2 integral_Omega integral_Omega abs(K (x, y))^2 dif y dif x \
  &= norm(f)_(L^2(Omega))^2 norm(K)_(L^2(Omega times Omega))^2. $
  This shows that $T_K$ is a well-defined bounded operator, and its operator norm is bounded by the $L^2$-norm of its kernel: $norm(T_K) lt.eq norm(K)$.

+ #strong[Compactness of $T_K$];: Let ${ phi.alt_j (y) }_(j = 1)^oo$ be an orthonormal basis for $L^2 (Omega)$. Then the set of functions ${ phi.alt_i (x) overline(phi.alt_j (y)) }_(i , j = 1)^oo$ forms an orthonormal basis for the Hilbert space $L^2 (Omega times Omega)$. We can expand the kernel $K(x, y)$ in this basis:
  $ K(x, y) = sum_(i , j = 1)^oo c_(i j) phi.alt_i (x) overline(phi.alt_j (y)) , quad "where" c_(i j) = angle.l K , phi.alt_i overline(phi.alt_j) angle.r_(L^2 (Omega times Omega)). $
  Let's define a sequence of truncated kernels $K_N (x , y)$ by taking the first $N$ terms for each index:
  $ K_N (x , y) = sum_(i , j = 1)^N c_(i j) phi.alt_i (x) overline(phi.alt_j (y)). $
  The corresponding integral operator $T_(K_N)$ is given by:
  $ (T_(K_N) f) (x) = integral_Omega (sum_(i , j = 1)^N c_(i j) phi.alt_i (x) overline(phi.alt_j (y))) f (y) dif y = sum_(i = 1)^N (sum_(j = 1)^N c_(i j) angle.l f , phi.alt_j angle.r) phi.alt_i (x). $
  The range of $T_(K_N)$ is contained in the span of ${ phi.alt_1 , dots.h , phi.alt_N }$, which is a finite-dimensional space. Thus, each $T_(K_N)$ is a finite-rank operator and is therefore compact. As $N arrow.r oo$, $K_N arrow.r K$ in the $L^2 (Omega times Omega)$ norm. Using the norm inequality from the first part, we have:
  $ norm(T_K - T_(K_N)) = norm(T_(K - K_N)) lt.eq norm(K - K_N)_(L^2 (Omega times Omega)) arrow.r 0. $
  So, $T_(K_N) arrow.r T_K$ in the operator norm. Since $T_K$ is the norm-limit of a sequence of finite-rank (and thus compact) operators, and $cal(K) (L^2 (Omega))$ is closed, $T_K$ must be compact.
]

=== Duality of Compact Operators

A fundamental duality result for compact operators is Schauder's Theorem, which states that an operator is compact if and only if its adjoint is compact.

#theorem(title: "Schauder")[
Let $X$ and $Y$ be Banach spaces and $T in cal(B) (X , Y)$. Then $T$ is compact if and only if its adjoint operator $T^* : Y^* arrow.r X^*$ is compact.
]

#proof[
- #strong[($arrow.r.double$) Assume $T$ is compact. We show $T^*$ is compact.] Let ${ f_n }$ be a bounded sequence in the dual space $Y^*$; say $norm(f_n)_(Y^*) lt.eq M$ for all $n$. We want to show that ${ T^* f_n }$ has a convergent subsequence in $X^*$.

  Let $ball_X$ be the closed unit ball in $X$. Since $T$ is compact, the set $K = overline(T (ball_X))$ is a compact subset of $Y$. Consider the sequence of functions ${ Phi_n }$ obtained by restricting each functional $f_n$ to the compact set $K$. That is, $Phi_n = f_n mid(|)_K : K arrow.r bb(F)$ (where $bb(F)$ is $bb(R)$ or $bb(C)$).

  This sequence of functions ${ Phi_n }$ on $K$ is:
  1. #strong[Uniformly bounded:] For any $y in K$, $abs(Phi_n (y)) = abs(f_n (y)) lt.eq norm(f_n)_(Y^*) norm(y) lt.eq M dot.op sup_(z in K) norm(z)$.
  2. #strong[Equicontinuous:] For any $y_1 , y_2 in K$, $abs(Phi_n (y_1) - Phi_n (y_2)) = abs(f_n (y_1 - y_2)) lt.eq norm(f_n)_(Y^*) norm(y_1 - y_2) lt.eq M norm(y_1 - y_2)$.

  By the Arzelà-Ascoli theorem, there exists a subsequence ${ Phi_(n_k) }$ that converges uniformly on $K$ to some continuous function $g : K arrow.r bb(F)$.

  Now we examine the sequence ${ T^* f_(n_k) }$ in $X^*$. For any $x in ball_X$, we have $T x in T (ball_X) subset.eq K$. Thus,
  $
  abs((T^* f_(n_(k_1))) (x) - (T^* f_(n_(k_2))) (x)) &= abs(f_(n_(k_1)) (T x) - f_(n_(k_2)) (T x)) \
  &= abs(Phi_(n_(k_1)) (T x) - Phi_(n_(k_2)) (T x)). $
  Taking the supremum over $x in ball_X$:
  $
  norm(T^* f_(n_(k_1)) - T^* f_(n_(k_2)))_(X^*) &= sup_(x in ball_X) abs((T^* f_(n_(k_1))) (x) - (T^* f_(n_(k_2))) (x)) \
  &lt.eq sup_(y in K) abs(Phi_(n_(k_1)) (y) - Phi_(n_(k_2)) (y)). $
  Since ${ Phi_(n_k) }$ converges uniformly on $K$, the right-hand side tends to 0 as $k_1 , k_2 arrow.r oo$. This means ${ T^* f_(n_k) }$ is a Cauchy sequence in $X^*$. Since $X^*$ is a Banach space, this subsequence converges. Hence, $T^*$ is compact.

- #strong[($arrow.l.double$) Assume $T^*$ is compact. We show $T$ is compact.] Let ${ x_n }$ be a bounded sequence in $X$. We need to show that ${ T x_n }$ has a convergent subsequence. This part of the proof cleverly uses the bidual (or double dual) operator, $T^(**) : X^(**) arrow.r Y^(**)$.

  Let $J_X : X arrow.r X^(**)$ and $J_Y : Y arrow.r Y^(**)$ be the canonical isometric embeddings. A standard identity relates these maps to the operators: $J_Y T = T^(**) J_X$. Since we assume $T^*$ is compact, by the part we just proved ($arrow.r.double$), its adjoint $(T^*)^* = T^(**)$ must also be compact.

  Now, since ${ x_n }$ is a bounded sequence in $X$ and $J_X$ is an isometry, the sequence ${ J_X (x_n) }$ is a bounded sequence in $X^(**)$. Since $T^(**)$ is compact, there exists a subsequence ${ x_(n_k) }$ such that ${ T^(**) (J_X (x_(n_k))) }$ converges in $Y^(**)$. Using the identity, this means the sequence ${ J_Y (T x_(n_k)) }$ converges in $Y^(**)$. Because convergent sequences are Cauchy sequences, ${ J_Y (T x_(n_k)) }$ is a Cauchy sequence.

  Finally, since $J_Y$ is an isometry, it preserves distances: $ norm(T x_(n_k) - T x_(n_l))_Y = norm(J_Y (T x_(n_k)) - J_Y (T x_(n_l)))_(Y^(**)) $ Since ${ J_Y (T x_(n_k)) }$ is a Cauchy sequence, the right-hand side goes to 0 as $k , l arrow.r oo$. Therefore, ${ T x_(n_k) }$ is a Cauchy sequence in $Y$. As $Y$ is a Banach space, this sequence must converge. This proves that $T$ is compact.
]
