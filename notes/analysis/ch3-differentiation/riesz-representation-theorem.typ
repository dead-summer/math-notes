#import "../book.typ": *

#show: book-page.with(
  title: "3.6 The Riesz Representation Theorem"
)

== The Riesz Representation Theorem

=== The Space of $cal(M) (X)$

#definition[
A topological space $X$ is called *locally compact* if every point in $X$ has a compact neighborhood.
]

#definition[
A space is a *Hausdorff space* if for any two distinct points $p, q in X$, there exist disjoint open neighborhoods $U$ of $p$ and $V$ of $q$.
]

Let $X$ be a locally compact Hausdorff space. We consider the set of all finite signed Radon measures on the Borel $sigma$-algebra of $X$, denoted by $cal(M) (X)$.

To ensure that $cal(M) (X)$ forms a vector space, we restrict our consideration to #strong[finite] signed measures, where $abs(mu) (X) < oo$.

Our first objective is to demonstrate that $cal(M) (X)$ is not just a vector space, but a complete normed vector space---a Banach space.

#theorem[
The space $cal(M) (X)$ is a Banach space with the norm defined by the total variation of the measure: $ norm(mu) := abs(mu) (X) $ where $abs(mu)$ is the total variation measure of $mu$.
]

#proof[
We must verify that $norm(dot.op)$ satisfies the three properties of a norm and that the space is complete under this norm.

- #strong[Homogeneity:] For any $lambda in bb(R)$ and $mu in cal(M) (X)$, we need to show $norm(lambda mu) = abs(lambda) norm(mu)$. The total variation of $lambda mu$ is given by $abs(lambda mu) (X)$. If $lambda > 0$, then $(lambda mu)^(+) = lambda mu^(+)$ and $(lambda mu)^(-) = lambda mu^(-)$. If $lambda < 0$, then $(lambda mu)^(+) = - lambda mu^(-)$ and $(lambda mu)^(-) = - lambda mu^(+)$. In both cases, the total variation measure is $abs(lambda mu) = abs(lambda) abs(mu)$. Therefore,
  
  $ norm(lambda mu) = abs(lambda mu) (X) = abs(lambda) abs(mu) (X) = abs(lambda) norm(mu) $

- #strong[Non-degeneracy:] We need to show that $norm(mu) = 0$ if and only if $mu = 0$. If $norm(mu) = 0$, then $abs(mu) (X) = 0$. Since $abs(mu)$ is a non-negative measure, this implies $abs(mu)$ is the zero measure. From the definition $abs(mu) = mu^(+) + mu^(-)$, it follows that $mu^(+) (X) = 0$ and $mu^(-) (X) = 0$, making both $mu^(+)$ and $mu^(-)$ zero measures. Thus, $mu = mu^(+) - mu^(-) = 0$. The reverse implication is trivial.

- #strong[Triangle Inequality:] For any $mu_1 , mu_2 in cal(M) (X)$, we must show $norm(mu_1 + mu_2) lt.eq norm(mu_1) + norm(mu_2)$. The total variation of a signed measure $mu$ can be defined as:

  $ abs(mu) (X) = sup {sum_(j = 1)^oo abs(mu (E_j)) : X = union.sq.big_(j = 1)^oo E_j , E_j "are disjoint sets"}. $
  
  Using this definition for $norm(mu_1 + mu_2)$:
  
  $ norm(mu_1 + mu_2) = abs(mu_1 + mu_2) (X) = sup {sum_(j = 1)^oo abs((mu_1 + mu_2) (E_j))}. $

  By the triangle inequality for real numbers, $abs(mu_1 (E_j) + mu_2 (E_j)) lt.eq abs(mu_1 (E_j)) + abs(mu_2 (E_j))$. Thus,
  
  $ sum_(j = 1)^oo abs((mu_1 + mu_2) (E_j)) lt.eq sum_(j = 1)^oo abs(mu_1 (E_j)) + sum_(j = 1)^oo abs(mu_2 (E_j)). $
  
  Taking the supremum over all Borel partitions of $X$, we get:
  
  $ norm(mu_1 + mu_2) lt.eq sup {sum_j abs(mu_1 (E_j))} + sup {sum_j abs(mu_2 (E_j))} = norm(mu_1) + norm(mu_2). $

