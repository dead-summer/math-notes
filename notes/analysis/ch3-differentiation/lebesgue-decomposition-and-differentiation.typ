#import "../book.typ": *

#show: book-page.with(
  title: "3.2 Lebesgue Decomposition and Differentiation"
)

== Lebesgue Decomposition and Differentiation

In this interion, we explore the fundamental structure of measures. A central theme is the decomposition of one measure with respect to another into components that are either "absolutely continuous" or "singular". This leads to the celebrated Lebesgue-Radon-Nikodym theorem, which provides a way to represent one measure as an integral with respect to another, forming a cornerstone of modern analysis and probability theory.

=== Absolute Continuity and Singularity

We begin by defining the two fundamental relationships between a pair of measures.

#definition[
Let $mu$ and $nu$ be positive Radon measures on $bb(R)^n$, denoted $mu , nu in cal(M)^(+)(bb(R)^n)$.

+ We say that $nu$ is #strong[absolutely continuous] with respect to $mu$, denoted $nu lt.double mu$, if for any Borel set $A subset.eq bb(R)^n$, the condition $mu(A) = 0$ implies $nu(A) = 0$. In essence, any set negligible to $mu$ is also negligible to $nu$.

+ We say that $mu$ and $nu$ are #strong[mutually singular];, denoted $nu perp mu$, if they are supported on disjoint sets. Formally, there exists a Borel set $B subset.eq bb(R)^n$ such that $mu(B) = 0$ and $nu(bb(R)^n \\ B) = 0$.
]

#example[
Let $mu = cal(L)^n$ be the $n$-dimensional Lebesgue measure and $nu = delta_0$ be the Dirac measure centered at the origin. Then $mu perp nu$. To see this, consider the Borel set $B = { 0 }$. We have $mu(B) = cal(L)^n ({ 0 }) = 0$. The complement is $bb(R)^n \\ B = bb(R)^n \\ { 0 }$, and $nu(bb(R)^n \\ B) = delta_0(bb(R)^n \\ { 0 }) = 0$. Thus, the conditions for mutual singularity are satisfied.
]

A more subtle example of a singular measure arises from the Cantor-Lebesgue function, often called the "Devil's Staircase".

#example[
The Cantor-Lebesgue function $phi.alt : arrow.r$ is a continuous, non-decreasing function such that $phi.alt(0) = 0$, $phi.alt(1) = 1$, and $phi.alt$ is constant on each open interval removed during the construction of the standard Cantor set $C subset [0, 1]$.

Since the total length of these removed intervals is $1$, the derivative $phi.alt'$ exists and is equal to $0$ for all $x in [0, 1] \\ C$. As the Cantor set has Lebesgue measure zero, $cal(L)^1(C) = 0$, we have that $phi.alt' = 0$ almost everywhere with respect to the Lebesgue measure. Consequently, the Fundamental Theorem of Calculus in its Riemann form fails: $ integral_0^1 phi.alt'(x) dif x = 0 eq.not 1 = phi.alt(1) - phi.alt(0) . $ The function $phi.alt$ induces a Lebesgue-Stieltjes measure $nu_phi.alt$ on $[0, 1]$. This measure is supported entirely on the Cantor set $C$. Since $cal(L)^1(C) = 0$ and $nu_phi.alt ([0, 1] \\ C) = 0$, we conclude that $nu_phi.alt perp cal(L)^1$.
]


=== The Radon-Nikodym Theorem

The Radon-Nikodym theorem establishes a crucial link between absolute continuity and integration. It states that if a measure $nu$ is absolutely continuous with respect to $mu$, then $nu$ can be expressed as an integral with respect to $mu$.

#theorem(title: "The Radon-Nikodym Theorem")[
Let $mu , nu in cal(M)^(+)(bb(R)^n)$ be two positive Radon measures. If $nu lt.double mu$, then there exists a non-negative, $mu$-measurable function $h : bb(R)^n arrow.r \[ 0 , oo \]$, such that for any $mu$-measurable set $A subset.eq bb(R)^n$, $ nu(A) = integral_A h dif mu . $ This function $h$ is unique up to a set of $mu$-measure zero and is called the #strong[Radon-Nikodym derivative] of $nu$ with respect to $mu$, denoted by $frac(dif nu, dif mu)$.
]

#proof[
We will show that $cal(D)_mu nu$ is one of the derivatives that satisfies the condition.

