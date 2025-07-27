#import "../book.typ": *

#show: book-page.with(
  title: "3.2 Lebesgue Decomposition"
)

== Lebesgue Decomposition

#definition[
Let $mu, nu in cal(M)^+(RR^n)$ .

1. Say $nu$ is absolutely continuous w.r.t. $mu$ , denoted $nu lt.double mu$ , iff $forall A subset RR^n$ , if $mu(A) = 0$ , then $nu(A) = 0$ .
2. Say $nu$ and $mu$ are mutally singular, denoted as $nu perp mu$ , iff there exists a Borel set $B subset RR^n$ , s.t. $mu(B) = 0 = nu(RR^n without B)$ .
]

#example[
Let $mu = cal(L)^n$ and $nu = delta_0$ , then $mu perp nu$ . Consider $B = {0}$ , then $mu(B) = 0 = nu(RR^n without B)$ .
]

#example(title: "Devil's Staircase")[
Recall $phi(sum_(n=1)^(infinity) a_n\/3^n) = sum_(n=1)^(infinity)a_n\/2^(n+1), a_n in {0, 2}$ .Then $phi$ is constant on each connected component of $[0, 1] without C$ where $C$ is Cantor set.
Since $cal(L)^1 (C) = 0$ , then $phi' = 0, cal(L)^1$ -a.e. .and
$
integral_0^1 phi(x) dif x = 0 eq.not phi(1) - phi(0) = 1 - 0.
$
$phi'$ defines a measure supported on $C perp cal(L)^1$ .
]

#theorem(title: "The Radon-Nikodym Theorem")[
Let $mu, nu in cal(M)^+(RR^n)$ , s.t. $nu lt.double mu$ . Then
$
nu(A) = integral_A cal(D)_mu nu dif mu
$
for any $mu$-measurable $A subset RR^n$ .
]

#proof[
*Step 1.* For special sets.

Consider
$
Z = {cal(D)_mu nu = 0}, quad I = {cal(D)_mu nu = infinity} .
$
*Claim*: $Z$ and $I$ both are $nu$-null.

Indeed, we've proved that $mu(I) = 0$ , hence $nu(I) = 0 = integral_I cal(D)_mu nu dif mu$ .

For $Z$ , if $cal(D)_mu nu = 0$ , then $nu(Z) <= alpha mu(Z) < infinity, forall alpha > 0$ . Then $nu(Z) = 0 = integral_Z cal(D)_mu nu dif mu$ . (Recall $integral_A f d mu = 0$ , if $mu(A) = 0$ and $integral_E g dif mu = 0$ , if $g = 0$, $mu$-a.e.)

*Step 2.* For general $A subset RR^n, mu$-measurable.

Fix any $lambda in (1, + infinity)$ and consider
$
A_m := {lambda^n <= cal(D)_mu nu < lambda^(n+1)} .
$
Then $A without union.big.sq_(m in ZZ) A_m = Z union {cal(D)_mu nu "dosen't exist"}$ ,
which is $nu$-null. Thus
$
nu(A) = sum_(m in ZZ) nu(A_m) &<= sum_(m in ZZ) lambda^(m+1) mu(A_m) \
                              &= lambda sum_(m in ZZ) lambda^m mu(A_m) \
                              &<= lambda sum_(m in ZZ) integral_A_m cal(D)_mu nu dif mu \
                              &<= lambda integral_A cal(D)_mu nu dif mu .
$
On the other hand,
$
nu(A) = sum_(m in ZZ) nu(A_m) &>= sum_(m in ZZ) lambda^m mu(A_m)
                             &= lambda^(-1) sum_(m in ZZ) lambda^(m+1) mu(A_m)
                             &>= lambda^(-1) integral_A cal(D)_mu nu dif mu .
$
Sending $lambda arrow.br 1$, the result as follows.
]

#theorem(title: "Lebesgue Decomposition Theorem")[
Let $nu, mu in cal(M)^+(RR^n)$ . Then $nu = nu^("ac") + nu^("s")$ where $nu^("ac") lt.double mu, nu^("s") perp mu$ ,
and $nu^("ac"), nu^("s") in cal(M)^+(RR^n)$ . Moreover, $cal(D)_mu nu = cal(D)_mu nu^("ac")$ ($mu$-a.e.)
and $cal(D)_mu nu^("s") = 0$ ($mu$-a.e.) .
]

#proof[
WLOG, $mu(RR^n) + nu(RR^n) < infinity$ .

