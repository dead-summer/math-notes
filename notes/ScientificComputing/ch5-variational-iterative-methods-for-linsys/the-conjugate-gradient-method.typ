#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(2)
#set heading(numbering: "1.1.1")

// 上一节编号到 8
#counter(math.equation).update(8)

// 带有 label 的公式才编号
#set math.equation(numbering: "(1)", supplement: none, number-align: bottom)
#show math.equation.where(block: true): it => {
 if not it.has("label") {
   let fields = it.fields()
   fields.remove("body")
   fields.numbering = none
   return [#counter(math.equation).update(v => v - 1)#math.equation(..fields, it.body)<math-equation-without-label>]
 }
 return it
}

= The conjugate gradient method
<the-conjugate-gradient-method>
In this section, we again assume that matrix $upright(bold(A))$ is symmetric positive definite. The steepest descent method searches for a local minimizer in a one-dimensional subspace, which gives an algorithm with low convergence rate. The conjugate gradient method searches for a local minimizer in a two-dimensional subspace, which as we will see yields a significantly higher convergence rate.

== Derivation of the algorithm
<derivation-of-the-algorithm>
The first step in the conjugate gradient method is the same as the steepest descent method. In each iteration after the first one, the conjugate gradient method searches for the local minimizer of the quadratic functional on the two-dimensional subspace spanned by the present steepest descent direction (the residual) $upright(bold(r))_k$ and the previous search direction $upright(bold(d))_k$ .

Assume that

$ upright(bold(d))_(k + 1) in "span" {upright(bold(r))_k , upright(bold(d))_k} $

By the iteration process, similar to (2), it is reasonable to assume that the two vectors $upright(bold(r))_k$ and $upright(bold(d))_k$ are orthogonal, i.e,

$ upright(bold(d))_k^(upright(T)) upright(bold(r))_k = 0 . $<eq:9>

We assume that

$ upright(bold(d))_(k + 1) = upright(bold(r))_k + beta_(k + 1) upright(bold(d))_k $<eq:10>

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + alpha_(k + 1) upright(bold(d))_(k + 1) $<eq:11>

with parameters $alpha_(k + 1)$ and $beta_(k + 1)$ to be determined by solving the two-dimensional minimization problem

$ phi (upright(bold(x))_k + alpha_(k + 1) upright(bold(d))_(k + 1)) = min_(alpha , beta in bb(R)) phi (upright(bold(x))_k + alpha (upright(bold(r))_k + beta upright(bold(d))_k)) . $

Let

$ upright(bold(r))_(k + 1) = upright(bold(b)) - upright(bold(A)) upright(bold(x))_(k + 1) . $

The local minimization problem on the two-dimensional subspace indicates that the new residual $upright(bold(r))_(k + 1)$ is orthogonal to any vector in the two-dimensional subspace $"span" {upright(bold(r))_k , upright(bold(d))_k}$ . In other words, the new residual $upright(bold(r))_(k + 1)$ satisfies

$ upright(bold(r))_k^(upright(T)) upright(bold(r))_(k + 1) = 0 , $<eq:12>

$ upright(bold(d))_k^(upright(T)) upright(bold(r))_(k + 1) = 0 . $<eq:13>

Here, since the new search direction $upright(bold(d))_(k + 1)$ is a linear combination of $upright(bold(r))_k$ and $upright(bold(d))_k$ , we also have

$ upright(bold(d))_(k + 1)^(upright(T)) upright(bold(r))_(k + 1) = 0 $<eq:14>

Note that

$ upright(bold(r))_(k + 1) = upright(bold(r))_k - alpha_(k + 1) upright(bold(A d))_(k + 1) . $<eq:15>

From (@eq:13) and (@eq:15), using (@eq:9), we get

$ upright(bold(d))_k^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1) = 0 $<eq:16>

This means that the new search direction $upright(bold(d))_(k + 1)$ is $upright(bold(A))$ -conjugate to the previous search direction $upright(bold(d))_k$ . Moreover, together with (@eq:10), we have

$ beta_(k + 1) = - frac(upright(bold(d))_k^(upright(T)) upright(bold(A)) upright(bold(r))_k, upright(bold(d))_k^(upright(T)) upright(bold(A)) upright(bold(d))_k) . $<eq:17>

From (@eq:14) and (@eq:15), using (@eq:10) and (@eq:9), we get

$ alpha_(k + 1) = frac(upright(bold(d))_(k + 1)^(upright(T)) upright(bold(r))_k, upright(bold(d))_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1)) = frac((upright(bold(r))_k + beta_(k + 1) upright(bold(d))_k)^(upright(T)) upright(bold(r))_k, upright(bold(d))_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1)) = frac(upright(bold(r))_k^(upright(T)) upright(bold(r))_k, upright(bold(d))_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1)) . $<eq:18>

The expression above indicates that

