#import "../book.typ": *

#show: book-page.with(
  title: "5.3 The Open Mapping Theorem and Its Consequences"
)

== The Open Mapping Theorem and Its Consequences

=== Fundamental Concepts

We begin by defining the essential types of functions (mappings) that are central to the theorem.

#definition(title: "Continuous Mapping")[
Let $A$ and $B$ be topological spaces. A function $f : A arrow.r B$ is said to be #strong[continuous] if for every open set $V$ in $B$, its preimage $f^(- 1) (V) = { x in A: f (x) in V }$ is an open set in $A$. 
]

#definition(title: "Open Mapping")[
Let $A$ and $B$ be topological spaces. A function $f : A arrow.r B$ is called an #strong[open mapping] if for every open set $U$ in $A$, its image $f (U) = { f (x): x in U }$ is an open set in $B$.
]

It is important to note that continuity and openness are independent properties. A continuous map is not necessarily open, and vice versa. The Open Mapping Theorem establishes a powerful link between these concepts for a specific class of functions.

The proof of the main theorem relies on the following key lemma.

#lemma(title: "Successive Approximation")[
Let $X$ and $Y$ be Banach spaces, and let $T in cal(B) (X , Y)$ be a bounded linear operator from $X$ to $Y$. Suppose for some $r > 0$ and a constant $s in (0 , 1)$, we have that for any $y in ball_Y (0 , 1)$, the distance from $y$ to the set $overline(T (ball_X ( 0 , r) ))$ is less than $s$. That is: $ dist(y , overline(T ( ball_X ( 0 , r) )) ) < s $ Then, the image of a slightly larger ball in $X$ under $T$ contains the open unit ball in $Y$: $ ball_Y (0 , 1) subset T (ball_X (0 , frac(r, 1 - s))) $
]

#proof[
Let $y in ball_Y (0 , 1)$ be arbitrary. Our goal is to construct a sequence ${ x_k }_(k = 0)^oo$ in $X$ such that $y = T (sum_(k = 0)^oo x_k)$ and $sum_(k = 0)^oo norm(x_k)_X < frac(r, 1 - s)$.

Let $y_0 = y$. By our hypothesis, we can find an element $T x_0$ in $T (ball_X ( 0 , r) )$ such that $norm(y_0 - T x_0)_Y < s$. Let $y_1 = y_0 - T x_0$. Note that $norm(x_0)_X < r$ and $norm(y_1)_Y < s$.

Now, consider the element $y_1 / s in ball_Y (0 , 1)$. Again, by the hypothesis, we can find an $x_1 in ball_X (0 , r)$ such that:

$ norm(y_1 / s - T x_1)_Y < s. $

This implies $norm(y_1 - s T x_1)_Y < s^2$. Let's define $tilde(x)_1 = s x_1$. Then $norm(tilde(x)_1)_X < s r$. Let $y_2 = y_1 - T tilde(x)_1 = y_0 - T x_0 - T tilde(x)_1$. We have $norm(y_2)_Y < s^2$.

We can continue this process inductively. Assume we have constructed $x_0 , tilde(x)_1 , dots.h , tilde(x)_(k - 1)$ and $y_k$ such that $norm(tilde(x)_j)_X < s^j r$ and $norm(y_k)_Y < s^k$. We define $y_(k + 1) = y_k - T tilde(x)_k$ where $tilde(x)_k$ is chosen such that $norm(tilde(x)_k)_X < s^k r$ and $norm(y_k - T tilde(x)_k)_Y < s^(k + 1)$. This is achieved by finding an $x_k in ball_X (0 , r)$ for the element $y_k / s^k in ball_Y (0 , 1)$ and setting $tilde(x)_k = s^k x_k$.

We have constructed a sequence ${ tilde(x)_k }_(k = 0)^oo$ (with $tilde(x)_0 = x_0$) such that:

$ norm(y - T (sum_(j = 0)^k tilde(x)_j))_Y < s^(k + 1) quad "and" quad norm(tilde(x)_k)_X < s^k r. $

As $k arrow.r oo$, $s^(k + 1) arrow.r 0$, so $T (sum_(j = 0)^k tilde(x)_j) arrow.r y$.

