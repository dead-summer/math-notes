#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(0)
#set heading(numbering: "1.1.1")

// 上一节编号到 0
#counter(math.equation).update(0)

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

= The Lagrange interpolation
<the-lagrange-interpolation>

#thm([Weierstrass approximation theorem])[
Any function continuous on a closed interval can be arbitrarily accurately approximated by a polynomial.
]

Assume function $f (x) in C [a , b]$ is continuous on $[a , b]$ . Let ${x_i}_(i = 0)^n$ be $(n + 1)$ distinct points on the interval $[a , b]$ . We look for an algebraic polynomial $p_n (x)$ of degree not greater than $n$ that takes the same values as $f (x)$ at the distinct points,

$ p_n (x_i) = f (x_i) quad "for" i = 0 , 1 , dots.h.c , n . $<eq:1>

== Canonical form of the polynomial
<canonical-form-of-the-polynomial>
We first assume the polynomial $p_n (x)$ is in the canonical form

$ p_n (x) = a_0 + a_1 x + a_2 x^2 + dots.h.c + a_n x^n . $<eq:2>

In matrix-vector formulation, the coefficients ${a_j}_(j = 0)^n$ satisfy the linear system

$ mat(delim: "(", 1, x_0, x_0^2, dots.h.c, x_0^n; 1, x_1, x_1^2, dots.h.c, x_1^n; 1, x_2, x_2^2, dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, x_(n - 1)^n; 1, x_n, dots.h.c, x_n^(n - 1), x_n^n) vec(a_0, a_1, a_2, dots.v, a_n) = vec(f (x_0), f (x_1), f (x_2), dots.v, f (x_n)) . $<eq:3>

The coefficient matrix

$ upright(bold(A)) = mat(delim: "(", 1, x_0, x_0^2, dots.h.c, x_0^n; 1, x_1, x_1^2, dots.h.c, x_1^n; 1, x_2, x_2^2, dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, x_(n - 1)^n; 1, x_n, dots.h.c, x_n^(n - 1), x_n^n) $

is invertible as its determinant reads

$ det (upright(bold(A))) = product_(i < j) (x_j - x_i) eq.not 0 , $

which is the well-known Vandermonde determinant. By the invertibility of the coefficient matrix, we see the existence and uniqueness of the interpolating polynomial $p_n (x)$ that satisfies (@eq:1).

The uniqueness of the interpolating polynomial $p_n (x)$ can be derived alternatively by the fact that a polynomial of degree not greater than $n$ can have at most $n$ roots. In fact, if there is another polynomial $q_n (x)$ of degree $n$ which also satisfies (@eq:1), the difference polynomial $r_n (x) ≐ p_n (x) - q_n (x)$ has $(n + 1)$ roots since

$ r_n (x_i) = p_n (x_i) - q_n (x_i) = f (x_i) - f (x_i) = 0 quad "for" j = 0 , 1 , 2 , dots.h.c , n $

while the degree of the polynomial $r_n (x)$ is not greater than $n$ . We know a polynomial of degree not greater than $n$ can have at most $n$ roots unless the polynomial is trivially identical to zero. This indicates $r_n (x) = p_n (x) - q_n (x) equiv 0$ for any $x in bb(R)$ and hence the uniqueness of the interpolating polynomial.

