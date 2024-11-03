#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "The Aitken/Steffenson Acceleration Technique")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(2)
#set heading(numbering: "1.1.1")

= The Aitken/Steffenson Acceleration Technique

Consider the fixed point iteration

$ x_(k + 1) = phi (x_k) , #h(0em) k = 0 , 1 , 2 , dots.h.c . $

Assume the sequence ${x_k}$ has a limit $x^(\*)$ with

$ x^(\*) = lim_(k arrow.r + oo) x_k $

Let

$ e_k = x^(\*) - x_k $

be the iteration error. We have

$ e_(k + 1) = x^(\*) - x_(k + 1) = phi (x^(\*)) - phi (x_k) = phi^(') (xi_k) (x^(\*) - x_k) = phi^(') (xi_k) e_k $

with $xi_k$ in the middle of $x^(\*)$ and $x_k$ , provided that $phi (x)$
is continuously differentiable in the neighborhood of $x^(\*)$ .

As $xi_k$ is assumed to be close to $x^(\*)$ , we may treat
$phi^(') (xi_k)$ as a constant $c$ . Then we get

$ e_(k + 1) = phi^(') (xi_k) e_k approx c e_k $

i.e.,

$ e_(k + 1) approx c e_k , #h(0em) k = 0 , 1 , 2 , dots.h.c . $

Once again, we emphasize that the nearly linear relation above indicates
that the fixed point iteration has first-order convergence rate when the
absolute value of the coefficient constant has a positive lower bound.
We consider the relation between the first three errors,

$ e_1 &approx c e_0 , \
  e_2 &approx c e_1 , $

i.e.,

$ x^(\*) - x_1 &approx c (x^(\*) - x_0) , \
  x^(\*) - x_2 &approx c (x^(\*) - x_1) . $

Assume none of the errors are identically zero. Eliminating the constant
$c$ yields

$ frac(x^(\*) - x_1, x^(\*) - x_2) approx frac(x^(\*) - x_0, x^(\*) - x_1) $

i.e.,

$ (x^(\*) - x_0) (x^(\*) - x_2) approx (x^(\*) - x_1)^2 . $

We obtain

$ x^(\*) approx frac(x_0 x_2 - x_1^2, x_0 + x_2 - 2 x_1) $

It is reasonable to take

$ z equiv frac(x_0 x_2 - x_1^2, x_0 + x_2 - 2 x_1) $

as a more accurate approximation of $x^(\*)$ than $x_0 , x_1$ and $x_2$
.

We have the accelerated fixed point iteration: for
$k = 0 , 1 , 2 , dots.h.c$ , do as follows

- Step 1. Let $y_0 = x_k , y_1 = phi (y_0)$ and $y_2 = phi (y_1)$ .
  Compute $x_(k + 1)$ by

$ x_(k + 1) = frac(y_0 y_2 - y_1^2, y_0 + y_2 - 2 y_1) $

- Step 2. Check if the difference $lr(|x_(k + 1) - phi (x_(k + 1))|)$ is
  less than some pre-specified tolerance $epsilon.alt > 0$ . If it
  is, stop the iteration; otherwise,increase $k$ by one and go back to
  Step 1 .

#rmk[
1) In the fixed point iteration, one may alternatively check $lr(|x_(k + 1) - x_k|)$ to determine whether to stop the iteration. 
2) The tolerance for the termination can not be arbitrarily small,  i.e., can not be too close to the computer round-off. Otherwise, the assumption on the linear relation between errors is invalid.
]

#exr[
Consider for $k gt.eq 0$ the following fixed point method, known as Steffensen's method,

$ x_(k + 1) = x_k - frac(f (x_k), g (x_k)) $

with

$ g (x_k) = frac(f (x_k + f (x_k)) - f (x_k), f (x_k)) . $

The map $phi (x)$ of the iteration is given by

$ phi (x) = x - frac([f (x)]^2, f (x + f (x)) - f (x)) . $

Write a computer program either in C++, MATLAB or python to employ the method to approximate a root of the nonlinear equation

$ f (x) = e^(- x) - sin (x) = 0 . $

]


