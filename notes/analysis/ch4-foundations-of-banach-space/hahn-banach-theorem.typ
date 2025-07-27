#import "../book.typ": *

#show: book-page.with(
  title: "4.4 Hahn-Banach Theorem"
)


== Hahn-Banach Theorem

#definition[
Let $X$ be a normed vector space, $X' = cal(L) (X , bb(F) )$ be the algebraic dual where $FF = RR$ or $CC$. $X^(*) = cal(B) (X , bb(F))$ be the dual space of bounded linear functional.
]

Clearly, for $Y subset.eq X$, $f in X^(*)$, we have $f |_Y in Y^(*)$ with $norm(f|_Y)_(Y^*) <= norm(f)_(X^*)$ .


HW: If $Y subset.eq X$ is dense, then any $g in Y^(*)$ can be extended (uniquely) to $G in X^(*)$ with $norm(g)_(Y^(*)) = norm(G)_(X^(*))$ and $G |_Y = g$

Goal: Prove more general extension theorems for (linear) functional.

#definition[
Let $X$ be an $bb(R)$-valued vector space, $p : X arrow.r bb(R)$ is a sublinear functional iff $forall lambda gt.eq 0 , x in X$,

$
cases(
p (lambda x) = lambda p (x),
 (x + y) lt.eq p (x) + p (y) .
)
$
]

#example[
(Semi)-norm is the sublinear functional.
]

#example[
Let
$
p: RR^n &-> RR, \
x = (x_1,..., x_n) &|-> max{x_n, 0} .
$
Then $p$ is a sublinear functional.
]

#theorem(title: "Hahn-Banach Extension")[
Let $X$ be a real-valued vector space, $Y subset.eq X$ a subspace and $p : X arrow.r bb(R)$ a sublinear functional. Suppose there is a linear functional $f : Y arrow.r bb(R)$ s.t $f (y) lt.eq p (y) , forall y in Y$. Then there exists a linear functional $F : X arrow.r bb(R)$, s.t. $f$, s.t. $F (x) lt.eq p (x) , forall x in X$ and $F |_Y = f$.
]

#proof[
*Step 1.* We prove that *One-Step Extension* holds.

For some $x_0 in.not Y$, we construct $hat(f) : Y plus.circle span(x_0) arrow.r bb(R)$, s.t. $hat(f) |_Y = f$. Indeed, a generic point in $Y plus.circle span(x_0)$ is $y + alpha x_0$, $alpha in bb(R)$. We want to define $hat(f) (y + alpha x_0) = f (y) + alpha hat(f) (x_0)$ (since $hat(f)$ is a linear extension), s.t. $hat(f) lt.eq p arrow.l.r.double alpha hat(f) (x_0) lt.eq p (y + alpha x_0) - f (y)$.

- Case 1. $alpha = 0$: $p (y) gt.eq f (y)$ holds by assumption.
- Case 2. $alpha > 0$:
$
hat(f) (x_0) &lt.eq frac(p (y + alpha x_0) - f (y), alpha) \
&= p(y/alpha + x_0) - f(y/alpha) , quad forall y in Y \
<=> hat(f) (x_0) & lt.eq p (y ' + x_0) - f (y ') , quad forall y' in Y.
$
- Case 3. Case $alpha < 0$:
$
hat(f) (x_0) & gt.eq frac(- p (y + alpha x_0) + f (y), - alpha)\
&= f (- y / alpha) - p (- y / alpha - x_0) quad forall y in Y \
<=> hat(f) (x_0) &gt.eq - p (y '' - x_0) + f (y '') quad forall y'' in Y , forall alpha < 0 .
$
Hence, one-step extension can be done iff
$
sup_(y'' in Y) { f (y '') - p (y '' - x_0) } lt.eq inf_(y' in Y) { p (y ' + x_0) - f (y ') } .
$

After re-arrangement, we have

$
&f (y '') + f (y ') - [p (y '' - x_0) + p (y ' + x_0)]\
&lt.eq f (y '' + y ') - p (y '' - x_0 + y ' + x_0)\
&= f (y '' + y ') - p (y '' + y ')
$
By assumption, RHS $lt.eq 0, forall y', y'' in Y$. So $hat(f) (x_0)$ can always be found.

*Step2.* General case.

Let $codim Y := dim (X \/ Y)$. So we have finished the case: $codim Y lt.eq 1$. In general, we resort to transfinite induction. Let $Y subset.eq tilde(Y) subset.eq X$ be subspaces, Consider

