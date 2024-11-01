#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#show: thmrules.with(qed-symbol: $square$)

#show: book-page.with(title: "Measures")


= Measures

Ref/Nomenclature:
1. A pair $(X, cal(F)) = ("set", sigma-"algebra")$ is a measurable space.
2. A measure on $(X, cal(F))$ is a function $mu: f -> [0, +infinity]$ , s.t. $mu(diameter) = 0$ ,
   $mu(union.sq.big_(j=1)^infinity E_j) = sum_(j=1)^infinity mu(E_j)$ for ${E_j}_(j=1)^infinity subset cal(F)$ disjoint.
3. $(X, cal(F), mu)$ is a measure space.
4. $(X, cal(F), mu)$ is finite iff $mu(X) < infinity$ .
5. $(X, cal(F), mu)$ is $sigma$-finite iff $exists {E_j}_(j=1)^infinity subset.eq cal(F)$ ,
    s.t. $X = union.big_(j=1)^infinity E_j$ and $mu(E_j) < infinity, forall j >=1$ .
6. $mu$ is semifinite if $forall E in cal(F), mu(E) < infinity$ , there exists a set $F subset E, F in cal(F)$ , s.t. $0 < mu(F) < infinity$ .

#exr[
(5) $=>$ (6).

]

#exm[
Counting measure $cal(H)^0$ on $(X, cal(P)(X))$ :
$
cal(H)^0 = cases(
    #math.op("card") (E) & "if" E "is finite",
    \
    infinity & "otherwise"
)
$

]

#rmk[
$cal(H)^k, k >= 0$ is the Hausdroff measures. $k=0$ , $cal(H)^0$ is the counting measure, $k in NN$ , $cal(H)^k = cal(L)^k$ on $RR^k$ .

]

#exm[
Dirac measure on $(X, cal(P)(X))$: fix any $x_0 in X$ , define $delta_x: cal(P)(X) -> {0, 1}$ , s.t. 
$
bb(1)_E(x_0) := delta_x_0(E) = cases(
    1 & "if" x_0 in E,
    0 & "if" x_0  in.not E,
)
$
$bb(1)_E(x_0)$ is called indicator function.

]

#exm[
Let $(X, cal(F), mu)$ be a measure space, let $E in cal(F)$ . Then $(X, cal(F), mu|_E)$ is a measure spcae where $mu|_E(F) := mu(E sect F)$ .

]

#prp[
#set par(leading: 5pt)

1. $E subset.eq F in cal(F) => mu(E) <= mu(F)$,

2. ${E_j} subset cal(F) => mu(union.big_(j=1)^(infinity)E_j) <= sum_(j=1)^(infinity)mu(E_j)$,
   
3. $E_1 subset E_2 subset ... in cal(F), mu(union.big_(j=1)^(infinity)E_j) = lim_(j -> oo) E_j$,
4. $E_1 supset E_2 supset ... in cal(F)$ and $mu(E_1) < infinity$ , then
$
mu(sect.big_(j=1)^(infinity)E_j) = lim_(j -> oo) E_j
$

]

It's easy to see that if $mu = cal(L)^1, E_n = [n, +infinity)$ , then $mu(E_n) = infinity$ but $sect.big_(j=1)^(infinity) E_n = diameter$ .

#def[
$(X, cal(F), mu)$ is a measure space, $E in cal(F)$ is $mu$-null if $mu(E) = 0$ .

]

#def[
$(X, cal(F), mu)$ is a complete measure space, if $forall E in cal(F)$ is $mu$-null, s.t. $forall tilde(E) subset E$ , it holds that $tilde(E) in cal(F)$ .

]

Idea: $cal(F)$ contains all $mu$-null sets.

#prp[
Let $(X, cal(F), mu)$ be a measure space, set $cal(Z) = {E in cal(F): mu(E) = 0}$ . Then
$
macron(cal(F)) := {A union B : A in cal(F), B subset N "for some" N in cal(Z)}
$
is a $sigma$-algebra, and $exists!$ measure $macron(mu)$ on $cal(F)$ that extends $mu$ s.t. $(X, macron(cal(F)), macron(mu))$ is complete.

]

#prf[
*Step 1: prove that $macron(cal(F))$ is a $sigma$-algebra.*

Clearly, $macron(cal(F))$ is closed under countable unions. Now let $A union B in cal(F)$ with $A in cal(F), B subset N in cal(Z)$ and $mu(N) = 0$. Then
$
X without (A union B) &= (X \\ A) sect (X \\ B) \
                      &= (X \\ A) sect [(X \\ N) union.sq (N \\ B )] \
                      &= underbrace([(X \\ A) sect (X \\ N)], in cal(F)) union.sq underbrace([(X \\ A) sect (N \\ B)], subset N in cal(Z)).
$
Hence $X \\ (A union B) in macron(cal(F))$ .

*Step 2: show the existence of $macron(mu)$.*

Set $macron(mu)(A union B) := mu(A)$ for any $A union B in cal(F)$ where $A in cal(F)$ and $B subset N in cal(Z)$ for some $N$ .

*Step 2.1: check that $macron(mu)$ is a measure.*

If $A_1 union B_1 = A_2 union B_2$ where $A_i in cal(F)$ and $B_i subset N_i in cal(Z)$, then $A_1 subset A_2 union B_2$ and so $mu(A_1) <= mu(A_2) + mu(N_2) = mu(A_2)$ and likewise $mu(A_2) <= mu(A_1)$ .

*Step 2.2: check that $macron(mu)$ is a measure.*

Since $diameter in cal(F)$ and $diameter in cal(Z)$ , then $diameter = diameter union diameter in macron(cal(F))$ and $macron(mu)(diameter) = mu(diameter) = 0$ . $forall A_n in cal(F), B_n subset N_n in cal(Z), n>= 1$ are disjoint, then
$
union.big_(n=1)^(infinity) A_n in cal(F), quad union.big_(n=1)^(infinity) B_n subset union.big_(n=1)^(infinity) N_n in cal(Z).
$
Then
$
macron(mu)(union.big_(n=1)^(infinity)(A_n union B_n)) &= macron(mu)((union.big_(n=1)^(infinity) A_n) union (union.big_(n=1)^(infinity) B_n)) \
&= mu(union.big_(n=1)^(infinity) A_n) = sum_(n=1)^(infinity) mu(A_n) \
&= sum_(n=1)^(infinity) macron(mu)(A_n union B_n).
$

*Step 3: prove the uniqueness of $macron(mu)$.*

For $A in cal(F), B subset N in cal(Z)$,
$
macron(mu)(A union B) &<= macron(mu)(A) + macron(mu)(B)
                      &<= macron(mu)(A) + macron(mu)(N)
                      &= mu(A) + mu(N)
                      &= mu(A). 
$




]

#def[
$(X, macron(cal(F)), macron(mu))$ is the completion of $(X, cal(F), mu)$ .

]


