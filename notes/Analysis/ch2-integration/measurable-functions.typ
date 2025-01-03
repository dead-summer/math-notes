#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#show: thmrules.with(qed-symbol: $square$)

#show: book-page.with()

#counter(heading).update(0)
#set heading(numbering: "1.1.1")

= Measurable Functions

#def[
Let $(X , cal(F)) , (Y , cal(G))$ be measurable spaces. A function: $f : X arrow.r Y$ is $cal(F) \/ cal(G)$-measurable if $f^(- 1) (E) in cal(F) , forall E in cal(G)$ . I.e.,
$
& (X, cal(F)) arrow.long^(f) (Y , cal(G)), f "is" cal(F)\/cal(G) "measurable" \
arrow.l.r.double& f^(\#) cal(G) := {f^(- 1) (E) : E in cal(G)} subset cal(F) .
$
]



Analogy: $(X , cal(I)_X) , (Y , cal(J)_Y)$ topological spaces. $f : X arrow.r Y$ is continuous if

$ f^(\#) cal(J)_Y subset.eq cal(I)_X . $

#prp[
1. Let $X , Y$ be topological spaces, any continuous function $f : X arrow.r Y$ is $cal(B)_X \/ cal(B)_Y$-measurable.
2. If $(X , f) arrow.r^f (Y , cal(G)) arrow.r^g (Z , cal(L))$ with $f cal(F) \/ cal(G)$ - measurable and $g cal(G) \/ cal(H)$ - measurable, then $g circle.stroked.tiny f$ is $cal(F) \/ cal(H)$-measurable.
]

*Convention* : Let $quad f : bb(R) arrow.r bb(R)$. $f$ is Borel measurable $arrow.l.r.double cal(B)_(RR) \/ cal(B)_(RR)$ - measurable. $f$ is Lebesgue measurable $arrow.l.r.double cal(M)_(cal(L)^1) \/ B_(bb(R))$ - measurable. More generally, $f : (X , cal(F)) arrow.r bb(R)$ is $cal(F)$-measurable $arrow.l.r.double cal(F) \/ B_(bb(R))$- measurable.

Composition of Lebesgue measurable functions may be non-Lebesgue-measurable ($M_(cal(L)^1) supset.neq cal(B)_(bb(R))$).

#def[
Let $X$ be a set and let ${(Y_alpha , cal(E)_alpha) : alpha in I}$ be a family of measurable spaces. Let $f_alpha : X_alpha arrow.r Y_alpha$ be a function for each $alpha in I$. The $sigma$-algebra on $X$ generated by ${f_alpha : alpha in I}$ is the smallest $sigma$-algebra on $X$ s.t. all $f_alpha$ are measurable. i.e.

$  sigma ({f_alpha^(- 1) (E) : E in cal(G)_alpha , alpha in I}) = sigma (union.big_(alpha in I) f_alpha^(\#) (cal(G)_alpha)) . $
]

#prp[
$f : (X , F) arrow.r (Y = product_(alpha in I) Y_alpha , cal(G) = times.circle_(alpha in I) cal(G)_alpha)$ is $cal(F) \/ cal(G)$-measurable iff

$ pi_alpha circle.stroked.tiny f "is" cal(F) \/ G_alpha "-measurable" quad forall alpha in I . $

Hence $Pi_alpha : Y arrow.r Y_alpha$ is the projection map.
]<prp:1.2>

Special case: $f : (x , cal(F)) arrow.r bb(C)$ is $cal(F)$-measurable $arrow.l.r.double Re(f) , Im(f) : X arrow.r bb(R)$ are both $cal(F)$-measurable.

#prp[
If $f , g : (X, cal(F)) arrow.r bb(C)$ are $cal(F)$-measurable, then so are $f plus.minus g , f g$ .
]

#prf[
Only prove $f+g$ , the rest are similar. Since
$
A : &bb(C) times bb(C) arrow.r bb(C) \
&(z , w) |-> z + w
$
is continuous, hence is (Borel) measurable. Hence $(f + g) (x) = A ((f , g))$ where
$
(f , g) : &X arrow.r CC times CC \
&x |-> (f(x), g(x)) .
$
By the preview proposition (@prp:1.2) , $(f , g)$ is measurable. Hence the composition $f + g$ is measurable.
]

In the extended real number system $overline(bb(R)) = [- oo , + oo]$, we define

$ cal(B)_(overline(bb(R))) := {E subset overline(bb(R)) : E sect bb(R) in B_(bb(R))} $