1. #strong[Analysis on Special Sets.] Let $Z = { x in bb(R)^n: cal(D)_mu nu(x) = 0 }$ and $I = { x in bb(R)^n: cal(D)_mu nu(x) = oo }$. Indeed, we've proved in the previous interion that $mu(I) = 0$. Since $nu lt.double mu$, it follows that $nu(I) = 0$. Therefore, $integral_I cal(D)_mu nu dif mu = nu(I)$, satisfying the identity on $I$.

  For the set $Z$, since the derivative $cal(D)_mu nu (x)$ exists for $mu$-a.e. $x in bb(R)^n$. By @lem:measure-comparison:
  $
  nu (Z) <= alpha mu(Z) < infinity, quad forall alpha > 0. 
  $
  This implies $nu(Z) = 0$. Thus, $integral_Z cal(D)_mu nu dif mu = integral_Z 0 dif mu = 0 = nu(Z)$, and the identity holds for $Z$.

2. #strong[Analysis on General Sets.] Let $A$ be a $mu$-measurable set. Fix $lambda in(1 , oo)$ and partition $A$ based on the values of the derivative:

  $ A_m := A inter { x in bb(R)^n: lambda^m lt.eq cal(D)_mu nu(x) < lambda^(m + 1) } , quad m in bb(Z) . $
  
  The union $union.big_(m in bb(Z)) A_m$ covers $A$ up to a set of $nu$-measure zero (namely, $A inter(Z union I union { cal(D)_mu nu "doesn't exist" })$). From the definition of the measure derivative, for any set $E$, we have $nu(E) lt.eq sup_E (cal(D)_mu nu) dot.op mu(E)$ and $nu(E) gt.eq inf_E (cal(D)_mu nu) dot.op mu(E)$. Applying this to each $A_m$:
  
  $ lambda^m mu(A_m) lt.eq nu(A_m) lt.eq lambda^(m + 1) mu(A_m) . $
  
  Summing over all $m in bb(Z)$: $ sum_(m in bb(Z)) lambda^m mu(A_m) lt.eq sum_(m in bb(Z)) nu(A_m) = nu(A) . $ Also, note that $integral_(A_m) cal(D)_mu nu dif mu lt.eq lambda^(m + 1) mu(A_m)$. Summing this gives: $ integral_A cal(D)_mu nu dif mu = sum_(m in bb(Z)) integral_(A_m) cal(D)_mu nu dif mu lt.eq sum_(m in bb(Z)) lambda^(m + 1) mu(A_m) = lambda sum_(m in bb(Z)) lambda^m mu(A_m) lt.eq lambda nu(A) . $ This implies $1 / lambda integral_A cal(D)_mu nu dif mu lt.eq nu(A)$. Similarly, using the other side of the inequalities: $ nu(A) = sum_(m in bb(Z)) nu(A_m) lt.eq sum_(m in bb(Z)) lambda^(m + 1) mu(A_m) lt.eq lambda sum_(m in bb(Z)) integral_(A_m) cal(D)_mu nu dif mu = lambda integral_A cal(D)_mu nu dif mu . $ Combining these results, we have for any $lambda > 1$: $ 1 / lambda integral_A cal(D)_mu nu dif mu lt.eq nu(A) lt.eq lambda integral_A cal(D)_mu nu dif mu . $ Taking the limit as $lambda arrow.r 1^(+)$, we obtain the desired equality.
]

=== The Lebesgue Decomposition Theorem

The Radon-Nikodym theorem addresses the case where $nu lt.double mu$. The Lebesgue Decomposition Theorem generalizes this to any pair of positive Radon measures, showing that any measure $nu$ can be uniquely split into an absolutely continuous part and a singular part with respect to $mu$.

#theorem(title: "Lebesgue Decomposition Theorem")[
Let $mu , nu in cal(M)^(+)(bb(R)^n)$. Then there exists a unique pair of measures $nu_"ac" , nu_"s" in cal(M)^(+)(bb(R)^n)$ such that:
1. $nu = nu_"ac" + nu_"s"$.
2. $nu_"ac" lt.double mu$.
3. $nu_"s" perp mu$.

Moreover, the Radon-Nikodym derivative satisfies $cal(D)_mu nu = cal(D)_mu nu_"ac"$ ($mu$-a.e.) and $cal(D)_mu nu_"s" = 0$ ($mu$-a.e.).
]

