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

#counter(figure).update(3)

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

// 上一节编号到 13
#counter(math.equation).update(13)

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

= The spline interpolation
<the-spline-interpolation>
To avoid the *Runge phenomenon*, we often work with interpolation by piecewise polynomials of low degrees. The corresponding interpolation is called *spline interpolation*. Suppose the interval $[a , b]$ is divided into $n$ sub-intervals $[x_j , x_(j + 1)] , j = 0 , 1 , dots.h.c , n - 1$ , with

$ a = x_0 < x_1 < dots.h.c < x_(n - 1) < x_n = b . $

1. The piecewise constant spline

$ S_0 (x) = f (x_(i + 1 \/ 2)) quad "for" x in [x_i , x_(i + 1)] . $

Here, $x_(i + 1 \/ 2) = (x_i + x_(i + 1)) \/ 2$ .

2. The piecewise linear spline

$ S_1 (x) = frac(x_(i + 1) - x, x_(i + 1) - x_i) f (x_i) + frac(x - x_i, x_(i + 1) - x_i) f (x_(i + 1)) quad "for" x in [x_i , x_(i + 1)] . $

3. The piecewise quadratic spline

$ S_2 (x) =& frac((x - x_(i + 1 \/ 2)) (x - x_(i + 1)), (x_i - x_(i + 1 \/ 2)) (x_i - x_(i + 1))) f (x_i) + frac((x - x_i) (x - x_(i + 1)), (x_(i + 1 \/ 2) - x_i) (x_(i + 1 \/ 2) - x_(i + 1))) f (x_(i + 1 \/ 2)) \
&+ frac((x - x_(i + 1 \/ 2)) (x - x_i), (x_(i + 1) - x_(i + 1 \/ 2)) (x_(i + 1) - x_i)) f (x_(i + 1)) quad "for" x in [x_i , x_(i + 1)] . $

4. The piecewise cubic $C^0$ -spline
In each sub-interval $[x_j , x_(j + 1)]$ , the spline $S (x)$ is a cubic polynomial,

$ S_(3 , 0) (x) = a x^3 + b x^2 + c x + d . $

At the nodes, it satisfies the interpolation condition,

$ S_(3 , 0) (x_j) = f (x_j) . $

5. The piecewise cubic $C^1$ -spline

In each sub-interval $[x_j , x_(j + 1)]$ , the spline $S (x)$ is a cubic polynomial,

$ S_(3 , 1) (x) = a x^3 + b x^2 + c x + d . $

At the nodes, it satisfies the interpolation conditions,

$ S_(3 , 1) (x_j) = f (x_j) #h(0em) upright(" and ") #h(0em) S_(3 , 1)^(') (x_j) = f^(') (x_j) . $

6. The piecewise cubic $C^2$ -spline

In addition to the conditions,

$ S_3 (x_j) = f (x_j) , quad "for" j = 0 , 1 , 2 , dots.h.c n , $

the spline, its first-order and second-order derivatives are all continuous at interior nodes ${x_j}_(j = 1)^(n - 1)$ , i.e.,

$ S_3 (x_j -) = S_3 (x_j +) , $

$ S_3^(') (x_j -) = S_3^(') (x_j +) $

$ S_3^('') (x_j -) = S_3^('') (x_j +) , $

for $j = 1 , 2 , dots.h.c , n - 1$ . There are totally $(n + 1) + 3 times (n - 1) = 4 n - 2$ conditions.

On each sub-interval $[x_j , x_(j + 1)]$ , the spline $S_3 (x)$ is a cubic polynomial, involving 4 coefficients. Totally there are $4 n$ coefficients.

One needs two extra (additional) conditions.

- A natural cubic spline works with the conditions

$ S_3^('') (x_0) = 0 #h(0em) upright(" and ") #h(0em) S_3^('') (x_n) = 0 ; $

- A clamped cubic spline works with the conditions

$ S_3^(') (x_0) = f^(') (x_0) #h(0em) upright(" and ") #h(0em) S_3^(') (x_n) = f^(') (x_n) . $

Let $M_j = S_3^('') (x_j)$ with $j = 0 , 1 , dots.h.c , n$ . Since $S_3 (x)$ is piecewise cubic, $S_3^('') (x)$ is a linear

function on each sub-interval $[x_j , x_(j + 1)]$ ,

