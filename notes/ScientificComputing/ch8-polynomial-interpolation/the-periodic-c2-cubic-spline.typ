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

#counter(heading).update(5)
#set heading(numbering: "1.1.1")

// 上一节编号到 16
#counter(math.equation).update(16)

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

= The periodic $C^2$ cubic spline
<the-periodic-c2-cubic-spline>
Given a set of points ${(x_i , f_i)}_(i = 1)^n$ , find a periodic piecewise cubic $C^2$ -spline $S (x)$ such that on each interval $(x_i , x_(i + 1))$ the spline $S (x) = S_i (x)$ is a cubic polynomial, which satisfies

$ S_i (x_i) = f_i "and" S_i (x_(i + 1)) = f_(i + 1) , quad "for" i = 1 , 2 , dots.h.c , n , $

and the continuity conditions

$
cases(
S_i^(') (x_i) & = S_(i - 1)^(') (x_i) \,\
S_i^('') (x_i) & = S_(i - 1)^('') (x_i) . quad "for" i = 1 \, 2 \, dots.h.c \, n .
)
$

- *Method One*: second derivatives as unknowns
<method-one-second-derivatives-as-unknowns>
Let $M_i = S_i^('') (x_i)$ be the second-order derivative of the $C^2$ -spline function $S (x)$ at $x = x_i$ . Since $S_i^('') (x)$ is a linear function on each interval $[x_i , x_(i + 1)]$ , we have

$ S_i^('') (x) = M_i frac(x_(i + 1) - x, h_i) + M_(i + 1) frac(x - x_i, h_i) quad "for" x in (x_i , x_(i + 1)) $

with $h_i = x_(i + 1) - x_i$ . Taking twice anti-derivatives of $S_i^('') (x)$ , we get

$ S_i (x) = 1 / 6 M_i (x_(i + 1) - x)^3 / h_i + 1 / 6 M_(i + 1) (x - x_i)^3 / h_i + alpha_i frac(x_(i + 1) - x, h_i) + beta_i frac(x - x_i, h_i) . $<eq:17>

Here, the constants $alpha_i$ and $beta_i$ are to be determined. They can be expressed in terms of $M_i$ and $M_(i + 1)$ . As a matter of fact, evaluating (@eq:17) at $x = x_i$ and $x = x_(i + 1)$ , we get

$ S_i (x_i) = 1 / 6 M_i h_i^2 + alpha_i = f_i $

and

$ S_i (x_(i + 1)) = 1 / 6 M_(i + 1) h_i^2 + beta_i = f_(i + 1) . $

These two identities give us

$ alpha_i = f_i - 1 / 6 M_i h_i^2 $<eq:18>

and

$ beta_i = f_(i + 1) - 1 / 6 M_(i + 1) h_i^2 . $<eq:19>

Now by differentiating (@eq:17), we arrive at