$ frac(1, upright(bold(d))_k^(upright(T)) upright(bold(A)) upright(bold(d))_k) = frac(alpha_k, upright(bold(r))_(k - 1)^(upright(T)) upright(bold(r))_(k - 1)) . $

Substituting this into (@eq:17), we get

$ beta_(k + 1) = - frac(alpha_k upright(bold(d))_k^(upright(T)) upright(bold(A)) upright(bold(r))_k, upright(bold(r))_(k - 1)^(upright(T)) upright(bold(r))_(k - 1)) = frac((upright(bold(r))_k - upright(bold(r))_(k - 1))^(upright(T)) upright(bold(r))_k, upright(bold(r))_(k - 1)^(upright(T)) upright(bold(r))_(k - 1)) = frac(upright(bold(r))_k^(upright(T)) upright(bold(r))_k, upright(bold(r))_(k - 1)^(upright(T)) upright(bold(r))_(k - 1)) $<eq:19>

Here, we used the fact $upright(bold(r))_(k - 1)^(upright(T)) upright(bold(r))_k = 0$ .

In summary, the conjugate gradient method is described as follows:

$
cases(
upright(bold(d))_1 = upright(bold(r))_0 = upright(bold(b)) - upright(bold(A)) upright(bold(x))_0\
alpha_1 = frac(upright(bold(r))_0^(upright(T)) upright(bold(r))_0, upright(bold(d))_1^(upright(T)) upright(bold(A)) upright(bold(d))_1)\
upright(bold(x))_1 = upright(bold(x))_0 + alpha_1 upright(bold(d))_1\
upright(bold(r))_1 = upright(bold(r))_0 - alpha_1 upright(bold(A)) upright(bold(d))_1
)
$

and for $k = 1 , 2 , dots.h.c$ do

$
cases(
beta_(k + 1) = frac(upright(bold(r))_k^(upright(T)) upright(bold(r))_k, r_(k - 1)^(upright(T)) upright(bold(r))_(k - 1))\
upright(bold(d))_(k + 1) = upright(bold(r))_k + beta_(k + 1) upright(bold(d))_k\
alpha_(k + 1) = frac(upright(bold(r))_k^(upright(T)) upright(bold(r))_k, upright(bold(d))_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1))\
upright(bold(x))_(k + 1) = upright(bold(x))_k + alpha_(k + 1) upright(bold(d))_(k + 1)\
r_(k + 1) = r_k - alpha_(k + 1) upright(bold(d))_(k + 1) .
)
$

Note that the first step of the conjugate gradient algorithm is the same as the steepest descent method.

== Properties of the search directions and residuals
<properties-of-the-search-directions-and-residuals>
Now we will prove by induction the search directions and the residuals by the conjugate gradient method have the orthogonality properties:

$ upright(bold(d))_j^(upright(T)) upright(bold(A)) upright(bold(d))_k = 0 quad "for" j < k , $<eq:20>

$ upright(bold(r))_j^(upright(T)) upright(bold(A d))_k = 0 quad "for" j < k - 1 , $<eq:21>

$ upright(bold(r))_j^(upright(T)) upright(bold(r))_k = 0 quad "for" j < k , $<eq:22>

$ upright(bold(d))_j^(upright(T)) upright(bold(r))_k = 0 quad "for" j lt.eq k . $<eq:23>

Property (@eq:20) states that all search directions $upright(bold(d))_k$'s are A-conjugate. Property (@eq:22) states that all residuals $upright(bold(r))_k$'s are *conjugate gradients*. Now assume that properties (@eq:20)-(@eq:23) hold. By the construction of the conjugate gradient method, we have already known

$ upright(bold(d))_k^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1) = 0 , $<eq:24>

$ upright(bold(r))_k^(upright(T)) upright(bold(r))_(k + 1) = 0 , $<eq:25>

$ upright(bold(d))_k^(upright(T)) upright(bold(r))_(k + 1) = 0 , $<eq:26>

$ upright(bold(d))_(k + 1)^(upright(T)) upright(bold(r))_(k + 1) = 0 . $<eq:27>

We only need to show that

$ upright(bold(d))_j^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1) = 0 , $<eq:28>

$ upright(bold(r))_j^(upright(T)) upright(bold(A d))_(k + 1) = 0 , $<eq:29>

$ upright(bold(r))_j^(upright(T)) upright(bold(r))_(k + 1) = 0 , $<eq:30>

$ upright(bold(d))_j^(upright(T)) upright(bold(r))_(k + 1) = 0 $<eq:31>

for $j = 0 , 1 , dots.h.c , k - 1$ . Note that

$ upright(bold(r))_j = upright(bold(d))_(j + 1) - beta_(j + 1) upright(bold(d))_j $<eq:32>

and

$ upright(bold(A d))_j = alpha_j^(- 1) (upright(bold(r))_j - upright(bold(r))_(j - 1)) $<eq:33>

