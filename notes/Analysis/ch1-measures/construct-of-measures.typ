#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *
#show: thmrules.with(qed-symbol: $square$)

#show: book-page.with(title: "Construct of Measures")

#counter(heading).update(3)
#set heading(numbering: "1.1.1")

= Construct of Measures

#def[
Let $#mi("\mathcal{A} \subset \mathcal{P}(X) ")$ be an algebra.
A function $#mi("\mu_0: \mathcal{A} \\to [0, +\infty]")$ is a premeasure iff

- $mu_0(#sym.emptyset.rev) = 0$,
- if ${A_j }_1^infinity subset.eq cal(A)$ is disjoint,
  s.t. $union.big_1^infinity in cal(A)$ .

]

The goal of this section is to start
from $(X, cal(A), mu_0)$ to construct a measure on $sigma (A)$
that extends $mu_0$

#def[
An outer measure on $X$ is a function $mu^*: cal(P) -> [0, +infinity]$
s.t.

- $mu^* (diameter) = 0$,
- $mu^* (A) <= mu^*(B)$ if $A subset.eq B$,
- $mu^* (union.big _1^infinity A_j) <= sum_1^infinity mu^*(A_j)$.
  (*$sigma$-subadditivity*)

]

It arises from approximately a set of "from the outside".

#prp[
Let $(X, cal(A), mu_0)$ be a premeasure space, then $forall E in X$,
$
mu^*(E) := inf{sum_(j=1)^infinity mu_0(A_j): A_j in cal(A), union.big _(j=1)^infinity A_j supset E}
$
defines an outer measure.

]

#def[
Say $A subset X$ satisfies separation condition [C] of Caratheodory iff
$
mu^*(E) = mu^*(E sect A) + mu^*(E without A), forall E subset X
$
where $mu^*$ is an outer measure.

]

#thm("Caratheodory's Theorem")[
Let $mu^*$ be an outer measure on $X$ . Then 
$
cal(F) := {A subset X: mu^*(E) = mu^*(E sect A) + mu^*(E without A), forall E subset X}
$
is a $sigma$-algebra, and $mu^*|_cal(F)$ is a complete measure.

]