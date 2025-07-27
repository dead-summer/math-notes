#import "../book.typ": *

#show: book-page.with(
  title: "4.2 Bounded Linear Operator"
)

== Bounded Linear Operator

#definition[
Let $(X , norm(dot.op)_X)$, $(Y , norm(dot.op)_Y)$ be normed vector spaces. Linear operator $T : X arrow.r Y$ is bounded iff $exists 0 lt.eq M < oo$, s.t. $norm(T x)_Y lt.eq M norm(x)_X , forall x in X$.
]

Then we can define the operator norm of $T$:

$
norm(T) &= inf { M gt.eq 0 : norm(T x)_Y lt.eq M norm(x)_X , forall x in X } \
&= inf { M gt.eq 0 : norm(T y)_Y lt.eq M , forall y in overline(bold(B)_1) (0) }\
&= inf { M gt.eq 0 : norm(T z)_Y lt.eq M , forall z in bold(B)_1 (0) }\
&= inf { M gt.eq 0 : norm(T u)_Y lt.eq M , forall u in partial bold(B)_1 (0) } . $

So $norm(T x)_Y lt.eq norm(T) norm(x)_X$.

*Notation*: $cal(B) (X , Y) := { T : X arrow.r Y , T "is a bounded linear operator" }$. If $Y = FF$ ( $bb(R)$ or $bb(C)$ ),  $cal(B) (X , FF) = X^(*)$, the dual of $X$. Say $f in X^(*)$ is a bounded functional on X.

#theorem[
If $X , Y$ are Banach spaces, then $(cal(B) (X , Y) , norm(dot.op))$ is a Banach space.
]

#proof[
Let ${ T_n } subset cal(B) (X , Y)$ be Cauchy, i.e., $norm(T_n - T_j) arrow.r 0$ as $n , j arrow.r oo$. Then $forall x in X$, ${ T_n x }$ is Cauchy in $Y$ since $norm(T_n x - T_j x)_Y lt.eq norm(T_n - T_j) norm(x)_X arrow.r 0$. So ${ T_n x }$ converges in $Y$, say to $T x$ for $T : X arrow.r Y$. Clearly $T$ is linear.

Now we need to check $norm(T_n - T) arrow.r 0$. Since $lim_(n , j arrow.r oo) norm(T_n - T_j) = 0$, so
$
lim_(n arrow.r oo) norm(T_n - T) = lim_(n arrow.r oo) lim_(j arrow.r oo) norm(T_n - T_j) = lim_(n , j arrow.r oo) norm(T_n - T_j) = 0 .
$
Hence, $norm(T) lt.eq norm(T_n - T) + norm(T_n)$. $T$ is bounded and $T in cal(B) (X , Y)$.
]

#remark[
$X$ can be a normed vector space.
]

#corollary[
Let $X$ be a normed vector space, then $X^*$ is a Banach space.
]

*Notation*: $cal(B) (X) = cal(B) (X , X)$.

Consider multiplication on $cal(B) (X)$: $X arrow.r^T X arrow.r^S X$. Let $S compose T = S T$. Then

$
norm(S T x) lt.eq norm(S) norm(T x) lt.eq norm(S) dot norm(T) norm(x), quad forall x in X .
$
So $norm(S T) lt.eq norm(S) dot norm(T)$. Indeed. if $X arrow.r^T Y arrow.r^S Z$ , then $norm(S T) lt.eq norm(S) dot norm(T)$ .

#proposition[
Let $T : X arrow.r Y$ linear, $X$ and $Y$ are normed vector spaces, the following are equivalent:

+ $T$ is bounded.

+ $T$ is continuous.

+ $T$ is continuous at $x$ .

+ $T$ is Lipschitz continuous.
]

Note that $norm(T)_(cal(B) (X , Y)) = sup {frac(norm(T x), norm(x)) : norm(x) = 1}$ is not attained in general. 

#example[
Let $X subset [- 1 , 1] $ over $norm(dot.op)_infinity$ . Take
$
T : & X arrow.r bb(R) \
& phi arrow.r.bar integral_0^1 phi (t) dif t - integral_(- 1)^0 phi (t) dif t .
$
Then $T in X^(*)$, indeed, $norm(T) = 2$. But $exists.not phi_* in X, norm(phi_*) = 1$, s.t. $norm(T phi_*) = 2$ .
]

