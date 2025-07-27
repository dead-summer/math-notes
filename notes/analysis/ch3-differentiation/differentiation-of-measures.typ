#import "../book.typ": *

#show: book-page.with(
  title: "3.1 Differentiation of Measures"
)

== Differentiation of Measures

Recall: $f : U$ is open $subset bb(R)^n arrow.r bb(R) , x in V$ :

$ lim_(delta arrow.r 0) frac(f (x + delta) - f (x), delta) = : f^(') (x) quad "if it exists." $

So differentiation is in local. $f^(') (x)$ is solely determined by the behaviors of $f$ in an arbitrarily small neighbourhood of $x$ . We first introduce a tool to study the local properties of $f$ : Covering Theorem.

For the moment, we restrict to $cal(L)^n$ on $bb(R)^n$.

*Notations.*

- For $B = overline(BB)_r (x) subset bb(R)^n$, with $hat(B) = 5 B := overline(BB)_(5 r) (x)$.
- For $A subset bb(R)^n$ and $cal(F)$ is the collection of closed balls in $bb(R)^n$, say $cal(F)$ is a cover of $A$ iff $A subset union cal(F) := union.big_(B in cal(F)) B$
- Let $cal(F)$ be a cover of $A$, say that $cal(F)$ is fine (Vitali) iff $forall x in A$, we have inf ${ "diam" B : x in B , B in cal(F)} = 0$ .

#theorem(title: "Vitali Covering")[
Let $cal(F)$ be any collection of (nondegenerate) closed balls in $bb(R)^n$, s.t.

$ D = sup { "diam" B : B in cal(F) } < oo . $

Then we can choose a countable subcollection $cal(G) subset cal(F)$ of disjoint balls, s.t. $union cal(F) subset.eq union.big_(B in cal(G)) hat(B)$.
]<theorem:vitali>

#proof[
(Greedy algorithm) Write $cal(F)_j := {B in cal(F) : D \/ 2^j < "diam" B lt.eq D \/ 2^(j - 1)} , j >= 1$. Define $cal(G)_1$ as (any) maximal disjoint subcollection of $cal(F)_1$. Assume $cal(G)_1 ... cal(G)_(k - 1)$ are chosen; then choose $cal(G)_k$ to be any maximal disjoint subcollection of

$ {B in cal(F)_k : B inter B^(') = diameter "for all " B^(') in union.big_(j = 1)^(k - 1) cal(G)_j} . $

Set $cal(G) : union.big_(k = 1)^oo cal(G)_k$, it is a countable (since $RR^n$ is separated, so $cal(G)_k$ is always countable) collection of disjoint balls. To see the coverage properties, pick any $B in cal(F)$ and prove that $exists B^(') in cal(G)$, s.t. $ B subset hat(B^('))$ . Say $B in cal(F)_k$. Then by construction (maximality of $cal(G)_1 ,..., cal(G)_k$ )
$ B inter B^(') eq.not diameter "for some" B^(') in union.big_(j = 1)^k cal(G)_j , $

(If $forall B^(') in union.big_(j = 1)^k cal(G)_j , B inter B^(') = diameter$, and $B in cal(F)_k$, then $B in cal(G)_k$. This is a contradiction.)

Note that $"diam" B^(') > D \/ 2^k$, diam $B lt.eq D \/ 2^(k - 1)$, Let $y , y'$ be the center of $B , B^(')$, respectively. Then $forall x in B$
$ abs(x - y') & lt.eq abs(x - y) + abs(y - y^('))\
 & lt.eq (D / 2^(k)) + (D / 2^(k) + 1/2 "diam"(B'))\
 & = 5/2 "diam"(B') $

ie., $B subset hat(B^('))$
]

#remark[
1. It's easy to improve $hat(B^(')) = 5 B^(')$ to $(3 + epsilon) B^(')$ :

  Let $cal(F)_j = {B in cal(F) : D \/ delta^j < "diam" B lt.eq D \/ delta^(j - 1)}$ , then $abs(x - y) lt.eq (4/delta + 1/2)"diam"(B') $
2. Woks for compact metric space.
]

#corollary[
Let $cal(F)$ be a fine cover of closed balls for $A subset bb(R)^n$. s.t.

  $ D = sup { "diam" B : B in cal(F) } < oo . $

  We can choose a disjoint countable subcollection $cal(G) subset cal(F)$, s.t. for any fixed $B_1 ... B_m in cal(F)$
  $
  A without union.big_(k = 1)^m B_k subset.eq union.big_(B in cal(G) without {B_1 ,..., B_m}) hat(B)
  $
]

