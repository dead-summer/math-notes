#import "../book.typ": *

#show: book-page.with(
  title: "4.3 Finite Dimensional Normed Vector Space"
)

== Finite Dimensional Normed Vector Space

=== Completeness of Finite-Dimensional Spaces

A fundamental result in functional analysis is that the notion of completeness (being a Banach space) is automatically satisfied for any finite-dimensional normed vector space.

#theorem[
Any finite-dimensional normed vector space $X$ over a complete field $bb(F)$ (where $bb(F) = bb(R)$ or $bb(F) = bb(C)$) is a Banach space. Furthermore, any such space is isometrically isomorphic to $bb(F)^d$ for some norm on $bb(F)^d$, where $d = dim (X)$.
]<thm:finite-dimensional>

#proof[
Let $dim (X) = d$ and fix a basis $cal(B) = { e_1 , dots.h , e_d }$ for $X$. We can define a linear map $Lambda : bb(F)^d arrow.r X$ by:

$ Lambda (lambda_1 , dots.h , lambda_d) = sum_(i = 1)^d lambda_i e_i. $

By construction, $Lambda$ is a vector space isomorphism (it is linear, surjective, and injective since ${ e_i }$ is a basis). We will show that both $Lambda$ and its inverse $Lambda^(- 1)$ are bounded linear operators, which establishes a topological equivalence between $X$ and the Banach space $bb(F)^d$.

+ #strong[Boundedness of $Lambda$];: Let $(lambda_1 , dots.h , lambda_d) in bb(F)^d$. We equip $bb(F)^d$ with the infinity norm, $norm(dot.op)_oo$, where $norm((lambda_1 , dots.h , lambda_d))_oo = max_i abs(lambda_i)$. By the triangle inequality in $X$:

  $
  norm(Lambda (lambda_1 , dots.h , lambda_d))_X &= norm(sum_(i = 1)^d lambda_i e_i)_X lt.eq sum_(i = 1)^d abs(lambda_i) norm(e_i)_X \
  &lt.eq (max_i abs(lambda_i)) (sum_(i = 1)^d norm(e_i)_X) \
  &= C norm((lambda_1 , dots.h , lambda_d))_oo,
  $

  where $C = sum_(i = 1)^d norm(e_i)_X$ is a finite constant. This shows that $Lambda$ is a bounded operator and thus continuous.

+ #strong[Boundedness of $Lambda^(- 1)$];: We argue by contradiction. Assume $Lambda^(- 1)$ is not bounded. Consequently, there must exist a sequence ${ x_n }_(n = 1)^oo subset X$ such that:

  $ norm(Lambda^(- 1) x_n)_oo arrow.r oo quad "as" quad n arrow.r oo , quad "while" quad norm(x_n)_X = 1 "for all" n . $
  
  Let $a_n = Lambda^(- 1) x_n in bb(F)^d$. Define a new sequence ${ b_n }$ in $bb(F)^d$ by normalizing ${ a_n }$:
  
  $ b_n = frac(a_n, norm(a_n)_oo) = frac(Lambda^(- 1) x_n, norm(Lambda^(- 1) x_n)_oo). $
  
  Each $b_n$ lies on the unit sphere in $(bb(F)^d , norm(dot.op)_oo)$, since $norm(b_n)_oo = 1$. By the Heine-Borel theorem, the closed unit ball in $bb(F)^d$ is compact. Therefore, the sequence ${ b_n }$ must have a convergent subsequence, say ${ b_(n_j) }$, which converges to some $b in bb(F)^d$. Since $norm(b_(n_j))_oo = 1$ for all $j$, we must have $norm(b)_oo = 1$.

  However, since $Lambda$ is continuous, we have:
  
  $ Lambda (b) = Lambda (lim_(j arrow.r oo) b_(n_j)) = lim_(j arrow.r oo) Lambda (b_(n_j)) = lim_(j arrow.r oo) frac(Lambda (Lambda^(- 1) x_(n_j)), norm(Lambda^(- 1) x_(n_j))_oo) = lim_(j arrow.r oo) frac(x_(n_j), norm(Lambda^(- 1) x_(n_j))_oo). $
  
  Since $norm(x_(n_j))_X = 1$ and $norm(Lambda^(- 1) x_(n_j))_oo arrow.r oo$, the limit is the zero vector in $X$: $Lambda (b) = 0$. Because $Lambda$ is an isomorphism, $Lambda (b) = 0$ implies $b = 0$. This contradicts our finding that $norm(b)_oo = 1$. Thus, our initial assumption must be false, and $Lambda^(- 1)$ must be bounded.