Consider $cal(E) = {A subset RR^n "Borel" : mu(RR^n without A) = 0}$ .
Choose $B_1 supset B_2 dots.c$ in $cal(E)$ , s.t.
$
nu(B_k) <= inf_(A in cal(E)) nu(A) + 1/k .
$
Set $B_infinity = inter.big_(k=1)^(infinity) B_k$ , then
$
mu(RR^n without B_infinity) &= mu(RR^n without inter.big_(k=1)^(infinity)B_k) \
                            &= mu(union.big_(k=1)^(infinity) RR^n without B_k) \
                            &<= sum_(k=1)^(infinity) mu(RR^n without B_k) = 0.
$
Thus, $B_infinity in cal(E)$ and $nu(B_infinity) = inf_(A in cal(E))nu(A)$ .

Then we set
$
nu^("ac") := nu|_B_infinity , quad nu^("s") := nu|_(RR^n without B_infinity) ,
$
which are both Radon measures. Here, $nu^("ac")(RR^n without B_infinity) = 0 = nu^("s")(B_infinity)$ , hence, $nu^"s" perp nu^"ac"$ .

*Claim*: $nu^"ac" lt.double mu$ . Suppose there exists Borel set C , s.t. $mu(C) = 0, nu^"ac" eq.not 0$ .
Then $mu(RR^n without (B_infinity without C)) <= mu(RR^n without B_infinity) + mu(C) = 0$ . So $B_infinity without C in cal(E)$ ,
but $nu(B_infinity) eq.not inf_(A in cal(E)) nu(A)$ , which leads to a contradiction.

*Claim*: $cal(D)_mu nu^"s" = 0$, $mu$-a.e. . Fix $alpha >0$ , consider $B_infinity inter {cal(D)_mu nu^"s" >= alpha} =: Z_alpha$ .
Then by the inter of $nu^("s")$ , $alpha mu(Z_alpha) <= nu^"s" (Z_alpha) = 0$ .
Hence $mu(Z_alpha) = 0, forall alpha >0$ . So $mu(B_infinity inter {cal(D)_mu nu eq.not 0}) = mu(B_infinity inter (union.big_(alpha > 0, alpha in QQ) Z_alpha)) = 0$


]

#corollary[
For any $A subset RR^n$ Borel,
$
nu(A) &= nu^("ac")(A) + nu^("s")(A) \
      &= integral_A cal(D)_mu nu^("ac") dif mu + nu^("s")(A) .
$
]

#definition[
$f in L^1_"loc" (RR^n, mu)$ is called locally integrable (with respect to  Lebesgue measure), if any open set $U$ , s.t. $overline(U)$ is compact, $f|_overline(U) in L^1(U, mu)$
]

#example[
If $f equiv 1$ , then $f in L^1_("loc")(RR^n, mu)$ but $f in.not L^1(RR^n, mu)$ .
]

*Notation:*
$
integral.slash_A f dif mu = 1/(mu(A)) integral_A f dif mu .
$


#theorem(title: "Lebesgue-Besikovitch's Differentiation")[
Let $mu in cal(M)^+(RR^n)$ , $f in L^1_"loc" (RR^n, mu)$ . Then
$
(integral_(BB_r (x)) f dif mu) / (mu(BB_r (x))) arrow.long^(r arrow.br 0) f(x) quad "for" mu-"a.e." , x in RR^n
$
]<theorem:LBT>

#proof[
Consider $nu^(plus.minus)(A) := integral_A f^(plus.minus) dif mu$ . Here $nu^(plus.minus) in cal(M)^+(RR^n), nu^(plus.minus) lt.double mu$ , so
$
nu^(plus.minus) (A) = integral_A cal(D)_mu nu^(plus.minus) dif mu = integral_A f^(plus.minus) dif mu .
$
Here $A$ is arbitrary, so $f^(plus.minus) = cal(D)_mu nu^(plus.minus)$ , $mu$-a.e. . Hence
$
integral.slash_(BB_r (x)) f^(plus.minus) dif mu = (nu^(plus.minus)(BB_r (x))) / (mu(BB_r (x))) ,
$
then
$
lim_(r arrow.br 0) integral.slash_(BB_r (x)) f dif mu &= lim_(r arrow.br 0) (nu^(plus)(BB_r (x)) - nu^(minus)(BB_r (x))) / (mu(BB_r (x))) \
&= cal(D)_mu nu^(plus) - cal(D)_mu nu^(minus) & (mu-"a.e.") \
&= f^(plus) (x) - f^(minus) (x) = f(x) & (mu-"a.e.")
$

]

Another way to state the theorem is
$
abs(integral.slash_(BB_r (x)) [f(y) - f(x)] dif mu(y)) -> 0 quad "as" r -> 0
$