#proof[
  Let $cal(G)$ be as in the Vitali covering theorem, suppose $exists x in A without union.big_(k = 1)^m B_k$. As $cal(F)$ is a fine cover, there is $B in cal(F)$ , s.t. $x in B$ and $B inter (union.big_(k = 1)^m B_k) = diameter$. But then, by  Vitali covering theorem, $exists B' in cal(G)$, s.t. $B inter B^(') eq.not diameter , B subset hat(B^('))$ . In particular, $B^(') in cal(G) without {B_1,..., B_m}$ .
]

#corollary[ 
Let $U subset bb(R)^n$ be open and $delta > 0$. There exists a countable collection $cal(G)$ of disjoint closed balls in $U$. s.t. diam $B lt.eq delta$. $forall B in cal(G)$. and $cal(L)^n (U without union cal(G)) = 0$ .
]<cor2:vitali>

#proof[
WLOG assume $cal(L)^n (U) < oo$ (otherwise let $U_n = U inter bb(B)_n^((0))$ and more details need). Fix $1 - 1 / 5^n < theta < 1$, Let's first pick ${B_1, ... B_J_1} (J_1 < oo)$ of disjoint closed balls in $U$, s.t.
$ "diam" (B_i) < delta dot.op cal(L)^n (U without union.big_(i = 1)^(J_i) B_i) lt.eq theta cal(L)^n (U) $
Indeed, consider $cal(F)_1 = { B subset U : "diam" B < delta }$. It is a finite cover of $U$, so by Vitali covering theorem, $exists$ countable disjoint subcollection $cal(G)_1 subset cal(F)_1$ s.t. $U subset union.big_(B in cal(G)_1) hat(B)$ . So

$ cal(L)^n (U) lt.eq cal(L)^n (union.big_(B in cal(G)_1) hat(B)) lt.eq sum_(B in cal(G)_1) cal(L)^n (hat(B)) = 5^n sum_(B in cal(G)_1) cal(L)^n (B) = 5^n cal(L)^n (union.big_(B in cal(G)_1) B) $

Thus, $cal(L)^n (U without union.sq cal(G)_1) lt.eq (1 - 1 / 5^n) cal(L)^n (U)$. Hence, for $1 - 5^(- n) < theta < 1$. $exists {B_1 ... B_J} subset cal(G)_1 quad$ s.t. $cal(L)^n  (U without union.sq cal(G)_1) < theta cal(L)^n (U)$. Apply the argument to $U without union.sq cal(G)_1$, and so on. Then we obtain disjoint closed balls

$ {B_1, ... , B_(J_1), B_(J_1 + 1) ... B_(J_2), ... , B_(J_k)} $

s.t. $cal(L)^n (U without union.big.sq_(j=1)^(k) B_j) lt.eq 0^k cal(L)^n (U)$. Send $k arrow.r oo$, the result as follows.
]

*Note.* for $forall mu , mu (hat(B)) lt.eq C (n) dot mu (B)$ is not always true. 

#definition[
A measure on a metric space $X$ is said ta be doubling if the measure of any ball is finite and approximately the measure of its double, or more precisely, if there is a constant $C > 0$ s.t.

$ 0 < mu (BB_(2 r) (x)) lt.eq C mu  (BB_r (x)) < oo . $
]

A simple example of a doubling measure is $cal(L)^n$ on a Euclidean space. For non doubling measure, a theorem similar to Vitali covering theorem is as follows.

#theorem(title: [Besikovitch Covering Theorem])[
$exists$ dimensional constant $Lambda = Lambda (n) < oo$, s.t. the following holds: $forall$ family $F$ of nondegenerate closed balls in $bb(R)^n$, s.t.

$ sup { "diam" B : B in F } < oo . $

$exists$ disjoint countable collections of balls. $cal(G)_1 dots.h cal(G)_(Lambda (n))$ s.t.

$ {"centers of" B "in" cal(F) } subset union.big_(i = 1)^(Lambda (n)) (union.sq cal(G)_i) $
]

#remark[
Here we allow overlaps between $cal(G)_1 dots.h cal(G)_(Lambda (n))$ .
]

Next, we discuss the differentiation of measures.

#definition[
A(n) (outer) measure $mu$ on $bb(R)^n$ is Borel regular iff $forall A subset bb(R)^n , exists B subset bb(R)^n$ Borel, s.t. $A subset B, mu (A) = mu (B)$
]

#definition[
A(n) (outer) measure $mu$ is Radon iff $mu$ is Borel regular and $mu (K) < oo , forall K$ compact.
]

We define derivative between two measures via density.

#definition[
Let $mu , nu in cal(M)^(+) (bb(R)^n)$ (Radon nonnegative measure on $bb(R)^n$) , $x in bb(R)^n$. Define
$ overline(cal(D))_mu nu (x) := cases(delim: "{", limsup_(r -> 0) frac(nu (BB_r (x)), mu (BB_r (x))) & "if" mu (BB_r (x)) > 0 quad forall r > 0,
+ oo & "if" exists r > 0 \, "s.t." mu (BB_r (x)) = 0) $

