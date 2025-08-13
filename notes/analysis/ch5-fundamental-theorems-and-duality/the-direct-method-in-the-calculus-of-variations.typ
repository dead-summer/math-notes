#import "../book.typ": *

#show: book-page.with(
  title: "5.6 The Direct Method in the Calculus of Variations"
)

== The Direct Method in the Calculus of Variations


The Direct Method in the Calculus of Variations provides a framework for establishing the existence of a minimizer for a given functional.

#problem[
Let $X$ be a normed vector space and let $J : X arrow.r bb(R)$ be a given functional. The primary objective is to identify sufficient conditions on $X$ and $J$ that guarantee the existence of an element $x_0 in X$ such that:
$
J (x_0) = inf_(x in X) J (x).
$
This $x_0$ is referred to as a #strong[minimizer] of the functional $J$.
]

To contextualize the problem, consider the following classical examples from the calculus of variations:

#example(title: [Length Functional])[
Let $X$ be the set of all continuously differentiable ($C^1$) curves in $bb(R)^d$ connecting two fixed points. The functional $J$ could be the length of these curves. The problem is to find the curve of shortest length, which is a straight line. 
]

#example(title: [Dirichlet Energy])[
Let $Omega$ be a bounded domain in $bb(R)^d$. Consider the space of functions $X = { f in C^2 (Omega) : f mid(|)_(partial Omega) = 0 }$. The Dirichlet energy is a functional $J$ defined as:
$ J (u) = 1 / 2 integral_Omega abs(nabla u)^2 dif x. $
Minimizing this functional is equivalent to solving the Laplace equation $Delta u = 0$ on $Omega$ with zero boundary conditions. The space $X$ is typically completed to become a Sobolev space, with the norm defined as $norm(f) = sqrt(norm(f)_(L^2)^2 + norm(nabla f)_(L^2)^2)$. 
]

The direct method relies on two crucial properties of the functional $J$: coercivity and lower semi-continuity.

#definition(title: [Coercivity])[
A functional $J : X arrow.r bb(R)$ is said to be #strong[coercive] if for any sequence ${ x_n }_(n in bb(N))$ in $X$ such that $norm(x_n)  arrow.r oo$, we have $J (x_n) arrow.r oo$.
]

Intuitively, coercivity ensures that as the norm of the elements in $X$ grows, the value of the functional also grows. This prevents the infimum from being approached by a sequence that "escapes to infinity."

#definition(title: [Sequential Weak Lower Semi-Continuity (swLSC)])[
A functional $J : X arrow.r bb(R)$ is #strong[sequentially weakly lower semi-continuous] (swLSC) if for any sequence ${ x_n }_(n in bb(N))$ in $X$ that converges weakly to an element $x in X$, the following inequality holds:
$ J (x) lt.eq liminf_(n arrow.r oo) J (x_n). $
]

The main theorem of the direct method combines the concepts of coercivity and swLSC in a specific type of space.

#theorem[
Let $X$ be a reflexive Banach space and let $J : X arrow.r bb(R)$ be a functional that is both coercive and sequentially weakly lower semi-continuous. Then, $J$ attains its infimum; that is, a minimizer exists. 
]

#proof[
+ Let ${ x_n }_(n in bb(N))$ be a #strong[minimizing sequence];, i.e., a sequence in $X$ such that: $ lim_(n arrow.r oo) J (x_n) = inf_(tilde(x) in X) J (tilde(x)). $ 

+ From the #strong[coercivity] of $J$, the sequence ${ x_n }$ must be bounded in norm. 

+ Since $X$ is a #strong[reflexive Banach space];, every bounded sequence has a weakly convergent subsequence. Therefore, there exists a subsequence ${ x_(n_k) }_(k in bb(N))$ and an element $x in X$ such that $x_(n_k) weakTo x$ as $k arrow.r oo$. 

+ By the #strong[sequential weak lower semi-continuity] of $J$, we have: $ J (x) lt.eq liminf_(k arrow.r oo) J (x_(n_k)) $ 

+ Combining these steps, we arrive at the conclusion: $ J (x) lt.eq liminf_(k arrow.r oo) J (x_(n_k)) = lim_(n arrow.r oo) J (x_n) = inf_(tilde(x) in X) J (tilde(x)) $ 

Since $J (x)$ cannot be less than the infimum of $J$ over all of $X$, it must be that $J (x) = inf_(tilde(x) in X) J (tilde(x))$.  Thus, $x$ is a minimizer, and the proof is complete.
]


Verifying sequential weak lower semi-continuity directly can be challenging. The following proposition provides a useful sufficient condition.

#proposition[
Let $X$ be a normed vector space. If a functional $J : X arrow.r bb(R)$ is both #strong[convex] and #strong[lower semi-continuous] (with respect to the norm topology), then $J$ is also sequentially weakly lower semi-continuous. 
]

#proof[
+ Let ${ x_n }$ be a sequence that converges weakly to $x$ ($x_n weakTo x$). We can assume $liminf_(n arrow.r oo) J (x_n)$ is finite, otherwise the inequality holds trivially. We can then extract a subsequence ${ x_(n_k) }$ such that $lim_(k arrow.r oo) J (x_(n_k)) = liminf_(n arrow.r oo) J (x_n)$. 

+ Applying Mazur's Lemma to our subsequence ${ x_(n_k) }$, we can construct a sequence of convex combinations, $u_m = sum_(k = m)^(N (m)) lambda_k^((m)) x_(n_k)$ (with $lambda_k^((m)) gt.eq 0$ and $sum lambda_k^((m)) = 1$), such that $u_m arrow.r x$ in norm. 

+ Since $J$ is convex, we have: $ J (u_m) = J (sum_(k = m)^(N (m)) lambda_k^((m)) x_(n_k)) lt.eq sum_(k = m)^(N (m)) lambda_k^((m)) J (x_(n_k)). $ 

+ Because $J$ is also lower semi-continuous with respect to the norm, and $u_m arrow.r x$ in norm, we have: $ J (x) lt.eq liminf_(m arrow.r oo) J (u_m) $ 

+ Combining these inequalities, we get: $ J (x) lt.eq liminf_(m arrow.r oo) J (u_m) lt.eq liminf_(m arrow.r oo) (sum_(k = m)^(N (m)) lambda_k^((m)) J (x_(n_k))) lt.eq lim_(k arrow.r oo) J (x_(n_k)) = liminf_(n arrow.r oo) J (x_n). $
  This shows that $J$ is sequentially weakly lower semi-continuous.
]