Using identities (@eq:32)-(@eq:33), we can verify that (@eq:28) $arrow.l.r.double$ (@eq:29) $arrow.l.r.double$ (@eq:30) $arrow.l.r.double$ (@eq:31) $arrow.l.r.double$ (@eq:28). It suffices to show that property (@eq:28) holds. As a matter of fact, we have

$ upright(bold(d))_j^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1) = upright(bold(d))_j^(upright(T)) upright(bold(A)) (upright(bold(r))_k + beta_(k + 1) upright(bold(d))_k) = upright(bold(d))_j^(upright(T)) upright(bold(A)) upright(bold(r))_k = alpha_j^(- 1) (upright(bold(r))_j - upright(bold(r))_(j - 1))^(upright(T)) upright(bold(r))_k = 0 . $<eq:34>

The identities above indicate the additional property

$ upright(bold(d))_j^(upright(T)) upright(bold(A r))_k = 0 quad "for" j < k . $

Property (@eq:23) says the residual $upright(bold(r))_k$ is orthogonal to all previous search directions. It means that the approximation $upright(bold(x))_(k + 1)$ is not just the minimizer of the quadratic functional $phi (upright(bold(y)))$ over the two-dimensional set

$ upright(bold(x))_k + "span" {upright(bold(r))_k , upright(bold(d))_k} $

but also the minimizer of the quadratic functional over the $(k + 1)$ dimensional set

$ upright(bold(x))_0 + "span" {upright(bold(d))_1 , upright(bold(d))_2 , dots.h.c , upright(bold(d))_k , upright(bold(d))_(k + 1)} = upright(bold(x))_0 + "span" {upright(bold(r))_0 , upright(bold(r))_1 , dots.h.c , upright(bold(r))_(k - 1) , upright(bold(r))_k} $

$ = upright(bold(x))_0 + "span" {upright(bold(r))_0 , upright(bold(A r))_0 , dots.h.c , upright(bold(A))^(k - 1) upright(bold(r))_0 , upright(bold(A))^k upright(bold(r))_0} . $

The conjugate gradient method in each iteration finds its best possible solution. Note the space spanned by the residuals,

$ "span" {upright(bold(r))_0 , upright(bold(A r))_0 , dots.h.c , upright(bold(A))^(k - 1) upright(bold(r))_0 , upright(bold(A))^k upright(bold(r))_0} , $

is called the Krylov subspace. The conjugate gradient method is a Krylov subspace method.

== The convergence rate
<the-convergence-rate>
In the next, we will derive the convergence of the conjugate gradient algorithm. Assume

$ upright(bold(r))_k = (upright(bold(I)) - c_1 upright(bold(A)) - c_2 upright(bold(A))^2 - dots.h.c - c_k upright(bold(A))^k) upright(bold(r))_0 . $

Let $upright(bold(e))_k = upright(bold(x)) - upright(bold(y))_k$ be the iteration error at the $k^("th")$ step. We have

$ upright(bold(e))_k &= upright(bold(A))^(- 1) upright(bold(r))_k = upright(bold(A))^(- 1) (upright(bold(I)) - c_1 upright(bold(A)) - c_2 upright(bold(A))^2 - dots.h.c - c_k upright(bold(A))^k) upright(bold(r))_0 \
&= (upright(bold(I)) - c_1 upright(bold(A)) - c_2 upright(bold(A))^2 - dots.h.c - c_k upright(bold(A))^k) upright(bold(A))^(- 1) upright(bold(r))_0 \
&= (upright(bold(I)) - c_1 upright(bold(A)) - c_2 upright(bold(A))^2 - dots.h.c - c_k upright(bold(A))^k) upright(bold(e))_0 .
$<eq:35>

Recall the coefficients ${c_i}_(i = 1)^k$ are chosen by the conjugate gradient algorithm such that the approximation error $upright(bold(e))_k$ in the energy norm is minimized. That is,

$ norm(upright(bold(e))_k)_(upright(bold(A))) lt.eq norm(p_k (upright(bold(A))) upright(bold(e))_0)_(upright(bold(A))) $<eq:36>

for any polynomial $p_k (xi) in cal(P)_k$ in the form

$ p_k (xi) = 1 - a_1 xi - a_2 xi^2 - dots.h.c - a_k xi^k , $<eq:37>

with $a_i in bb(R) , i = 1 , 2 , dots.h.c , k$ . Assume the symmetric and positive definite matrix $upright(bold(A))$ has $n$ positive eigenvalues, $0 < lambda_1 lt.eq lambda_2 lt.eq dots.h.c lt.eq lambda_n$ . Same as that for the steepest descent method, it is easy to verify that

