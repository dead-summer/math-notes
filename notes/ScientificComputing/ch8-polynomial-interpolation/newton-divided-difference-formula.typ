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

#counter(heading).update(1)
#set heading(numbering: "1.1.1")

// 上一节编号到 9
#counter(math.equation).update(9)

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

= Newton divided difference formula
<newton-divided-difference-formula>
The interpolation polynomial $p_k (x)$ can be constructed incrementally for $k = 0 , 1 , 2 , dots.h.c , n$ . Note that the difference between two consecutive polynomials $p_(k - 1) (x)$ and $p_k (x)$ is a polynomial of degree not great than $k$ . Let

$ q_k (x) eq.def p_k (x) - p_(k - 1) (x) $

be the polynomial. The polynomial $q_k (x)$ has the same highest degree term as $p_k (x)$ .

It is obvious that the points ${x_i}_(i = 0)^(k - 1)$ are $k$ distinct roots of the polynomial $q_k (x)$ since

$ q_k (x_i) = p_k (x_i) - p_(k - 1) (x_i) = f (x_i) - f (x_i) = 0 quad "for" i = 0 , 1 , dots.h.c , k - 1 . $

From this, we see $q_k (x)$ has the form

$ q_k (x) = a_k (x - x_0) (x - x_1) dots.h.c (x - x_(k - 1)) = f [x_0 , x_1 , dots.h.c , x_k] omega_k (x) $

with

$ omega_k (x) = (x - x_0) (x - x_1) dots.h.c (x - x_(k - 1)) . $

Let $p_(- 1) (x) = 0$ . We may write the polynomial $p_n (x)$ as

$ p_n (x) = sum_(k = 0)^n [p_k (x) - p_(k - 1) (x)] = sum_(k = 0)^n q_k (x) = sum_(k = 0)^n f [x_0 , dots.h.c , x_k] omega_k (x) , $<eq:10>

or

$ p_n (x) &= p_(n - 1) (x) + f [x_0 , dots.h.c , x_n] omega_n (x) \
&= p_(n - 2) (x) + f [x_0 , dots.h.c , x_(n - 1)] omega_(n - 1) (x) + f [x_0 , dots.h.c , x_n] omega_n (x) \
&= p_(n - 3) (x) + f [x_0 , dots.h.c , x_(n - 2)] omega_(n - 2) (x) + f [x_0 , dots.h.c , x_(n - 1)] omega_(n - 1) (x) + f [x_0 , dots.h.c , x_n] omega_n (x) \
&dots.v \
&= p_0 (x) + f [x_0 , x_1] omega_1 (x) + dots.h.c + f [x_0 , dots.h.c , x_(n - 1)] omega_(n - 1) (x) + f [x_0 , dots.h.c , x_n] omega_n (x) , $

i.e.,

$ p_n (x) =& f [x_0] + f [x_0 , x_1] (x - x_0) + f [x_0 , x_1 , x_2] (x - x_0) (x - x_1) \
&+ f [x_0 , x_1 , x_2 , x_3] (x - x_0) (x - x_1) (x - x_2) + f [x_0 , dots.h.c , x_4] (x - x_0) dots.h.c (x - x_3) \
&+ dots.h.c + f [x_0 , x_1 , dots.h.c , x_n] (x - x_0) (x - x_1) dots.h.c (x - x_(n - 1)) . $

In the next, we will prove that

$ f [x_0 , dots.h.c , x_k] = frac(f [x_0 , dots.h.c , x_(k - 1)] - f [x_1 , dots.h.c , x_k], x_0 - x_k) . $

Let $p_(1 , dots.h.c , k) (x) = p [x_1 , x_2 , dots.h.c , x_k] (x)$ be the polynomial of degree at most $(k - 1)$ that interpolates $f (x)$ at nodes $x_1 , x_2 , dots.h.c , x_k$ , i.e., satisfying

$ p [x_1 , x_2 , dots.h.c , x_k] (x_i) = f (x_i) quad "for" i = 1 , 2 , dots.h.c , k . $