#prp[
If $f_j : (X, cal(F)) arrow.r bb(R)$ are $cal(F) \/ cal(B)_(overline(RR))$-measurable, then so are $sup_(j in bb(N)) f_j$ , $inf_(j in bb(N)) f_j$ , $limsup_(j arrow.r oo)f_j$ , $liminf_(j arrow.r oo) f_j$ .
]

#prf[
#set enum(numbering: "(1)")
1. Note that, $forall a in bb(R) , x in X$,

  $ sup_(j in bb(N)) f_j (x) > a arrow.l.r.double f_j (x) > alpha "for some" j in bb(N) . $

  Hence, $(sup_(j in NN) f_j)^(- 1) ((a, + oo))  = union.big_(j in NN) \(f_j^(- 1) (( a, + oo ))$ .

2. Note that
  $ (inf_(j in bb(N)) f_j)^(- 1) ((a, + oo )) = sect.big_(j in bb(N)) (f_j^(- 1) ((a, + oo)) . $
3. Note that $limsup_(j arrow.r oo) f_j = inf_(k in bb(N)) sup_(n gt.eq k) f_n$ .
4. Note that $liminf_(j arrow.r oo) f_j = sup_(k in bb(N)) inf_(n gt.eq k) f_n$ .
]

#prp[
Let $f , g : (x , cal(F)) arrow.r bb(R)$ be measurable, then so are $f or g , f and g$ where

$ 
& \( f or g) (x) := max { f (x) , g (x) } ,\
& \( f and g) (x) := min { f (x) , g (x) } .
$
]

#prf[
Since
$
(f or g) (x) lt.eq a arrow.l.r.double f lt.eq a "and" g lt.eq a ,
$
then
$
(f or g)^(- 1) \((- oo , a \]\) = f^(- 1) \((- oo , a \]\) union g^(- 1) \((- oo , a \]\) in cal(F) .
$
Likewise
$ (f and g)^(- 1) ((- oo , a \]) = f^(- 1) \((- oo , a \]\) sect g^(- 1) \((- oo , a \]\) in cal(F) . $
] 
 
#cor[
Let $f : (X , cal(F)) arrow.r bb(R)$ be measurable. Then so are $f^(+) = f or 0$, $f^- = f and 0$ , $abs(f) = f^+ + f^-$ .
]

#def[
A simple function on $(X , f)$ is a finite ( $bb(C)$ - ) linear combination of indicator functions of sets in $cal(F)$. I.e.
$
f "is simple function" arrow.l.r.double & f = sum_(j n)^n alpha_j bb(1)_(E_j) "for" n in bb(N) , alpha_j in bb(C) , E_j in cal(F) \
arrow.l.r.double & f "is a measurable function"\ &"s.t." "image"(f) "is a finite set."
$

]

#rmk[
One can choose distinct $alpha_j$ and disjoint $E_j$ .
]

#thm[
Let $f : (X , cal(F)) arrow.r \[ 0 , oo \)$ be measurable. Then there exists a sequence of simple functions ${phi_n}$ , s.t.
$
cases(
0 lt.eq phi_1 lt.eq phi_2 lt.eq dots.h.c lt.eq phi_n lt.eq f \, ,
phi_n arrow.r f "pointwise"
)
$
In particular, $phi_n$ uniformly convergent to $f$ on the set ${ f < oo }$ .
]

#prf[

]

For each $n in bb(N)$ and $0 lt.eq k lt.eq 2^(2 n) - 1$, let $E_n^k := {x in X : k / 2^n < f lt.eq frac(k + 1, 2^n)}$ , $F_n = {f > 2^n}$ . Then take
$ phi_n := sum_(k = 0)^(2^2^n - 1) (k / 2^n bb(1)_(E_n^k)) + 2^n bb(1)_(F_n) $

Cleanly $phi_n lt.eq f$ and $phi_n lt.eq phi_(n + 1)$ since ${E_(n + 1)^j}_(j in bb(N))$ is a refinement of ${E_(n)^j}_(j in bb(N))$ . Also, $phi_n arrow.r f$ clearly on ${ f = oo }$ . For $x in { f < oo}$ , we have $x in E_n^k$ for some $n in bb(N) , 0 lt.eq k lt.eq 2^(2 n - 1)$ . Then $abs(f (x) - phi_n (x)) lt.eq 2^(- n) arrow.r 0$ (independent of $k$ ) as $n -> infinity$ . Hence $phi_n arrow.r f$ pointwise. This together with monotonicity of $phi_n$ yields uniform convergence on which $f$ is bounded. I.e., for each $M > 0 , phi_n arrow.r f$ uniformly on ${ f < M }$ .