#proof[
Without loss of generality, assume $mu$ and $nu$ are finite measures, i.e., $mu(bb(R)^n) + nu(bb(R)^n) < oo$.

1. #strong[Construction of the Decomposition:] Let

  $ cal(E) = { A subset.eq bb(R)^n: A "is Borel and" mu(bb(R)^n \\ A) = 0 }. $
  
  This is the collection of sets that are "full" from $mu$'s perspective. Let $alpha = inf_(A in cal(E)) nu(A)$. Choose a sequence ${ B_k }_(k = 1)^oo subset cal(E)$ such that $nu(B_k) arrow.r alpha$. Define $B_oo = inter.big_(k = 1)^oo B_k$. Since each $B_k in cal(E)$, we have $mu(bb(R)^n \\ B_k) = 0$. Then
  
  $ mu(bb(R)^n \\ B_oo) = mu (union.big_(k = 1)^oo (bb(R)^n \\ B_k)) lt.eq sum_(k = 1)^oo mu(bb(R)^n \\ B_k) = 0 . $
  
  Thus, $B_oo in cal(E)$. By its construction, $nu(B_oo) = alpha$.

  We now define the decomposition. Let $S = bb(R)^n \\ B_oo$. Define: $ nu_"ac" (A) := nu(A inter B_oo) quad "and" quad nu_"s" (A) := nu(A inter S) . $ Clearly, $nu = nu_"ac" + nu_"s"$.

2. #strong[Verification of Properties:]

  - #strong[Singularity:] We have $mu(S) = mu(bb(R)^n \\ B_oo) = 0$. Also, by definition, $nu_"s" (B_oo) = nu(B_oo inter S) = nu(nothing) = 0$. This shows that $nu_"s" perp mu$ (with singular support set $S$).
  - #strong[Absolute Continuity:] Suppose there exists a Borel set $C$ with $mu(C) = 0$ but $nu_"ac" (C) > 0$. Consider the set $A' = B_oo \\ C$. Then $ mu(bb(R)^n \\ A') = mu((bb(R)^n \\ B_oo) union C) lt.eq mu(bb(R)^n \\ B_oo) + mu(C) = 0 + 0 = 0 . $ So, $A' in cal(E)$. However, $ nu(A') = nu(B_oo \\ C) = nu(B_oo) - nu(B_oo inter C) = alpha - nu_"ac" (C) < alpha . $ This contradicts the definition of $alpha$ as the infimum. Therefore, no such set $C$ exists, and we must have $nu_"ac" lt.double mu$.

3. #strong[Derivative Property:] Since $nu_"s" perp mu$ with singular support $S = bb(R)^n \\ B_oo$, for any $alpha > 0$, consider the set $Z_alpha = { x in B_oo: cal(D)_mu nu_"s" (x) gt.eq alpha }$. From the properties of the measure derivative, $alpha mu(Z_alpha) lt.eq nu_"s" (Z_alpha)$. But $Z_alpha subset.eq B_oo$ and $nu_s$ is supported on the complement of $B_oo$, so $nu_"s" (Z_alpha) = 0$. This implies $mu(Z_alpha) = 0$ for all $alpha > 0$. Taking a union over a countable sequence of $alpha$ values approaching $0$ shows that $mu({ x in B_oo: cal(D)_mu nu_"s" (x) > 0 }) = 0$. Since $mu(bb(R)^n \\ B_oo) = 0$, we conclude $cal(D)_mu nu_"s" = 0$ $mu$-a.e. The claim for $cal(D)_mu nu$ follows from the linearity of the derivative.
]

#corollary[
For any Borel set $A subset.eq bb(R)^n$, the Lebesgue decomposition combined with the Radon-Nikodym theorem yields: $ nu(A) = nu_"ac" (A) + nu_"s" (A) = integral_A frac(dif nu_"ac", dif mu) dif mu + nu_"s" (A) . $
]


=== The Lebesgue Differentiation Theorem

The Lebesgue Differentiation Theorem is a profound result that connects the abstract Radon-Nikodym derivative to a concrete limiting process of averages, justifying the term "derivative". It essentially states that for a locally integrable function, the average value over shrinking balls converges to the function's value at almost every point.

#definition(title: "Locally Integrable Functions")[
A function $f : bb(R)^n arrow.r bb(R)$ is said to be #strong[locally integrable] with respect to a measure $mu$, denoted $f in L_("loc")^1 (bb(R)^n , mu)$, if for every compact set $K subset bb(R)^n$, the restriction of $f$ to $K$ is integrable, i.e., $integral_K abs(f) dif mu < oo$.
]