$ S_i^(') (x) = - 1 / 2 M_i (x_(i + 1) - x)^2 / h_i + 1 / 2 M_(i + 1) (x - x_i)^2 / h_i + frac(beta_i - alpha_i, h_i) . $

Evaluating the first-order derivative at the endpoints of the interval $(x_i , x_(i + 1))$ , we obtain

$ S_i^(') (x_i) = - 1 / 2 M_i h_i + frac(beta_i - alpha_i, h_i) = frac(f_(i + 1) - f_i, h_i) - h_i / 6 (2 M_i + M_(i + 1)) . $

and

$ S_i^(') (x_(i + 1)) = 1 / 2 M_(i + 1) h_i + frac(beta_i - alpha_i, h_i) = frac(f_(i + 1) - f_i, h_i) + h_i / 6 (M_i + 2 M_(i + 1)) , $

the latter of which implies

$ S_(i - 1)^(') (x_i) = 1 / 2 M_i h_(i - 1) + frac(beta_(i - 1) - alpha_(i - 1), h_(i - 1)) = frac(f_i - f_(i - 1), h_(i - 1)) + h_(i - 1) / 6 (M_(i - 1) + 2 M_i) . $

By the continuity of the first-order derivative of the spline, we get

$ &frac(f_(i + 1) - f_i, h_i) - h_i / 6 (2 M_i + M_(i + 1)) = - 1 / 2 M_i h_i + frac(beta_i - alpha_i, h_i) = S_i^(') (x_i) \
= & S_(i - 1)^(') (x_i) = 1 / 2 M_i h_(i - 1) + frac(beta_(i - 1) - alpha_(i - 1), h_(i - 1)) = frac(f_i - f_(i - 1), h_(i - 1)) + h_(i - 1) / 6 (M_(i - 1) + 2 M_i) . $<eq:20>

Rearrangment of the terms in (@eq:20) gives us

$ 1 / 6 h_(i - 1) M_(i - 1) + 1 / 3 (h_(i - 1) + h_i) M_i + 1 / 6 h_i M_(i + 1) = frac(f_(i + 1) - f_i, h_i) - frac(f_i - f_(i - 1), h_(i - 1)) , $<eq:21>

for $i = 1 , 2 , dots.h.c , n$ .

Let

$ a_i = frac(h_(i - 1) + h_i, 3) , #h(0em) b_i = h_(i - 1) / 6 , #h(0em) c_i = h_i / 6 , $

and

$ p_i = 1 / h_(i - 1) + 1 / h_i , #h(0em) q_i = - 1 / h_(i - 1) , #h(0em) r_i = - 1 / h_i . $

In matrix-vector form, the system (@eq:21) reads

$ mat(delim: "(", a_0, c_0, , , b_0; b_1, a_1, c_1, , ; #none, dots.down, dots.down, dots.down, ; #none, , b_(n - 2), a_(n - 2), c_(n - 2); c_(n - 1), , , b_(n - 1), a_(n - 1)) vec(M_0, M_1, dots.v, M_(n - 2), M_(n - 1)) = vec(g_0, g_1, dots.v, g_(n - 2), g_(n - 1)) $<eq:22>

with

$ vec(g_0, g_1, dots.v, g_(n - 2), g_(n - 1)) = - mat(delim: "(", p_0, r_0, , , q_0; q_1, p_1, r_1, , ; #none, dots.down, dots.down, dots.down, ; #none, , q_(n - 2), p_(n - 2), r_(n - 2); r_(n - 1), , , q_(n - 1), p_(n - 1)) vec(f_0, f_1, dots.v, f_(n - 2), f_(n - 1)) $

In the case the points ${x_i}_(i = 1)^n$ are evenly spaced with $h = h_(i - 1) = h_i = h_(i + 1)$ , the system even has the following simple form

$ 1 / 6 mat(delim: "(", 4, 1, , , 1; 1, 4, 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , 1, 4, 1; 1, , , 1, 4) vec(M_0, M_1, dots.v, M_(n - 2), M_(n - 1)) = - 1 / h^2 mat(delim: "(", 2, - 1, , , - 1; - 1, 2, - 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 2, - 1; - 1, , , - 1, 2) vec(f_0, f_1, dots.v, dots.v, f_(n - 2), f_(n - 1)) . $

- *Method Two*: first derivatives as unknowns
<method-two-first-derivatives-as-unknowns>
In the next, we give another approach to constructing the piecewise cubic $C^2$ -spline. Let $m_i = S^(') (x_i)$ for $i = 0 , 1 , 2 , dots.h.c , n$ . Then on each interval $[x_i , x_(i + 1)]$ for $i = 0 , 1 , 2 , dots.h.c , n - 1$ , the cubic spline is given by the Hermite polynomial

$ S (x) = alpha_i^(-) (x) f_i + alpha_i^(+) (x) f_(i + 1) + beta_i^(-) (x) m_i + beta_i^(+) (x) m_(i + 1) $

with the basis functions

$ alpha_i^(-) (x) = 1 / h_i^3 [2 (x - x_i) + h_i] (x_(i + 1) - x)^2 , #h(0em) alpha_i^(+) (x) = 1 / h_i^3 [2 (x_(i + 1) - x) + h_i] (x - x_i)^2 $

and

$ beta_i^(-) (x) = 1 / h_i^2 (x - x_i) (x_(i + 1) - x)^2 , #h(0em) beta_i^(+) (x) = - 1 / h_i^2 (x_(i + 1) - x) (x - x_i)^2 . $

Here, $h_n = h_0 = x_1 - x_0$ . We can compute

$ S_i^('') (x_i) = frac(6 (f_(i + 1) - f_i), h_i^2) - frac(4 m_i, h_i) - frac(2 m_(i + 1), h_i) $

and

$ S_(i - 1)^('') (x_i) = - frac(6 (f_i - f_(i - 1)), h_(i - 1)^2) + frac(2 m_(i - 1), h_(i - 1)) + frac(4 m_i, h_(i - 1)) . $

By the continuity of the second-order derivative $S^('') (x)$ at $x = x_i$ , i.e.,

$ S_i^('') (x_i) = S_(i - 1)^('') (x_i) , $

we get the equation

$ frac(6 (f_(i + 1) - f_i), h_i^2) - frac(4 m_i, h_i) - frac(2 m_(i + 1), h_i) = - frac(6 (f_i - f_(i - 1)), h_(i - 1)^2) + frac(2 m_(i - 1), h_(i - 1)) + frac(4 m_i, h_(i - 1)) , $

for $i = 1 , 2 , dots.h.c , n$ . After re-arrangement, we arrive at the linear system

$ 2 (1 / h_i + 1 / h_(i - 1)) m_i + 1 / h_(i - 1) m_(i - 1) + 1 / h_i m_(i + 1) = 3 (frac(f_(i + 1) - f_i, h_i^2) + frac(f_i - f_(i - 1), h_(i - 1)^2)) , $

for $i = 1 , 2 , dots.h.c , n$ . On evenly spaced points with $h = h_i = h_(i - 1)$ , the linear system reads

$ 1 / 6 (m_(i - 1) + 4 m_i + m_(i + 1)) = frac(f_(i + 1) - f_(i - 1), 2 h) , $

for $i = 1 , 2 , dots.h.c , n$ . In matrix-vector form, we have

$ 1 / 6 mat(delim: "(", 4, 1, , , 1; 1, 4, 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , 1, 4, 1; 1, , , 1, 4) vec(m_0, m_1, dots.v, m_(n - 2), m_(n - 1)) = frac(1, 2 h) mat(delim: "(", 0, 1, , , - 1; - 1, 0, 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 0, 1; 1, , , - 1, 0) vec(f_0, f_1, dots.v, f_(n - 2), f_(n - 1)) . $

== Solution of the cyclic tridiagonal system
<solution-of-the-cyclic-tridiagonal-system>
In the previous two sections, we see that construction of the $C^2$ cubic spline involves solution of a cyclic tridiagonal system. The linear system can not be solved by direct application of the chasing algorithm (the Thomas algorithm). But after some manipulation, we will see that the cyclic system indeed can be solved with the chasing algorithm.

In the next, we present the solution method for a system in a slightly more general form than the cyclic tridiagonal one. It takes the form

$ mat(delim: "(", upright(bold(A))_(n - 1), upright(bold(alpha))_(n - 1); upright(bold(beta))_(n - 1)^(upright(T)), gamma) vec(upright(bold(u))_(n - 1), u_n) = vec(upright(bold(b))_(n - 1), b_n) . $<eq:23>

Here, $upright(bold(A))_(n - 1)$ is a tridiagonal $(n - 1) times (n - 1)$ matrix; $upright(bold(alpha))_(n - 1) , upright(bold(beta))_(n - 1) , upright(bold(u))_(n - 1)$ and $upright(bold(b))_(n - 1)$ are vectors in $bb(R)^(n - 1) ; gamma , u_n$ and $b_n$ are real scalars.

Writing out the linear system (@eq:23) above yields

$ {upright(bold(A))_(n - 1) upright(bold(u))_(n - 1) + upright(bold(alpha))_(n - 1) u_n & = & upright(bold(b))_(n - 1)\
upright(bold(beta))_(n - 1)^(upright(T)) upright(bold(u))_(n - 1) + gamma u_n & = & b_n $<eq:24>

From the first equation in (@eq:24), we get

$ upright(bold(u))_(n - 1) = upright(bold(A))_(n - 1)^(- 1) (upright(bold(b))_(n - 1) - upright(bold(alpha))_(n - 1) u_n) . $<eq:25>

Plugging it into the second equation in (@eq:24) leads to

$ upright(bold(beta))_(n - 1)^(upright(T)) upright(bold(A))_(n - 1)^(- 1) (upright(bold(b))_(n - 1) - upright(bold(alpha))_(n - 1) u_n) + gamma u_n = b_n . $

Then we have

$ (gamma - upright(bold(beta))_(n - 1)^(upright(T)) upright(bold(A))_(n - 1)^(- 1) upright(bold(alpha))_(n - 1)) u_n = b_n - upright(bold(beta))_(n - 1)^(upright(T)) upright(bold(A))_(n - 1)^(- 1) upright(bold(b))_(n - 1) $

and as a result

$ u_n = frac(b_n - upright(bold(beta))_(n - 1)^(upright(T)) upright(bold(A))_(n - 1)^(- 1) upright(bold(b))_(n - 1), gamma - upright(bold(beta))_(n - 1)^(upright(T)) upright(bold(A))_(n - 1)^(- 1) upright(bold(alpha))_(n - 1)) . $<eq:26>

Now we see we may first compute $upright(bold(A))_(n - 1)^(- 1) upright(bold(b))_(n - 1)$ and $upright(bold(A))_(n - 1)^(- 1) upright(bold(alpha))_(n - 1)$ by the chasing algorithm; then compute $u_n$ by (@eq:26) and $upright(bold(u))_(n - 1)$ by (@eq:25). In this way, we can solve the linear system (@eq:23) efficiently.
