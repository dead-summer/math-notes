#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with(title: "The Secant Method")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

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

= 5 The Secant Method

In some situations, it is difficult, complicated or expensive to evaluate the derivative of function $f (x)$ . One may prefer to a derivative-free iterative method. The secant method to be introduced here is such a method.

At the $n^(t h)$ iteration,the secant method uses the secant line on the coordinate plane

$ ell (x) = f (x_n) + frac(f (x_n) - f (x_(n - 1)), x_n - x_(n - 1)) (x - x_n) $

to approximate the curve of the function and approximate a zero nearby by the intersection of the line with the axis,which is taken as the next iterated value $x_(n + 1)$ ,satisfying

$ 0 = ell (x_(n + 1)) = f (x_n) + frac(f (x_n) - f (x_(n - 1)), x_n - x_(n - 1)) (x_(n + 1) - x_n) , $

i.e.,

$ x_(n + 1) = x_n - frac(x_n - x_(n - 1), f (x_n) - f (x_(n - 1))) f (x_n) . $

Example 5.1.

$ f (x) = (x - 1) exp (- 1 / (1 - x)^2) . $

== 5.1 Convergence Rate

The secant iteration reads

$ x_(n + 1) = x_n - frac(x_n - x_(n - 1), f (x_n) - f (x_(n - 1))) f (x_n) , quad n = 0 , 1 , 2 , dots.h.c . $

Let

$ e_n = x^(\*) - x_n $

be the iteration error. We have

$ e_(n + 1) &= e_n + frac(x_n - x_(n - 1), f (x_n) - f (x_(n - 1))) f (x_n) , \
&= e_n - frac(x_n - x_(n - 1), f (x_n) - f (x_(n - 1))) [f (x^(\*)) - f (x_n)] , \
&= e_n - frac(x_n - x_(n - 1), f (x_n) - f (x_(n - 1))) frac(f (x^(\*)) - f (x_n), x^(\*) - x_n) e_n , \
&= (1 - frac(x_n - x_(n - 1), f (x_n) - f (x_(n - 1))) frac(f (x^(\*)) - f (x_n), x^(\*) - x_n)) e_n . $<3>

One can verify that there is a number $xi_n$ so that

$ frac(f (x_n) - f (x_(n - 1)), x_n - x_(n - 1)) = f^(') (xi_n) $

and a number $eta_n$ so that

$ frac(f (x^(\*)) - f (x_n), x^(\*) - x_n) - frac(f (x_n) - f (x_(n - 1)), x_n - x_(n - 1)) = 1 / 2 f^('') (eta_n) (x^(\*) - x_(n - 1)) , $

provided that $f (x)$ is twice continuously differentiable in a neighborhood of the limit $x^(\*)$ . From (@3), we get

$ e_(n + 1) = - 1 / 2 frac(f^('') (eta_n), f^(') (xi_n)) e_(n - 1) e_n $

which is quite similar to that of the Newton iteration.

Assume that the absolute value of the first derivative function $f^(') (x)$ at the limit $x^(\*)$ has a positive lower bound and that of the second derivative $f^('') (x^(\*))$ has a positive upper bound. In a neighborhood of $x^(\*)$ , there is a positive constant $C$ so that

$ lr(|e_(n + 1)|) lt.eq C lr(|e_(n - 1)|) lr(|e_n|) $

Let

$ d_n = C lr(|e_n|) . $

We get

$ d_(n + 1) lt.eq d_(n - 1) d_n , #h(0em) upright(" for ") n = 1 , 2 , 3 , dots.h.c . $

Assume there exists a positive constant $delta in (0 , 1)$ so that the initial two errors satisfy

$ C lr(|e_0|) lt.eq delta #h(0em) upright(" and ") #h(0em) C lr(|e_1|) lt.eq delta , $

which implies

$ d_0 lt.eq delta #h(0em) upright(" and ") #h(0em) d_1 lt.eq delta . $

By recursion, we have

$ d_2 lt.eq d_0 & d_1 lt.eq delta^2 \
d_3 lt.eq d_1 & d_2 lt.eq delta^3 \
d_4 lt.eq d_2 & d_3 lt.eq delta^5 \
d_5 lt.eq d_3 & d_4 lt.eq delta^8 \
d_6 lt.eq d_4 & d_5 lt.eq delta^13 \
&dots.v $

The exponents on the right hand side of the inequalities above form the Fibonacci sequence. Let $F_n$ be the $n "th"$ Fibonacci numbers, then
$
d_n <= delta^(F_n), d_(n+1) <= delta^(F_(n+1))
=> d_n^(F_(n+1) / F_n) <= delta^(F_(n+1)),
$
so we have $d_(n+1) approx d_n^(F_(n+1) / F_n)$ . Since $lim_(n -> oo) F_(n+1) / F_n = (sqrt(5) + 1)/2$, one can see that the convergence rate is

$ p = frac(sqrt(5) + 1, 2) approx 1.618 $

#rmk[
One may extend idea of the secant method, work with quadratic polynomial interpolation of three points and use the intersect of the quadratic curve by the X -axis as a new approximation. The resulting iterative method is the so-called *Muller method*.
]