Now, consider the series $sum_(k = 0)^oo tilde(x)_k$. We examine the sum of their norms:

$ sum_(k = 0)^oo norm(tilde(x)_k)_X < sum_(k = 0)^oo s^k r = frac(r, 1 - s). $

Since the series of norms converges, and $X$ is a Banach space, the series $sum_(k = 0)^oo tilde(x)_k$ converges to some point $x in X$. Let $x = sum_(k = 0)^oo tilde(x)_k$. The norm of this limit is bounded: $ norm(x)_X = norm(sum_(k = 0)^oo tilde(x)_k)_X lt.eq sum_(k = 0)^oo norm(tilde(x)_k)_X < frac(r, 1 - s) $ So, $x in ball_X (0 , frac(r, 1 - s))$.

Since $T$ is a bounded (and therefore continuous) operator: $ T (x) = T (sum_(k = 0)^oo tilde(x)_k) = sum_(k = 0)^oo T (tilde(x)_k) = y $ This completes the proof.
]

#corollary[
Let $X$ and $Y$ be Banach spaces, and let $T in cal(B) (X , Y)$ be a bounded linear operator. If there exists $r > 0$ such that the image $T (ball_X (0 , r))$ contains a dense subset of unit ball $ball_Y (0 , 1)$, then:

$ ball_Y (0 , 1) subset T (ball_X (0 , r)) . $

]

#proof[
Given that $T (ball_X (0 , r))$ contains a dense subset of $ball_Y (0 , 1)$, we have for any $epsilon > 0$,

$ ball_Y (0 , 1) subset overline(T (ball_X (0 , r))) subset T (ball_X (0 , r)) + ball_Y (0 , epsilon) . $

This implies:

$ forall epsilon > 0 , quad "dist" (y , T (ball_X (0 , r))) < epsilon , quad forall y in ball_Y (0 , 1) . $

Thus, for each $epsilon > 0$, the assumptions of the Successive Approximation Lemma are satisfied with some $s < epsilon$. Hence,

$ ball_Y (0 , 1 - epsilon) subset T (ball_X (0 , r)) . $

Since $epsilon > 0$ is arbitrary,

$ ball_Y (0 , 1) = union.big_(epsilon > 0) ball_Y (0 , 1 - epsilon) subset T (ball_X (0 , r)) . $

This completes the proof.
]

=== The Open Mapping Theorem

#theorem(title: "Open Mapping Theorem")[
Let $X$ and $Y$ be Banach spaces and let $T in cal(B) (X , Y)$ be a bounded, surjective linear operator. Then $T$ is an open mapping.
]

#proof[
+ #strong[Applying the Baire Category Theorem:] Since $T$ is surjective, we can write $Y$ as the union of the images of balls of integer radius in $X$: $ Y = T (X) = T (union.big_(n = 1)^oo ball_X (0 , n)) = union.big_(n = 1)^oo T (ball_X ( 0 , n) ) $ Taking the closure of each set in the union: $ Y = union.big_(n = 1)^oo overline(T (ball_X ( 0 , n) )) $
  Since $Y$ is a Banach space, it is a complete metric space.  The Baire Category Theorem states that a complete metric space cannot be written as a countable union of nowhere dense sets. Therefore, there must exist some integer $n_0 in bb(N)$ such that the set $overline(T (ball_X ( 0 , n_0) ))$ has a non-empty interior.  This means there exists a point $y_0 in Y$ and a radius $rho > 0$ such that: $ ball_Y (y_0 , rho) subset overline(T (ball_X ( 0 , n_0) )) $

+ #strong[Centering the Ball at the Origin:] The set $overline(T (ball_X ( 0 , n_0) ))$ is convex and symmetric with respect to the origin. Since $ball_Y (y_0 , rho) subset overline(T (ball_X ( 0 , n_0) ))$, and also by symmetry $- y_0$ can be approximated by elements in this set, we also have $ball_Y (- y_0 , rho) subset overline(T (ball_X ( 0 , n_0) ))$.  Any element $z in ball_Y (0 , rho)$ can be written as $z = 1 / 2 (y_0 + z) + 1 / 2 (- y_0 + z)$. Notice that $(y_0 + z) in ball_Y (y_0 , rho)$ and $(- y_0 + z) in ball_Y (- y_0 , rho)$. Because $overline(T (ball_X ( 0 , n_0) ))$ is convex:
  $ ball_Y (0 , rho) subset 1 / 2 overline(T (ball_X ( 0 , n_0) )) + 1 / 2 overline(T (ball_X ( 0 , n_0) )) = overline(T (ball_X ( 0 , n_0) )). $
  By linearity, $overline(T (ball_X ( 0 , n_0) )) = n_0 overline(T (ball_X ( 0 , 1) ))$. So, after rescaling, there is a $delta > 0$ such that:
  $ ball_Y (0 , delta) subset overline(T (ball_X ( 0 , 1) )). $

