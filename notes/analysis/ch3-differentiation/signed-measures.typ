#import "../book.typ": *

#show: book-page.with(
  title: "3.3 Signed Measures"
)

== Signed Measures

#definition[
Let $(X, cal(F))$ be a measurable space. A signed measure is a function $nu: cal(F) -> [-infinity, +infinity]$ s.t. only one of $plus.minus$ is assumed, $nu(diameter) = 0$ and $nu$ is countably additive.
]

#remark(title: "Key remark")[
Let $E_1, E_2, ... , in cal(F)$ disjoint, then $nu(union.big.sq_(i=1)^(infinity) = sum_(i=1)^(infinity) nu (E_i))$ , where LHS is finite and RHS is absolutely convergent.
]

#definition[
Let $nu$ be a signed measure on $(X, cal(F))$ . Say $E in cal(F)$ is a *positive* (respectively, *negative*, *null*) set if $nu(tilde(E)) >= 0$ (respectively, $nu(tilde(E)) <= 0, nu(tilde(E)=0)$) for any $tilde(E) subset E, tilde(E) in cal(F)$ .
]

We can pull out the largest positive set for $nu$ .

#theorem(title: "Hahn Decomposition")[
Let $(X, cal(F), nu)$ be a signed measure spcae. We can decompose $X = P union.sq N$ where $P$ is positive and $N$ is negative. This decomposition is essentially unique if $X = P' union.sq N'$ is another such decomposition. Then $P triangle P' = (P without P')union (P' without P)$ is $nu$-null.
]

#proof[
Without loss of generality say $nu: cal(F) -> [- infinity, +infinity)$ . Consider
$
M := sup{nu(E): E "is a positive set w.r.t." nu} . 
$
Take sequence of positive set ${P_j} subset cal(F)$ s.t. $nu(P_j) arrow.tr M$ . Then set
$
P := union.big_(j=1)^(infinity) P_j .
$
Say $P$ is positive because $forall E subset P, E in cal(F)$, set $Q_j = P_j without union.big.sq_(i=1)^(j-1)P_i$ . Then
$
nu(E) = nu(union.big.sq_(j=1)^(infinity) (E inter Q_j)) = sum_(j=1)^(infinity)nu(E inter Q_j) >= 0,
$
since $Q_j subset P_j$ is positive.

(Check $nu(P) = M$)

Set $N := X without P$ . We prove that $N$ is negative.

First we prove that $N$ doesn't have any positive subset. Indeed, if $A subset N$ were positive and not null, then $nu(A) = 0$ and $A union.sq P$ would be positive. This contradicts the maximality of $P$ .

Next, observe that if $exists B subset.eq N$ , s.t. $nu(B) > 0$ . Then $exists C subset B$ s.t. $nu(C) > nu(B)$ . This because $B$ is not positive, so $exists D subset B$ , s.t. $nu(D) < 0$ . Then take $C = B without D$ and $nu(C) = nu(B) - nu(D) > nu(B)$ .

Now if $N$ were not negative, then $exists E subset N$ , s.t. $nu(E) > 1\/n$ for some $n in NN$ . Let $n_1$ be the smallest such $n$ and let $E_1$ be such $E$ . But for $E_1, exists E_2 subset E_1$ , s.t. $nu(E_2) > nu(E_1)$ . We can see that $nu(E_2) > nu(E_1) + 1/n_2$ ($n_2$ is the smallest such $n_2$ ). Inductively, we obtain $N supset E_1 supset E_2 supset dots.c$ s.t.
$
nu(E_j) > sum_(k=1)^(j) 1/(n_k) .
$
By continuity from above of $nu$ (check) , $F := inter.big_(j=1)^(infinity)E_j$ satisfies
$
nu(F) = lim_(j -> oo) nu(E_j) = sum_(j=1)^(infinity) 1/(n_j)
$
But $nu$ dosen't attain to $+infinity$ , so $n_i arrow.tr + infinity$ . Then $exists G subset F$ , s.t.
$
nu(G) > nu(F) + 1/n, quad "for some" n .
$
Say $n < n_j$ . Then $G subset F subset E_(j-1)$ while $E_j$ is a subset of $E_(j-1)$ s.t.
$
nu(E_j) > nu(E_(j-1)) + 1/(n_j), quad "where" n_j "is  minimal" .
$
However, $nu(G) > nu(F) + 1/n > nu(E_(j-1)) + 1/n$ , which contradicts the minimum of $E_j$ . Therefore, $N = X without P$ is unique (w.r.t. $nu$).

Finally, if $X = P union.sq N = P' union.sq N'$ are both Hahn decomposition, then
$
P without P' subset.eq P inter N'
$
which is both positive and negative, hence $P without P'$ is null set. By symmetry, $P triangle P'$ is null.

]

Let $X = P union.sq N$ be Hahn decomposition, set $nu^(+) (E) := nu (E inter P) gt.eq 0$, $nu^(-) (E) := - nu (E inter N) gt.eq 0 , forall E cal(F)$. Then $nu =  nu^(+) - nu^(-)$, which is the Jordan decomposition of the signed measure $nu$.

