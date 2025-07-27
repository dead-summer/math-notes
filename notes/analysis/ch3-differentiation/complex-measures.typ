#import "../book.typ": *

#show: book-page.with(
  title: "3.4 Complex Measures"
)

== Complex Measures

#definition[
$nu : cal(F) arrow.r bb(C)$ is a complex measures, iff
1. $nu (diameter) = 0$ ,
2. ${E_n} subset cal(F)$ disjoint $arrow.r.double nu (sum_(n = 1)^oo E_n) = sum_(n = 1)^oo nu (E_n)$ . (absolutly convergent)
]

#remark[
Vector-valued measure: 
$ nu : (X , cal(F)) arrow.r bb(R)^"d" <~ ~> nu = mat(delim: "(", nu^1, nu^2 dots.h, nu^("d")) ,  $
  where $nu^i$ are (finite) signed measures.
]

Let $nu = nu_Re + sqrt(- 1) nu_Im , nu_Re , nu_Im$ are signed (finite) measures. Thus $nu_Re, nu_Im$ do not assume the values $plus.minus infinity$ , hence they are finite, and so the range of $nu$ is a bounded subset of $CC$ : $abs(nu(CC)) < infinity$ .

The notions we have developed for signed measures generalize easily to complex measures. For example, we define $L^1 (nu) = L^1 (v_(Re)) inter L^1 (nu_Im)$ , and
$ integral_X f dif nu = integral_X f dif v_(Re) + sqrt(- 1) integral_X f dif nu_Im . $
If $nu, mu$ are complex measures, we say that $nu perp mu <=> nu_a perp mu_b $, for $ a , b in {Re , Im}$ , and if $lambda$ is a positive measure, we say that $nu lt.double lambda$ if $nu_Re lt.double lambda$ and $nu_(Im) lt.double lambda$.
  



#theorem(title: "Radon-Nikodym-Lebesgue")[
Let $nu$ be complex measures, $mu$ be $sigma$-finite positive measures on $(X , cal(F))$. Then $nu = nu^("ac") + nu^("s")$ where $nu^("ac") , nu^("s")$ are complex measures with $nu^("s") perp mu , nu^("ac") lt.double mu$ , and there exists an $f in L^1 (mu)$, s.t. $dif nu^("ac") = f dif mu$. If $dif nu = tilde(f) dif mu + dif tilde(nu)^s$ too (with $tilde(f) in L^1 (mu) , tilde(nu)^("s") perp mu\)$ then $tilde(f) = f$ and $tilde(nu)^s = nu^("s"), mu$ -a.e. .
]

#definition[
Let $nu$ be a complex measure. Then its total variation $abs(nu)$ is the positive measures satisfying the following: If $mu$ is a(ny) positive measure s.t. $dif nu = f dif mu$, for $f in L^1 (mu)$, then set $dif abs(nu) = abs(f) dif mu$.
]

*Check.*
- One can find $mu$ : $nu lt.double mu := abs(nu_Re) + abs(nu_Im)$

- Independence of the choice of $mu$.

  Suppose $dif nu = f_1 dif mu_1 = f_2 dif mu_2$. Set $rho = mu_1 + mu_2$. Then

$ 
& dif nu = f_1 frac(dif mu_1, dif rho) dif rho = f_2 frac(dif mu_2, dif rho) dif rho .\
arrow.r.double & f_1 frac(dif mu_1, dif rho) = f_2 frac(dif mu_2, dif rho) & rho "-a.e."\
arrow.r.double & abs(f_1) frac(dif mu_1, dif rho) = abs(f_2) frac(dif mu_2, dif rho) & rho "-a.e."\
arrow.r.double & abs(f_1) dif mu_1 = abs(f_2) dif mu_2 $

#example[
Let $mu$ be signed measure (finite), $dif nu = f dif mu$ with $mu$ positive measure.

$
~~> cases(
nu^(+) = nu\|_({ f gt.eq 0 }) equiv nu\|_P \, \
nu^(-) = - nu\|_({ f < 0 }) equiv nu\|_N .
)
$
So $bb(1)_P - bb(1)_N = frac(dif nu, dif abs(nu)) in { - 1 , 1 } $, $abs(nu)$ -a.e. where $abs(nu) = nu^(+) + nu^-$.
]

For $bb(C)$-measure $nu , frac(dif nu, dif abs(nu))$ takes values in $bb(S)^(1) = { z in bb(C) : abs(z) = 1 }, abs(nu)$-a.e. ( $nu lt.double abs(nu)$ because $abs(nu (E)) lt.eq abs(nu) (E) , forall E in cal(F)$, exercise)

If $dif nu = f dif mu$ for some positive measures $mu$ and $f in L^1 (mu)$, then
$
&cases(
frac(dif nu, dif abs(nu)) dif abs(nu) = dif nu = f dif mu \, & mu "- a.e."\
dif abs(nu) = abs(f) dif mu \, & mu "- a.e. , by definition of" abs(nu) .
)\
& arrow.r.double frac(dif nu, dif abs(nu)) abs(f) = f quad mu "- a.e."
$


We call $frac(dif nu, dif abs(nu))$ polar of $nu$.

#proposition[
1. $L^1 (nu) = L^1 (abs(nu))$ .
2. For $f in L^1 (nu) , abs(integral_X f dif nu) lt.eq integral_X abs(f) dif abs(nu)$ .
]
