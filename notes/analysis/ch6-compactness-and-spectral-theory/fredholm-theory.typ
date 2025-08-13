#import "../book.typ": *

#show: book-page.with(
  title: "6.2 Fredholm Theory"
)

== Fredholm Theory

=== Fredholm Operators

Let $X$ and $Y$ be Banach spaces and let $cal(B)(X, Y)$ denote the space of all bounded linear operators from $X$ to $Y$.

#definition[
For any operator $T in cal(B)(X, Y)$, we define: 
- #strong[Kernel:] The kernel of $T$ is the subspace of $X$ that is mapped to the zero vector in $Y$.
  $ ker T = { x in X mid(|) T x = 0 } = T^(- 1) ({ 0 }). $ 
- #strong[Range:] The range of $T$ is the subspace of $Y$ consisting of all possible values of $T (x)$.
  $ ran T = { y in Y mid(|) exists x in X , y = T x } = T (X). $
- #strong[Cokernel:] The cokernel of $T$ is the quotient space of the codomain $Y$ by the range of $T$.
  $ coker T = Y \/ ran T. $
  The dimension of the cokernel is referred to as the codimension of the range: $codim (ran T) = dim (coker T)$.
]

#definition(title: "Fredholm Operator")[
An operator $T in cal(B)(X, Y)$ is called a #strong[Fredholm operator] if it satisfies two conditions:
1. The kernel of $T$ is finite-dimensional, i.e., $dim (ker T) < oo$.
2. The range of $T$ is a closed subspace of $Y$ and has finite codimension, i.e., $dim (Y \/ ran T) < oo$. 
]


The set of all Fredholm operators from $X$ to $Y$ is denoted by $fred(X , Y)$. Intuitively, a Fredholm operator is one that is "almost invertible". The non-trivial kernel and the non-surjective range are "finite-dimensional defects" that prevent it from being a true isomorphism.

#definition(title: "Fredholm Index")[
For a Fredholm operator $T in fred(X , Y)$, the #strong[Fredholm index] is defined as the integer:  $ index(T) = dim (ker T) - codim (ran T). $
]

A key result in Fredholm theory is that the property of being a Fredholm operator is stable under small perturbations. This is formalized in the following theorem.

#theorem[
Let $X$ and $Y$ be Banach spaces. Then:
1. The set $fred(X , Y)$ is an #strong[open subset] of $cal(B)(X, Y)$.
2. The map $index: fred(X , Y) arrow.r bb(Z)$ is #strong[continuous];.  Since the codomain is the set of integers, this implies the index is locally constant.
]

#proof[

#strong[Part 1: $fred(X , Y)$ is open.]  Let $T in fred(X , Y)$. Our goal is to show that there exists an $epsilon > 0$ such that any operator $S in cal(B)(X, Y)$ with $norm(T - S) < epsilon$ is also a Fredholm operator.

+ #strong[Decomposition of Spaces:] Since $ker T$ is finite-dimensional and $ran T$ is a closed subspace of finite codimension, they are complemented subspaces. This means there exist closed subspaces $X_1 subset X$ and $Y_1 subset Y$ such that we can write the topological direct sums:
  $ X = ker T xor X_1 quad "and" quad Y = ran T xor Y_1. $
  Note that $dim (Y_1) = codim (ran T) < oo$.

+ #strong[Constructing an Isomorphism:] Consider the restriction of $T$ to $X_1$, denoted $T mid(|)_(X_1) : X_1 arrow.r ran T$. This map is a linear bijection. By the Banach isomorphism theorem, it is an isomorphism. Now, define a new operator $tilde(T) : X_1 xor Y_1 arrow.r Y$ by: $ tilde(T) (x_1 , y_1) = T x_1 + y_1 $ This operator $tilde(T)$ is a linear bijection between Banach spaces, and thus it is also a Banach space isomorphism. 

+ #strong[Perturbation:] Let $S in cal(B)(X, Y)$ be an operator close to $T$. We construct a corresponding perturbed operator $tilde(S) : X_1 xor Y_1 arrow.r Y$: $ tilde(S) (x_1 , y_1) = S x_1 + y_1 $ The difference between $tilde(T)$ and $tilde(S)$ can be bounded: $ norm(tilde(T) - tilde(S)) = sup_(norm(x_1) + norm(y_1) = 1) norm((tilde(T) - tilde(S)) (x_1 , y_1)) = sup_(norm(x_1) + norm(y_1) = 1) norm((T - S) x_1) lt.eq norm(T - S). $ Since the set of invertible operators in $cal(B) (X_1 xor Y_1 , Y)$ is open, if we choose $norm(T - S)$ to be sufficiently small, $tilde(S)$ will also be an isomorphism. 