*Check.*

1. $nu^(plus.minus)$ are both positive measures.
2. $nu^(plus.minus)$ are independent of the choice of Hahn decomposition.
3. If $nu = lambda - mu$ for positive measures $mu , lambda$, then $nu^+ lt.eq lambda , nu^(-) lt.eq mu$.

#definition[
$abs(nu) = nu^+ + nu^-$ is the total variation (measure) of $nu$.
]


#proposition[
If $nu$ is a signed measure on $(X , cal(F)) , E in cal(F)$, then
]
$
nu^(+) (E) &equiv sup { nu (F) : F subset E , F in cal(F) } ,\
nu^(-) (E) &equiv - inf { nu (G) : G subset E , G in cal(F) },\
abs(nu) (E) &= sup {sum_(i = 1)^n abs(nu (E_i)) : E = union.big.sq_(i = 1)^n E_i , E_i in cal(F)} .
$



#definition[
Signed measures $mu , nu$ are mutually singular $(mu perp nu)$ iff $A , B in cal(F)$. $X = A union.sq B , A$ is $mu$-vul and $B$ is $nu$-null.
]

#proposition[

1. $E in cal(F)$ is $nu$-null $arrow.l.r.double abs(nu) (E) = 0$ .
2. $nu perp mu arrow.l.r.double nu perp abs(mu) arrow.l.r.double mu^(+) perp nu , mu^- perp nu$.
3. $nu(R) = integral_E (bb(1)_P - bb(1)_N) dif abs(nu)$ .
4. $abs(nu)(E) = sup {abs(integral_E f dif nu) : abs(f) lt.eq 1}$
]

#definition(title: [*important*])[
Let $nu$ be a signed measure,

$ L^(1) (nu) & := L^1 (nu^(+)) inter L^1 (nu^(-)) ,\
integral_X f dif nu & := integral_X f d nu^(+) - integral_X f d nu^(-) $
]

#definition[
If $nu$ is a signed measure and $mu$ is a positive measure, then $nu lt.double mu$. iff $forall E in cal(F) , mu (E) = 0 arrow.r.double nu (E) = 0$.
]

*Check.* $nu lt.double mu arrow.l.r.double abs(nu) lt.double mu arrow.l.r.double nu^(+) lt.double mu , nu^- lt.double mu$ .

#theorem[
Let $nu$ be a finite signed measure, and $mu$ be the positive measure on $(X , cal(F))$. Then TFAE.
1.  $nu lt.double mu$.
2.  $forall epsilon > 0 , exists delta > 0$, s.t. $abs(nu(E)) < epsilon$ wherever $mu (E) < delta$. (exercise)
]

#theorem(title: [Radon-Nikodym-Lebesgue])[
Let $nu$ be a $sigma$-finite signed measure and $mu$ be a $sigma$-finite positive measure on $(X , cal(F))$. Then there exists a unique pair of $sigma$-finite signed measures $(nu^("ac") , nu^("s"))$, s.t. $nu =  nu^("ac") + nu^("s") , nu^("ac") lt.double mu , nu^("s") perp mu$. Moreover, $exists ! f in L^1 (mu)$ s.t.

$ nu^("ac") (E) = integral_E f dif mu , forall E in cal(F) upright(". ") $
]

*Notation:*
$ f = cal(D)_mu nu^("ac") = cal(D)_mu nu = frac(dif nu^("ac"), dif mu) , $

$ nu^("ac") = f dif mu = (frac(dif nu^("ac"), dif mu)) dif mu . $

#proposition[
Let $nu$ be a $sigma$-finite signed measures. Let $mu, lambda$  be $sigma$-finite positive measures on $(X , cal(F))$. Suppose $nu lt.double mu , mu lt.double lambda$. then $nu lt.double lambda$ and
$
frac(dif nu, dif mu) dot.op frac(dif mu, dif lambda) = frac(dif nu, dif lambda) ,quad lambda "-a.e. "
$
$
(integral_E frac(dif nu, dif mu) frac(dif mu, dif lambda) dif lambda = integral_E frac(dif nu, dif mu) dif mu = integral_E dif nu = nu (E) = integral_E frac(dif nu, dif lambda) dif lambda "and" E "is arbitrary")
$

For given $f in L^1 (X, cal(F), mu)$, consider signed measure $lambda$ on $(X , cal(G))$. given by $lambda (E) := integral_E f dif mu$. for $E in cal(G) , cal(G) subset F$ is $sigma$-subalgebra. Then $lambda lt.double mu$. So $exists ! g in L^1 (mu)$, s.t.

$ lambda (E) = integral_E g dif mu . $
]

#definition[
$g := bb(E) [f|cal(G)]$ is the conditioned expectation of $f$ w.r.t. $cal(G)$. 
]

#corollary[
If $cal(H) subset.eq cal(G) subset.eq (cal(F) , mu)$ are $sigma =$ algebras, then $forall f in L^1 (mu)$,
$ bb(E) [bb(E) [f | cal(G)] | cal(H)] = bb(E) [f | cal(H)] . quad mu|_(cal(H)) "-a.e." $
]

(Tower property).