The coefficient of the $x^(k - 1)$ term in the polynomial reads

$ f [x_1 , x_2 , dots.h.c , x_k] . $

It is easy to verify that

$ p_(0 dots.h.c k) (x) = frac(x - x_k, x_0 - x_k) p_(0 , dots.h.c , k - 1) (x) + frac(x_0 - x, x_0 - x_k) p_(1 , dots.h.c , k) (x) $

Equating the coefficients of the $x^k$ terms yields

$ f [x_0 , dots.h.c , x_k] = frac(f [x_0 , dots.h.c , x_(k - 1)] - f [x_1 , dots.h.c , x_k], x_0 - x_k) , $

or

$ f [x_0 , dots.h.c , x_k] = frac(f [x_1 , dots.h.c , x_k] - f [x_0 , dots.h.c , x_(k - 1)], x_k - x_0) . $

#figure(
  align(center)[
    // #set text(10pt)
    #table(
      columns: 6,
      align: (auto,auto,auto,auto,auto,auto,),
      [$x_0$], [$f\[x_0\]$], [$f\[x_0, x_1\]$], [$f\[x_0, x_1, x_2\]$], [$f\[x_0, x_1, x_2, x_3\]$], [$f\[x_0, x_1, x_2, x_3, x_4\]$],
      [$x_1$], [$f\[x_1\]$], [$f\[x_1, x_2\]$], [$f\[x_1, x_2, x_3\]$], [$f\[x_1, x_2, x_3, x_4\]$], [],
      [$x_2$], [$f\[x_2\]$], [$f\[x_2, x_3\]$], [$f\[x_2, x_3, x_4\]$], [], [],
      [$x_3$], [$f\[x_3\]$], [$f\[x_3, x_4\]$], [], [], [],
      [$x_4$], [$f\[x_4\]$], [], [], [], [],
  )]
  , kind: table,
  caption: [Newton divided difference table for the Lagrange interpolation]
)

== Horner's rule for evaluating the polynomial

Once we have the Newton divided differences as the coeffients of the polynomial (@eq:10), we evaluate the polynomial by Horner's rule.

Let

$ z_k = x_(n - k) , $

$ b_k = a_(n - k) . $

The interpolating polynomial can be rewritten as

$ p_n (x) = b_n + b_(n - 1) (x - z_n) + b_(n - 2) (x - z_n) (x - z_(n - 1)) + dots.h.c + b_0 product_(j = 0)^(n - 1) (x - z_(n - j)) . $

Let $q_0 = b_0 = a_n$ . For $k = 1 , 2 , dots.h.c , n$ , let

$ q_k (x) = b_k + b_(k - 1) (x - z_k) + b_(k - 2) (x - z_k) (x - z_(k - 1)) + dots.h.c + b_0 product_(j = 0)^(k - 1) (x - z_(k - j)) . $

We have

$ q_k (x) = b_k + (x - z_k) q_(k - 1) (x) , quad "for" k = 1 , 2 , dots.h.c , n . $

== Horner's rule for polynomial derivatives
<horners-rule-for-polynomial-derivatives>
One can similarly compute derivatives of the interpolation polynomial using the Newton divided differences.

Let $q_k^(') = q_k^(') (x) , q_k^('') = q_k^('') (x)$ and $q_k^(''') = q_k^(''') (x)$ be respectively the first-order, second-order and third-order derivatives of the interpolation polynomial $q_k (x)$ .

Assume $q_0 = a_n , q_0^(') = 0 , q_0^('') = 0 , q_0^(''') = 0$ . For $k = 1 , 2 , dots.h.c , n - 1 , n$ , do

$ q_k^(''') = 3 q_(k - 1)^('') + (x - x_(n - k)) q_(k - 1)^(''') , $