+ #strong[Properties of S:] Assuming $tilde(S)$ is an isomorphism, we can deduce the properties of $S$.

  - #strong[Kernel of S:] We have $ker (S) inter X_1 = { 0 }$ . Indeed, if $x_1 in ker (S) inter X_1$, then $tilde(S) (x_1 , 0) = S x_1 + 0 = 0$. Since $tilde(S)$ is an isomorphism, $(x_1 , 0)$ must be the zero vector, which implies $x_1 = 0$. The quotient map from $ker (S)$ to $X \/ X_1$ is therefore injective. This implies $dim (ker (S)) lt.eq dim (X \/ X_1) = dim (ker (T)) < oo$.
  - #strong[Range of S:] Since $tilde(S)$ is surjective, for any $y in Y$, there exists $(x_1 , y_1) in X_1 xor Y_1$ such that $y = S x_1 + y_1$.  This implies $Y = ran(S) + Y_1$. It follows that: $ codim (ran S) = dim (Y \/ ran S) lt.eq dim (Y_1) = codim (ran T) < oo. $ This also ensures that $ran S$ is a closed subspace. Therefore, $S$ is a Fredholm operator. 

#strong[Part 2: The index is continuous.]  For $S$ sufficiently close to $T$, a more detailed dimensional analysis of the relationships established above shows that $index(S) = index(T)$. Since the index is a locally constant function on a topological space, it is continuous.
]

=== Fredholm Operators and Compact Perturbations

A cornerstone of Fredholm theory is its relationship with compact operators.

#theorem[
Let $X$ be a Banach space and $K in cal(K) (X)$ be a compact operator. Then the operator $T = I - K$ is a Fredholm operator with an index of $0$. 
]<thm:compact-perturbations>

#proof[
+ #strong[$ker (I - K)$ is finite-dimensional:]  Let ${ x_n }$ be a bounded sequence in $ker (I - K)$. Then $(I - K) x_n = 0$, which means $x_n = K x_n$. Since $K$ is a compact operator, the sequence ${ K x_n }$ has a convergent subsequence.  This implies that ${ x_n }$ itself must have a convergent subsequence. This shows that the closed unit ball in $ker (I - K)$ is compact. By the F. Riesz Lemma, this is only possible if $ker (I - K)$ is finite-dimensional. 

+ #strong[$ran(I - K)$ is closed:]  We can write $X = ker (I - K) xor V$ for some closed subspace $V$. The restriction $(I - K) mid(|)_V$ is injective. We can show this restriction has a bounded inverse. Assume for contradiction it does not. Then there exists a sequence ${ v_n } subset V$ with $norm(v_n) = 1$ such that $(I - K) v_n arrow.r 0$. Since $K$ is compact, there is a subsequence (which we still label $v_n$) such that $K v_n arrow.r z in X$. Then $v_n = (I - K) v_n + K v_n arrow.r 0 + z = z$. Since $V$ is closed, $z in V$. Also, $(I - K) z = lim_(n->infinity) (I - K) v_n = 0$, so $z in ker (I - K)$. This means $z in ker (I - K) inter V = { 0 }$, so $z = 0$. This contradicts $norm(z) = lim_(n->infinity) norm(v_n) = 1$.  Thus, $(I - K) mid(|)_V$ has a bounded inverse, which implies that its range, $ran(I - K)$, is closed.

+ #strong[$ran(I - K)$ has finite codimension:]  This can be proven by considering the adjoint operator $T^* = (I - K)^* = I^* - K^*$. Since the adjoint of a compact operator is compact, $K^*$ is compact. From Step 1, we know $dim (ker (I^* - K^*))$ is finite. By standard results from functional analysis, we have the relationship: $ overline(ran(I - K)) = (ker ((I - K)^*))^perp = (ker (I^* - K^*))^perp $ Since we know from Step 2 that $ran(I - K)$ is closed, we have: $ codim (ran(I - K)) = dim (X \/ ran(I - K)) = dim (ker (I^* - K^*)) < oo. $ This establishes that the codimension is finite.
+ #strong[$index(I - K) = 0$:] The set of operators of the form $I - t K$ for $t in [0 , 1]$ forms a continuous path within $cal(B) (X , X)$. Since $fred(X)$ is open, this entire path lies within $fred(X)$. As the index function is continuous (and integer-valued), it must be constant along this path. Therefore:
$
index(I - K) &= index(I - 0 dot.op K) \
&= index(I) = dim (ker (I)) - dim (coker(I)) \
&= 0 - 0.
$
]

