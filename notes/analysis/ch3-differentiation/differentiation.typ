#import "../book.typ": *

#show: book-page.with(
  title: "3 Differentiation"
)

= Differentiation

By Baire Category arguments, there exists a "generic" continuous function nowhere differentiable. The following provides a concrete example.

Consider $f (x) = sum_(n = 1)^oo a_n sin (b_n x)$. Choose $sum a_n$ converging rapidly but $a_n b_n arrow.r oo$ even faster.

For example, Take $a_n = 10^(- n)$ and $b_n = 10^(6 n)$, then

$ frac(a_(n - 1) b_(n - 1), a_n b_n) = 10^(- 5) . $

Fix $n$ and $x$, choose $Delta x asymp 1 / b_n = 10^(- 6 n)$, so

$ Delta {a_n sin (b_n x)} & = a_n sin (b_n (x + Delta x)) - a_n sin (b_n x)\
&asymp a_n = 10^(- n). $

Then consider

$ Delta f (x) & = (sum_(k < n) + sum_(k = n)) Delta a_n sin (b_n x)\
 & = Delta_(upright("small")) f + Delta_(upright("big")) f, $

where

$ Delta_(upright("small ")) f & = sum_(k = n) Delta {a_k sin (b_k x)}\
 & lt.tilde sum_(k = 1)^(n - 1) frac(a_k b_k, b_n) lt.tilde frac(a_(n - 1) b_(n - 1), b_n) lt.double a_n, $

and

$ Delta_(upright("big ")) f = sum_(k gt.eq n) lt.eq sum_(k gt.eq  n + 1) a_k lt.double a_n. $

Therefore, the difference quotient

$ frac(Delta f, Delta x) asymp frac(a_n, Delta x) asymp a_n b_n = 10^(5 n) arrow.r oo. $

Hence, there exists a continuous function that is nowhere differentiable. Historically, Riemann thought that
$ f (x) = sum_(n in ZZ) e^(2 pi upright("i") n^2 x) / n^2 $
is nowhere differentiable. It is almost true but at certain $q in QQ$.