$ norm(upright(bold(e))_k)_(upright(bold(A))) lt.eq max_(1 lt.eq i lt.eq n) abs(p_k (lambda_i)) dot.op norm(upright(bold(e))_0)_(upright(bold(A))) lt.eq max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(p_k (xi)) dot.op norm(upright(bold(e))_0)_(upright(bold(A))) , $<eq:38>

for any polynomial $p_k (xi) in cal(P)_k$ with $p_k (0) = 1$ . Here, $cal(P)_k$ is the set of polynomials with degree not greater than $k$ . Equivalently, inequality (@eq:38) says

$ norm(upright(bold(e))_k)_(upright(bold(A))) / norm(upright(bold(e))_0)_(upright(bold(A))) lt.eq inf_(p_k in cal(P)_k\
p_k (0) = 1) max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(p_k (xi)) . $<eq:39>

To estimate an upper bound for

$ inf_(p_k in cal(P)_k\
p_k (0) = 1) max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(p_k (xi)) $<eq:40>

we choose a particular polynomial

$ T_k (xi) equiv frac(C_k (frac(lambda_n + lambda_1 - 2 xi, lambda_n - lambda_1)), C_k (frac(lambda_n + lambda_1, lambda_n - lambda_1))) $<eq:41>

with $C_k (zeta)$ be the standard *Chebyshev polynomial*, given by

$ C_k (zeta) = 1 / 2 [(zeta + sqrt(zeta^2 - 1))^k + (zeta - sqrt(zeta^2 - 1))^k] $

$ =
cases(
cos (k arccos zeta) \, & "if" abs(zeta) lt.eq 1\
cosh (k "arccosh" zeta) \, & "if" abs(zeta) gt.eq 1 .
)
$<eq:42>

We can verify that

$ T_k (0) = 1 , quad T_k (1) = 1 ,quad abs(T_k (zeta)) lt.eq 1 quad "for" - 1 lt.eq zeta lt.eq 1 . $<eq:43>

So, we have

$ inf_(p_k in cal(P)_k\
p_k (0) = 1) max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(p_k (xi)) &lt.eq max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(T_k (xi)) lt.eq frac(1, C_k (frac(lambda_n + lambda_1, lambda_n - lambda_1))) \
&lt.eq 2 / (frac(lambda_n + lambda_1, lambda_n - lambda_1) + sqrt((frac(lambda_n + lambda_1, lambda_n - lambda_1))^2 - 1))^k \
&= 2 (frac(sqrt(lambda_n) - sqrt(lambda_1), sqrt(lambda_n) + sqrt(lambda_1)))^k
$<eq:44>

That is, we have the convergence estimate for the conjugate gradient method

$ norm(upright(bold(e))_k)_(upright(bold(A))) lt.eq 2 (frac(sqrt(lambda_n) - sqrt(lambda_1), sqrt(lambda_n) + sqrt(lambda_1)))^k norm(upright(bold(e))_0)_(upright(bold(A))) $<eq:45>

Finally, we will prove that

$ inf_(p_k in cal(P)_k\
p_k (0) = 1) max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(p_k (xi)) = max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(T_k (xi)) . $

Suppose that there were a polynomial $q_k (xi) in cal(P)_k$ such that

$ q_k (0) = 1 "and" max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(q_k (xi)) < max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(T_k (xi)) . $<eq:46>

Note that the shifted and scaled Chebyshev polynomial $T_k (xi)$ achieves its maximum and minimum in alternating order at $(k + 1)$ points,

$ eta_j = frac(lambda_n + lambda_1, 2) + frac(lambda_n - lambda_1, 2) cos frac(j pi, k) in [lambda_1 , lambda_n] quad "for" #h(0em) j = 0 , 1 , 2 , dots.h.c , k . $

At each of those points, $T_k (xi) - q_k (xi)$ must have the same sign as $T_k (xi)$ . Otherwise, if $T_k (xi) - q_k (xi)$ has the opposite sign against $T_k (xi)$ at some $eta_j$ , then we will have $max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(q_k (xi)) > max_(lambda_1 lt.eq xi lambda_n) abs(T_k (xi))$ , which is contradictory to the assumption. So, the values of the polynomial

$ S_(k - 1) (xi) = frac(T_k (xi) - q_k (xi), xi) $<eq:47>

at the $(k + 1)$ points ${eta_j}_(j = 0)^k$ alternatively change signs. In other words, the polynomial $S_(k - 1) (xi)$ , which has a degree of(k - 1), changes signs $(k + 1)$ times between $[lambda_1 , lambda_n]$ . By the mean value theorem, the polynomial $S_(k - 1) (xi)$ has $k$ zeros in $(lambda_1 , lambda_n)$ . A non-trivial polynomial of degree not greater than(k - 1)can have at most(k - 1)zeros. This indicates that the polynomial $S_(k - 1) (xi)$ is identically zero, i.e.,