=== Atkinson's Theorem: An Algebraic Characterization

The intuitive idea that Fredholm operators are "almost invertible" can be made precise. An operator $T$ has a "near inverse" whose failure to be a true inverse is a compact operator.

#definition[
An operator $T in cal(B)(X, Y)$ is said to be #strong[invertible modulo the compact operators] if there exists an operator $S in cal(B) (Y , X)$ (called a #strong[parametrix];) such that:
- $S T = I_X - K_1$ for some compact operator $K_1 in cal(B) (X , X)$.
- $T S = I_Y - K_2$ for some compact operator $K_2 in cal(B) (Y , Y)$.
]

#theorem(title: "Atkinson's Theorem")[
An operator $T in cal(B)(X, Y)$ is Fredholm if and only if it is invertible modulo the compact operators. 
]

#proof[
- #strong[($arrow.r.double$) Fredholm implies invertible modulo $cal(K)$:]  Assume $T$ is a Fredholm operator. We must construct a parametrix $S$. As in the above theorem, we can decompose the spaces: $ X = ker(T) xor X_1 quad "and" quad Y = ran(T) xor Y_1. $ Let $P_X : X arrow.r ker(T)$ and $P_(Y_1) : Y arrow.r Y_1$ be the projection operators. The restriction $T mid(|)_(X_1) : X_1 arrow.r ran(T)$ is a bijective bounded linear operator between Banach spaces. By the Open Mapping Theorem, it has a bounded inverse $(T mid(|)_(X_1))^(- 1) : ran(T) arrow.r X_1$.

  Define the parametrix $S : Y arrow.r X$ as: $ S := (T mid(|)_(X_1))^(- 1) compose (I_Y - P_(Y_1)). $ This operator first projects $Y$ onto $ran(T)$ and then applies the inverse of $T mid(|)_(X_1)$. $S$ is a bounded operator as it's a composition of bounded operators.

  Now we check the compositions:
  - $T S$: For any $y in Y$, $(I_Y - P_(Y_1)) y in ran(T)$. Applying $S$ maps it to some $x_1 in X_1$ such that $T x_1 = (I_Y - P_(Y_1)) y$. Then $T S y = T x_1 = (I_Y - P_(Y_1)) y$. So, $ T S = I_Y - P_(Y_1) arrow.r.double.long I_Y - T S = P_(Y_1). $ The projection $P_(Y_1)$ has a finite-dimensional range ($Y_1$), so it is a finite-rank operator and therefore compact.

  - $S T$: For any $x = x_0 + x_1 in ker(T) xor X_1$, we have $T x = T x_1$. Then $S T x = S (T x_1) = (T mid(|)_(X_1))^(- 1) (T x_1) = x_1$. So, $ S T (x_0 + x_1) = x_1 = (I_X - P_X) (x_0 + x_1). $ This gives $S T = I_X - P_X$, which means: $ I_X - S T = P_X. $ The projection $P_X$ onto the finite-dimensional space $ker(T)$ is a finite-rank operator and thus compact.

  We have found an $S$ such that $I - S T$ and $I - T S$ are compact, so $T$ is invertible modulo compact operators.

- #strong[($arrow.l.double$) Invertible modulo $cal(K)$ implies Fredholm:]  Assume there exists $S in cal(B) (Y , X)$ and compact operators $K_1 , K_2$ such that $S T = I_X - K_1$ and $T S = I_Y - K_2$.
  - #strong[Kernel:] We have $ker T subset ker (S T) = ker (I_X - K_1)$. By @thm:compact-perturbations, $I_X - K_1$ is a Fredholm operator, so its kernel is finite-dimensional. Thus, $dim (ker T) < oo$.
  - #strong[Range:] We have $ran T supset ran(T S) = ran(I_Y - K_2)$. Again by @thm:compact-perturbations, $I_Y - K_2$ is Fredholm, so its range is closed and has finite codimension. A subspace that contains a closed, finite-codimensional subspace must itself be closed and of finite codimension. Therefore, $ran T$ is closed and has finite codimension. 
]