Let $upright(bold(alpha)) = (a_0 , a_1 , a_2 , dots.h.c , a_n)^(upright(T)) in bb(R)^(n + 1) , upright(bold(f)) = \(f (x_0) , f (x_1) , f (x_2) , dots.h.c , f (x_n)^(upright(T)) in bb(R)^(n + 1)$ and $upright(bold(x)) =$ $(1 , x , x^2 , dots.h.c , x^n) in bb(R)^(n + 1)$ be the vectors. The interpolating polynomial $p_n (x)$ has the form

$ p_n (upright(bold(x))) = upright(bold(x))^(upright(T)) upright(bold(alpha)) = upright(bold(x))^(upright(T)) upright(bold(A))^(- 1) upright(bold(f)) . $

The approach above which first solves the linear system (@eq:3) for the coefficients ${a_i}_(i = 0)^n$ and then gets the polynomial (@eq:2) does provide a way to obtain the interpolating polynomial that satisfies (@eq:1).

By taking advantage of the special structure of the coefficient matrix, the solution of the linear system can be acceptable as it involves $O (n^2)$ operations. For example, one may work with the LU decomposition for the Vandermonde matrix.

Consider the case $n = 4$ .

$ mat(delim: "(", 1, x_0, x_0^2, x_0^3; 1, x_1, x_1^2, x_1^3; 1, x_2, x_2^2, x_2^3; 1, x_3, x_3^2, x_3^3) arrow.r mat(delim: "(", 1, x_0, x_0^2, 0; 1, x_1, x_1^2, x_1^2 (x_1 - x_0); 1, x_2, x_2^2, x_2^2 (x_2 - x_0); 1, x_3, x_3^2, x_3^2 (x_3 - x_0)) $

$ mat(delim: "(", 1, x_0, 0, 0; 1, x_1, x_1 (x_1 - x_0), x_1^2 (x_1 - x_0); 1, x_2, x_2 (x_2 - x_0), x_2^2 (x_2 - x_0); 1, x_3, x_3 (x_3 - x_0), x_3^2 (x_3 - x_0)) arrow.r mat(delim: "(", 1, 0, 0, 0; 1, x_1 - x_0, x_1 (x_1 - x_0), x_1^2 (x_1 - x_0); 1, x_2 - x_0, x_2 (x_2 - x_0), x_2^2 (x_2 - x_0); 1, x_3 - x_0, x_3 (x_3 - x_0), x_3^2 (x_3 - x_0)) $

$ arrow.r mat(delim: "(", 1, 0, 0, 0; 1, x_1 - x_0, x_1 (x_1 - x_0), 0; 1, x_2 - x_0, x_2 (x_2 - x_0), x_2 (x_2 - x_1) (x_2 - x_0); 1, x_3 - x_0, x_3 (x_3 - x_0), x_3 (x_3 - x_1) (x_3 - x_0)) $

$ arrow.r mat(delim: "(", 1, 0, 0, 0; 1, x_1 - x_0, 0, 0; 1, x_2 - x_0, (x_2 - x_1) (x_2 - x_0), x_2 (x_2 - x_1) (x_2 - x_0); 1, x_3 - x_0, (x_3 - x_1) (x_3 - x_0), x_3 (x_3 - x_1) (x_3 - x_0)) , $

$ arrow.r mat(delim: "(", 1, 0, 0, 0; 1, x_1 - x_0, 0, 0; 1, x_2 - x_0, (x_2 - x_1) (x_2 - x_0), 0; 1, x_3 - x_0, (x_3 - x_1) (x_3 - x_0), (x_3 - x_2) (x_3 - x_1) (x_3 - x_0)) . $

The corresponding upper triangular part of the LU decomposition of the Vandermonde matrix reads

$ &mat(delim: "(", 1, - x_0, , ; #none, 1, - x_0, ; #none, , 1, - x_0; #none, , , 1) mat(delim: "(", 1, , , ; #none, , , ; #none, 1, - x_1, ; #none, , 1, - x_1; #none, , , 1) mat(delim: "(", 1, , , ; #none, 1, , ; #none, , 1, - x_2; #none, , , 1) \
= & mat(delim: "(", 1, - x_0, x_0 x_1, - x_0 x_1 x_2; #none, 1, - x_0 - x_1, x_0 x_1 + x_1 x_2 + x_2 x_0; #none, , 1, - x_0 - x_1 - x_2; #none, , , 1) . $

However it is not straightforward to see the coefficients ${a_i}_(i = 0)^n$ and the entries of the row vector $upright(bold(x))^(upright(T)) upright(bold(A))^(- 1)$ . In practice, we want to avoid this approach.

== Lagrange form of the polynomial
<lagrange-form-of-the-polynomial>
In the next, we will introduce another approach, which computes the interpolating polynomial $p_n (x)$ as a linear combination of a set of interpolating basis polynomials.

At each point $x_i$ , we associate an interpolating basis polynomial $ell_i (x)$ of degree $n$ which satisfies

the conditions

$ ell_i (x_j) = delta_(i , j) =
cases(
1 & "if" & j = i\
0 & "if" & j eq.not i .
)
$

By the conditions above, we see $x_0 , dots.h.c , x_(i - 1) , x_(i + 1) , dots.h.c , x_n$ are $n$ roots of $ell_i (x)$ . The basis polynomial $ell_i (x)$ must have the form

$ ell_i (x) = c_i product_(j eq.not i) (x - x_j) . $

The coefficient $c_i$ is determined by the property $ell_i (x_i) = 1$ . This implies

$ c_i = frac(1, product_(j eq.not i) (x_i - x_j)) . $

The interpolating basis polynomial $ell_i (x)$ reads

$ ell_i (x) = frac(product_(j eq.not i) (x - x_j), product_(j eq.not i) (x_i - x_j)) = product_(j eq.not i) frac(x - x_j, x_i - x_j) . $

In terms of the interpolating basis polynomials ${ell_i (x)}_(i = 0)^n$ , the interpolating polynomial $p_n (x)$ can be computed by

$ p_n (x) = sum_(i = 0)^n f (x_i) ell_i (x) . $<eq:4>

The interpolating basis polynomials ${ell_i (x)}_(i = 0)^n$ are called Lagrange interpolants. The interpolation in the form of (@eq:4) is the so-called Lagrange interpolation.

== Barycentric Formula
<barycentric-formula>
Let

$ omega_(n + 1) (x) = product_(k = 0)^n (x - x_k) $

be the nodal polynomial. We may rewrite the interpolating basis polynomial as

$ ell_i (x) = frac(omega_(n + 1) (x), (x - x_i) omega_(n + 1)^(') (x_i)) $

with

$ omega_(n + 1)^(') (x_i) = product_(k eq.not i)^n (x_i - x_k) . $

The Lagrange polynomial reads

$ p_n (x) = sum_(i = 0)^n frac(f (x_i) omega_(n + 1) (x), omega_(n + 1)^(') (x_i) (x - x_i)) $

or

$ p_n (x) = omega_(n + 1) (x) sum_(i = 0)^n frac(f (x_i), omega_(n + 1)^(') (x_i) (x - x_i)) = omega_(n + 1) (x) sum_(i = 0)^n frac(rho_i f (x_i), x - x_i) , $<eq:5>

which is called the first form of the barycentric interpolation formula. Here,

$ rho_i = frac(1, omega_(n + 1)^(') (x_i)) , quad "for" i = 0 , 1 , 2 , dots.h.c , n , $

are called the bacycentric weights.

From the barycentric interpolation formula, we see that the coefficient $a_n$ of the $x^n$ term in the Lagrange polynomial reads

$ a_n = sum_(i = 0)^n frac(f (x_i), omega_(n + 1)^(') (x_i)) , $

which is often denoted by

$ f [x_0 , x_1 , dots.h.c , x_n] = sum_(i = 0)^n frac(f (x_i), omega_(n + 1)^(') (x_i)) . $<eq:6>

The leading coefficient is permutation invariant.

In the first form of the barycentric interpolation formula, the computation of the $(n + 1)$ bacycentric weights requires $O (n^2)$ operations; for every $x$ only $O (n)$ operations are needed for the polynomial evaluation. If a new pair of data $(x_(n + 1) , f (x_(n + 1)))$ is added, $O (n)$ operations are required:

- for $i = 0 , 1 , 2 , dots.h.c , n$ , divide each barycentric weight $rho_i$ by $x_i - x_(n + 1)$ for a cost of $(n + 1)$ operations;

- computing the bacycentric weight $rho_(n + 1)$ by the formula requires $(n + 1)$ further operations.

The barycentric form (@eq:5) is often modified in practice. Note that

$ 1 = omega_(n + 1) (x) sum_(i = 0)^n frac(rho_i, x - x_i) , $<eq:7>

which comes from the interpolation when the function $f (x)$ is idencially equal to one. Dividing (@eq:5) by (@eq:7), we can cancel the common factor $omega_(n + 1) (x)$ to obtain the second form of the bacycentric interpolation formula,

$ p_n (x) = frac(sum_(i = 0)^n frac(rho_i f (x_i), x - x_i), sum_(i = 0)^n frac(rho_i, x - x_i)) . $<eq:8>

The barycentric interpolation formula is more stable than the Lagrange interpolation formula. Even when $x approx x_i$ for some index $i$ , the quantity $rho_i \/ (x - x_i)$ is very large, this is not a problem for the

barycentric interpolation formula since the same inaccurate number appears in both numberator and denominator.

For special sets of nodes ${x_i}$ , one can get explicit formula for the barycentric weights $rho_i$ . In particular, for equidistant nodes with spacing $h = 2 \/ n$ on the interval $[- 1 , 1]$ , we have

$ rho_i = (- 1)^(n - i) vec(n, i) \/ (h^n n !) = (- 1)^i vec(n, i) . $

For a generic interval $[a , b]$ , the weights should be multplied by $2^n (b - a)^(- n)$ .

== Error estimate
<error-estimate>
#prp[
Suppose that $f (x)$ is a $C^(n + 1) [a , b]$ function. We have the error estimate for the

Lagrange interpolation

$ f (x) - p_n (x) = frac(f^((n + 1)) (xi), (n + 1) !) omega_(n + 1) (x) $<eq:9>

for some $xi in [a , b]$ .
]

#prf[
Let

$ R (x) = f (x) - p_n (x) $

be the remainder.

For $x in.not {x_0 , x_1 , dots.h.c , x_n}$ , let

$ phi (t) = R (t) - frac(omega_(n + 1) (t), omega_(n + 1) (x)) R (x) . $

It vanishes at $(n + 2)$ points, $x_0 , x_1 , dots.h.c , x_n$ and $x$ . Its first order derivative has $(n + 1)$ roots on $[a , b]$ by the Rolle thorem. Its second order derivative has $n$ roots on $[a , b]$ . Its $(n + 1)^(t h)$ order derivative has one zero on $[a , b]$ . That is, there exists $xi in [a , b]$ such that

$ 0 = phi^((n + 1)) (xi) = R^((n + 1)) (xi) - frac((n + 1) !, omega_(n + 1) (x)) R (x) = f^((n + 1)) (xi) - frac((n + 1) !, omega_(n + 1) (x)) R (x) . $

So we have the estimate for the remainder

$ R (x) = frac(f^((n + 1)) (xi), (n + 1) !) omega_(n + 1) (x) . $
]

#cor[
Assume that

$ a lt.eq x_0 < x_1 < dots.h.c < x_(n - 1) < x_n lt.eq b . $

Let $h = max_(0 lt.eq i < n) abs(x_(i + 1) - x_i)$ . We have

$ max_(a lt.eq x lt.eq b) abs(f (x) - p_n (x)) lt.eq frac(h^(n + 1), 4 (n + 1)) norm(f^((n + 1)))_oo . $
]

#prf[
We will give an upper bound for $omega_(n + 1) (x) = product_(i = 0)^n (x - x_i)$ . For any $x in [a , b]$ , let $k$ be the integer such that

$ x_k lt.eq x < x_(k + 1) . $

First we have

$ abs((x - x_k) (x - x_(k + 1))) lt.eq 1 / 4 abs(x_(k + 1) - x_k)^2 lt.eq 1 / 4 h^2 . $

For the product of other terms, we have

$ abs(product_(i = 0)^(i = k - 1) (x - x_i)) lt.eq h^k product_(i = 0)^(i = k - 1) (k + 1 - i) = h^k (k + 1) ! $

and

$ abs(product_(i = k + 2)^(i = n) (x - x_i)) lt.eq h^(n - k - 1) product_(i = k + 2)^(i = n) (i - k) = h^(n - k - 1) (n - k) ! . $

Putting all factors together, we get

$ abs(omega_(n + 1) (x)) lt.eq 1 / 4 h^(n + 1) (k + 1) ! (n - k) ! lt.eq 1 / 4 h^(n + 1) n ! . $

By the previous proposition, we finally obtain

$ abs(f (x) - p_n (x)) lt.eq frac(h^(n + 1), 4 (n + 1)) norm(f^((n + 1)))_oo #h(0em) forall x in [a , b] . $
]

#exr[
Assume $f (x)$ is a twice continuously differentiable function on the closed interval $[a , b]$ . Let

$ p_1 (x) = frac(b - x, b - a) f (a) + frac(x - a, b - a) f (b) $

be the interpolant of $f (x)$ at the endpoints. Show that

$ norm(f - p_1)_oo lt.eq (b - a)^2 / 8 norm(f^(''))_oo . $
]

== Rounding error analysis for linear interpolation
<rounding-error-analysis-for-linear-interpolation>
Let $f_a$ and $f_b$ be respectively approximations of $f (a)$ and $f (b)$ . Assume $epsilon.alt_a = f (a) - f_a$ and $epsilon.alt_b = f (b) - f_b$ are the computer round-off (rounding errors) with

$ abs(epsilon.alt_a) , abs(epsilon.alt_b) lt.eq epsilon.alt $

We will get an estimate for the interpolation error

$ e (x) = f (x) - q_1 (x) $

with

$ q_1 (x) = frac((x_b - x) f_a + (x - x_a) f_b, b - a) quad "for" x in [a , b] . $

The interpolation error can be computed by

$ e (x) = f (x) - frac((b - x) f (a) + (x - a) f (b), b - a) $

$ + frac((b - x) epsilon.alt_a + (x - a) epsilon.alt_b, b - a) equiv E (x) + R (x) , $

with

$ E (x) = frac((x - a) (x - b), 2) f^('') (xi) , quad "for" xi in [a , b] $

and

$ R (x) = frac((b - x) epsilon.alt_a + (x - a) epsilon.alt_b, b - a) . $

Note that

$ max_(a lt.eq x lt.eq b) abs(R (x)) = max {abs(epsilon.alt_a) , abs(epsilon.alt_b)} lt.eq epsilon.alt . $

So we have the estimate for the linear interpolation,

$ abs(e (x)) lt.eq (b - a)^2 / 8 max_(a lt.eq t lt.eq b) abs(f^('') (t)) + max {abs(epsilon.alt_a) , abs(epsilon.alt_b)} . $