$ S_(k - 1) (xi) = frac(T_k (xi) - q_k (xi), xi) equiv 0 $<eq:48>

for any $xi in [lambda_1 , lambda_n]$ . This leads to a contradiction against assumption (@eq:46).

Similarly, we can see that if there is a polynomial $q_k (xi) in cal(P)_k$ such that

$ q_k (0) = 1 "and" max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(q_k (xi)) < max_(lambda_1 lt.eq xi lt.eq lambda_n) abs(T_k (xi)) , $

we must have $q_k (xi) = T_k (xi)$ .

Rewriting the convergence estimate (@eq:45), we get

$ norm(upright(bold(x)) - upright(bold(x))_m)_(upright(bold(A))) lt.eq 2 (frac(sqrt(lambda_n) - sqrt(lambda_1), sqrt(lambda_n) + sqrt(lambda_1)))^m norm(upright(bold(x)) - upright(bold(x))_0)_(upright(bold(A))) = 2 (1 - frac(2, sqrt(lambda_n \/ lambda_1) + 1))^m norm(upright(bold(x)) - upright(bold(x))_0)_(upright(bold(A))) . $

The ratio $lambda_n \/ lambda_1$ is called the spectral condition number, which is equivalent to other condition number of the matrix. From the convergence estimate, we see that the larger the condition number is, the slower does the conjugate gradient method converge. We also see that the conjugate gradient method has a much higher convergence rate than the steepest descent method.

In the next, we will estimate the minimum number of conjugate gradient iterations needed for the relative error $norm(upright(bold(x)) - upright(bold(x))_m)_(upright(bold(A))) \/ norm(upright(bold(x)) - upright(bold(x))_0)_(upright(bold(A)))$ to be less than some pre-specified tolerance $epsilon.alt$ . Here, we may assume the initial guess $upright(bold(x))_0$ simply takes the zero vector. By the estimate for the conjugate gradient iteration errors,

$ norm(upright(bold(x)) - upright(bold(x))_m)_(upright(bold(A))) lt.eq 2 (frac(sqrt(lambda_max) - sqrt(lambda_min), sqrt(lambda_max) + sqrt(lambda_min)))^m norm(upright(bold(x)) - upright(bold(x))_0)_(upright(bold(A))) , $<eq:49>

the minimum number of conjugate gradient iterations needed should satisfy

$ 2 (frac(sqrt(lambda_max) - sqrt(lambda_min), sqrt(lambda_max) + sqrt(lambda_min)))^m = 2 (frac(sqrt(kappa (upright(bold(A)))) - 1, sqrt(kappa (upright(bold(A)))) + 1))^m < epsilon.alt , $

where $kappa (upright(bold(A))) = lambda_max \/ lambda_min$ is the 2-norm condition number of the matrix $upright(bold(A))$ . That is, we get

$ m > frac(- log (epsilon.alt \/ 2), - log { 1 - 2 \/ [sqrt(kappa (upright(bold(A)))) + 1] }) . $

The convergence rate of the conjugate gradient method reads

$ R_(upright(C G)) = - log [1 - frac(2, sqrt(kappa (upright(bold(A)))) + 1)] approx frac(2, sqrt(kappa (upright(bold(A)))) + 1) approx 2 / sqrt(kappa (upright(bold(A)))) $

when the matrix has a large condition number. In summary, in order for the relative error to be less than some pre-specified tolerance, the number of iterations needed is approximately given by

$ m_min approx frac(- log (epsilon.alt \/ 2), 2) sqrt(kappa (upright(bold(A)))) , $

which is linearly proportional to the square root of the 2-norm condition number of the matrix.

== The preconditioned conjugate gradient method
<the-preconditioned-conjugate-gradient-method>
In order that a linear system is solved more efficiently with the conjugate gradient method, we often transform the system into one with a much smaller condition number before the conjugate gradient method is applied.

Let $upright(bold(P))$ be a symmetric positive definite matrix. Suppose that $upright(bold(P))$ is an approximation of $upright(bold(A))$ in the sense that $upright(bold(P))^(- 1) upright(bold(A))$ has a small condition number. Note that $upright(bold(P))^(- 1) upright(bold(A))$ is similar to $upright(bold(P))^(- 1 \/ 2) upright(bold(A)) upright(bold(P))^(- 1 \/ 2)$ . If the matrix $upright(bold(P))^(- 1) upright(bold(A))$ has a small condition number, so does matrix $upright(bold(P))^(- 1 \/ 2) upright(bold(A)) upright(bold(P))^(- 1 \/ 2)$ . Note that the linear system

$ upright(bold(A x)) = upright(bold(b)) $

can be rewritten as

$ (upright(bold(P))^(- 1 \/ 2) upright(bold(A)) upright(bold(P))^(- 1 \/ 2)) upright(bold(P))^(1 \/ 2) upright(bold(x)) = upright(bold(P))^(- 1 \/ 2) upright(bold(b)) . $

