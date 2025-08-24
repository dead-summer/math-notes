#import "../book.typ": *

#show: book-page.with(
  title: "3 Differentiation"
)

= Differentiation

A fundamental concept in calculus is the relationship between continuity and differentiability. A necessary condition for a function $f$ to be differentiable at a point $x_0$ is that it must be continuous at $x_0$. A natural question that arises is whether the converse is true: Does continuity imply differentiability?

The answer is no. While it is easy to construct functions that are continuous everywhere but fail to be differentiable at a finite number of points (e.g., $f (x) = abs(x)$ is not differentiable at $x = 0$), it is far less intuitive that functions can be continuous everywhere on their domain but differentiable #emph[nowhere];.

In the 19th century, mathematicians began to construct such "pathological" functions. It turns out that, in a specific topological sense, a "generic" continuous function is nowhere differentiable.

The statement that a "generic" continuous function is nowhere differentiable can be made precise using the #strong[Baire Category Theorem];.

Consider the space $C ([0 , 1])$, which is the set of all continuous real-valued functions on the interval $[0 , 1]$, equipped with the supremum norm $norm(f)_oo = sup_(x in [0 , 1]) abs(f (x))$. This makes $C ([0 , 1])$ a complete metric space.

Within this space, we can define the set of functions that are differentiable at #emph[at least one point];. It can be shown that this set is a #strong[meager set] (or a set of the #emph[first category];). A meager set is a countable union of nowhere dense sets; intuitively, it is a "small" or "thin" set within the larger space.

The Baire Category Theorem states that a complete metric space cannot be a meager set. This implies that the complement of our meager set---the set of functions that are differentiable #emph[nowhere];---must be non-meager. Such a set is called a #strong[residual set] (or a set of the #emph[second category];), and it is dense in $C ([0 , 1])$. Therefore, not only do continuous, nowhere differentiable functions exist, but they are also abundant in the space of all continuous functions.

While the Baire Category Theorem proves existence, it is non-constructive. The first published example of a continuous, nowhere differentiable function was provided by Karl Weierstrass. A function of this type, often called a #strong[Weierstrass function];, typically takes the form of an infinite series:

$ f (x) = sum_(n = 0)^oo a^n cos (b^n pi x). $

where $0 < a < 1$, $b$ is a positive odd integer, and $a b > 1 + 3 / 2 pi$. These conditions ensure the function is continuous yet fails to be differentiable at any point.

Let's analyze the function given by the series:

$ f (x) = sum_(n = 1)^oo a_n sin (b_n x) $

with the specific parameters $a_n = 10^(- n)$ and $b_n = 10^(6 n)$.

- *Continuity:*

  The function $f (x)$ is continuous on $bb(R)$. This can be established using the #strong[Weierstrass M-test];. We have:
  
  $ abs(a_n sin (b_n x)) = abs(10^(- n) sin (10^(6 n) x)) lt.eq 10^(- n). $
  
  Since the series $sum_(n = 1)^oo 10^(- n)$ is a convergent geometric series, the series for $f (x)$ converges uniformly on $bb(R)$. Because each term $a_n sin (b_n x)$ is a continuous function, their uniform limit $f (x)$ is also continuous.

- *Heuristic Argument for Non-Differentiability:*

  To show that $f (x)$ is not differentiable at any point $x_0$, we must show that the limit of the difference quotient $ lim_(h arrow.r 0) frac(f (x_0 + h) - f (x_0), h) $ does not exist. The core idea is that no matter how small a scale we examine (i.e., how small we take $h$), there are high-frequency components in the series that will dominate and cause the slope of the secant line to grow without bound.

  Let's fix an arbitrary point $x_0$ and choose a sequence of increments $h_N arrow.r 0$ designed to resonate with the high-frequency terms. Let $N$ be a large integer and consider an increment $h_N$ on the order of $1 \/ b_N = 10^(- 6 N)$.

  We decompose the difference quotient $frac(Delta f, Delta x) = frac(f (x_0 + h_N) - f (x_0), h_N)$ into three parts: $ frac(Delta f, Delta x) = underbrace(sum_(k = 1)^(N - 1) frac(Delta (a_k sin (b_k x)), h_N), upright("Low Frequencies")) + underbrace(frac(Delta (a_N sin (b_N x)), h_N), upright("Resonant Frequency")) + underbrace(sum_(k = N + 1)^oo frac(Delta (a_k sin (b_k x)), h_N), upright("High Frequencies")) $

  + #strong[Low Frequencies ($k < N$):] For these terms, the function is smooth on the scale of $h_N$. By the Mean Value Theorem, the contribution to the slope is bounded by the sum of the maximum slopes of each component: $ abs(sum_(k = 1)^(N - 1) a_k b_k cos (b_k c_k)) lt.eq sum_(k = 1)^(N - 1) a_k b_k = sum_(k = 1)^(N - 1) 10^(5 k) $ This sum is dominated by its last term, $10^(5 (N - 1))$, which is large but will be negligible compared to the resonant term.

  + #strong[Resonant Frequency ($k = N$):] By choosing $h_N$ appropriately (e.g., $h_N = pi \/ b_N$), we can ensure that the change in the argument, $b_N h_N$, is $pi$. The change in the function value is $Delta (a_N sin (b_N x_0)) = a_N (sin (b_N x_0 + pi) - sin (b_N x_0)) = - 2 a_N sin (b_N x_0)$. The magnitude of the slope contribution from this term is approximately: $ abs(frac(Delta (a_N sin (b_N x)), h_N)) approx abs(frac(2 a_N, h_N)) approx frac(2 a_N, pi \/ b_N) = 2 / pi a_N b_N = 2 / pi 10^(5 N) $ This term grows extremely rapidly with $N$.

  + #strong[High Frequencies ($k > N$):] The contribution from these terms can be shown to be small. While each term has a very large maximum slope ($a_k b_k$), on the scale of $h_N$ they oscillate so rapidly that their net change is small.

#strong[Conclusion:] The difference quotient is dominated by the resonant term. As we let $N arrow.r oo$, our chosen increment $h_N arrow.r 0$. The magnitude of the corresponding difference quotient behaves like: $ abs(frac(f (x_0 + h_N) - f (x_0), h_N)) approx 2 / pi 10^(5 N) arrow.r oo $ Since we can find a sequence of increments for which the secant slope diverges, the derivative at $x_0$ does not exist. As $x_0$ was arbitrary, the function is nowhere differentiable.

There is a historical anecdote that Bernhard Riemann proposed the following function as an example of a continuous, nowhere differentiable function:

$ f (x) = sum_(n = 1)^oo frac(sin (pi n^2 x), n^2). $

Riemann conjectured its non-differentiability but never published a proof. It turns out the behavior of this function is remarkably subtle.

- #strong[Weierstrass] was the first to publish a rigorous proof for his own function in 1872.
- #strong[G. H. Hardy] in 1916 proved that Riemann's function is not differentiable at any irrational value of $x$.
- However, in 1970, #strong[Joseph Gerver] proved that Riemann's function is actually #strong[differentiable] at all rational numbers $x = p \/ q$ where $p$ and $q$ are odd integers, with a derivative of $f' (p \/ q) = - 1 \/ 2$.

This result demonstrates the profound difficulty and intricacy involved in analyzing the differentiability of such fractal-like functions.