#example[
The constant function $f(x) equiv 1$ on $bb(R)^n$ is in $L_("loc")^1(bb(R)^n , cal(L)^n)$ because for any compact set $K$, $integral_K 1 dif cal(L)^n = cal(L)^n (K) < oo$. However, $f in.not L^1(bb(R)^n , cal(L)^n)$ since $integral_(bb(R)^n) 1 dif cal(L)^n = oo$.
]

The average value of a function $f$ over a set $A$ with $mu(A) in(0 , oo)$ is denoted by $ integral.slash_A f dif mu = frac(1, mu(A)) integral_A f dif mu . $

#theorem(title: "Lebesgue-Besicovitch Differentiation Theorem")[
Let $mu in cal(M)^(+)(bb(R)^n)$ be a positive Radon measure, and let $f in L_("loc")^1(bb(R)^n , mu)$. Then for $mu$-almost every $x in bb(R)^n$,

$ lim_(r arrow.r 0^(+)) integral.slash_(ball(x, r)) f dif mu = lim_(r arrow.r 0^(+)) frac(1, mu(ball(x, r))) integral_(ball(x, r)) f dif mu = f(x) . $

Here, $ball(x, r)$ denotes the open ball of radius $r$ centered at $x$.
]<thm:lebesgue-besicovitch-differentiation>

#proof[
This theorem can be seen as a direct consequence of the Radon-Nikodym theorem.

1. Decompose $f$ into its positive and negative parts, $f = f^(+) - f^(-)$. It suffices to prove the theorem for non-negative $f$.

2. For a non-negative $f in L_("loc")^1(bb(R)^n , mu)$, define a new measure $nu$ by $nu(A) = integral_A f dif mu$. By construction, $nu lt.double mu$.

3. By the Radon-Nikodym theorem, $nu(A) = integral_A frac(dif nu, dif mu) dif mu$. Since this holds for all $A$, we must have $f(x) = frac(dif nu, dif mu)(x)$ for $mu$-a.e. $x$.

4. Combining these facts:
  $ f(x) = frac(dif nu, dif mu)(x) = cal(D)_mu nu (x)= lim_(r arrow.r 0^(+)) frac(nu(ball(x, r)), mu(ball(x, r))) = lim_(r arrow.r 0^(+)) frac(1, mu(ball(x, r))) integral_(ball(x, r)) f dif mu quad mu "-a.e." $
  This completes the connection.
]

=== Lebesgue Points

The conclusion of the Lebesgue Differentiation Theorem can be strengthened. The convergence holds not just for the function itself, but for the average deviation from its value at a point. Points where this stronger convergence holds are called Lebesgue points.

#definition(title: "Lebesgue Points")[
Let $mu in cal(M)^(+)(bb(R)^n)$, $1 lt.eq p < oo$, and $f in L_("loc")^p (bb(R)^n, mu)$. A point $x in bb(R)^n$ is called an #strong[($L^p$-)Lebesgue point] of $f$ if $ lim_(r arrow.r 0^(+)) integral.slash_(ball(x, r)) abs(f(y) - f(x))^p dif mu(y) = 0 . $
]

#theorem[
Let $mu in cal(M)^(+)(bb(R)^n)$, $1 lt.eq p < oo$, and $f in L_("loc")^p (bb(R)^n , mu)$. Then $mu$-almost every $x in bb(R)^n$ is a Lebesgue point of $f$.
]

#proof[
Let $bb(Q) = { q_j }_(j = 1)^oo$ be an enumeration of the rational numbers.

+ For any fixed rational number $q_j$, the function $g_j(y) = abs(f(y) - q_j)^p$ is in $L_("loc")^1(bb(R)^n , mu)$. By the Lebesgue Differentiation Theorem, for $mu$-a.e. $x in bb(R)^n$,

  $ lim_(r arrow.r 0^(+)) integral.slash_(ball(x, r)) abs(f(y) - q_j)^p dif mu(y) = abs(f(x) - q_j)^p . $

  Let $cal(N)_j$ be the null set where this fails. Then $cal(N) = union.big_(j = 1)^oo cal(N)_j$ is also a null set.

+ Now, fix any $x in bb(R)^n \\ cal(N)$ and any $epsilon > 0$. Since $bb(Q)$ is dense in $bb(R)$, we can choose a rational $q_j$ such that $abs(f(x) - q_j)^p < epsilon$.