Since $X$ is linearly and topologically isomorphic to the complete space $(bb(F)^d , norm(dot.op)_oo)$, $X$ must also be a complete space, i.e., a Banach space.

]

#corollary(title: "Equivalence of Norms")[
On any finite-dimensional vector space, all norms are equivalent.
]

#definition(title: "Equivalent Norms")[
Two norms, $norm(dot.op)^((1))$ and $norm(dot.op)^((2))$, on a vector space $X$ are said to be #strong[equivalent] if there exist constants $c_1 , c_2 > 0$ such that for all $x in X$: $ c_1 norm(x)^((2)) lt.eq norm(x)^((1)) lt.eq c_2 norm(x)^((2)) $ Equivalent norms induce the same topology, meaning they have the same open sets and the same convergent sequences.
]



=== Quotient Spaces

Given a normed space and a closed subspace, we can construct a new normed space called the quotient space.

Let $X$ be a normed vector space and $Y subset.eq X$ be a closed subspace. The #strong[quotient space];, denoted $X \/ Y$, is the set of all equivalence classes $[x] = x + Y = { x + y : y in Y }$ for $x in X$. We define the #strong[quotient norm] on $X \/ Y$ as:

$ norm([x])_(X \/ Y) := inf_(z in [x]) norm(z)_X = inf_(y in Y) norm(x - y)_X = dist(x , Y). $

This defines a valid norm on the vector space $X \/ Y$:

- #strong[Non-degeneracy];: $norm([x]) = 0 arrow.l.r.double dist(x , Y) = 0$. Since $Y$ is a closed subspace, $dist(x , Y) = 0 arrow.l.r.double x in overline(Y) = Y$. This in turn means $[x$ is the zero vector in $X \/ Y$.

- #strong[Absolute Homogeneity];: For $lambda in bb(F)$,
  
  $
  norm(lambda [x])_(X \/ Y) &= norm([lambda x])_(X \/ Y) = inf_(y in Y) norm(lambda x - y)_X \
  &= inf_(y' in Y) norm(lambda x - lambda y')_X = abs(lambda) inf_(y' in Y) norm(x - y')_X \
  &= abs(lambda) norm([x])_(X \/ Y).
  $

- #strong[Triangle Inequality];: For $[x_1] , [x_2] in X \/ Y$, $ norm([x_1] + [x_2])_(X \/ Y) = norm([x_1 + x_2])_(X \/ Y) = dist(x_1 + x_2 , Y) $ For any $y_1 , y_2 in Y$, we have

  $ norm((x_1 - y_1) + (x_2 - y_2))_X lt.eq norm(x_1 - y_1)_X + norm(x_2 - y_2)_X. $

  Taking the infimum over all $y_1 , y_2 in Y$ on the right side yields: $ dist(x_1 + x_2 , Y) lt.eq dist(x_1 , Y) + dist(x_2 , Y) $ Hence, $norm([x_1] + [x_2])_(X \/ Y) lt.eq norm([x_1])_(X \/ Y) + norm([x_2])_(X \/ Y)$.

The completeness of the quotient space is preserved if the original space is complete.

#theorem[
Let $X$ be a Banach space and $Y subset.eq X$ be a closed subspace. Then the quotient space $(X \/ Y , norm(dot.op)_(X \/ Y))$ is also a Banach space.
]

#proof[
Let ${ [x_n] }_(n = 1)^oo$ be a Cauchy sequence in $X \/ Y$. We will construct a convergent subsequence.