and

$ underline(cal(D))_mu nu (x) := cases(delim: "{", liminf_(r -> 0) frac(nu (BB_r (x)), mu (BB_r (x))) & "if" mu (BB_r (x)) > 0 quad forall r > 0,
+ oo & "if" exists r > 0 \, "s.t." mu (BB_r (x)) = 0) $
]

#definition[
If $overline(cal(D))_mu nu (x) = underline(cal(D))_mu nu (x)$, then say $nu$ is differentiable w.r.t (with respect to) $mu$ at $x in bb(R)^n$. Write $cal(D)_mu nu (x)$, call it the derivative of $nu$ w.r.t $mu$ at $x$.
]


*Questions*:
1. When does $cal(D)_mu nu$ exist ?
2. Even if $cal(D)_mu nu$ exists, can we recover $nu$ from this?
    
   Expect: $nu (E) = integral_E cal(D)_mu nu (x) dif mu (x)$.

#lemma[
For any $0 < alpha < oo , mu , nu in M^(+) (bb(R)^n)$.

1. If $A subset {underline(cal(D))_mu nu lt.eq alpha}$, then $nu(A) lt.eq alpha mu (A)$ .
2. If $A subset {overline(cal(D))_mu nu gt.eq alpha}$, then $nu (A) gt.eq alpha mu (A)$
]<lemma:1>

#proof[
WLOG, can assume $mu (bb(R)^n) + nu (bb(R)^n) < oo$. If $A subset {underline(cal(D))_mu nu lt.eq alpha}$, take any $U subset bb(R)^n$ open, s.t. $U supset A$. Fix $epsilon > 0$, the following is a fine cover of $A$ :

$ cal(F) = {B = overline(bb(B)_r (x)) : x in A , B subset U , nu (B) lt.eq (alpha + epsilon) mu (B)} $

By the corollary (@cor2:vitali) of Vitali covering theorem, we can find $cal(G) subset cal(F)$ countable, disjoint, s.t.

$ nu (A without union.sq cal(G)) = 0 . $

Hence, $nu(A) lt.eq sum_(B in cal(G)) nu (B) lt.eq (alpha + epsilon) sum_(B in cal(G)) mu (B) lt.eq (alpha + epsilon) dot mu (U)$ . Since $U$ is open, $U supset A$ is arbitrary and $mu$ is Borel regular, we have

$ nu (A) lt.eq (alpha + epsilon) mu (A) $

But $epsilon > 0$ is arbitrary, so $nu (A) lt.eq alpha mu (A)$ . Another proposition can be proved similarly.
]

#theorem[
Let $mu , nu in cal(M)^(+) (bb(R)^n)$. Then $cal(D)_mu nu$ exists and is finite $mu$-a.e. In addition, $cal(D)_mu nu$ is $mu$-measurable.
]

#proof[
WLOG $mu (bb(R)^n) + nu (bb(R)^n) < oo$ . Consider $ I = {cal(D)_mu nu = oo}$, and for some $0 < a < b < oo$,
$J (a , b) = & {underline(cal(D))_mu nu < a < b < overline(cal(D))_mu nu}$ . Note that

$ {cal(D)_mu nu "doesn't exist"} = union.big_(0 < a < b < oo\
a , b in bb(Q)) J (a , b) . $

On $I$ , $forall M > 0$ , by @lemma:1 ,

$  cal(D)_mu nu >= M & arrow.r.double oo > nu (I) gt.eq mu (I) dot M\
 & arrow.r.double mu (I) = 0 . $

On $J (a , b)$, similarly by @lemma:1 ,

$ 0 lt.eq b mu (J (a , b)) lt.eq nu (J (a , b)) lt.eq a mu (J (a , b)) < oo $

Hence, $mu (J (a , b)) = 0 arrow.r.double {cal(D)_mu nu$ doesn't exist $}$ is $mu$-null. If $cal(D)_mu nu$ is $mu$-measurable, then $integral_B cal(D)_mu nu dif mu$ makes sense. To see this, consider

$ f_r (x) := cases(delim: "{", frac(nu (BB_r (x)), mu (BB_r (x))) \, & "if" mu (BB_r (x)) > 0, + oo \, & "if" mu (BB_r (x)) = 0 .) $

*Fact*: $x arrow.r.bar nu (BB_r (x)) , x arrow.r.bar mu (BB_r (x))$ are Borel measurable. Then, $cal(D)_mu nu (x) = lim_(n arrow.r oo) f_(1 \/ n) (x)$ for $mu$-a.e. $x in bb(R)^n$. so $cal(D)_mu nu$ is $mu$-measnucble.
]