We notice that
$
& integral.slash_(BB_r (x)) abs(f(y) - f(x)) dif mu(y) -> 0 quad "as" r -> 0 \
=> & abs(integral.slash_(BB_r (x)) [f(y) - f(x)] dif mu(y)) -> 0 quad "as" r -> 0 ,
$
We can see that reverse direction is also valid.

#definition[
Let $mu in cal(M)^+(RR^n), 1<=p <infinity, f in L^p_("loc")(RR^n, mu)$ . $x in RR^n$ is said to be a ($L^p$-) Lebesgue point of $f$ if
$
lim_(r arrow.br 0) integral.slash_(BB_r (x)) abs(f(y) - f(x))^p dif mu(y) = 0 .
$
]

#theorem[
Let $mu in cal(M)^+(RR^n), 1<=p <infinity, f in L^p_("loc")(RR^n, mu)$ , then $mu$-a.e. $x in RR^n$ is a Lebesgue point of $f$ .
]

#proof[
Say $QQ = {q_j}$ , by @theorem:LBT (Lebesgue-Besikovitch's Differentiation), for any fixed $j in NN$ , we have,
$
integral.slash_(BB_r (x)) abs(f(y) - q_j)^p dif mu(y) arrow.long^(r arrow.br 0) abs(f(x) - q_j)^p
$
for $x in RR^n without cal(N)$ where $mu(cal(N)) = 0$ .

Now, for any $x in RR^n without cal(N), epsilon > 0$ , pick $q_j in QQ$ , s.t.
$
abs(f(x) - q_j)^p < epsilon / (2^p) . 
$
Then,
$
integral.slash_(BB_r (x)) abs(f(y) - f(x))^p dif mu(y) &<= integral.slash_(BB_r (x)) 2^(p-1) dot (abs(f(x) - q_j)^p + abs(f(y) - q_j)^p) dif mu(y) \
&<= epsilon/2 + 2^(p-1)integral.slash_(BB_r (x)) abs(f(y) - q_j)^p dif mu(y) .
$
Take supremum both sides, then
$
limsup_(r arrow.br 0) integral.slash_(BB_r (x)) abs(f(y) - f(x))^p dif mu(y) <= epsilon/2 + epsilon/2 = epsilon .
$

]

Back to Lebesgue's differentiation theorem (@theorem:LBT) and set $mu = cal(L)^p$ , then
$
integral.slash_(BB_r (x)) f(y) dif y arrow.long^(r arrow.br 0) f(x), quad cal(L)^p -"a.e."
$
Take $f = bb(1)_E$ where $E subset RR^n$ is Borel. Then
$
(cal(L)^n (E inter BB_r (x))) / (cal(L)^n (BB_r (x))) -> bb(1)_E (x) = cases(
      1 \, & x in E \, \
      0 \, & x in.not E \,
) quad "for" cal(L)^n"-a.e." x in RR^n
$
#definition[
For $E subset RR^n$ Borel, the density function of $E$ is
$
lim_(r arrow.br 0) (cal(L)^n (E inter BB_r(x))) / (cal(L)^n (BB_r(x))) =: Theta_E (x) in L^1_("loc")(RR^n, cal(L)^n) .
$

]

*Question*: Consider $E = C^1$-domain in $RR^n$. What is $Theta_E (x)$ for $x in partial E$ ?

From the above plot we can see that the answer is $Theta_E (x) = 1/2, x in partial E$ .

In a word,
- $Theta_E (x) = 1 arrow.l.r.wave x$ is in the measure-theoretic interion of $E$ .
- $Theta_E (x) = 0 arrow.l.r.wave x$ is in the measure-theoretic exterion of $E$ .

Given $f in L^1_("loc") (RR^n)$ . Define
$
f^* = cases(
      lim_(r arrow.br 0) integral.slash_(BB_r (x)) f(y) dif y \, & "if it exists" \, \
      0 & "if else"
)
$
which is called precise representation of $f$ ($f^* = f, cal(L)^n$-a.e.).


We now introduce that approximate limit in the measure-theoretic sense.

#definition[
Let $f: RR^n -> RR^m, L in RR^m$ . Say that $L$ is the approximate limit of $f$ at $x$ :
$"ap" lim_(y -> x) f(y) = L$ iff $forall epsilon > 0$ ,
$
(cal(L)^n (BB_r (x) inter {abs(f - L) >= epsilon})) / (cal(L)^n (BB_r (x))) -> 0 quad "as" r -> 0^+
$

]

#remark[
$x$ is the measure-theoretic extension of ${abs(f - L) >= epsilon}, forall epsilon >= 0$ .
Call ${y in RR^n: abs(f(y) - L) >= epsilon}$ the $epsilon$-error set.
]

#definition[
$f$ is approximately continuous at $x$ iff $"ap" lim_(y -> x)f(y) = f(x)$ .
]