Since ${ [x_n] }$ is Cauchy, we can find a subsequence, which we relabel as ${ [x_k] }_(k = 1)^oo$, such that: $ norm([x_(k + 1)] - [x_k])_(X \/ Y) < 2^(- k) quad upright("for all ") k gt.eq 1 . $ By the definition of the quotient norm, for each $k$, we can choose a representative $w_k in [x_k]$ such that the distance between consecutive representatives is controlled. Specifically, for $k = 1$, choose any $w_1 in [x_1]$. For $k gt.eq 1$, we know $norm([x_(k + 1) - x_k])_(X \/ Y) < 2^(- k)$. This means $inf_(y in Y) norm(x_(k + 1) - x_k - y) < 2^(- k)$. We can thus choose $y_k in Y$ such that $norm(x_(k + 1) - x_k - y_k) < 2^(- k)$. Define $w_(k + 1) = x_(k + 1) - y_k$. Note that $[w_(k + 1)] = [x_(k + 1) - y_k] = [x_(k + 1)]$. With this choice, we have constructed a sequence of representatives ${ w_k }$ in $X$ such that $norm(w_(k + 1) - w_k)_X < 2^(- k)$ for all $k gt.eq 1$.

This sequence ${ w_k }$ is a Cauchy sequence in $X$. To see this, for any $m > n$:

$
norm(w_m - w_n)_X &= norm(sum_(k = n)^(m - 1) (w_(k + 1) - w_k))_X \
&lt.eq sum_(k = n)^(m - 1) norm(w_(k + 1) - w_k)_X \
&< sum_(k = n)^(m - 1) 2^(- k) < sum_(k = n)^oo 2^(- k) = 2^(- n + 1).
$

As $n arrow.r oo$, this difference goes to zero. Since $X$ is a Banach space, ${ w_k }$ converges to some limit $x in X$.

Finally, we show that the subsequence of equivalence classes ${ [x_k] }$ converges to $[x]$ in $X \/ Y$:

$ norm([x_k] - [x])_(X \/ Y) = norm([w_k] - [x])_(X \/ Y) = norm([w_k - x])_(X \/ Y) lt.eq norm(w_k - x)_X. $

Since $w_k arrow.r x$ in $X$, we have $norm(w_k - x)_X arrow.r 0$. Therefore, $norm([x_k] - [x])_(X \/ Y) arrow.r 0$. The Cauchy sequence ${ [x_n] }$ has a convergent subsequence, so it converges. Hence, $X \/ Y$ is a Banach space.
]



=== Riesz's Lemma and Geometric Characterization

Riesz's Lemma is a crucial tool in functional analysis that provides a geometric insight into the structure of normed spaces. It essentially states that in an infinite-dimensional space, one can always find a unit vector that is "almost orthogonal" to any given finite-dimensional subspace.

#theorem(title: "Riesz's Lemma")[
Let $X$ be a normed vector space and $Y subset X$ be a closed, proper subspace ($Y eq.not X$). Then for any $epsilon in (0 , 1)$, there exists a vector $x_epsilon in X$ with $norm(x_epsilon) = 1$ such that:

$ dist(x_epsilon , Y) gt.eq 1 - epsilon. $
]<thm:riesz-lemma>

#proof[
Since $Y$ is a proper subspace of $X$, we can choose a vector $z in X \\ Y$. Because $Y$ is closed, the distance from $z$ to $Y$, given by $d = dist(z , Y) = inf_(y in Y) norm(z - y)$, is strictly positive ($d > 0$).

By the definition of the infimum, for the given $epsilon in (0 , 1)$, there must exist a $y_0 in Y$ such that:

$ d lt.eq norm(z - y_0) < frac(d, 1 - epsilon). $

Let's define the desired vector $x_epsilon$ as:

$ x_epsilon = frac(z - y_0, norm(z - y_0)). $

Clearly, $norm(x_epsilon) = 1$. Now we compute its distance to $Y$. For any $y in Y$:

$ norm(x_epsilon - y) = norm(frac(z - y_0, norm(z - y_0)) - y) = frac(1, norm(z - y_0)) norm(z - (y_0 + norm(z - y_0) y)). $

Since $Y$ is a subspace, the vector $y' = y_0 + norm(z - y_0) y$ is also in $Y$. Therefore:

$ norm(x_epsilon - y) = frac(norm(z - y'), norm(z - y_0)) gt.eq frac(inf_(y'' in Y) norm(z - y''), norm(z - y_0)) = frac(d, norm(z - y_0)). $

Using our choice of $y_0$, we have $norm(z - y_0) < d \/ (1 - epsilon)$, which implies $d \/ (norm(z - y_0)) > 1 - epsilon$. Thus, for any $y in Y$, $norm(x_epsilon - y) > 1 - epsilon$. Taking the infimum over all $y in Y$, we get:

$ dist(x_epsilon , Y) gt.eq 1 - epsilon. $
]

This lemma provides a powerful characterization of finite-dimensional normed spaces.

#theorem(title: "F. Riesz")[
A normed vector space $X$ is finite-dimensional if and only if its closed unit ball $ball(0, 1) = { x in X : norm(x) lt.eq 1 }$ is compact.
]

#proof[
- *$arrow.r.double.long$:* If $X$ is finite-dimensional with dimension $d$, then by @thm:finite-dimensional, it is topologically isomorphic to $bb(F)^d$. The closed unit ball in $X$ is the image of a closed and bounded set in $bb(F)^d$ under a continuous map. By the Heine-Borel theorem in $bb(F)^d$, this set is compact.

- *$arrow.l.double.long$:* Assume $ball(0, 1)$ is compact. We argue by contradiction. Suppose $X$ is infinite-dimensional. We will construct a sequence in the unit sphere $sphere(0, 1) = { x in X : norm(x) = 1 }$ that has no convergent subsequence, contradicting compactness.
  
  1. Choose any $x_1 in X$ with $norm(x_1) = 1$. Let $Y_1 = span{ x_1 }$. Since $Y_1$ is finite-dimensional, it is a closed, proper subspace of $X$.
  
  2. By Riesz's Lemma with $epsilon = 1 \/ 2$, there exists an $x_2 in sphere(0, 1)$ such that $dist(x_2 , Y_1) gt.eq 1 \/ 2$.
  
  3. Let $Y_2 = span{ x_1 , x_2 }$. This is again a closed, proper subspace. By Riesz's Lemma, there exists an $x_3 in sphere(0, 1)$ such that $dist(x_3 , Y_2) gt.eq 1 \/ 2$.
  
  4. Continuing this process inductively, we construct a sequence ${ x_n }_(n = 1)^oo subset sphere(0, 1)$ such that for each $n > 1$:
  
    $ dist(x_n , span{ x_1 , dots.h , x_(n - 1) }) gt.eq 1 \/ 2. $
  
    This implies that for any $n > m$,
  
    $
    norm(x_n - x_m) &= norm(x_n - (- sum_(i = 1)^m 0 dot.op x_i - x_m)) \
    &gt.eq dist(x_n , span{ x_1 , dots.h , x_(n - 1) }) \
    &gt.eq 1 \/ 2.
    $
    
    The sequence ${ x_n }$ lies within the compact set $ball(0, 1)$, but the distance between any two distinct elements is at least $1 \/ 2$. Such a sequence cannot have a convergent subsequence. This contradicts the assumption that $ball(0, 1)$ is compact. Therefore, $X$ must be finite-dimensional.

]

=== The Stone-Weierstrass Theorem

The Stone-Weierstrass theorem is a cornerstone of approximation theory, providing conditions under which a subalgebra of continuous functions is dense in the space of all continuous functions.

Let $E$ be a metric space. The space of all continuous bounded functions from $E$ to $bb(R)$, denoted $C_b (E , bb(R))$, equipped with the supremum norm $norm(f)_oo = sup_(x in E) abs(f (x))$, is a Banach space. It is also a #strong[Banach algebra];, meaning it satisfies $norm(f dot.op g)_oo lt.eq norm(f)_oo norm(g)_oo$. If $cal(A) subset.eq C_b (E , bb(R))$ is a subalgebra, its closure $overline(cal(A))$ is also a subalgebra.

#theorem(title: "Stone-Weierstrass, Real Version")[
Let $E$ be a compact metric space. Let $cal(A)$ be a subalgebra of $C (E , bb(R))$ (the space of real-valued continuous functions on $E$). If $cal(A)$ satisfies the following two conditions:
1. #strong[Separates points];: For any distinct points $x , y in E$, there exists a function $f in cal(A)$ such that $f (x) eq.not f (y)$.
2. #strong[Contains constant functions];: For every $c in bb(R)$, the constant function $f (x) = c$ is in $cal(A)$. (It is sufficient that the function $f (x) = 1$ is in $cal(A)$).

