#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#show: thmrules.with(qed-symbol: $square$)

#show: book-page.with()

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

= Monetone functions on $I subset RR$

Let $Phi$ be devil staircase. Why FTC (fundamental theorem of calculus) dresn't work?

#thm[
Monotone functions are differentiable $cal(L)^1$-a.e. .
]

#prf[
Assume $f : [a , b] arrow.r bb(R)$ is monotone increasing. On any open intervals $I$, approximate $f^(')$ by

$ D (f) := frac("diam" f (I), "diam" (I)) . $

Consider

$ E_0 &= {x in [a , b] ; f^(') (x) "doesn't exist"}\
E_1 &= { x in [a , b] : f "is discontinuous on" x }\
E_2 &= {x in [a , b] : f^(') (x) = oo} $

Then $E_1$ is (almost) countable and $cal(L)^1 (E_2) = 0$. Indeed, take ${f^(') > M} = : E_3$. By Vitali's covering theorem, $exists$ disjoint open intervals $I_1, ..., I_N subset E_3$, s.t. $cal(L)^1 (E_3 without union.big.sq_(i = 1)^N I_i) < epsilon$. Then

$ cal(L)^1 (E_3) & lt.eq epsilon + sum_(i = 1)^N cal(L)^1 (I_i)\
 & lt.eq epsilon + sum_(i = 1)^N frac(f (b_i) - f (a_i), M) & "for" I_i = (a_i , b_i)\
 & lt.eq epsilon + frac(f (b) - f (a), M) arrow.r 0 & "as" M arrow.t oo , epsilon arrow.b 0 . $

For $x in E_0 , D(I) = frac("diam" f(I), "diam" (I))$ oscillates on arbitrarily small intervals containing $x$.

$ ~~> E_0 = union.big_(r < s \r , s in bb(Q)) E_("rs") , $

where for arbitrarily short intervals $I, hat(I)$ containing $x$ and

$ E_(r , s) = {x in E_0 : D(I) < r < s < D (hat(I))} . $

*Check.* $cal(L) (E_(1 , s)) = 0 . forall r < s , r , s in bb(Q)$ . Fix $epsilon > 0$. Apply Vitali to $E_(r, s)$ to get disjoint open intervals $I_1, ..., I_n$ s.t. $D (I_i) < r , cal(L)^1 (E_(r, s) triangle union.big.sq_(i = 1)^n I_i) < epsilon$ . Then applying Vitali again to $E_(r, s) sect (union.big.sq_(i = 1)^n I_i)$ , we get disjoint intervals $J_1, ..., J_m$ containing in $union.big.sq_(i = 1)^n I_i$ s.t. $D (J_j) < s , L^1 (union.big.sq_(j = 1)^m J_j) > cal(L)^1 (E_(r, s)) - 2 epsilon$. By monotonicity,

$ s dot sum_(j = 1)^m cal(L)^1 (J_j) & lt.eq sum_(j = 1)^m "diam" (f (J_j))\
 & lt.eq sum_(i = 1)^n "diam" (f (I_i))\
 & lt.eq r sum_(i = 1)^n cal(L)^1 (I_i) . $

Then

$ frac(cal(L)^1 (E_(r , s)) - 2 epsilon, cal(L)^1 (E_(r , s)) + epsilon) lt.eq frac(sum_(j = 1)^m cal(L)^1 (j_i), sum_(i = 1)^n cal(L)^1 (I_i)) lt.eq r / s < 1 . $

This is impossible unless $cal(L)^1 (E_(r, s)) = 0$.
]

So we can define (as a Lebesgue integral) .

#thm[
Let $f : [a , b] arrow.r bb(R)$ monotone increasing, then

$ integral_a^b f^(') dif x lt.eq f (b) - f (a) . $
]

#prf[
Consider $f_n (x) = n dot [f (x + 1 / n) - f (x)] gt.eq 0$. Set $f (x) equiv f (b)$ for $x gt.eq b$. Then $f_n arrow.r f^(')$ pointwise ($cal(L)^1$- a.e.), so by Fatou's lemma,

$ integral_a^b f^(') dif x & lt.eq liminf_(n arrow.r oo) integral_a^b f_n dif x .\
 & = liminf_(n arrow.r oo) (- n integral_a^(a + 1 / n) f dif x + f (b))\
 & = f (b) - f (a) . $
]

#def[
$f : [a , b] arrow.r RR$ is of bounded variation $(f in "BV"[a , b])$ iff

$ "T.V."(f) & := sup {sum_(i = 1)^n lr(|f (a_i) - f (a_(i - 1))|) = a = a_0 < a_1 <, dots.c, < a_(n - 1) < a_n = b}\
 & < oo . $

Here the supremum is taken over all finite partitions of $[a , b]$ .
]

#exm[
- $x arrow.r.bar sin (1 / x)$ on $\( 0 , 1 \]$ is not of bounded variance.
- $f$ is monotone (increasing), then $"T.V."f = f(b)-f(a)$ , so $f in "BV"$ .
]


*Notation.* $"Mono" = { f : [a , b] arrow.r bb(R), f "is monotone increasing"} $ .

#thm[
$f in "BV"([ a , b]) arrow.l.r.double f$ is difference of two monotone functions, i.e.,
$ "BV"([a , b]) = "Mone" - "Mone" . $
]

#prf[
$<==$ is clear.

$==>$ : Define $f_plus.minus (x) < sup {sum_(i = 1)^n [f (a_i) - f (a_(i - 1))]^plus.minus}$ where supermum over all finite partitions on $[a , x]$. Clearly $f_(plus.minus) gt.eq 0$, and $f_(plus.minus) in "Mono"$ . Then

$ f_(+) (x) - f_(-) (x) = f (x) - f (a) = "T.V." f|_([a , x]) . quad "(exercise)" $
]

#cor[
$f in "BV" arrow.r.double f$ is differentiable $cal(L)^1$-a.e. , i.e.,

$ f^(') in L^1 ([a , b]) . $
]

#def[
$f : [a , b] arrow.r bb(R)$ is absolutely continuous ($f in "AC"([a, b])$) iff $forall epsilon > 0$, $exists delta > 0$, s.t. for any finite collection of disjoint intervals $(a_i b_i)$ in $[a , b]$ whenever $sum_(i = 1)^n lr(|b_i - a_i|) < delta$, one has

$ sum_(i = 1)^n lr(|f (b_i) - f (a_i)|) < epsilon . $
]

Above all, we have $"AC" subset.eq C^0 sect "BV"$ , since the $"T.V."$ of $f$ over any set of length $lt.eq delta$ is no move than $epsilon$.

#thm[
FTC holds iff for $"AC"$ .
]