$
cal(G) = { (tilde(Y) , tilde(f)) : tilde(f) in tilde(Y)', tilde(f) |_(Y) = f "and" tilde(f) lt.eq p "on" tilde(Y) } .
$

It's naturally partially ordered:
$
(tilde(Y)_1 , tilde(f)_1) lt.eq (tilde(Y)_2 , tilde(f)_2) arrow.l.r.double^("definition") tilde(Y_1) subset.eq tilde(Y_2), tilde(f_2) |_(tilde(Y)_1) = tilde(f_1) .
$

Note that $(Y, f) in cal(G)$. Also if $cal(C) subset.eq cal(G)$ is totally ordered, it has an upper bound: $tilde(tilde(Y)) = union.big cal(C) = union.big_(tilde(Y) in cal(C)) tilde(Y)$ and we can (well) define $tilde(tilde(f))$ on $tilde(tilde(Y))$ by
$
tilde(tilde(f)) |_(tilde(Y)) = tilde(f) quad forall (tilde(Y) , tilde(f)) in cal(C) .
$

By Zorn's lemma, $cal(G)$ has a maximal element $(Y_oo , f_oo) in cal(G)$. It remains to show that $Y_oo = X$. Supposed not, then $exists x_(*) in X without Y_oo$. But by One-Step extension, $exists f_* in (Y_oo plus.circle span(x_*))'$, s.t. $f_* |_(Y_oo) = f_oo$. But then $(Y_oo , f_oo) lt.eq (Y_oo plus.circle span(x_*), f_*)$, which contradicts the maximality of $(Y_oo , f_oo)$.

]

Hahn-Banach Extension is for functional, not for operators. Eg: $I: c_0 arrow.r c_0$ can not be extended to $T : ell^oo arrow.r c_0$ with $norm(T) < oo$.

If $p$ is a seminorm and $f: X -> RR$ is linear, the inequality $f <= p$ is equivalent to the inequality $abs(f) < p$, because $abs(f(x)) = plus.minus f(x) = f(plus.minus x)$ and $p(-x) = p(x)$.

#corollary[
Let $X$ be a normed space over $bb(R)$, $Y subset.eq X$ be a subspace, $f in Y^(*)$. Then there exists extension $F in X^(*)$, s.t. $norm(F)_(X^(*)) = norm(f)_(Y^(*))$.
]

#proof[
Take $p (x) = norm(f)_(Y^(*)) norm(x)_X$, then

$
abs(f (y)) lt.eq norm(f)_(Y^(*)) norm(y)_X = p (y) , quad forall y in Y .
$
By Hahn-Banach Extension, $exists F in X'$, s.t. $F |_Y = f$ and $abs(F (x)) lt.eq p (x) = norm(f)_(Y^(*)) norm(x)_X$ . So $norm(F) lt.eq norm(f)$. On the other hand, $norm(F) >= norm(f)$ is clear, hence $norm(F) = norm(f)$.
]

*Question*: What about complex linear functional $f$ on vector subspace $Y$ over $CC$ ?

Write $f = f_1 + upright(i) f_2$ where $f_1 = Re(f) , f_2 = Im(f)$ are viewed as real-valued linear functionals on $Y$. Then
$
& f (upright(i) y) = f_1 (upright(i) y) + upright(i) f_2 (upright(i) y) \
=> &  upright(i) f (y) = - f_2 (y) + upright(i) f_1 (y) .
$
So $f_1(upright(i) y) = - f_2(y), f_2(upright(i) y) = f_1(y), forall y in Y$.

We first extend $f_1 = Re(f)$ by the real version of Hahn-Banach Extension and complexify it. Since

$
abs(f_1 (y)) lt.eq abs(f (y)) lt.eq norm(f)_(Y^(*)) norm(y)_Y, quad forall y in Y ,
$
so $f_1 in Y_(bb(R))^(*) := cal(B) (Y , bb(R))$. By Hahn-Banach Extension, $exists F_1 in X_(bb(R))^(*) = cal(B) (X , bb(R))$, s.t. $F_1 |_Y = f_1$ and $norm(F_1)_(X_(bb(R))^(*)) = norm(f_1)_(Y_(bb(R))^(*))$ .

Complexify $F_1$ by setting

$ F (x) := F_1 (x) - upright(i) F_1 (upright(i) x), quad x in X. $

Note that:

1. $F|_Y (y) = f_1 (y) + upright(i) f_2 (y) = f (y) , forall y in Y$.

2. $F$ is linear over $CC$:
$
F(upright(i) x) &= F_1 (upright(i) x) - upright(i) F_1(upright(i) (upright(i) x)) \
&= upright(i) F_1(x) + F_1(upright(i) x) \
&= upright(i) F(x) .
$
3. $norm(F)_(X_CC^*) <= norm(f)_(Y_CC^*)$ . Indeed, $forall x in X, exists theta = theta(x) in RR$, s.t.
$
F(e^(upright(i) theta) x) = abs(F(x)) = F_1(e^(upright(i) theta) x) <= norm(F_1) dot norm(e^(upright(i) theta) x) = norm(f) dot norm(x).
$

Thus, $norm(F) <= norm(f)$.

In conclusion, we've proved the complex version of Hahn-Banach Extension.

#theorem[
Let $X$ be a complex-valued normed vector space, $Y <= X$ a subspace and $p$ a seminorm on $X$. Suppose there is a linear functional $f: Y-> CC$, s.t. $abs(f(y)) <= p(y), forall y in Y$. Then there exists a complex linear functional $F$ on $X$, s.t. $abs(F(x)) < p(x), forall x in X$ and $F|_Y = f$.
]