$ q_k^('') = 2 q_(k - 1)^(') + (x - x_(n - k)) q_(k - 1)^('') , $

$ q_k^(') = q_(k - 1) + (x - x_(n - k)) q_(k - 1)^(') , $

$ q_k = a_(n - k) + (x - x_(n - k)) q_(k - 1) . $

== Alternative approach for the Newton divided differences
<alternative-approach-for-the-newton-divided-differences>
An alternative approach for determining the coefficients in the Newton polynomial,

$ p_n (x) = gamma_0 + gamma_1 (x - x_0) + dots.h.c + gamma_n (x - x_0) (x - x_1) dots.h.c (x - x_(n - 1)) . $

We write the interpolation conditions

$ p_n (x_i) = f (x_i) quad "for" i = 0 , 1 , dots.h.c , n $

in the matrix-vector form

$ mat(delim: "(", 1, , , , , ; 1, x_1 - x_0, , , , ; 1, x_2 - x_0, (x_2 - x_0) (x_2 - x_1), , , ; dots.v, dots.v, dots.v, dots.down, , ; 1, x_n - x_0, (x_n - x_0) (x_n - x_1), dots.h.c, product_(i = 0)^(n - 1) (x_n - x_i), ) vec(gamma_0, gamma_1, gamma_2, dots.v, gamma_n) = vec(f (x_0), f (x_1), f (x_2), dots.v, f (x_n)) . $

Forward substitution may lead to the formula for the coefficients ${gamma_i}_(i = 0)^n$ .

For example, for $n = 3$ , since

$ p_3 (x) = gamma_0 + gamma_1 (x - x_0) + gamma_2 (x - x_0) (x - x_1) + gamma_3 (x - x_0) (x - x_1) (x - x_2) , $

from the interpolation conditions,

$ mat(delim: "(", 1, , , , , ; 1, x_1 - x_0, , , , ; 1, x_2 - x_0, (x_2 - x_0) (x_2 - x_1), , , ; 1, x_3 - x_0, (x_3 - x_0) (x_3 - x_1), (x_3 - x_0) (x_3 - x_1) (x_3 - x_2), , ) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_1], f [x_2], f [x_3]) , $

we get