Let $upright(bold(A))^(') = upright(bold(P))^(- 1 \/ 2) upright(bold(A)) upright(bold(P))^(- 1 \/ 2) , upright(bold(b))^(') = upright(bold(P))^(- 1 \/ 2) upright(bold(b))$ and $upright(bold(x))^(') = upright(bold(P))^(1 \/ 2) upright(bold(x))$ . Applying the conjugate gradient method for the linear system

$ upright(bold(A))^(') upright(bold(x))^(') = upright(bold(b))^(') $

yields

$
cases(
beta_(k + 1)^(') & = & frac((upright(bold(r))_k^('))^(upright(T)) upright(bold(r))_k^('), (upright(bold(r))_(k - 1)^('))^(upright(T)) upright(bold(r))_(k - 1)^('))\
upright(bold(d))_(k + 1)^(') & = & upright(bold(r))_k^(') + beta_(k + 1)^(') upright(bold(d))_k^(')\
alpha_(k + 1)^(') & = & frac((upright(bold(r))_k^('))^(upright(T)) upright(bold(r))_k^('), (upright(bold(d))_(k + 1)^('))^(upright(T)) upright(bold(A))^(') upright(bold(d))_(k + 1)^('))\
upright(bold(x))_(k + 1)^(') & = & upright(bold(x))_k^(') + alpha_(k + 1)^(') upright(bold(d))_(k + 1)^(')\
upright(bold(r))_(k + 1)^(') & = & gamma_(k + 1)^(') - gamma_(k + 1)^(') upright(bold(d))_(k + 1)^(') .
)
$

We have

$ upright(bold(x))_k^(') = upright(bold(P))^(1 \/ 2) upright(bold(x))_k "and" upright(bold(r))_k^(') = upright(bold(b))^(') - upright(bold(A))^(') upright(bold(x))_k^(') = upright(bold(P))^(- 1 \/ 2) upright(bold(b)) - upright(bold(P))^(- 1 \/ 2) upright(bold(A)) upright(bold(P))^(- 1 \/ 2) upright(bold(P))^(1 \/ 2) upright(bold(x))_k = upright(bold(P))^(- 1 \/ 2) upright(bold(r))_k . $

Let

$ upright(bold(d))_k = upright(bold(P))^(- 1 \/ 2) upright(bold(d))_k^(') $

i.e.,

$ upright(bold(d))_k^(') = upright(bold(P))^(1 \/ 2) upright(bold(d))_k $

Using the identities above, we can rewrite the preconditioned conjugate gradient algorithm as

$ cases(
beta_(k + 1)^(') & = frac(upright(bold(r))_k^(upright(T)) upright(bold(P))^(- 1) upright(bold(r))_k, r_(k - 1)^(upright(T)) upright(bold(P))^(- 1) upright(bold(r))_(k - 1)),
upright(bold(d))_(k + 1) & = upright(bold(P))^(- 1) upright(bold(r))_k + beta_(k + 1)^(') upright(bold(d))_k,
alpha_(k + 1)^(') & = frac(upright(bold(r))_k^(upright(T)) upright(bold(P))^(- 1) upright(bold(r))_k,
d_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(d))_(k + 1)),
upright(bold(x))_(k + 1) & = upright(bold(x))_k + alpha_(k + 1)^(') upright(bold(d))_(k + 1),
upright(bold(r))_(k + 1) & = upright(bold(r))_k - alpha_(k + 1)^(') upright(bold(d))_(k + 1)) $

or

$ cases(delim: "{", upright(bold(s))_k & = upright(bold(P))^(- 1) upright(bold(r))_k, beta_(k + 1)^(') & = frac(upright(bold(r))_k^(upright(T)) upright(bold(s))_k, upright(bold(r))_(k - 1)^(upright(T)) upright(bold(s))_(k - 1)), upright(bold(d))_(k + 1) & = upright(bold(s))_k + beta_(k + 1)^(') upright(bold(d))_k, alpha_(k + 1)^(') & = frac(upright(bold(r))_k^(upright(T)) upright(bold(s))_k, upright(bold(d))_(k + 1)^(upright(T)) upright(bold(d))_(k + 1)), upright(bold(x))_(k + 1) & = upright(bold(x))_k + alpha_(k + 1)^(') upright(bold(d))_(k + 1), upright(bold(w))_k & = upright(bold(w))_(k + 1) upright(bold(d))_k + upright(bold(b))_(k + 1)) . $

#rmk[
The preconditioned conjugate gradient method can also be derived by assuming the decomposition of the matrix $upright(bold(P))$ ,

$ upright(bold(P)) = upright(bold(L L))^T $

transforming the linear system into

$ upright(bold(A))^(') upright(bold(x))^(') = upright(bold(b))^(') $<eq:50>

with

$ upright(bold(A))^(') = upright(bold(L))^(- 1) upright(bold(A)) (upright(bold(L))^(- 1))^T , #h(0em) upright(bold(x))^(') = upright(bold(L))^T upright(bold(x)) "and" upright(bold(b))^(') = upright(bold(L))^(- 1) upright(bold(b)) , $

and applying the standard conjugate gradient algorithm to the new system (@eq:50).
]

There are two typical ways to choose a preconditioner for a symmetric positive definite matrix. One chooses the preconditioner $upright(bold(P))$ by an incomplete $L U$ decomposition. Another one chooses the preconditioner $upright(bold(P))$ by the symmetric successive over-relaxation (SSOR).

The symmetric SOR iteration for linear system $upright(bold(A x)) = upright(bold(b))$ takes the form

$ x_i^((k + 1 \/ 2)) = (1 - omega) x_i^((k)) + omega (b_i - sum_(j = 1)^(i - 1) a_(i , j) x_j^((k + 1 \/ 2)) - sum_(i + 1)^n a_(i , j) x_j^((k))) \/ a_(i , i) $

for $i = 1 , 2 , dots.h.c , n - 1, n$ , and

$ x_i^((k + 1)) = (1 - omega) x_i^((k + 1 \/ 2)) + omega (b_i - sum_(j = 1)^(i - 1) a_(i , j) x_j^((k + 1 \/ 2)) - sum_(i + 1)^n a_(i , j) x_j^((k + 1))) \/ a_(i , i) $

for $i = n , n - 1 , dots.h.c , 2 , 1$ with $0 < omega < 2$ . Suppose that we write the SSOR iteration in the form

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + upright(bold(P))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) $

If we choose $upright(bold(x))_k = 0$ , then the vector $upright(bold(x))_(k + 1)$ after one SSOR iteration is equal to the inverse of the

preconditioner multiplied by vector $upright(bold(b))$ . In practice, we do use this fact to compute $upright(bold(P))^(- 1) upright(bold(b))$ .

Assume that the matrix $upright(bold(A))$ has the splitting $upright(bold(A)) = upright(bold(D)) - upright(bold(L)) - upright(bold(U))$ as we discussed in earlier classnotes.

We can verify that the preconditioner corresponding to the SSOR iteration reads

$ upright(bold(P)) = frac(1, omega (2 - omega)) (upright(bold(D)) - omega upright(bold(L))) upright(bold(D))^(- 1) (upright(bold(D)) - omega upright(bold(U))) $

with $0 < omega < 2$ .

Let

$ upright(bold(P))_(upright(S O R)) = 1 / omega (upright(bold(D)) - omega upright(bold(L))) "and" upright(bold(P))_(upright(S O R))^(\*) = 1 / omega (upright(bold(D)) - omega upright(bold(U))) . $

be the preconditioners of the forward SOR and backward SOR, respectively.

The corresponding iteration matrices read

$ upright(bold(B))_(upright(S O R)) = upright(bold(I)) - upright(bold(P))_(upright(S O R))^(- 1) upright(bold(A)) = upright(bold(I)) - omega (upright(bold(D)) - omega upright(bold(L)))^(- 1) upright(bold(A)) = omega (upright(bold(D)) - omega upright(bold(L)))^(- 1) [(1 - omega) upright(bold(D)) + omega upright(bold(U))] $

and

$ upright(bold(B))_(upright(S O R))^(\*) = upright(bold(I)) - (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(A)) = upright(bold(I)) - omega (upright(bold(D)) - omega upright(bold(U)))^(- 1) upright(bold(A)) = (upright(bold(D)) - omega upright(bold(U)))^(- 1) [(1 - omega) upright(bold(D)) + omega upright(bold(L))] . $

The iteration matrix of the symmetric SOR is the product of the seperate iteration matrices, i.e.,

$ upright(bold(B))_(upright(S S O R)) = upright(bold(B))_(upright(S O R))^(\*) upright(bold(B))_(upright(S O R)) $

The iteration matrix and the preditioner of SSOR have the relation,

$ upright(bold(B))_(upright(S S O R)) = upright(bold(I)) - upright(bold(P))_(upright(S S O R))^(- 1) upright(bold(A)) $

Thus, we get

$
upright(bold(P))_(upright(S S O R))^(- 1) &= upright(bold(A))^(- 1) - upright(bold(B))_(upright(S S O R)) upright(bold(A))^(- 1) = upright(bold(A))^(- 1) - upright(bold(B))_(upright(S O R))^(\*) upright(bold(B))_(upright(S O R)) upright(bold(A))^(- 1) \
&= upright(bold(A))^(- 1) - [upright(bold(I)) - (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(A))] (upright(bold(A))^(- 1) - upright(bold(P))_(upright(S O R))^(- 1)) \
&= upright(bold(P))_(upright(S O R))^(- 1) + (upright(bold(P))_(upright(S O R))^(\*))^(- 1) - (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(A P))_(upright(S O R))^(- 1) \
&= (upright(bold(P))_(upright(S O R))^(\*))^(- 1) [upright(bold(P))_(upright(S O R))^(\*) + upright(bold(P))_(upright(S O R)) - upright(bold(A))] upright(bold(P))_(upright(S O R))^(- 1) .
$


Note that

$ upright(bold(P))_(upright(S O R))^(\*) + upright(bold(P))_(upright(S O R)) - upright(bold(A)) = 1 / omega (upright(bold(D)) - omega upright(bold(U))) + 1 / omega (upright(bold(D)) - omega upright(bold(L))) - upright(bold(A)) = (2 / omega - 1) upright(bold(D)) . $

We have

$
upright(bold(P))_(upright(S S O R))^(- 1) &= (upright(bold(P))_(upright(S O R))^(\*))^(- 1) [upright(bold(P))_(upright(S O R))^(\*) + upright(bold(P))_(upright(S O R)) - upright(bold(A))] upright(bold(P))_(upright(S O R))^(- 1) \
&= omega (2 - omega) (upright(bold(D)) - omega upright(bold(U)))^(- 1) upright(bold(D)) (upright(bold(D)) - omega upright(bold(L)))^(- 1) .
$

Another way to compute the preconditioner $upright(bold(P))_(upright(S S O R))$ is as follows.

The symmetric SOR iteration reads

$ cases(delim: "{", upright(bold(x))_(k + 1 \/ 2) & = upright(bold(x))_k + upright(bold(P))_(upright(S O R))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) ,, upright(bold(x))_(k + 1) & = upright(bold(x))_(k + 1 \/ 2) + (upright(bold(P))_(upright(S O R))^(\*))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_(k + 1 \/ 2)) .) $

Note that

$ upright(bold(x))_(k + 1) = upright(bold(P))_(upright(S S O R))^(- 1) upright(bold(b)) $

if we set $upright(bold(x))_k = 0$ . In the next, we write out $upright(bold(x))_(k + 1)$ explicitly with $upright(bold(x))_k = 0$ . We have

$ upright(bold(x))_(k + 1 \/ 2) = upright(bold(P))_(upright(S O R))^(- 1) upright(bold(b)) $

and

$
upright(bold(x))_(k + 1) &= [upright(bold(I)) - (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(A))] upright(bold(x))_(k + 1 \/ 2) + (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(b)) \
&= [upright(bold(I)) - (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(A))] upright(bold(P))_(upright(S O R))^(- 1) upright(bold(b)) + (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(b)) \
&= [upright(bold(P))_(upright(S O R))^(- 1) + (upright(bold(P))_(upright(S O R))^(\*))^(- 1) - (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(A)) upright(bold(P))_(upright(S O R))^(- 1)] upright(bold(b)) .
$

This implies

$ upright(bold(P))_(upright(S S O R))^(- 1) = upright(bold(P))_(upright(S O R))^(- 1) + (upright(bold(P))_(upright(S O R))^(\*))^(- 1) - (upright(bold(P))_(upright(S O R))^(\*))^(- 1) upright(bold(A)) upright(bold(P))_(upright(S O R))^(- 1) . $

#exr[
Show that the symmetric Gauss-Seidel iteration for a symmetric and positive definite system converges with any initial guess.
]

#prf[
Let $upright(bold(A)) = upright(bold(D)) - upright(bold(L)) - upright(bold(L))^(upright(T))$ . The preconditioner matrix by the symmetric Gauss-Seidel iteration reads

$ upright(bold(P)) = (upright(bold(D)) - upright(bold(L))) upright(bold(D))^(- 1) (upright(bold(D)) - upright(bold(L))^(upright(T))) . $

By the Sarmarskii theorem, we only need to show that the matrix $upright(bold(P)) - upright(bold(A)) \/ 2$ is positive definite. In fact, straightforward calculation shows that

$ upright(bold(P)) - upright(bold(A)) \/ 2 = (upright(bold(D)) - upright(bold(L))) upright(bold(D))^(- 1) (upright(bold(D)) - upright(bold(L))^(upright(T))) - 1 / 2 (upright(bold(D)) - upright(bold(L)) - upright(bold(L))^(upright(T))) $

$ = 1 / 2 upright(bold(D)) - 1 / 2 upright(bold(L)) - 1 / 2 upright(bold(L))^(upright(T)) + upright(bold(L D))^(- 1) upright(bold(L))^(upright(T)) = 1 / 2 upright(bold(A)) + upright(bold(L D))^(- 1) upright(bold(L))^(upright(T)) . $

It is obvious to see that the matrix $upright(bold(P)) - upright(bold(A)) \/ 2$ is symmetric and positive definite.
]