+ Using the inequality $(a + b)^p lt.eq 2^(p - 1)(a^p + b^p)$, we have:
  $
  integral.slash_(ball (x, r)) abs(f (y) - f (x))^p dif mu (y) & lt.eq integral.slash_(ball (x, r)) abs(abs(f (y) - q_j) + abs(q_j - f (x)))^p dif mu (y)\
  & lt.eq 2^(p - 1) (integral.slash_(ball (x, r)) abs(f (y) - q_j)^p dif mu (y) + abs(f (x) - q_j)^p) .
  $

+ Take the limit superior as $r arrow.r 0^(+)$ on both sides. Since $x in.not cal(N)$, the integral term converges to $abs(f(x) - q_j)^p$.

  $
  &limsup_(r arrow.r 0^(+)) integral.slash_(ball(x, r)) abs(f(y) - f(x))^p dif mu(y) \
  lt.eq & 2^(p - 1) abs(f(x) - q_j)^p + 2^(p - 1) abs(f(x) - q_j)^p \
  = & 2^p abs(f(x) - q_j)^p .
  $

+ By our choice of $q_j$, we have $2^p abs(f(x) - q_j)^p < 2^p epsilon$. Since $epsilon > 0$ was arbitrary, the limit superior must be $0$. As the integrand is non-negative, the limit exists and is $0$. This holds for all $x in.not cal(N)$, proving the theorem.
]



=== Density of Sets and Approximate Continuity

A special case of the Lebesgue Differentiation Theorem provides a powerful geometric tool for understanding the structure of measurable sets.

#definition(title: "Density of a Set")[
Let $E subset.eq bb(R)^n$ be a Borel set. The #strong[density of $E$ at a point $x$] is defined as the limit, if it exists:

$ Theta_E (x) := lim_(r arrow.r 0^(+)) frac(cal(L)^n (E inter ball(x, r)), cal(L)^n (ball(x, r))) . $

This can be obtained by applying the Lebesgue Differentiation Theorem (@thm:lebesgue-besicovitch-differentiation) to the characteristic function $f = indicator_E$. The theorem implies that for $cal(L)^n$-a.e. $x in bb(R)^n$,

$
Theta_E (x) = indicator_E (x) = cases(delim: "{",
  1 & "if" x in E,
  0 & "if" x in.not E
)
$

Points where $Theta_E (x) = 1$ are called #strong[points of density] of $E$, forming the measure-theoretic interior. Points where $Theta_E (x) = 0$ form the measure-theoretic exterior. At a "nice" boundary, such as the boundary of a $C^1$ domain, one can show that $Theta_E (x) = 1 \/ 2$ for $x in partial E$.
]

This measure-theoretic perspective leads to a weaker, yet more general, notion of continuity.

#definition(title: "Approximate Limit and Continuity")[
Let $f : bb(R)^n arrow.r bb(R)^m$. We say that $L in bb(R)^m$ is the #strong[approximate limit] of $f$ at $x$, written

$ aplim_(y arrow.r x) f(y) = L , $

if for every $epsilon > 0$, the set ${ y in bb(R)^n : abs(f(y) - L) gt.eq epsilon }$ has density $0$ at $x$. That is,

$ lim_(r arrow.r 0^(+)) frac(cal(L)^n (ball(x, r) inter { y : abs(f(y) - L) gt.eq epsilon }), cal(L)^n (ball(x, r))) = 0 . $

The function $f$ is #strong[approximately continuous] at $x$ if $aplim_(y arrow.r x) f(y) = f(x)$.
]

#proposition[
The approximate limit, if it exists, is unique.
]

#proof[
Suppose, for the sake of contradiction, that $L_1 = aplim_(y arrow.r x) f (y)$ and $L_2 = aplim_(y arrow.r x) f (y)$ with $L_1 eq.not L_2$.

Let $epsilon = abs(L_1 - L_2) \/ 3$. Since $epsilon > 0$, by the definition of the approximate limit, we have:

$ lim_(r arrow.r 0^(+)) frac(cal(L)^n (ball (x, r) inter { y : abs(f (y) - L_1) gt.eq epsilon }), cal(L)^n (ball (x, r))) = 0, $

$ lim_(r arrow.r 0^(+)) frac(cal(L)^n (ball (x, r) inter { y : abs(f (y) - L_2) gt.eq epsilon }), cal(L)^n (ball (x, r))) = 0. $