$ mat(delim: "(", 1, , , , ; 1, x_1 - x_0, , , ; 1, x_2 - x_0, (x_2 - x_0) (x_2 - x_1), , ; #none, 1, (x_3 - x_1) + (x_2 - x_0), (x_3 - x_0) (x_3 - x_1)) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_1], f [x_2], f [x_2 , x_3]) , $

$ mat(delim: "(", 1, , , , ; 1, x_1 - x_0, , , ; #none, 1, (x_2 - x_0), , ; #none, 1, (x_3 - x_1) + (x_2 - x_0), (x_3 - x_0) (x_3 - x_1), ) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_1], f [x_1 , x_2], f [x_2 , x_3]) , $

$ mat(delim: "(", 1, , , , ; #none, 1, , , ; #none, 1, (x_2 - x_0), , ; #none, 1, (x_3 - x_1) + (x_2 - x_0), (x_3 - x_0) (x_3 - x_1),) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_1], f [x_1 , x_2], f [x_2 , x_3]) , $

$ mat(delim: "(", 1, , , ; #none, 1, , ; #none, 1, (x_2 - x_0), ; #none, , 1, (x_3 - x_0)) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_1], f [x_1 , x_2], f [x_1 , x_2] , f [x_1 , x_2 , x_3]) , $

$ mat(delim: "(", 1, , , ; #none, 1, , ; #none, , 1, ; #none, , 1, (x_3 - x_0), ) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_1], f [x_0 , x_1 , x_2], f [x_1 , x_2 , x_3]) $

and

$ mat(delim: "(", 1, , , ; #none, 1, , ; #none, , 1, ; #none, , , 1) vec(gamma_0, gamma_1, gamma_2, gamma_3) = vec(f [x_0], f [x_0 , x_1], f [x_0 , x_1 , x_2], f [x_0 , x_1 , x_2 , x_3]) . $

== Interpolation error using divided differences
<interpolation-error-using-divided-differences>
Let $p_n (x)$ be the interpolating polynomial of $f (x)$ on the nodes $x_0 , x_1 , dots.h.c , x_n$ ,

$ p_n (x) = sum_(k = 0)^n f [x_0 , dots.h.c , x_k] omega_k (x) , $

i.e.,

$ p_n (x) =& f [x_0] + f [x_0 , x_1] (x - x_0) + f [x_0 , x_1 , x_2] (x - x_0) (x - x_1) \
&+ f [x_0 , x_1 , x_2 , x_3] (x - x_0) (x - x_1) (x - x_2) + f [x_0 , dots.h.c , x_4] (x - x_0) dots.h.c (x - x_3) \
&+ dots.h.c + f [x_0 , x_1 , dots.h.c , x_n] (x - x_0) (x - x_1) dots.h.c (x - x_(n - 1)) . $

Let $x$ be a node distinct from the nodes ${x_i}$ . Assume $x_(n + 1) = x$ . we denote by $p_(n + 1) (x)$ the interpolating polynomial of $f (x)$ at the nodes $x_0 , x_1 , dots.h.c , x_n$ and $x_(n + 1)$ . Using the Newton divided differences, we get

$ p_(n + 1) (t) = p_n (t) + f [x_0 , x_1 , dots.h.c , x_n , x] (t - x_0) (t - x_1) dots.h.c (t - x_n) . $

Since $p_(n + 1) (x) = f (x)$ , we obtain the following formula for the interpolation error,

$ E_n (x) &= f (x) - p_n (x) = p_(n + 1) (x) - p_n (x) \
&= f [x_0 , x_1 , dots.h.c , x_n , x] (x - x_0) (x - x_1) dots.h.c (x - x_n) \
&= f [x_0 , x_1 , dots.h.c , x_n , x] w_(n + 1) (x) . $<eq:11>

Assuming $f (x) in C^(n + 1) [a , b]$ and comparing (9) with (@eq:11), we get

$ f [x_0 , x_1 , dots.h.c , x_n , x] = frac(f^((n + 1)) (xi), (n + 1) !) $

for some $xi in [a , b]$ .

== Properties of divided differences
<properties-of-divided-differences>
In addition to the property above, which alternatively states that if $f in C^n [a , b] , x_0 , x_1 , dots.h.c , x_n in [a , b]$ , then

$ f [x_0 , x_1 , dots.h.c , x_n] = frac(f^((n)) (xi), n !) $

for some $xi in [a , b]$ , the divided difference has the following properties.

#prp[
Suppose that $f$ is $n$ times continuously differentiable around $x$ . Then we can compute the $n^(upright("th "))$ -order divided difference by

$ f [x , x , dots.h.c , x] = frac(1, n !) f^((n)) (x) . $
]

#prp[
Suppose $f in C^(n + 2) [a , b]$ and $x_0 , x_1 , dots.h.c , x_n , x in [a , b]$ . We have

$ frac(d, d x) f [x_0 , x_1 , dots.h.c , x_n , x] = f [x_0 , x_1 , dots.h.c , x_n , x , x] . $
]

#prf[
$ & frac(dif, dif x) f [x_0 , x_1 , dots.h.c , x_n , x] \
=& lim_(h arrow.r 0) frac(f [x_0 , x_1 , dots.h.c , x_n , x + h] - f [x_0 , x_1 , dots.h.c , x_n , x], h) \
=& lim_(h arrow.r 0) frac(f [x_0 , x_1 , dots.h.c , x_n , x + h] - f [x_0 , x_1 , dots.h.c , x_n , x], (x + h) - x) \
=& lim_(h arrow.r 0) f [x_0 , x_1 , dots.h.c , x_n , x , x + h] \
=& f [x_0 , x_1 , dots.h.c , x_n , x , x] . $

The last step in the proof uses the fact that the divided difference $f [x_0 , x_1 , dots.h.c , x_n]$ is continuous with respect to any one of the nodes ${x_j}$ . It can be readily observed from the definition (6).
]
