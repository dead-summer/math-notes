#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#show figure.where(
  kind: table
): set figure.caption(position: top)
#show figure.where(
  kind: table
): set block(breakable: true)

#counter(figure).update(1)

#counter(heading).update(2)
#set heading(numbering: "1.1.1")

// 上一节编号到 11
#counter(math.equation).update(11)

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

= The Hermite interpolation
<the-hermite-interpolation>
Sometimes we know not just the values of a function but also its derivatives at a set of discrete points. We want to use the known values and derivatives to approximately recover or interpolate the function. The corresponding polynomial interpolation is the so-called Hermite interpolation.

Once again, assume ${x_i}_(i = 0)^n$ is a set of distinct points. Let $f (x)$ be a smooth function. We look for a polynomial $p (x)$ such that

$ p (x_i) = f (x_i) #h(0em) upright(" and ") #h(0em) p^(') (x_i) = f^(') (x_i) #h(0em) i = 0 , 1 , dots.h.c , n . $

Since we have totally $2 (n + 1)$ equations, the degree of the polynomial $p (x)$ is at most $2 n + 1$ . As before, we may assume the polynomial has the form

$ p (x) = a_0 + a_1 x + a_2 x^2 + dots.h.c + a_(2 n + 1) x^(2 n + 1) $

and determine the coefficients ${a_j}_(j = 0)^(2 n + 1)$ by solving the system of $(2 n + 2)$ equations. However, the solution of the $(2 n + 2)$ by $(2 n + 2)$ system is in general very expensive if it is solved without taking the special structure of the coefficient matrix. We want to avoid directly solving it.

As the Lagrange interpolation, we may alternatively compute the interpolating polynomial with basis polynomials. Let $alpha_i (x)$ and $beta_i (x)$ be the basis polynomials satisfying

$ alpha_i (x_j) = delta_(i , j) , #h(0em) alpha_i^(') (x_j) = 0 $<eq:12>

and

$ beta_i (x_j) = 0 , #h(0em) beta_i^(') (x_j) = delta_(i , j) . $<eq:13>

In terms of the basis polynomials, the interpolating polynomial $p (x)$ reads

