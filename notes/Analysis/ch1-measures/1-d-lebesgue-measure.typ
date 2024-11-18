#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *
#show: thmrules.with(qed-symbol: $square$)
#show: book-page.with()

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

= 1-D Lebesgue Measure

Let $F: RR -> RR$ be increasing and right-continuous.
Consider intervals of the type "h-intervals":
sets of the form $]a, b]$ or $[a, +infinity[$ or $diameter$ for $-infinity <= a < b <= +infinity$.

#prp[
$cal(A) = {"finite disjointegral unions of h-intervals"}$ is an algebra, and
$
cases(
mu_0(diameter) = 0,
mu_0(union.sq.big_1^infinity (a_j, b_j]) :=  sum_1^infinity F(b_j) - F(a_j)
)
$
defines a premeasure on $cal(A)$ .

]

Since $sigma(cal(A)) = cal(B)_(RR^1)$ , we can apply _Hahn extension_ to
extend $mu_0$ to a unique Borel measure on $RR$ , called the Lebesgue-Stieltjes measure $mu_F$.

#prp[
$mu_F = mu_G <=> F = G + "constant"$.

]

We write $mu_F equiv mu$ and
let $cal(M)_mu := {mu^* "-measurable subsets"}$ which is the domain of $macron(mu)$ .
Then $forall E in cal(M)_mu$ ,
$
mu(E) = inf{sum_1^infinity mu(]a_j, b_j]) : E subset union.big_1^infinity (a_j, b_j]}.
$

#lem[

$
mu(E) = inf{sum_1^infinity mu((a_j, b_j)) : E subset union.big_1^infinity (a_j, b_j)}
$

]

#prf[
Suppose $E subset union.big_1^infinity (a_j, b_j)$.
Since $(a_j, b_j) = union.big_1^infinity (a_j, b_j - 1/n] =: union.sq.big_(j, n = 1)^infinity I_(j, n)$ for some disjoint h-intervals $I_(j, n)$, so
$
mu(E) <= mu(union.sq.big_(j, n = 1)^infinity I_(j, n)) = mu(union.big_1^infinity (a_j, b_j)).
$

On the other hand, by the definition of $mu(E)$ , $forall epsilon > 0, exists {(a_j, b_j]}_1^infinity$ , s.t.
$
mu(E) >= sum_1^infinity mu((a_j, b_j]) - epsilon,
$
where $mu((a_j, b_j]) = F(b_j) - F(a_j)$.

For $F$ right-countinuous, so $exists delta_j >0$, s.t.
$
F(b_j + delta_j) - F(b_j) < epsilon/2^j,\
=> mu((b_j, b_j + delta_j)) < epsilon/2^j .
$
Then $mu((a_j, b_j + delta_j)) <= mu((a_j, b_j]) + epsilon/2^j$ , so
$
mu(E) >= sum_1^infinity mu((a_j, b_j]) - epsilon >= sum_1^infinity mu((a_j, b_j + delta_j)) - 2epsilon
$
where $E subset union.big_1^infinity (a_j, b_j + delta_j)$ . Sending $epsilon -> 0$ , the result follows.

]

Let $mu_F :=$ the (implies uniqueness) measure on $sigma({"h-integralerbals"})$ obtained via Hahn extension.

Convention: Denote by $mu_F$ its own completion.

Recall:
$
mu(E) = inf{sum_(j=1)^(infinity) mu((a_j, b_j)): E subset union.sq.big_(j=1)^(infinity) (a_j, b_j), forall E in cal(M)_mu},
$
and the fact that
$
U subset RR "is open" <=> U = union.sq.big_(j=1)^(infinity) I_j,
$
where ${I_j}$ are disjoint open intervals. We may deduce that $mu := mu_F$ , the Lebesgue-Stieltjes measure, is regular.

#thm[
Let $E in cal(M)_mu$ be arbitrary, then
$
mu(E) &= inf{mu(O): O "is open", O supset E} quad & "(outer regular)" \
      &= sup{mu(K): K "is compact", K subset E}quad & "(inner regular)"
$

]

Proof is left as an exercise.

For sets $A, B$ , $A Delta B := (A \\ B) union (B \\ A)$ .
In fact, Borel set ($E in cal(B)_RR$) $Delta$ "good set" = null set. 

#def[
A $G_delta$ - set is a countable insections of open sets. An $F_sigma$ - set is a countable unions of closed sets.

]


#quote(author: "Littlewood's First Principle")[
Every Borel set on $RR$ is nearly a (finite unions of) open intervals.
]

#thm[
Let $E subset RR$ , TFAT(the following are equivalent)

1. $E in cal(M)_mu$,
2. $E = V \\ N_1$ with $V$ is $G_delta$-set, $mu(N_1) = 0$,
3. $E = H union N_2$ with $H$ is $F_sigma$-set, $mu(N_2) = 0$.

]

#prf[
2, 3 $=>$ 1:

Since $mu$ is complete on $cal(M)_mu$ and $G_delta, F_sigma$-sets are Borel sets. Hence $E in cal(M)_mu$ .

1 $=>$ 2 & 3:

By regularing of $mu$, $forall E in cal(M)_mu, forall j in NN, exists$ open set $O_j subset RR$ , compact set $K_j subset RR$ , s.t.
$
cases(
  K_j subset E subset O_j  \
  mu(O_j) - 2^(-j) <= mu(E) <= mu(K_j) + 2^(-j) quad "if" mu(E) < infinity .
)
$
Then take $V = sect.big_(j=1)^(infinity) O_j, H = union.big_(j=1)^(infinity) K_j$ .

TODO: the general case: $mu(E) = infinity$ .

]

#def[
When $F$ is identity mapping, $mu_F = cal(L)^1$ is the Lebesgue measure on $RR$. Its domain $cal(M)_mu$ is the set of Lebesgue measurable sets.

]

In fact, we have $cal(M)_mu supset cal(B)_RR$ and the supset sign is strict.

About Lebesgue measurable, we have some key (pathological) examples.

#exm[
There are open, dense subsets of $(0, 1)$ of arbitrary small $cal(L)^1$-measure. In orther words, topological big $arrow.r.double.not$ measure-theoretically big.

]

Some specific examples are as follows.

#exm[
Take $q_1, q_2, ...$ be an enumenation of $QQ sect (0, 1)$ . Fix any $epsilon$ , and let
$
O = union.big_(j=1)^(infinity) (q_j - epsilon/(2j), q_j + epsilon/(2j))
$
then
$
cal(L)^1(O) <= sum_(j=1)^(infinity) mu((q_j - epsilon/(2j), q_j + epsilon/(2j))) <= 2 epsilon.
$
]

#exm[
Take $q_1, q_2 dots.h$ be an enumeration of $Q sect (0 , 1)$. Fix any $epsilon < 10^(- 10)$. Then

$ 0 = & union.big_(j = 1)^oo\] q_j - frac(epsilon, 2 j) , q_j + epsilon / 2_j \[\
 & cal(L)^1 (0) lt.eq sum_(j = 1)^oo mu (J q_j - frac(epsilon, 2 j) , q_j + epsilon / 2) c\) lt.eq 2 epsilon . $
]

#exm[
$cal(L)^1$ -null sets may be uncountable. Let
$
C = sect.big_(j=0)^(infinity) C_j
$
be cantor set, and let Cantor-Lebesgue function (Devil's Staircase) be
$
phi: C -> [0, 1] , \
sum_(j=1)^(infinity) (a_j)/3^j |-> sum_(j=1)^(infinity)(a_j\/2)/(2^j)
$
with $a_j in {0, 2}$ . Extending to $phi.alt : [0 , 1] arrow.r [0 , 1]$ by setting $phi$ constant on each interval removed from $C$ . Then $phi|_C: C -> [0, 1]$ is surjection. So $C$ is uncountable. Moreover,  $phi|_([0, 1] without C)$ is piecewise constant, so $phi^(') = 0$ on $[0 , 1] without C$ and $cal(L)^1 (C) = 0$ ($cal(L)^1 (C) = 1 - sum_(j = 1)^oo 2^(j - 1) \/ 3^j = 0$) so $phi^(') = 0$ almost everywhere and 
$
integral_0^1 phi'(x) dif x = 0 eq.not 1 = phi(1) - phi(0) .
$

]

#exm[
$cal(B)_(RR) subset.eq.not cal(M)_(cal(L)^1)$, i.e., there are lebesgue measurable sets that are not Borel measurable.
]
#prf[
Since $cal(L)^1(C) = 0$ and $cal(L)^1$ is complete on $cal(M)_(cal(L)^1)$ , so
$
&cal(M)_(cal(L)^1) supset.eq cal(P)(C) \
=>& "card"(cal(M)_(cal(L)^1)) >= alef_2 \
=>& "card"(cal(B)_RR) = alef_1 .
$

]

#exm[
There are "non-full" Borel sets in $(0, 1)$ which meets every interval.
]

#exm[
$cal(M)_(cal(L)^1) subset.eq.not cal(P)(RR)$ .
]

#prf[
Since $QQ <= (RR, +)$ is the subgroup. Let $A$ be a set of coset representation of $RR \/ QQ$ , i.e.,
$
RR = union.big.sq_(a in A) (a + QQ) .
$
Then $forall r in RR, exists ! (a, q) in A times QQ$ , s.t., $r = a+q$ .

*Claim.* $A$ is non-Lebesgue measurable.

Proof of Claim: Suppose not. Fix any $[a , b] subset bb(R)$ and set $cal(S) = [0 , 1] sect QQ$. Consider the countable collection

$ Lambda := { s + A sect [a , b] : s in cal(S) } $

Its elements are pairwise disjoint, and of the same $cal(L)^(')$-measure (invariant under translations) and all lie in $[a , b + 1]$ . So every $lambda in Lambda$ is a null set ($sum_(j = 1)^oo cal(L)^1 (lambda_j) = sum_(j = 1)^oo alpha^1 (lambda_1) lt.eq b + 1 - a$). Then $cal(L)^1 (A sect [a , b]) = 0$ (by countable additivity of $cal(L)^1$ ). Hence

$ L^1 (A) = 0 $

But $bb(R) = union.big_(q in bb(Q)) (A + q)$ , which leads to a contradiction that $cal(L)^1 (bb(R)) = 0$.
]