Consider
$
ell^p = {{ alpha_j } : norm({ alpha_j })_p < oo }
$
where $norm({ alpha_j })_p = (sum_j abs(alpha_j)^p)^(1 \/ p)$ , $1 lt.eq p < oo$. Let $e_i = (0 , dots.h , 0 , 1 , 0 , dots.h)$ : all zero but $i$-th coordinate. Let
$
Z &= "span" ({ e_i }_1^infinity) \
&= { sum_(i=1)^(infinity) c_i e_i : "only finitely many" c_i "are non-zero" } ,
$
where $"span" (S) = {"finite linear cobinations of elements in" S, S "is a set"}$ .

*Question*: Is $Z$ dense in $ell^p$ ?

Yes: $forall x in ell^p$, say $x = { x_j }_1^oo$. Consider $x^n = (x_1 , x_2 , dots.h , x_n , 0 , dots.h)$, then
$
norm(x - x^n)_p &= norm((0 , dots.h , 0 , x_(n + 1) , x_(n + 2) dots.h))_p \
&= (sum_(j = n + 1)^oo abs(x_j)^p)^(1 / p) arrow.r 0 ,
$
as $n arrow.r oo$ .

*Question*: Is $Z$ closed in $ell^p$ ?

If $Z$ is closed, then $overline(Z) = Z = ell^p$. But take $x = (1 , 1 / 2 , 1 / 3 , dots.h) , x_j = j^(- 2)$ , then $x in.not Z$ , since $x eq.not$ finite linear combination of ${ e_j }_1^oo$.

#corollary[
$(Z , norm(dot.op)_p)$ is not a Banach space.
]

Recall $c_(00) = { x in { x_j } : x_j = 0 , forall j gt.eq n$ for some $n in bb(N) }$.

*Fact*: There exists no norm making $c_00$ a Banach space.

#definition[
Let $X$ be a vector space. A subset $B subset X$, s.t. $"span" (B) = X$ is a Hamel Basis.
]

*Fact*: Let $X$ be a Banach space, then either $dim X < oo$ (i.e., all Hamel basis are finite) or any of its Hamel basis must be uncountable.

Some examples for Bounded linear operator:

#example[
$"Mat"(m times n , bb(C)) tilde.equiv cal(L) (bb(C)^n , bb(C)^m)$ (linear map) .
]

#example[
Let $X = ell^p (bb(C)) , 1 lt.eq p lt.eq oo$ . The map $Lambda : cal(L) (X) := cal(L) (X , X) = { T : X arrow.r X "linear" }$ is diagonal iff $Lambda ((x_1 , x_2 , . . .)) = (lambda_1 x_1 , lambda_2 x_2 , . . .)$. Then
$
Lambda in cal(B) (X) arrow.l.r.double { lambda_k }_(k=1)^infinity in ell^oo .
$
]

#proof[
Consider

$
phi.alt : & ell^oo arrow.r cal(B) (X) \
& { x_k } arrow.r.bar Lambda = {(x_1 , x_2 , dots.h) arrow.r.bar (lambda_1 x_1 , lambda_2 x_2 , lambda_3 x_3 dots.h)}
$

_Claim_: $phi.alt$ is isometric. For $Lambda = phi.alt ({lambda_k })$,

$
norm(phi.alt ({ lambda_k })) &= norm(Lambda)_(cal(B) (X)) \
&= sup { norm(Lambda x)_p = { sum_i abs(lambda_i x_i)^p }^(1 \/ p) : norm({ x_i })_p lt.eq 1 } \
&lt.eq norm({ lambda_i })_oo
$
So $norm(phi.alt)_(ell^oo arrow.r cal(B) (X)) lt.eq 1$ . To check $norm(Lambda) gt.eq norm({ lambda_i })_oo$, we just need to exhibit $exists x in ell^p$ , $norm(x)_p = 1$, s.t. $norm(Lambda x)_p = norm({ lambda_j })_oo$.

If $exists j_0$ s.t. $norm(lambda_j)_oo = abs(lambda_(j_0))$. Then take $x = e_(j_0)$. $(arrow.r.double Lambda x = (0 , 0 , dots.h , lambda_(j_0) , 0 , dots.h))$