By the triangle inequality, for any point $y in bb(R)^n$:

$ 3 epsilon = abs(L_1 - L_2) lt.eq abs(f (y) - L_1) + abs(f (y) - L_2). $

This implies that it is not possible for both $abs(f (y) - L_1) < epsilon$ and $abs(f (y) - L_2) < epsilon$ to hold simultaneously. Therefore, for any $y$, at least one of $abs(f (y) - L_1) gt.eq epsilon$ or $abs(f (y) - L_2) gt.eq epsilon$ must be true.

This means that any ball $ball (x, r)$ is completely contained within the union of the two sets:

$ ball (x, r) subset.eq { y : abs(f (y) - L_1) gt.eq epsilon } union { y : abs(f (y) - L_2) gt.eq epsilon }. $

Consequently, by the subadditivity of measure:

$
cal(L)^n (ball (x, r)) lt.eq & cal(L)^n (ball (x, r) inter { y : abs(f (y) - L_1) gt.eq epsilon }) \
& + cal(L)^n (ball (x, r) inter { y : abs(f (y) - L_2) gt.eq epsilon }).
$

Dividing by $cal(L)^n (ball (x, r)) = c_n r^n > 0$, we get:

$ 1 lt.eq frac(cal(L)^n (ball (x, r) inter { y : abs(f (y) - L_1) gt.eq epsilon }), cal(L)^n (ball (x, r))) + frac(cal(L)^n (ball (x, r) inter { y : abs(f (y) - L_2) gt.eq epsilon }), cal(L)^n (ball (x, r))). $

Taking the limit as $r arrow.r 0^(+)$, the right-hand side approaches $0 + 0 = 0$. This leads to the contradiction $1 lt.eq 0$. Thus, our initial assumption must be false, and the approximate limit must be unique.
]


The concept of approximate continuity is deeply tied to a cornerstone of real analysis, #strong[Lusin's Theorem];. This theorem is often presented as one of "Littlewood's three principles," which offer guiding intuitions for measure theory:

1. Every measurable set is nearly a finite union of intervals (or open sets).
2. Every convergent sequence of measurable functions is nearly uniformly convergent (@thm:egoroff).
3. Every measurable function is nearly continuous (@thm:lusin).

The following lemma is a constructive consequence of Lusin's Theorem, providing a decomposition of the domain that is essential for proving our main result.

#lemma[
Let $f : bb(R)^n arrow.r bb(R)^m$ be an $cal(L)^n$-measurable function. Then there exists a sequence of disjoint compact sets ${ K_i }_(i = 1)^oo subset bb(R)^n$ such that $f mid(|)_(K_i)$ is continuous for each $i$, and the set of points not covered has measure zero, i.e., $cal(L)^n (bb(R)^n \\ union.big_(i = 1)^oo K_i) = 0$.
]<lem:domain-decomposition>

#proof[
We construct the sequence ${ K_i }$ iteratively. Let $B_j = ball (0, j)$ be the open ball of radius $j$ centered at the origin.

+ #strong[Base Case (i=1):] Apply Lusin's Theorem to $f$ on the domain $B_1$. For any $epsilon_1 = 1$, there exists a compact set $K_1 subset B_1$ such that $f mid(|)_(K_1)$ is continuous and $cal(L)^n (B_1 \\ K_1) < 1$.

+ #strong[Inductive Step:] Assume compact, disjoint sets $K_1 , dots.h , K_(j - 1)$ have been constructed. Consider the domain $D_j = B_j \\ union.big_(i = 1)^(j - 1) K_i$, which is measurable. Apply Lusin's Theorem to $f$ on $D_j$. For $epsilon_j = 1 \/ j$, there exists a compact set $K_j subset D_j$ such that $f mid(|)_(K_j)$ is continuous and $cal(L)^n (D_j \\ K_j) < 1 \/ j$. By construction, $K_j$ is disjoint from $K_1 , dots.h , K_(j - 1)$.

Repeating this process yields a sequence of disjoint compact sets ${ K_i }_(i = 1)^oo$ where each restriction $f mid(|)_(K_i)$ is continuous.

Let $E = bb(R)^n \\ union.big_(i = 1)^oo K_i$. We must show $cal(L)^n (E) = 0$. For any $j in bb(N)$, we have:

$ E inter B_j = (B_j \\ union.big_(i = 1)^oo K_i) subset.eq (B_j \\ union.big_(i = 1)^j K_i) = D_j \\ K_j. $

By our construction, $cal(L)^n (D_j \\ K_j) < 1 \/ j$. Thus, $cal(L)^n (E inter B_j) < 1 \/ j$. Since $bb(R)^n = union.big_(j = 1)^oo B_j$, we have $E = union.big_(j = 1)^oo (E inter B_j)$, and by the continuity of measure from below:

$ cal(L)^n (E) = lim_(j arrow.r oo) cal(L)^n (E inter B_j) = 0. $

This completes the proof.
]

We now arrive at the main result, which can be seen as a sharpened form of Lusin's Theorem. It states that the "near continuity" of measurable functions can be precisely formulated as approximate continuity holding almost everywhere.

#theorem[
Let $f : bb(R)^n arrow.r bb(R)^m$ be an $cal(L)^n$-measurable function. Then $f$ is approximately continuous at $cal(L)^n$-almost every point in $bb(R)^n$.
]

#proof[
Let ${ K_i }_(i = 1)^oo$ be the sequence of disjoint compact sets from @lem:domain-decomposition, such that $f mid(|)_(K_i)$ is continuous for each $i$ and $cal(L)^n (bb(R)^n \\ union.big K_i) = 0$. Let $K = union.big_(i = 1)^oo K_i$.

By @thm:lebesgue-besicovitch-differentiation, for almost every point $x in K$, $x$ is a point of density for $K$. Let's consider the set of points that are density points for the specific compact piece they belong to. For each $i$, let

$ G_i = { x in K_i : Theta_(K_i) (x) = 1 }. $

@thm:lebesgue-besicovitch-differentiation, applied to the set $K_i$, tells us that $cal(L)^n (K_i \\ G_i) = 0$.

Now, let $G = union.big_(i = 1)^oo G_i$. The set of points in $K$ that are #emph[not] in $G$ is $union.big_(i = 1)^oo (K_i \\ G_i)$. Since this is a countable union of sets of measure zero, its measure is also zero. Thus, $cal(L)^n (K \\ G) = 0$. The total set of "bad" points is $(bb(R)^n \\ K) union (K \\ G)$, and $cal(L)^n ((bb(R)^n \\ K) union (K \\ G)) = 0$. Therefore, it suffices to show that $f$ is approximately continuous at every point $x in G$.

Let $x$ be an arbitrary point in $G$. Then $x in G_j$ for some unique index $j$. By definition of $G_j$, we have:

1. $x in K_j$, so $f mid(|)_(K_j)$ is continuous at $x$.

2. $lim_(r arrow.r 0^(+)) frac(cal(L)^n (ball (x, r) \\ K_j), cal(L)^n (ball (x, r))) = lim_(r arrow.r 0^(+)) (1 - frac(cal(L)^n (ball (x, r) inter K_j), cal(L)^n (ball (x, r)))) = 1 - Theta_(K_j) (x) = 0$.

We want to show that $aplim_(y arrow.r x) f (y) = f (x)$. Let $epsilon > 0$. Since $f mid(|)_(K_j)$ is continuous at $x$, there exists a $delta > 0$ such that for any $y in K_j$ with $abs(x - y) < delta$, we have $abs(f (x) - f (y)) < epsilon$.

This implies that for any radius $r in (0 , delta)$, if a point $y in ball (x, r)$ satisfies $abs(f (y) - f (x)) gt.eq epsilon$, it cannot be in $K_j$. Therefore,

$ ball (x, r) inter { y : abs(f (y) - f (x)) gt.eq epsilon } subset.eq ball (x, r) \\ K_j. $

Using the monotonicity of the Lebesgue measure, we have: $ frac(cal(L)^n (ball (x, r) inter { y : abs(f (y) - f (x)) gt.eq epsilon }), cal(L)^n (ball (x, r))) lt.eq frac(cal(L)^n (ball (x, r) \\ K_j), cal(L)^n (ball (x, r))) $ Taking the limit as $r arrow.r 0^(+)$, the right-hand side goes to $0$ because $x$ is a point of density of $K_j$. Hence, the left-hand side must also go to $0$.

Since this holds for any $epsilon > 0$, we have shown that $f$ is approximately continuous at $x$. As $x$ was an arbitrary point in $G$ and $cal(L)^n (bb(R)^n \\ G) = 0$, the theorem is proven.
]