- #strong[Completeness:] Let ${ mu_j }_(j = 1)^oo$ be a Cauchy sequence in $cal(M) (X)$. This means that for any $epsilon > 0$, there exists an $N$ such that for all $j , k gt.eq N$, we have $norm(mu_j - mu_k) < epsilon$.

  For any fixed Borel set $E subset X$, we have $abs(mu_j (E) - mu_k (E)) = abs((mu_j - mu_k) (E)) lt.eq abs(mu_j - mu_k) (X) = norm(mu_j - mu_k)$. This shows that for each fixed $E$, the sequence of real numbers ${ mu_j (E) }_(j = 1)^oo$ is a Cauchy sequence. By the completeness of $bb(R)$, this sequence converges. Let us define a set function $mu$ by:
  
  $ mu (E) := lim_(j arrow.r oo) mu_j (E). $
  
  One can show that $mu$ is a finite signed measure. A more direct approach is to consider the Jordan decompositions $mu_j = mu_j^(+) - mu_j^(-)$. The sequences ${ mu_j^(+) }$ and ${ mu_j^(-) }$ are also Cauchy sequences of finite positive measures. For any Borel set $E$, the sequences of real numbers ${ mu_j^(+) (E) }$ and ${ mu_j^(-) (E) }$ are Cauchy and thus converge. Let's define: $ mu^(+) (E) := lim_(j arrow.r oo) mu_j^(+) (E) quad upright("and") quad mu^(-) (E) := lim_(j arrow.r oo) mu_j^(-) (E) $

  By the Vitali-Hahn-Saks theorem, $mu^(+)$ and $mu^(-)$ are positive measures. They are also Radon measures. We then define the limit signed measure as $mu := mu^(+) - mu^(-)$. It can be rigorously shown that this limit measure $mu$ is in $cal(M) (X)$ and that $norm(mu_j - mu) arrow.r 0$ as $j arrow.r oo$.

Thus, $cal(M) (X)$ is a complete normed vector space, i.e., a Banach space.
]


=== The Riesz Representation Theorem

The Riesz Representation Theorem establishes a fundamental connection between the space of measures $cal(M) (X)$ and the dual of a particular space of functions on $X$. For this interion, we specialize to $X = bb(R)^d$.

#theorem(title: "Riesz Representation Theorem")[
Let $X$ be a locally compact Hausdorff space. The dual space of $C_0 (X)$ is isometrically isomorphic to the space of finite signed Radon measures $cal(M) (X)$:

$ [C_0 (X)]^* tilde.equiv cal(M) (X). $

This isomorphism is given by the mapping $mu mapsto I_mu$, where $I_mu$ is the linear functional defined by:

$ I_mu (f) := integral_X f dif mu quad "for all" f in C_0 (X). $

Furthermore, the mapping is an #strong[isometry];, meaning the norm of the functional $I_mu$ is equal to the total variation norm of the measure $mu$: $ norm(I_mu)_([C_0 (X)]^*) = norm(mu)_(cal(M) (X)) $
]

#proof[
Let's show that the operator norm of $I_mu$ equals the total variation norm of $mu$.

- #strong[$norm(I_mu) lt.eq norm(mu)$];: The operator norm is $norm(I_mu) = sup { abs(I_mu (f)) : f in C_0 (bb(R)^d) , norm(f)_oo lt.eq 1 }$.

  $ abs(I_mu (f)) = abs(integral_(bb(R)^d) f dif mu) lt.eq integral_(bb(R)^d) abs(f) thin d abs(mu) lt.eq integral_(bb(R)^d) norm(f)_oo thin d abs(mu) = norm(f)_oo abs(mu) (bb(R)^d) = norm(f)_oo norm(mu). $
  
  Taking the supremum over all $f$ with $norm(f)_oo lt.eq 1$, we get $norm(I_mu) lt.eq norm(mu)$.

- #strong[$norm(mu) lt.eq norm(I_mu)$];: The other direction requires more work. We need to find a function $f in C_0 (bb(R)^d)$ with $norm(f)_oo lt.eq 1$ such that $abs(integral f dif mu)$ is arbitrarily close to $norm(mu) = abs(mu) (bb(R)^d)$. By the Hahn decomposition theorem, we can partition $bb(R)^d$ into two disjoint Borel sets, $P$ and $N$, such that $mu^(+) (E) = mu (E inter P)$ and $mu^(-) (E) = - mu (E inter N)$.

  Consider the function $g (x) = indicator_P (x) - indicator_N (x)$. Then
  
  $ integral g dif mu = mu (P) - (- mu (N)) = mu^(+) (P) + mu^(-) (N) = abs(mu) (bb(R)^d). $
  
  However, $g$ is not continuous. By Lusin's theorem, we can find a sequence of functions ${ f_k } in C_c (bb(R)^d)$ such that $norm(f_k)_oo lt.eq 1$ and $f_k arrow.r g$ in $L^1 (abs(mu))$. Then, by the Dominated Convergence Theorem: $ lim_(k arrow.r oo) I_mu (f_k) = lim_(k arrow.r oo) integral_(bb(R)^d) f_k dif mu = integral_(bb(R)^d) g dif mu = abs(mu) (bb(R)^d) = norm(mu) $ Since $norm(I_mu) = sup_(norm(f)_oo lt.eq 1) abs(I_mu (f))$, and we have found a sequence of functions ${ f_k }$ (with $norm(f_k)_oo lt.eq 1$) for which $abs(I_mu (f_k)) arrow.r norm(mu)$, it must be that $norm(I_mu) gt.eq norm(mu)$.

Combining both inequalities, we have $norm(I_mu) = norm(mu)$, proving the map is an isometry.
]