In general, $exists$ subsequence ${ lambda_(j_k) }$ s.t.

$ abs(lambda_(j_k)) arrow.r norm({ lambda_j })_oo . $

Then $abs(norm(Lambda e_(j_k))_infinity -  norm({lambda_j})_infinity)  < epsilon.alt , forall epsilon.alt > 0$. So

$
norm(Lambda) gt.eq norm({ lambda_j })_oo - epsilon.alt .
$

where $epsilon.alt > 0$ is arbitrary. Hence $phi.alt$ is an isometry.
]

#example[
Let $X = (ell^1 , norm(dot.op)_p)$, $1 lt.eq p lt.eq oo$. Let shift operator be
$
&L: X -> X ,(x_1, x_2, x_3, ) |-> (x_2, x_3, ) , \
&R: X -> X , (x_1, x_2, x_3, ) |-> (0, x_1, x_2, ) .
$
Then $norm(L) = norm(R)$ ; $R compose L eq.not L compose R =$ identity; $R$ is injective but not surjective, $L$ is surjective but not injective.
]

#example[
Consider $I$ on $C ([a , b])$ :
$
(I f) (x) = integral_a^x f (y) dif y .
$
Then $norm(I) = sup { abs(integral_a^x f (y) dif y) : norm(f) lt.eq 1 } lt.eq b - a$. Equality holds when $f equiv 1$.
]

#example[
Let $X = (c_0 , norm(dot.op)_oo)$ be a normed vector space. Consider operator
$
T : & X arrow.r X \
& (a_1 , a_2 , dots.h) arrow.r.bar (a_1 , a_2 / 2 , a_3 / 3 , dots.h) .
$
So $T in cal(B) (X)$ and $T^(- 1) (b_1 , b_2 , b_3 , dots.h) = (b_1 , 2 b_2 , 3 b_3 , dots.h)$ . Then $norm(T^(-1) e_n)_oo = n norm(e_n)_oo $ , $forall n in bb(N) $ . Hence $ norm(T^n)_(cal(B) (X)) = oo$.
]

#theorem[
If $X$ is a Banach space, and if $S in cal(B) (X)$ is invertible as a linear operator, then $S^(- 1) in cal(B) (X)$.
]

#definition[
Let $X$ and $Y$ be normed vector spaces. Say $T : X arrow.r Y$ is an normed vector space isomorphism iff T is a vector space isomorphism, $T in cal(B) (X , Y)$ and $T^(- 1) in cal(B) (Y , X)$.
]

#definition[
Let X be normed vector space. Define $"Aut"(X) = { T in cal(B) (X) : T "is normed vector space isomorphism" }$ .
]

Recall $"Aut"(bb(R)^d) = "GL"(d , bb(R)) subset bb(R)^(d times d) $ is open, $"GL"(d , bb(R)) $ is a Lie group.

#theorem[
Let X be a Banach space, $"Aut"(X) subset cal(B) (X)$ is open.
]

#proof[
*Step 1.* _Claim_: If $norm(T)_(cal(B) (X)) < 1$, then $I - T in "Aut"(X)$. Indeed, let's guess
$ (I - T)^(- 1) = sum_(k = 0)^oo T^k , $
which is so-called Neumann series. For RHS,
$ norm(sum_(k = 0)^N T^k) lt.eq sum_(k = 0)^N norm(T^k) lt.eq sum_(k = 0)^N norm(T)^k lt.eq sum_(k = 0)^oo norm(T)^k < oo $

So $sum_(k = 0)^oo T^k in cal(B) (X)$ is well-defined. Also,
$
(I - T) (sum_(k = 0)^N T^k) = I - T^(N + 1) arrow.r I "in " norm(dot.op) ,
$
$
(sum_(k = 0)^N T^k) (I - T) = I - T^(N + 1) arrow.r I "in " norm(dot.op) .
$

*Step 2.* Given $S in "Aut"(X)$. Since $S - T = S (I - S^(- 1) T)$, so $S - T in "Aut"(X)$ , if $norm(S^(- 1) T) < 1$ or if $norm(T) lt frac(1, norm(S^(- 1)))$. Hence $"Aut"(X)$ is open.
]

