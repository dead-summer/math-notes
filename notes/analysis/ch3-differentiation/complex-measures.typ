#import "../book.typ": *

#show: book-page.with(
  title: "3.4 Complex Measures"
)

== Complex Measures

=== Total Variation of a Complex Measure

We begin by extending the concept of signed measures to the complex plane.

#definition(title: "Complex Measure")[
Let $(X , cal(F))$ be a measurable space. A function $nu : cal(F) arrow.r bb(C)$ is called a #strong[complex measure] if it satisfies the following two properties:

1. #strong[Null Empty Set:] $nu (nothing) = 0$.
2. #strong[Countable Additivity (or $sigma$-additivity):] For any sequence of disjoint sets ${ E_n }_(n = 1)^oo subset.eq cal(F)$, the equality $ nu (union.big_(n = 1)^oo E_n) = sum_(n = 1)^oo nu (E_n) $ holds, where the series on the right-hand side converges absolutely.
]

Any complex measure $nu$ can be uniquely decomposed into its real and imaginary parts. Let $nu (E) = nu_(Re) (E) + imUnit nu_(Im) (E)$ for any $E in cal(F)$. It can be shown that $nu_(Re)$ and $nu_(Im)$ are both #strong[finite signed measures];.

A key point is that $nu_(Re)$ and $nu_(Im)$ cannot take on infinite values. If, for instance, $nu_(Re) (A) = oo$ and $nu_(Re) (B) = - oo$ for some sets $A , B in cal(F)$, then $nu_(Re) (A union B)$ could be undefined. The requirement that the series $sum nu (E_n)$ converges absolutely prevents this, ensuring that the range of $nu$ is a bounded subset of $bb(C)$. Consequently, all complex measures are finite.

#remark[
The concept can be generalized to vector-valued measures. For instance, a function $nu : cal(F) arrow.r bb(R)^d$ is a vector-valued measure if each of its component functions is a finite signed measure. We can write this as: $ nu = (nu^1 , nu^2 , dots.h , nu^d) $ where each $nu^i : cal(F) arrow.r bb(R)$ is a finite signed measure.
]

A crucial tool for understanding complex measures is the total variation, which is a positive measure that captures the "magnitude" of the complex measure.

#definition(title: "Total Variation")[
Let $nu$ be a complex measure on $(X , cal(F))$. Its #strong[total variation];, denoted $abs(nu)$, is a positive measure defined as follows: If $mu$ is any positive measure such that $nu$ is absolutely continuous with respect to $mu$ (i.e., $nu lt.double mu$), with Radon-Nikodym derivative $f = frac(dif nu, dif mu) in L^1 (mu)$, then the total variation $abs(nu)$ is the measure defined by:

$ frac(dif abs(nu), dif mu) = abs(f) "or equivalently," quad dif abs(nu) = abs(f) dif mu . $
]


For this definition to be valid, we must ensure two things:

1. #strong[Existence:] Such a positive measure $mu$ always exists. For a complex measure $nu = nu_(Re) + imUnit nu_(Im)$, we can perform the Jordan decomposition on its real and imaginary parts: $nu_(Re) = nu_(Re)^(+) - nu_(Re)^(-)$ and $nu_(Im) = nu_(Im)^(+) - nu_(Im)^(-)$. We can then choose the positive measure $mu = abs(nu_(Re)) + abs(nu_(Im)) = (nu_(Re)^(+) + nu_(Re)^(-)) + (nu_(Im)^(+) + nu_(Im)^(-))$. It is clear that $nu lt.double mu$.