Then $cal(A)$ is dense in $C (E , bb(R))$, i.e., $overline(cal(A)) = C (E , bb(R))$.
]

#example[
Let $E subset bb(R)^d$ be a compact set. The set $cal(A)$ of all polynomial functions restricted to $E$, $cal(A) = { p \|_E : p in bb(R) [x_1 , dots.h , x_d] }$, is a subalgebra of $C (E , bb(R))$. It contains constants and separates points. Therefore, by the Stone-Weierstrass theorem, any continuous function on $E$ can be uniformly approximated by polynomials.
]


The theorem as stated above is false for complex-valued functions. An additional condition is required.

#example(title: "Counterexample")[
Let $K = { z in bb(C) : 1 \/ 2 lt.eq abs(z) lt.eq 3 \/ 2 }$ be a compact annulus in the complex plane. Consider the algebra $cal(A) = bb(C) [z]$ of polynomials in $z$. This algebra separates points and contains constants. However, the function $f (z) = 1 \/ z$ is in $C (K , bb(C))$ but cannot be uniformly approximated by polynomials. This is because, by Cauchy's Integral Theorem, for any polynomial $p (z)$, the integral over the unit circle $sphere(0, 1) subset K$ is zero:

$ integral.cont_(sphere(0, 1)) p (z) dif z = 0. $

However, for $f (z) = 1 \/ z$:

$ integral.cont_(sphere(0, 1)) f (z) dif z = integral.cont_(sphere(0, 1)) 1 / z dif z = 2 pi i. $

If a sequence of polynomials ${ p_n }$ converged uniformly to $f$ on $K$, then uniform convergence would allow us to interchange the limit and the integral:

$ lim_(n arrow.r oo) integral.cont_(sphere(0, 1)) p_n (z) dif z = integral.cont_(sphere(0, 1)) lim_(n arrow.r oo) p_n (z) dif z = integral.cont_(sphere(0, 1)) f (z) dif z. $

This would imply $0 = 2 pi i$, a contradiction.
]

#theorem(title: "Stone-Weierstrass, Complex Version")[
Let $E$ be a compact metric space and $cal(A)$ be a subalgebra of $C (E , bb(C))$. If $cal(A)$ separates points, contains constant functions, and assuming either:
- #strong[Closed under complex conjugation:] For every $f in cal(A)$, its conjugate $overline(f)$ is also in $cal(A)$), then $overline(cal(A)) = C (E , bb(C))$.
- #strong[Simply-connected:] $E$ is simply-connected. In other words, $CC \/ E$ is connected.

Then $cal(A)$ is dense in $C (E , bb(R))$, i.e., $overline(cal(A)) = C (E , bb(R))$.
]

#example[
Let $E = sphere(0, 1) = { e^(imUnit theta) : theta in [ 0 , 2 pi ) }$. Consider the algebra of trigonometric polynomials:

$ cal(A) = {sum_(n = - N)^N c_n e^(imUnit n theta) : c_n in bb(C) , N in bb(N)}. $

This is a subalgebra of $C (sphere(0, 1) , bb(C))$.
- It contains constants (for $N = 0$).
- It separates points (e.g., $f (theta) = e^(imUnit theta)$ does).
- It is closed under conjugation: if $f (theta) = sum c_n e^(imUnit n theta)$, then $overline(f (theta)) = sum overline(c_n) e^(- imUnit n theta)$, which is also a trigonometric polynomial.

Therefore, by the complex Stone-Weierstrass theorem, $cal(A)$ is dense in $C (sphere(0, 1) , bb(C))$.
]

#corollary[
Any continuous $2 pi$-periodic function $g : bb(R) arrow.r bb(R)$ can be uniformly approximated by trigonometric polynomials of the form

$ sum_(k = 1)^N a_k sin (k x) + sum_(l = 0)^N b_l cos (l x). $
]

This follows from the previous example by considering the real part of the approximation and using Euler's formula ($e^(imUnit n theta) = cos (n theta) + imUnit sin (n theta)$).