$ S_3^('') (x) = frac(x_(j + 1) - x, h_j) M_j + frac(x - x_j, h_j) M_(j + 1) #h(0em) upright(" on ") [x_j , x_(j + 1)] . $

Here, $h_j = x_(j + 1) - x_j$ . Taking twice anti-derivatives of $S_3^('') (x)$ , we get

$ S_3 (x) = 1 / 6 (x_(j + 1) - x)^3 / h_j M_j + 1 / 6 (x - x_j)^3 / h_j M_(j + 1) + frac(x_(j + 1) - x, h_j) alpha_j + frac(x - x_j, h_j) beta_j $

for $x in [x_j , x_(j + 1)]$ . Using the conditions,

$ S_3 (x_j) = f (x_j) #h(0em) upright(" and ") #h(0em) S_3 (x_(j + 1)) = f (x_(j + 1)) , $

we obtain

$ f (x_j) = 1 / 6 h_j^2 M_j + alpha_j , $

$ f (x_(j + 1)) = 1 / 6 h_j^2 M_(j + 1) + beta_j , $

i.e.,

$ alpha_j &= f (x_j) - 1 / 6 h_j^2 M_j , \
beta_j &= f (x_(j + 1)) - 1 / 6 h_j^2 M_(j + 1) . $

We may get the first-order derivative $S_3 (x)$ ,

$ S_3^(') (x) = - 1 / 2 (x_(j + 1) - x)^2 / h_j M_j + 1 / 2 (x - x_j)^2 / h_j M_(j + 1) + frac(beta_j - alpha_j, h_j) , $

for $x in [x_j , x_(j + 1)]$ . Moreover, we have

$ S_3^(') (x_j +) &= - 1 / 2 h_j M_j + 1 / h_j (beta_j - alpha_j) \
&= - 1 / 2 h_j M_j + 1 / h_j [f (x_(j + 1)) - f (x_j) - 1 / 6 h_j^2 M_(j + 1) + 1 / 6 h_j^2 M_j] \
&= - 1 / 3 h_j M_j - 1 / 6 h_j M_(j + 1) + 1 / h_j (f_(j + 1) - f_j) $<eq:14>

and

$ S_3^(') (x_(j + 1) -) &= 1 / 2 h_j M_(j + 1) + 1 / h_j (beta_j - alpha_j) \
&= 1 / 2 h_j M_(j + 1) + 1 / h_j [f (x_(j + 1)) - f (x_j) - 1 / 6 h_j^2 M_(j + 1) + 1 / 6 h_j^2 M_j] \
&= 1 / 3 h_j M_(j + 1) + 1 / 6 h_j M_j + 1 / h_j (f_(j + 1) - f_j) . $<eq:15>

Here, $f_j = f (x_j)$ and $f_(j + 1) = f (x_(j + 1))$ . From (@eq:15), after reducing the index $j$ by one, we get

$ S_3^(') (x_j -) = 1 / 3 h_(j - 1) M_j + 1 / 6 h_(j - 1) M_(j - 1) + 1 / h_(j - 1) (f_j - f_(j - 1)) . $<eq:16>

By continuity of the first-order derivative,

$ S_3^(') (x_j +) = S_3^(') (x_j -) , $

from (@eq:16) and (@eq:14), we arrive at

$ 1 / 3 (h_(j - 1) + h_j) M_j + 1 / 6 h_(j - 1) M_(j - 1) + 1 / 6 h_j M_(j + 1) = 1 / h_j (f_(j + 1) - f_j) - 1 / h_(j - 1) (f_j - f_(j - 1)) , $

for $j = 1 , 2 , dots.h.c , n - 1$ .

In the particular case that $h_(j - 1) = h_j = h$ , for the natural spline, we have $M_0 = M_n = 0$ and

$ mat(delim: "(", 2 \/ 3, 1 \/ 6, , , ; 1 \/ 6, 2 \/ 3, 1 \/ 6, , ; #none, dots.down, dots.down, dots.down, ; #none, , 1 \/ 6, 2 \/ 3, 1 \/ 6; #none, , , 1 \/ 6, 2 \/ 3) vec(M_1, M_2, dots.v, M_(n - 2), M_(n - 1)) = 1 / h^2 vec(f_0 - 2 f_1 + f_2, f_1 - 2 f_2 + f_3, dots.v, f_(n - 3) - 2 f_(n - 2) + f_(n - 1), f_(n - 2) - 2 f_(n - 1) + f_n)_(n - 1) $