$ p (x) = sum_(i = 0)^n [alpha_i (x) f (x_i) + beta_i (x) f^(') (x_i)] . $

In the next, we determine the basis polynomials $alpha_i (x)$ and $beta_i (x)$ , whose degrees are not greater than $2 n + 1$ . First of all, for a fixed $i in { 0 , 1 , dots.h.c , n }$ , each $x_j$ with $j eq.not i$ is a double root of $alpha_i (x)$ and $beta_i (x)$ . So the basis polynomials must have the form

$ alpha_i (x) = (alpha_i^((0)) + alpha_i^((1)) x) product_(j eq.not i) (x - x_j)^2 $

and

$ beta_i (x) = (beta_i^((0)) + beta_i^((1)) x) product_(j eq.not i) (x - x_j)^2 . $

Without loss of generality, we may even assume

$ alpha_i (x) = (tilde(alpha)_i^((0)) + tilde(alpha)_i^((1)) x) ell_i^2 (x) $

and

$ beta_i (x) = (tilde(beta)_i^((0)) + tilde(beta)_i^((1)) x) ell_i^2 (x) . $

Here,

$ ell_i (x) = frac(omega_(n + 1) (x), omega_(n + 1)^(') (x_i) (x - x_i)) = product_(j eq.not i) frac(x - x_j, x_i - x_j) $

is the $i^(upright("th "))$ Lagrange basis polynomial. By the interpolation properties (@eq:12)-(@eq:13), we can easily get the values of the coefficients $tilde(alpha)_i^((0)) , tilde(alpha)_i^((1)) , tilde(beta)_i^((0))$ and $tilde(beta)_i^((1))$ . The basis polynomials $alpha_i (x)$ and $beta_i (x)$ are explicitly given by

$ alpha_i (x) = [1 - 2 ell_i^(') (x_i) (x - x_i)] ell_i^2 (x) $

and

$ beta_i (x) = (x - x_i) ell_i^2 (x) . $

== The divided differences
<the-divided-differences>
As the Lagrange interpolation, we may also contruct the Hermite polynomial incrementally and finally write it in terms of the Newton divided differences

$ p_(2 n + 1) (x) =& f [x_0] + f [x_0 , x_0] (x - x_0) + f [x_0 , x_0 , x_1] (x - x_0)^2 \
&+ f [x_0 , x_0 , x_1 , x_1] (x - x_0)^2 (x - x_1) + dots.h.c \
&+ f [x_0 , x_0 , dots.h.c , x_n , x_n] (x - x_0)^2 dots.h.c (x - x_(n - 1))^2 (x - x_n) . $

Here, $f [x_0 , x_0] = f^(') (x_0)$ is defined as

$ f [x_0 , x_0] eq.def lim_(h arrow.r 0) f [x_0 - h , x_0 + h] = lim_(h arrow.r 0) frac(f (x_0 + h) - f (x_0 - h), 2 h) = f^(') (x_0) . $

In the next, we illustrate why the coefficients in the incremental form of the Hermite polynomial equal the Newton divided differences for $n = 1$ . We assume

$ p_3 (x) = gamma_0 + gamma_1 (x - x_0) + gamma_2 (x - x_0)^2 + gamma_3 (x - x_0)^2 (x - x_1) . $

Evaluating the polynomial and its first-order derivative at the points $x_0$ and $x_1$ , we get

$ p_3 (x_0) &= gamma_0 = f [x_0] , \
p_3^(') (x_0) &= gamma_1 = f [x_0 , x_0] , \
p_3 (x_1) &= gamma_1 (x_1 - x_0) + gamma_2 (x_1 - x_0)^2 = f [x_1] , \
p_3^(') (x_1) &= gamma_1 + 2 gamma_2 (x_1 - x_0) + gamma_3 (x_1 - x_0)^2 = f [x_1 , x_1] . $

$ mat(delim: "(", 1, , , , ; #none, 1, , , ; 1, x_1 - x_0, (x_1 - x_0)^2, , ; #none, 1, 2 (x_1 - x_0), (x_1 - x_0)^2, ) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_0], f [x_1], f [x_1 , x_1]) . $

$ mat(delim: "(", 1, , , ; #none, 1, , ; #none, 1, (x_1 - x_0), ; #none, 1, 2 (x_1 - x_0), (x_1 - x_0)^2) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_0], f [x_0 , x_1], f [x_1 , x_1]) . $

Here,

$ f [x_0 , x_1] = frac(f [x_1] - f [x_0], x_1 - x_0) $

$ mat(delim: "(", 1, , , ; #none, 1, , ; #none, 1, (x_1 - x_0), ; #none, , 1, (x_1 - x_0)) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_0], f [x_0 , x_1], f [x_0 , x_1], f [x_0 , x_1 , x_1]) . $

Here,

$ f [x_0 , x_1 , x_1] = frac(f [x_1 , x_1] - f [x_0 , x_1], x_1 - x_0) $

$ mat(delim: "(", 1, , , ; #none, 1, , ; #none, , 1, ; #none, , 1, (x_1 - x_0)) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_0], f [x_0 , x_0 , x_1], f [x_0 , x_1 , x_1]) . $

Here,

$ f [x_0 , x_0 , x_1] = frac(f [x_0 , x_1] - f [x_0 , x_0], x_1 - x_0) $

$ mat(delim: "(", 1, , , ; #none, 1, , ; #none, , 1, ; #none, , , 1) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_0], f [x_0 , x_0 , x_1], f [x_0 , x_0 , x_1 , x_1]) . $

$ f [x_0 , x_0 , x_1 , x_1] = frac(f [x_0 , x_1 , x_1] - f [x_0 , x_0 , x_1], x_1 - x_0) . $

For general $n > 1$ , we can compute the coefficients ${gamma_i}$ by the same process.

#figure(
  align(center)[
    #set text(10pt)
    #table(
    columns: 7,
    [$x_0$], [$f[x_0]$], [$f[x_0, x_0]$], [$f[x_0, x_0, x_1]$], [$f[x_0, x_0, x_1, x_1]$], [$f[x_0, x_0, x_1, x_1, x_2]$], [$f[x_0, x_0, x_1, x_1, x_2, x_2]$],
    [$x_0$], [$f[x_0]$], [$f[x_0, x_1]$], [$f[x_0, x_1, x_1]$], [$f[x_0, x_1, x_1, x_2]$], [$[x_0, x_1, x_1, x_2, x_2]$], [],
    [$x_1$], [$f[x_1]$], [$f[x_1, x_1]$], [$f[x_1, x_1, x_2]$], [$f[x_1, x_1, x_2, x_2]$], [], [],
    [$x_1$], [$f[x_1]$], [$f[x_1, x_2]$], [$f[x_1, x_2, x_2]$], [], [], [],
    [$x_2$], [$f[x_2]$], [$f[x_2, x_2]$], [], [], [], [],
    [$x_2$], [$f[x_2]$],
  )]
  , kind: table,
  caption: [Newton divided difference table for the Hermite interpolation]
)

#figure(
  align(center)[
    #set text(10.8pt)
    #table(
    columns: 7,
    [$x_0$], $f[x_0]$, [$f[x_0, x_0]$], [$f[x_0, x_0, x_1]$], [$f[x_0, ..., x_1]$], [...], [$[x_0, ..., x_2]$],
    [$x_0 + h_0$], [$f[x_0]+f'(x_0)h_0$], [$f[x_0, x_1]$], [$f[x_0, x_1, x_1]$], [$f[x_0, ..., x_2]$], [$f[x_0, ..., x_2]$], [],
    [$x_1$], [$f[x_1]$], [$f[x_1, x_1]$], [$f[x_1, x_1, x_2]$], [$f[x_1, ..., x_2]$], [], [],
    [$x_1 + h_1$], [$f[x_1, f'(x_1)h_1]$], [$f[x_1, x_2]$], [$f[x_1, x_2, x_3]$], [], [], [],
    [$x_2$], [$f[x_2]$], [$f[x_2, x_2]$], [], [], [], [],
    [$x_2 + h_2$], [$f[x_2] + f'(x_2)h_1$]
  )]
  , kind: table,
  caption: [Newton divided difference table for the Hermite interpolation]
)

#exm[
$ f (0) = 0 , #h(0em) f^(') (0) = 1 , #h(0em) f (1) = 0 #h(0em) upright(" and ") #h(0em) f^(') (1) = 0 . $

]

== Error estimate
<error-estimate>
As the Lagrange interpolation, we have a similar error estimate for the Hermite interpolation

$ E_(2 n + 1) (x) = f (x) - p_(2 n + 1) (x) = f [x_0 , x_0 , dots.h.c , x_n , x_n , x] omega_(n + 1)^2 (x) = frac(f^((2 n + 2)) (xi), (2 n + 2) !) omega_(n + 1)^2 (x) . $

Here, $omega_(n + 1) (x) = (x - x_0) (x - x_1) dots.h.c (x - x_n)$ .

In particular, for $n = 1$ , we have the Hermite polynomial

$ p_3 (x) = f (x_0) + f [x_0 , x_0] (x - x_0) + f [x_0 , x_0 , x_1] (x - x_0)^2 $

$ + f [x_0 , x_0 , x_1 , x_1] (x - x_0)^2 (x - x_1) , $

and the corresponding interpolation error

$ E_3 (x) &= f (x) - p_3 (x) \
&= f [x_0 , x_0 , x_1 , x_1 , x] (x - x_0)^2 (x - x_1)^2 \
&= frac(f^((4)) (xi), 4 !) (x - x_0)^2 (x - x_1)^2 $

for some $xi in [x_0 , x_1]$ . Moreoever,

$ abs(f (x) - p_3 (x)) lt.eq 1 / 384 (x_1 - x_0)^4 max_(x_0 lt.eq t lt.eq x_1) abs(f^((4)) (t)) . $