2. #strong[Well-definedness:] The definition of $abs(nu)$ is independent of the choice of the dominating measure $mu$.

  #proof[
  Suppose $nu lt.double mu_1$ and $nu lt.double mu_2$, so that $dif nu = f_1 dif mu_1$ and $dif nu = f_2 dif mu_2$. Let's define a new measure $rho = mu_1 + mu_2$. Since $mu_1 lt.double rho$ and $mu_2 lt.double rho$, we can write:
  
  $ dif nu = f_1 dif mu_1 = f_1 frac(dif mu_1, dif rho) dif rho quad "and" quad dif nu = f_2 dif mu_2 = f_2 frac(dif mu_2, dif rho) dif rho . $
  
  By the uniqueness of the Radon-Nikodym derivative, we have:
  
  $ f_1 frac(dif mu_1, dif rho) = f_2 frac(dif mu_2, dif rho) , quad rho "-a.e." $
  
  Taking the absolute value of both sides gives:
  
  $ abs(f_1) frac(dif mu_1, dif rho) = abs(f_2) frac(dif mu_2, dif rho) , quad rho "-a.e." $
  
  This implies that the measures defined by $abs(f_1) dif mu_1$ and $abs(f_2) dif mu_2$ are identical. Thus, the definition of $abs(nu)$ is independent of the choice of $mu$.
  ]

A fundamental property linking a complex measure to its total variation is that for any measurable set $E in cal(F)$, we have $abs(nu (E)) lt.eq abs(nu) (E)$. This shows that $abs(nu)$ dominates $nu$ in magnitude.

=== Integration

#definition(title: "Integration")[
Let $nu = nu_(Re) + imUnit nu_(Im)$ be a complex measure. The space of integrable functions is defined as $L^1 (nu) = L^1 (nu_(Re)) inter L^1 (nu_(Im))$. For any $f in L^1 (nu)$, the integral of $f$ with respect to $nu$ is defined as:

$ integral_X f dif nu = integral_X f dif nu_(Re) + i integral_X f dif nu_(Im) . $
]


The following proposition establishes the relationship between integrability with respect to $nu$ and its total variation $abs(nu)$, and provides a crucial inequality.

#proposition[
Let $nu$ be a complex measure.

1. The spaces of integrable functions are identical: $L^1 (nu) = L^1 (abs(nu))$.
2. For any function $f in L^1 (nu)$, the following inequality holds:

  $ abs(integral_X f dif nu) lt.eq integral_X abs(f) dif abs(nu) . $
]

=== Radon-Nikodym-Lebesgue Theorem

The notions of absolute continuity and singularity extend naturally to complex measures, leading to a powerful decomposition theorem.

#definition(title: "Absolute Continuity and Singularity")[
Let $nu$ and $mu$ be complex measures, and let $lambda$ be a positive measure.
- $nu$ is #strong[absolutely continuous] with respect to $lambda$, denoted $nu lt.double lambda$, if $abs(nu) lt.double lambda$. (This is equivalent to $nu_(Re) lt.double lambda$ and $nu_(Im) lt.double lambda$).
- $nu$ and $mu$ are #strong[mutually singular];, denoted $nu perp mu$, if $abs(nu) perp abs(mu)$.
]

#theorem(title: "Radon-Nikodym-Lebesgue Decomposition")[
Let $nu$ be a complex measure and $mu$ be a $sigma$-finite positive measure on $(X , cal(F))$. Then there exists a unique decomposition $nu = nu_"ac" + nu_"s"$, where:

1. $nu_"ac"$ and $nu_"s"$ are complex measures.
2. $nu_"ac" lt.double mu$.
3. $nu_"s" perp mu$.

Furthermore, there exists a unique function $f in L^1 (mu)$ such that $dif nu_"ac" = f dif mu$.
]


#example(title: "Polar Representation")[
Since $nu lt.double abs(nu)$ by definition, the Radon-Nikodym theorem implies the existence of a function $h in L^1 (abs(nu))$ such that $dif nu = h dif abs(nu)$. This function $h$ is called the #strong[polar] of $nu$.

From the definition of total variation, we have $dif abs(nu) = abs(h) dif abs(nu)$, which implies that $abs(h (x)) = 1$ for $abs(nu)$-almost every $x$. Therefore, the polar $h$ takes values in the unit circle $bb(S)^1 = { z in bb(C) : abs(z) = 1 }$ almost everywhere. The representation $ dif nu = frac(dif nu, dif abs(nu)) dif abs(nu) $ is the complex measure analogue of the Jordan decomposition for signed measures. For a signed measure $mu$, the derivative $frac(dif mu, dif abs(mu))$ takes values in ${ - 1 , 1 }$ almost everywhere, indicating the positive and negative parts of the space. For a complex measure, this derivative points in a direction on the complex unit circle.
]