+ #strong[Applying the Successive Approximation Lemma:] From the previous step, for any $s in (0 , 1)$, we have $s ball_Y (0 , delta) subset overline(T (ball_X ( 0 , s) ))$. This implies that for any $y in ball_Y (0 , delta)$, the distance from $y$ to $overline(T (ball_X ( 0 , 1) ))$ is 0, which is less than any $s$. Applying a slight variation of the Successive Approximation Lemma (or its underlying principle), we can show that: $ ball_Y (0 , delta) subset T (ball_X ( 0 , 2) ) $ Let's scale this. Let $r_Y > 0$ be arbitrary. We can find a corresponding $r_X > 0$ such that $ball_Y (0 , r_Y) subset T (ball_X ( 0 , r_X) )$.

+ #strong[Showing T is Open:] To show $T$ is an open map, we must show that for any open set $U subset X$, its image $T (U)$ is open in $Y$.  Let $x_0 in U$. Since $U$ is open, there exists an $r > 0$ such that the open ball $ball_X (x_0 , r) subset U$. The image of this ball is: $ T (ball_X ( x_0 , r) ) = T (x_0 + ball_X ( 0 , r) ) = T (x_0) + T (ball_X ( 0 , r) ) $ From step 3, we know there exists some $delta' > 0$ such that $ball_Y (0 , delta') subset T (ball_X ( 0 , r) )$. Therefore: $ T (ball_X ( x_0 , r) ) supset T (x_0) + ball_Y (0 , delta') = ball_Y (T ( x_0) , delta' ) $ This means that for any point $y in T (U)$, we have found an open ball centered at $y$ that is fully contained in $T (U)$. Thus, $T (U)$ is an open set.
]

#corollary(title: "The Inverse Mapping Theorem")[
Let $X$ and $Y$ be Banach spaces. If $T in cal(B) (X , Y)$ is a bijective (both injective and surjective) bounded linear operator, then its inverse $T^(- 1) : Y arrow.r X$ is also a bounded linear operator.  Thus, $T$ is a Banach space isomorphism.
]

#proof[
Since $T$ is bijective, its inverse $T^(- 1) : Y arrow.r X$ exists and is linear. We must prove that $T^(- 1)$ is bounded, which for a linear operator is equivalent to proving it is continuous.

To prove $T^(- 1)$ is continuous, we must show that for any open set $U subset.eq X$, its preimage under $T^(- 1)$ is open in $Y$. The preimage of $U$ under $T^(- 1)$ is given by:

$
(T^(- 1))^(- 1) ( U ) = T ( U ).
$

Since $T$ is a surjective bounded linear operator between Banach spaces, the Open Mapping Theorem applies, and we conclude that $T$ is an open mapping. This means that for any open set $U subset.eq X$, its image $T ( U )$ is open in $Y$.

Therefore, $T^(- 1)$ is continuous. A continuous linear operator between normed spaces is always bounded. Hence, $T^(- 1) in cal(B) ( Y , X )$.
]


#example[
Let's consider a simple case with a linear functional $f : X arrow.r bb(R)$ on a Banach space $X$. If $f$ is the zero functional ($f (x) = 0$ for all $x$), it is not an open map since the image of any open set is just ${ 0 }$, which is not open in $bb(R)$.

However, if $f$ is a non-zero functional, it is an open map.
]

#proof[
Let $f : X arrow.r bb(R)$ be a non-zero continuous linear functional on a Banach space $X$. Since $f$ is non-zero, there exists some $x_0 in X$ such that $f (x_0) eq.not 0$. Define:

$ x_1 := frac(x_0, f (x_0)) quad "so that" quad f (x_1) = 1 $

Let $delta := frac(1, 2 norm(x_1)) > 0$. Then for any scalar $alpha in (- delta , delta)$, we have:

$ norm(alpha x_1) = abs(alpha) dot.op norm(x_1) < delta dot.op norm(x_1) = 1 / 2, $

which implies $alpha x_1 in ball_X$, the open unit ball of $X$.

Since $f (alpha x_1) = alpha$, it follows that:

$ (- delta , delta) subset f (ball_X). $

Thus, the image of the open unit ball under $f$ contains an open interval around 0 and is therefore an open set in $bb(R)$.

Now take an arbitrary open set $O subset.eq X$. For any $y in f (O)$, there exists $x in O$ such that $f (x) = y$. Since $O$ is open, there exists $r > 0$ such that the open ball $B (x , r) = x + r ball_X subset.eq O$.

Then:

$ f (B ( x , r) ) = f (x + r ball_X) = f (x) + r f (ball_X). $

Since $f (ball_X) supset (- delta , delta)$, we get:

$ f (B ( x , r) ) supset f (x) + r (- delta , delta) = (f ( x) - r delta , f (x) + r delta ). $

This shows that around every point $y in f (O)$, there is an open interval contained in $f (O)$, hence $f (O)$ is open in $bb(R)$.

Therefore, $f$ is an open mapping.
]


For a linear operator between normed spaces, the property of being open can be characterized in several equivalent ways.

#proposition[
Let $X$ and $Y$ be normed vector spaces and $T in cal(L) (X , Y)$ be a linear operator. The following are equivalent:

+ $T$ is an open map.
+ The image of the open unit ball in $X$, $T (ball_X)$, contains an open ball centered at the origin in $Y$. That is, $exists delta > 0$ such that $ball_Y (0 , delta) subset.eq T (ball_X)$.
+ $T$ is surjective, and there exists a constant $M > 0$ such that for every $y in Y$, there is an $x in X$ satisfying $T x = y$ and $norm(x)_X lt.eq M norm(y)_Y$.
]

#proof[
- #strong[(1) $=>$ (2):] If $T$ is an open map, then the image of the open unit ball $ball_X$, which is an open set containing $0 in X$, must be an open set in $Y$ containing $T (0) = 0 in Y$. By definition of an open set in a normed space, $T (ball_X)$ must contain an open ball centered at $0$, which is condition (2).

- #strong[(2) $=>$ (1):] Assume $ball_Y (0 , delta) subset.eq T (ball_X)$. To show $T$ is an open map, we need to show $T (O)$ is open for any open set $O subset.eq X$. For any $x in O$, there exists a radius $r > 0$ such that the ball $ball_X (x , r) = x + r ball_X$ is contained in $O$. The image is $T (ball_X ( x , r) ) = T (x) + r T (ball_X)$. Using our assumption, we have: $ T (ball_X ( x , r) ) supset.eq T (x) + r ball_Y (0 , delta) = ball_Y (T ( x) , r delta ) $ This shows that the image $T (O)$ contains an open ball around each of its points, and is therefore open.

- #strong[(3) $=>$ (2):] Assume condition (3). For any $y in ball_Y (0 , 1 \/ M)$, we have $norm(y)_Y < 1 \/ M$. By (3), there exists an $x in X$ such that $T x = y$ and $norm(x)_X lt.eq M norm(y)_Y < 1$. This means $x in ball_X$. Therefore, $ball_Y (0 , 1 \/ M) subset.eq T (ball_X)$, which is condition (2) with $delta = 1 \/ M$.

