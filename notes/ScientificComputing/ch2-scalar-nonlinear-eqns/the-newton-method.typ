#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with(title: "The Newton Method")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

// 带有 label 的公式才编号
#set math.equation(numbering: "(1)", supplement: none)
#show math.equation.where(block: true): it => {
 if not it.has("label") {
   let fields = it.fields()
   fields.remove("body")
   fields.numbering = none
   return [#counter(math.equation).update(v => v - 1)#math.equation(..fields, it.body)<math-equation-without-label>]
 }
 return it
}

= 4 The Newton Method

In this section, we will introduce a special fixed point method, the so-called Newton method. Let $x_n$ be the $n^(t h)$ approximated solution to the scalar nonlinear equation

$ f (x) = 0 $

by the Newton iteration.

The main idea of the iterative method is to approximate the curve given by $y = f (x)$ around the point $x_n$ with the tangent line passing through $(x_n , f (x_n))$ ,whose equation reads

$ ell (x) = f (x_n) + f^(') (x_n) (x - x_n) $

and uses the intersection of the line with the $x$ -axis as the next approximate solution $x_(n + 1)$ ,which satisfies

$ ell (x_(n + 1)) = f (x_n) + f^(') (x_n) (x_(n + 1) - x_n) , $

i.e.,

$ x_(n + 1) = x_n - frac(f (x_n), f^(') (x_n)) #h(0em) upright(" for ") #h(0em) n = 0 , 1 , 2 , dots.h.c . $

In the Newton method, the map of the fixed point iteration is

$ phi (x) = x - frac(f (x), f^(') (x)) $

with

$ x_(n + 1) = phi (x_n) #h(0em) upright(" for ") #h(0em) n = 0 , 1 , 2 , dots.h.c . $

Assume that the function $f (x)$ is twice continuously differentiable at least in a neighborhood of a solution. The derivative of the map reads

$ phi^(') (x) = 1 - frac([f^(') (x)]^2 - f (x) f^('') (x), [f^(') (x)]^2) = frac(f (x) f^('') (x), [f^(') (x)]^2) . $

*Observation*: 
#text(style: "italic")[
When (as long as) the initial guess $x_0$ is sufficiently close to a zero of $f (x)$ ,the derivative of $phi (x)$ of the fixed point iteration is small,satisfying the contraction map property, and thus the Newton iteration converges, provided that both $lr(|f^(') (x)|)$ and $lr(|f^('') (x)|)$ have reasonable sizes.
]

Note that in a neighborhood of the limit $x^(*)$ , the function value $f (x_n)$ is roughly linearly proportional to the iteration error $e_n = x^(*) - x_n$ , i.e.,

$ f (x_n) = f (x_n) - f (x^(*)) = f^(') (eta_n) (x_n - x^(*)) = - f^(') (eta_n) e_n $

for some value $eta_n$ between $x_n$ and $x^(*)$ . Thus, one may stop/terminate the Newton iteration when $lr(|f (x_n)|)$ is less than a pre-specified tolerance,provided that the magnitude of the derivative of $f (x)$ has a positive lower bound.

#exm[
Consider the Newton iteration for computing the square root of a positive real number $a > 0$ . That is, solve the quadratic equation

$ f (x) = x^2 - a = 0 $

with the Newton iteration. For $n = 0 , 1 , 2 , dots.h.c$ , do as follows,

$ x_(n + 1) = x_n - frac(f (x_n), f^(') (x_n)) = x_n - frac(x_n^2 - a, 2 x_n) = 1 / 2 (x_n + a / x_n) . $

]


== 4.1 Convergence of the Newton Iteration

Assume that the sequence ${x_n}$ generated by the Newton iteration converges to a limit $x^(*)$ . Let

$ e_n = x^(*) - x_n $

be the $n^(t h)$ iteration error. Note that we have the linear equation

$ 0 = ell (x_(n + 1)) = f (x_n) + f^(') (x_n) (x_(n + 1) - x_n) $<1>

and the Taylor expansion of the function around $x_n$ ,

$ 0 = f (x^(*)) = f (x_n) + f^(') (x_n) (x^(*) - x_n) + 1 / 2 f^('') (xi_n) (x^(*) - x_n)^2 . $<2>

Subtracting (@2) by (@1) gives us

$ 0 = f^(') (x_n) (x^(*) - x_(n + 1)) + 1 / 2 f^('') (xi_n) (x^(*) - x_n)^2 , $

i.e.,

$ 0 = f^(') (x_n) e_(n + 1) + 1 / 2 f^('') (xi_n) e_n^2 . $

Assume that

$ f^(') (x_n) eq.not 0 . $

We have the relation between two consecutive iteration errors

$ e_(n + 1) = - 1 / 2 frac(f^('') (xi_n), f^(') (x_n)) e_n^2 $

Suppose that the coefficient

$ c_n = - 1 / 2 frac(f^('') (xi_n), f^(') (x_n)) $

stays bounded in the iteration. Then as the iteration goes on ( $n$ grows),the coefficient is approximately constant and the errors have quadratic relation, for which we say the convergence rate of the Newton method is two. In other words, the Newton method is a quadratic convergent method.

#exm[
$f (x) = (1 + x) (1 - x)^2$ .
]

#exm[
$f (x) = x (x^2 - 2) + 2$ .
]

#exm[
$f (x) = x^3 - x - 3$ .
] 

#exm[
Consider the piecewisely defined function
$ f (x) = cases(delim: "{", sqrt(x) & x gt.eq 0 ,, - sqrt(lr(|x|)) & x < 0 .) $
] 


Note that

$ f^(') (x) = frac(1, 2 sqrt(x)) #h(0em) x > 0 . $

We have

$ x_(n + 1) = x_n - frac(f (x_n), f^(') (x_n)) = x_n - sqrt(x_n) / frac(1, 2 sqrt(x_n)) = x_n - 2 x_n = - x_n . $

We can similarly consider the case for $x < 0$ and see that the Newton iteration for the piecewisely smooth function will never converge.

By numerical experiments, we observe that the Newton method is not guaranteed to converge. There are two necessary conditions for the Newton method to converge:

- a good initial guess $x_0$ ;

- $f (x)$ is twice continuously differentiable.

== 4.2 Multiplicity More Than One

Assume that the limit $x^(*)$ of a convergent sequence ${x_n}$ generated by the Newton iteration is a zero of $f (x)$ with multiplicity $m$ greater than one, i.e.,

$
f (x) = (x - x^(*))^m h (x) " with " h (x^(*)) eq.not 0 .
$

The map of the fixed point iteration reads

$ phi (x) &= x - frac(f (x), f^(') (x)) = x - frac((x - x^(*))^m h (x), m (x - x^(*))^(m - 1) h (x) + (x - x^(*))^m h^(') (x)) \
          &= x - frac((x - x^(*)) h (x), m h (x) + (x - x^(*)) h^(') (x)) . $

The derivative of the map at the limit $x^(*)$ is given by

$ phi^(') (x^(*)) = 1 - frac([h (x^(*))]^2 m, m^2 [h (x^(*))]^2) = 1 - 1 / m in (0 , 1) . $

As $lr(|phi^(') (x^(*))|) > 0$ ,the Newton iteration in this case just converges linearly, not quadratically.

#exr[
Let $f (x)$ be an $m$ times continuously differentiable function with $m > 1$ such that

$ f (alpha) = f^((1)) (alpha) = dots.h.c = f^((m-1)) (alpha) = 0 , "and" f^((m)) (alpha) eq.not 0 . $

Prove …. and check that the modified Newton iteration,

$ x_(k + 1) = x_k - m frac(f (x_k), f^(') (x_k)) , #h(0em) upright(" for ") k = 0 , 1 , 2 , dots.h.c $

has order of convergence equal to 2 .

]

#prf[
Let $phi(x) = x - m f(x) / (f'(x))$ , then
$
phi'(x) = 1 - m (1 - (f(x) f''(x)) / ([f'(x)]^2)).
$
Take the limit that
$
lim_(x -> x^*) phi'(x) = 1 - m (1 - lim_(x -> x^*) (f(x) f''(x)) / ([f'(x)]^2)),
$
To further calculate the limit, by Taylor expension, we have
$
f(x) = (f^(\(m\))(alpha)) / (m!) (x - alpha)^m + cal(O)((x - alpha)^(m+1)).
$
Then,
$
lim_(x -> x^*) (f(x) f''(x)) / ([f'(x)]^2) &= lim_(x -> x^*) ((f^(\(m\))(alpha))^2/(m!(m-2)!)(x-alpha)^(2m-2) + cal(O)((x-alpha)^(2m))) / ((f^(\(m\))(alpha))^2/((m-1)!(m-1)!)(x-alpha)^(2m-2) + cal(O)((x-alpha)^(2m))) \
&= (m-1)/m.
$
Thus, $phi'(x^*) = 0$ . So
$
x^* - x_(k+1) = phi(x^*) - phi(x_k) = -(phi''(xi_n))/(2!)(x_k - x^*)^2,
$
Hence, $e_(k+1) = -(phi''(xi_n))/(2!)(e_k)^2$.

]

== 4.3 The Newton Iteration with Damping

Recall the Newton iteration reads

$ x_(n + 1) = x_n - frac(f (x_n), f^(') (x_n)) , quad n = 0 , 1 , 2 , dots.h.c . $

Let

$ delta_n = - frac(f (x_n), f^(') (x_n)) . $

We call it as the Newton step, which satisfies

$ x_(n + 1) = x_n + delta_n $

Note that when the Newton iteration fails to converge, the absolute value of the function may not be monotonely decreasing to zero. To modify the Newton iteration so that the generated sequence is guaranteed to converge, we introduce a function

$ g (x) = 1 / 2 [f (x)]^2 $

and

$ phi (lambda) = g (x_n + lambda delta_n) #h(0em) upright(" for ") #h(0em) lambda gt.eq 0 . $

We take derivative for $phi (lambda)$ ,

$ phi^(') (lambda) = f (x_n + lambda delta_n) f^(') (x_n + lambda delta_n) delta_n . $

and get

$ phi^(') (0) = f (x_n) f^(') (x_n) delta_n = - f (x_n) f^(') (x_n) frac(f (x_n), f^(') (x_n)) = - [f (x_n)]^2 < 0 . $

It indicates, when $lambda$ is small (sufficiently small), we have

$ phi (lambda) < phi (0) $

as

$ phi (lambda) approx phi (0) + phi^(') (0) lambda $

So we get the Newton method with damping. We introduce a parameter $lambda_n$ in the iteration

$ x_(n + 1) = x_n + lambda_n delta_n $

so that

$ g (x_(n + 1)) < g (x_n) . $

In each iteration, we do as follows

- Step 0 . Let $lambda_n = 1$ .

- Step 1. Let $z_(n + 1) = x_n + lambda_n delta_n$ .

- Step 2. Check if $lr(|f (z_(n + 1))|) < lr(|f (x_n)|)$ . If $lr(|f (z_(n + 1))|) < lr(|f (x_n)|)$ , reduce the size of $lambda_n$ by a half and go back to Step 1; otherwise, let $x_(n + 1) = z_(n + 1)$ .

#rmk[
1. For different functions, one may need to add extra checking. For example, for $f (x) = x ln (x) + 1$ ,one should check $z_(n + 1)$ to guarantees that it stays positive. 
2. In order to avoid working with too small steps, one should stop the inner iteration after a few times damping, say four to six.
]


Obviously, the Newton method with damping is a modified Newton method.