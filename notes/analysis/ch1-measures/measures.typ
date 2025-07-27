#import "../book.typ": *

#show: book-page.with(
  title: "1.3 Measures"
)

== Measures

#definition[
Let $X$ be a set equipped with a $sigma$-algebra $cal(F)$. A measure on $(X, cal(F))$ is a function $mu: f -> [0, +infinity]$, s.t.
1. $mu(diameter) = 0$,
2. $mu(union.sq.big_(j=1)^infinity E_j) = sum_(j=1)^infinity mu(E_j)$ for ${E_j}_(j=1)^infinity subset cal(F)$ disjoint.
]

If $X$ is a set and $cal(F) subset  cal(P)(X)$ is a $sigma$ -algebra, $(X, cal(F))$ is called a measurable space and the sets in $cal(F)$ are called measurable sets. If $mu$ is a measure on $cal(F)$, then $(X, cal(F), mu)$ is called a measure space.

Let $(X, cal(F), mu)$ be a measure space, here is some standard terminology concerning the "size" of $mu$:
1. $mu$ is finite iff $mu(X) < infinity$.
2. $mu$ is $sigma$-finite iff $exists {E_j}_(j=1)^infinity subset.eq cal(F)$,
    s.t. $X = union.big_(j=1)^infinity E_j$ and $mu(E_j) < infinity, forall j >=1$.
3. $mu$ is semifinite iff $forall E in cal(F)$ with $mu(E) = infinity$, there exists $F subset E, F in cal(F)$, s.t. $0 < mu(F) < infinity$.

#exercise[
Every $sigma$-finite measure is semifinite, but not conversely.
]

#example[
Counting measure $cal(H)^0$ on $(X, cal(P)(X))$ :
$
cal(H)^0 = cases(
    #math.op("card") (E) & "if" E "is finite",
    \
    infinity & "otherwise"
)
$

]

#remark[
$cal(H)^k, k >= 0$ is the Hausdroff measures: $cal(H)^0$ is the counting measure, and $cal(H)^k = cal(L)^k$ on $RR^k, k >0$.

]

#example[
Dirac measure on $(X, cal(P)(X))$: fix any $x_0 in X$, define $delta_x: cal(P)(X) -> {0, 1}$, s.t. 
$
bb(1)_E (x_0) := delta_x_0(E) = cases(
    1 & "if" x_0 in E,
    0 & "if" x_0  in.not E,
)
$
$bb(1)_E(x_0)$ is called indicator function.

]

#example[
Let $(X, cal(F), mu)$ be a measure space, $E in cal(F)$. Then $(X, cal(F), mu|_E)$ is a measure spcae where $mu|_E (F) := mu(E inter F)$.

]

#proposition[

1. $E subset.eq F, E in cal(F), F in cal(F) => mu(E) <= mu(F)$,

2. ${E_j} subset cal(F) => mu(union.big_(j=1)^(infinity)E_j) <= sum_(j=1)^(infinity)mu(E_j)$,
   
3. $E_1 subset E_2 subset ... in cal(F), mu(union.big_(j=1)^(infinity)E_j) = lim_(j -> oo) E_j$,
4. $E_1 supset E_2 supset ... in cal(F)$ and $mu(E_1) < infinity$, then
$
mu(inter.big_(j=1)^(infinity)E_j) = lim_(j -> oo) mu(E_j).
$
]

We remark that the condition $mu(E_1) < infinity$ in part 4 could be replaced by $mu(E_n) < infinity$ for some $n > 1$. However, some finiteness assumption 
is necessary. (E.g., let $mu = cal(L)^1, E_n = [n, +infinity)$, then $mu(E_n) = infinity$ but $inter.big_(j=1)^(infinity) E_n = diameter$.)

#definition[
Let $(X, cal(F), mu)$ be a measure space, $E in cal(F)$ is $mu$-null iff $mu(E) = 0$.

]

#definition[
$(X, cal(F), mu)$ is a complete measure space iff for any $E in cal(F)$ $mu$-null s.t. $forall tilde(E) subset E$, it holds that $tilde(E) in cal(F)$.

]

*Idea*: $cal(F)$ contains all subsets of $mu$-null sets.

#proposition[
Let $(X, cal(F), mu)$ be a measure space, set $cal(Z) = {E in cal(F): mu(E) = 0}$. Then
$
overline(cal(F)) := {A union B : A in cal(F), B subset N "for some" N in cal(Z)}
$
is a $sigma$-algebra, and $exists!$ measure $overline(mu)$ on $cal(F)$ that extends $mu$ s.t. $(X, overline(cal(F)), overline(mu))$ is complete.
]<prp:1.3.2>

#proof[
*Step 1: prove that $overline(cal(F))$ is a $sigma$-algebra.*

Clearly, $overline(cal(F))$ is closed under countable unions. Now let $A union B in cal(F)$ with $A in cal(F), B subset N in cal(Z)$ and $mu(N) = 0$. Then
$
X without (A union B) &= (X \\ A) inter (X \\ B) \
                      &= (X \\ A) inter [(X \\ N) union.sq (N \\ B )] \
                      &= underbrace([(X \\ A) inter (X \\ N)], in cal(F)) union.sq underbrace([(X \\ A) inter (N \\ B)], subset N in cal(Z)).
$
Hence $X \\ (A union B) in overline(cal(F))$.

*Step 2: show the existence of $overline(mu)$.*

Set $overline(mu)(A union B) := mu(A)$ for any $A union B in cal(F)$ where $A in cal(F)$ and $B subset N in cal(Z)$ for some $N$.

*Step 2.1: check that $overline(mu)$ is well-defined.*

If $A_1 union B_1 = A_2 union B_2$ where $A_i in cal(F)$ and $B_i subset N_i in cal(Z)$, then $A_1 subset A_2 union N_2$ and so $mu(A_1) <= mu(A_2) + mu(N_2) = mu(A_2)$ and likewise $mu(A_2) <= mu(A_1)$.

*Step 2.2: check that $overline(mu)$ is a measure.*

Since $diameter in cal(F)$ and $diameter in cal(Z)$, then $diameter = diameter union diameter in overline(cal(F))$ and $overline(mu)(diameter) = mu(diameter) = 0$. $forall A_n in cal(F), B_n subset N_n in cal(Z), n>= 1$ are disjoint, then
$
union.big.sq_(n=1)^(infinity) A_n in cal(F), quad union.big.sq_(n=1)^(infinity) B_n subset union.big.sq_(n=1)^(infinity) N_n in cal(Z).
$
Then
$
overline(mu)(union.big.sq_(n=1)^(infinity)(A_n union B_n)) &= overline(mu)((union.big.sq_(n=1)^(infinity) A_n) union (union.big.sq_(n=1)^(infinity) B_n)) \
&= mu(union.big.sq_(n=1)^(infinity) A_n) = sum_(n=1)^(infinity) mu(A_n) \
&= sum_(n=1)^(infinity) overline(mu)(A_n union B_n).
$

*Step 3: prove the uniqueness of $overline(mu)$.*

For $A in cal(F), B subset N in cal(Z)$,
$
overline(mu)(A union B) &<= overline(mu)(A) + overline(mu)(B)
                      &<= overline(mu)(A) + overline(mu)(N)
                      &= mu(A) + mu(N)
                      &= mu(A). 
$
]

The measure $overline(mu)$ in @prp:1.3.2 is called the completion of $mu$, and $overline(cal(F))$ is called the 
completion of $cal(F)$ with respect to $mu$·