- #strong[(2) $=>$ (3):] Assume $ball_Y (0 , delta) subset.eq T (ball_X)$. This immediately implies that $T$ is surjective, since any $y in Y$ can be written as $y = frac(norm(y)_Y, delta') z$ where $z = frac(delta', norm(y)_Y) y$ has norm $delta'$ for any $delta' < delta$. Since $z in ball_Y (0 , delta)$, there exists an $x_z in ball_X$ with $T x_z = z$. Then $T (frac(norm(y)_Y, delta') x_z) = y$.
  
  To establish the bound, for any non-zero $y in Y$, consider the element $y' = frac(delta, 2 norm(y)_Y) y$. Since $norm(y')_Y = delta \/ 2$, $y' in ball_Y (0 , delta)$. Thus, there exists an $x' in ball_X$ (so $norm(x')_X < 1$) such that $T x' = y'$. Let $x = frac(2 norm(y)_Y, delta) x'$. Then: $ T x = frac(2 norm(y)_Y, delta) T x' = frac(2 norm(y)_Y, delta) y' = frac(2 norm(y)_Y, delta) (frac(delta, 2 norm(y)_Y) y) = y $ And the norm of $x$ is bounded: $ norm(x)_X = frac(2 norm(y)_Y, delta) norm(x')_X < frac(2 norm(y)_Y, delta) $ Thus, condition (3) holds with $M = 2 \/ delta$.
]

Another major consequence of the Open Mapping Theorem is the Closed Graph Theorem, which provides a practical criterion for determining if a linear operator is bounded.

Consider the product space: The space $X times Y$ is a Banach space with the norm $norm((x , y)) = norm(x)_X + norm(y)_Y$ (or any equivalent norm, like $max { norm(x)_X , norm(y)_Y }$). Then:

#theorem(title: "The Closed Graph Theorem")[
Let $X$ and $Y$ be Banach spaces and let $T : X arrow.r Y$ be a linear operator (not assumed to be bounded). Then $T$ is bounded if and only if its graph, $graph(T) = { (x , T x) : x in X }$, is a closed subspace of the product space $X times Y$.
]

#proof[
- #strong[($=>$) If $T$ is bounded, its graph is closed.] Assume $T$ is bounded. Let ${ (x_n , y_n) } subset graph(T)$ be a sequence converging to some point $(x , y) in X times Y$. That is:

  $ x_n arrow.r x "in" X , quad y_n arrow.r y "in" Y. $

  Since $(x_n , y_n) in graph(T)$, we have $y_n = T x_n$. Because $T$ is bounded (and hence continuous), it follows that:

  $ T x_n arrow.r T x "in" Y . $

  But $y_n arrow.r y$ and $y_n = T x_n$, so we conclude by uniqueness of limits that $y = T x$. Therefore, $(x , y) = (x , T x) in graph(T)$, showing that the graph is closed.


- #strong[($arrow.l.double$) If the graph of $T$ is closed, then $T$ is bounded.] This is the more profound direction and relies on the Open Mapping Theorem.

  + Suppose $graph(T) subset X times Y$ is closed. Since both $X$ and $Y$ are Banach spaces, the product space $X times Y$ with norm

    $ norm((x , y))_(X times Y) := norm(x)_X + norm(y)_Y $

    is also a Banach space. Hence, $graph(T)$, being a closed subspace of a Banach space, is itself a Banach space under the induced norm.

  + Define the projection map

    $ pi_X : graph(T) arrow.r X , quad pi_X (x , T x) = x . $

    This map is linear, and it is also continuous (bounded). To see this, for all $(x , T x) in graph(T)$,

    $ norm(pi_X (x , T x))_X = norm(x)_X lt.eq norm(x)_X + norm(T x)_Y = norm((x , T x))_(X times Y) . $

    Therefore, $norm(pi_X) lt.eq 1$, and so $pi_X$ is bounded.

  + Moreover, $pi_X$ is a bijection from $graph(T)$ to $X$. Indeed, for every $x in X$, there is exactly one element $(x , T x) in graph(T)$ mapping to $x$.

  + Since $pi_X$ is a bounded linear bijection between Banach spaces, the Inverse Mapping Theorem applies. Thus, its inverse map

    $ pi_X^(- 1) : X arrow.r graph(T) , quad pi_X^(- 1) (x) = (x , T x) , $

    is also bounded.

  + Hence, there exists a constant $C > 1$ such that for all $x in X$,

    $ norm((x , T x))_(X times Y) = norm(x)_X + norm(T x)_Y lt.eq C norm(x)_X . $

  + Rearranging this inequality gives:

    $ norm(T x)_Y lt.eq (C - 1) norm(x)_X , $

    which shows that $T$ is bounded.

Thus, $T$ is a bounded linear operator if and only if its graph is closed in $X times Y$.
]

  