#lemma[
The approximate limit is unique.
]

#proof[
Suppose $L, L'$ were both $"ap" lim_(y -> x)f(y)$ . Take $epsilon = abs(L - L')/3$ .
We have by inter
$
(cal(L)^n (BB_r (x) inter {abs(f - L) >= epsilon})) / (cal(L)^n (BB_r (x))) -> 0 ,
$
$
(cal(L)^n (BB_r (x) inter {abs(f - L') >= epsilon})) / (cal(L)^n (BB_r (x))) -> 0 .
$
But for any $y in BB_r (x)$ , we have
$
& 3 epsilon =abs(L - L') <= abs(f(y) - L) + abs(f(y) - L') \
=> & BB_r (x) subset.eq {abs(f(y) - L) >= epsilon} union {abs(f(y) - L') >= epsilon } \
=> &  cal(L)^n (BB_r (x)) <= cal(L)^n ({abs(f(y) - L)>= epsilon}) +  cal(L)^n ({abs(f(y) - L')>= epsilon}) , \
$
which is a contradiction
]

*Littlewood's 3 principles* for real analysis:
1. Every (measurable) set is nearly a Borel set.
2. (*Egoroff*) Every sequence of (measurable) functions is nearly uniformly convergent.
3. (*Lusin*) Every (measurable) functions is nearly continuous.

#lemma[
Let $f: RR^n -> RR^m$ be $cal(L)^n$-measurable. Then there exist disjoint compact sets ${K_i}_(i=1)^infinity subset RR^n$ ,
s,t. $cal(L)^n (RR^n without union.big.sq_(i=1)^infinity K_i) = 0$ and $f|_K_i$ is continuous.
]

#proof[
Let $B_i = BB_i (0)$ . By Lusin's Theorem, $exists K_1 subset B_1$ compact,
s.t. $cal(L)^n (B_1 without K_1) <= 1, f|_K_i$ continuous. Assume $K_1, K_2, dots.h , K_(n-1)$ are constructed,
then pick compact
$
K_n subset(B_n without union.big.sq_(i=1)^(n-1) K_i)
$
s.t. $f|_K_i$ is continuous and $cal(L)^n (B_n without union.big.sq_(i=1)^(n) K_i) <= 1/n$ . Contine in this way, then we can obtain ${K_i}_(i=1)^(infinity)$ .

]

The following result sharpens Lusin's theorem.

#theorem[
Let $f: RR^n -> RR^m$ be $cal(L)^n$-measurable. Then $f$ is approximately continuous $cal(L)^n$-a.e. .
]

#proof[
We prove that $cal(L)^n$-a.e. point in $union.big.sq_(i=1)^(infinity) K_i$ is a point of approximate continuity.

Set
$
G &:= {x in RR^n: exists i "with" x in K_i "and" lim_(r -> 0^+) (cal(L)^n (BB_r (x) without K_i)) / (cal(L)^n (BB_r (x))) = 0} . \
// &= {x in union.big.sq_(i=1)^(infinity) K_i: lim_(r -> 0^+) (cal(L)^n (BB_r (x) without union.big.sq_(i=1)^(infinity) K_i)) / (cal(L)^n (BB_r (x))) = 0} .
$
// (i.e., $forall x in G$ , then $exists K_i$ , s.t. $x in K_i$ and $x$ in the measure-theoretic exterion of $K_i^c$ .)
Then $Theta_(G^c) = 0$ , i.e. $cal(L)^n (RR^n without G) = 0$ . Now take any $x in G$ , then $x in K_j$ with
$
lim_(r -> 0^+) (cal(L)^n (BB_r (x) without K_j)) / (cal(L)^n (BB_r (x))) =0 .
$
Fix $epsilon > 0$ . Since $f|_K_i$ is continuous, i.e. $exists delta > 0$ , s.t.
$
abs(f(x) - f(y)) < epsilon quad "wherever" abs(x - y) < delta, forall y in K_j .
$
Here, $forall r in (0, delta), BB_r (x) inter {abs(f - f(x)) >= epsilon} subset.eq BB_r (x) without K_j$ .
Then
$
(cal(L)^n (BB_r (x) inter {abs(f - f(x)) >= epsilon})) / (cal(L)^n (BB_r (x))) <= (cal(L)^n (BB_r (x) without K_j)) / (cal(L)^n (BB_r (x))) arrow.long^(r arrow.br 0) 0 .
$
That is, for such $G$ with $cal(L)^n (RR^n without G) = 0$ , then 
$
& "ap" lim_(y -> x) f(y) = f(x), quad forall x in G \
<==> & "every" x in G "is a point of aroximate continuity of" f
$

]