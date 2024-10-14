#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *
#show: thmrules.with(qed-symbol: $square$)

#show: book-page.with(title: "1-D Lebesgue Measure")

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
where $E subset union.big_1^infinity (a_j, b_j + delta_j)$ . Send $epsilon -> 0$ , the result follows.

]

