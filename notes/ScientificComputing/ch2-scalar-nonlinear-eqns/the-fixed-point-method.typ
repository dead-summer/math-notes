#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "The Fixed Point Method")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

= 2 The Fixed Point Method

Suppose an initial guess $x_0$ to the solution of the scalar nonlinearequation is given. One may construct a sequence of approximate solutions
$
x_0 arrow.r x_1 arrow.r x_2 arrow.r x_3 arrow.r dots.h.c
$
by a procedure/map,
$
x_(k + 1) = phi (x_k) , "for" k = 0 , 1 , 2 , dots.c
$

If the sequence ${x_k}$ converges to a limit $x^(*)$, then $x^(*)$ is
a fixed point of the iteration or the function $phi (x)$ with
$
lim_(k arrow.r + oo) x_(k + 1) = lim_(k arrow.r + oo) phi (x_k)
$

which implies
$
x^(*) = phi (x^(*))
$

#thm("Brouwer")[

If $phi (x) in C [a , b]$ and $phi (x) in [a , b]$ for any $x in [a , b]$,
then the function $phi (x)$ has a fixed point on the interval $[a , b]$.

]

#prf[

Let $g (x) = x - phi (x)$. As
$
a lt.eq phi (x) lt.eq b ,
$
we have
$
g (a) = a - phi (a) lt.eq 0
$
and
$
g (b) = b - phi (b) gt.eq 0 .
$

If $g (a) = 0$, then $a$ is a fixed point of $phi (x)$. If $g (b) = 0$,
then $b$ is a fixed point of $phi (x)$. Otherwise, $g (a) < 0$ and
$g (b) > 0$, the intermediate/mean value theorem implies that the
function $g (x)$ has a zero $x^(*)$ in the interval $(a , b)$ so that
$
0 = g( x^*) = x^* - ( x^*),
$
and
$
x^(*) = phi (x^(*)) .
$

]

#thm[

If a continuous map $phi (x)$ is compressive/contractive,
i.e., $lr(|phi (x) - phi (y)|) lt.eq L lr(|x - y|)$ with
$L in \[ 0 , 1 \)$, then the map has a fixed point and the fixed point
is unique.

]

#prf[

Suppose a sequence ${x_k}$ is generated by the map

$
x_(k + 1) = phi (x_k) ,  k = 0 , 1 , 2 , ...
$

First, we have

$
lr(|x_(k + 1) - x_k|) = lr(|phi (x_k) - phi (x_(k - 1))|) lt.eq L lr(|x_k - x_(k - 1)|) lt.eq L^k lr(|x_1 - x_0|) .
$

This indicates that

$
lr(|x_(k + p) - x_k|) & lt.eq sum_(i = k)^(k + p - 1) lr(|x_(i + 1) - x_i|) lt.eq sum_(i = k)^(k + p - 1) L^i lr(|x_1 - x_0|) \
                      & = lr(|x_1 - x_0|) sum_(i = k)^(k + p - 1) L^i lt.eq frac(L^k, 1 - L) lr(|x_1 - x_0|) .
$

We see that the sequence ${x_k}$ is a Cauchy sequence. So it is
convergent with the limit be a fixed point.

Assume that the fixed point is not unique with two fixed points $x^(*)$
and $x^(**)$,

$
x^(*) = phi (x^(*)) ,\
x^(* *) = phi (x^(* *)) .
$


Then we have

$
lr(|x^(*) - x^(* *)|) = lr(|phi (x^(*)) - phi (x^(* *))|) lt.eq L lr(|x^(*) - x^(* *)|) ,
$

which leads to

$
(1 - L) lr(|x^(*) - x^(* *)|) lt.eq 0
$

and

$
1 - L <= 0 .
$

This is a contradiction.

]



#thm[

Let a map $phi (x)$ be continuously differentiable, i.e.,
$phi in C^1$. If there is a constant $L in [ 0 , 1 )$ so that

$
lr(|phi^(') (x)|) lt.eq L
$

then the map has a fixed point and the fixed point is unique.

]

#prf[

Note that for any values $x$ and $y$, we have

$phi (x) - phi (y) = phi^(') (xi) (x - y) .$

Then

$
lr(|phi (x) - phi (y)|) = lr(|phi^(') (xi)|) dot.op lr(|x - y|) lt.eq L lr(|x - y|) .
$

]




The method to generate a sequence ${x_k}$ by the map

$
x_(k + 1) = phi (x_k) , k = 0 , 1 , 2 , dots.c
$

is called a *fixed point method*.

#exm[

Consider the cubic equation,

$
f (x) = x^3 - x^2 - x - 1 = 0 .
$

]

#sln[

One may choose the map by

$ phi (x) = x^3 - x^2 - 1 , $

$ phi (x) = sqrt(x^3 - x - 1) $

$ phi (x) = x^3 - 1 - 1 / x , $

$ phi (x) = 1 - 1 / x - 1 / x^2 $

or

$ phi (x) = root(3, x^2 + x + 1) . $

We can see that some of them work and some of them do not as some of them are contractive and some of them are not.

]

#exm[

Consider the scalar nonlinear equation

$ f (x) = x - e^(- x) = 0 . $

]

It is usually tricky to construct the map $phi (x)$ for the fixed point
method.

One way to construct the map is to get a form as follows

$ phi (x) = x - p (x) f (x) $

with $p (x)$ be called a preconditioner. The derivative reads

$ phi' (x) = 1 - p^(') (x) f (x) - p (x) f^(') (x) . $

For the absolute value of derivative has an upper bound
$L in [ 0 , 1 )$,

$ lr(|phi^(') (x)|) = lr(|1 - p^(') (x) f (x) - p (x) f^(') (x)|) lt.eq L , $

we should have

$ 1 - L <= p'(x) f( x) + p( x) f'(x) + L. $

If $p (x)$ is a constant, we get $p^(') (x) = 0$ and the condition becomes

$ 1 - L <= p( x) f^' (x) <= 1 + L. $

This means that at least the constant $p$ should take the same sign as the derivative $f^(') (x)$.

Let

$ e_n = x^(*) - x_n $

be the $n^"th"$ error in the fixed point iteration. Then we
have

$ e_(n + 1) = x^(*) - x_(n + 1) = x^(*) - phi (x_n) = phi (x^(*)) - phi (x_n) . $

Assume $phi (x)$ is a contractive map so that

$ lr(|phi (x) - phi (y)|) lt.eq L lr(|x - y|) $

for some $L in \[ 0 , 1 \)$. Then

$ lr(|e_(n + 1)|) = lr(|phi (x^(*)) - phi (x_n)|) lt.eq L lr(|x^(*) - x_n|) = L lr(|e_n|) . $

The consecutive errors have linear (inequality) relation. We say the fixed point iteration has a linear or first-order convergence rate.

#exr[

Analyze the convergence of the fixed point iteration below

$ x_(k + 1) = phi_j (x_k) $

for computing the zeros of the quadratic equation

$ f (x) = x^2 - x - 2 = 0 , $

when the following maps are used:

1. $phi_1(x) = x^2 - x$ ,
2. $phi_2(x) = sqrt(2 + x)$ ,
3. $phi_3(x) = - sqrt(2 + x)$ ,
4. $phi_4(x) = 1 + 2/x$ .

]


