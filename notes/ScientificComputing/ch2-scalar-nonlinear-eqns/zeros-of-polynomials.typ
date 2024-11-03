#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with(title: "The Secant Method")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(5)
#set heading(numbering: "1.1.1")


= Zeros of Polynomials

In this section, we are interested in finding zeros of a polynomial.

We can apply one of the iterative methods that we have so far studied to find a zero of a polynomial. Once a zero is found, we may work with polynomial division to get a polynomial with a lower degree and then also apply one of the studied methods to find another zero. The process can be repeated so that other real zeros are found.

== Polynomial Division

Consider a polynomial of degree $n gt.eq 1$ with

$ p_a (x) = a_0 x^n + a_1 x^(n - 1) + dots.h.c + a_(n - 1) x + a_n . $

Assume the polynomial of degree(n - 1)after dividing the polynomial $p_a (x)$ by $(x - x_0)$ reads

$ p_b (x) = b_0 x^(n - 1) + b_1 x^(n - 2) + dots.h.c + b_(n - 2) x + b_(n - 1) . $

They satisfy

$ p_a (x) = (x - x_0) p_b (x) + r_n $

where $r_n$ is the remainder (constant),equal to $p_a (x_0)$ . The coefficients ${b_k}_(k = 0)^(n - 1)$ can be computed by

$ b_0 &= a_0 \
b_1 &= a_1 + b_0 x_0 \
b_2 &= a_2 + b_1 x_0 \
& dots.v \
b_(n - 1) &= a_(n - 1) + b_(n - 2) x_0 $

and

$ r_n = a_n + b_(n - 1) x_0 $

#exr[
Please write a computer program to find all zeros of the polynomials below:

1. $p_1 (x) = 63 x^5 - 70 x^3 + 15 x$ ,

2. $p_2 (x) = 231 x^6 - 315 x^4 + 105 x^2 - 5$ ,

3. $p_3 (x) = 429 x^7 - 693 x^5 + 315 x^3 - 35 x$ ,

4. $p_4 (x) = 6435 x^8 - 12012 x^6 + 6930 x^4 - 1260 x^2 + 35$ .
]


== Complex Zeros of a Polynomial

We know that zeros of a polynomial may be complex even though all coefficients are real. The methods that we studied are only for scalar nonlinear equations and can not be directly applied to find complex zeros of a polynomial.

To nuemrically find complex roots of the polynomial $p_a (x)$ with real coefficients,one should work with the Newton method for solving a system of two nonlinear equations. We will systematically study iterative methods for nonlinear systems in a later chapter.

Let $x = u + upright(i) v$ be a root of the polynomial with $u$ and $v$ be,respectively,the real and imaginary parts of $x$ . Let $f (u , v)$ and $g (u , v)$ be the corresponding real-valued functions so that

$ p_a (u + upright(i) v) = f (u , v) + upright(i) g (u , v) . $

Then the real and imaginary parts of the root satisfy the nonlinear system

$ 
cases(
  f (u , v) = 0 \
  g (u , v) = 0 .
) 
 $

Let

$ upright(bold(A)) (u , v) = mat(delim: "(", frac(partial f (u , v), partial u), frac(partial f (u , v), partial v); frac(partial g (u , v), partial u), frac(partial g (u , v), partial v)) $

be the Jacobian of the system. Then once an initial guess $x_0 = u_0 + upright(i) v_0$ is given for a root,one may update the approximate solution by the Newton iteration,

$ vec(u_(k + 1), v_(k + 1)) = vec(u_k, v_k) - mat(delim: "(", frac(partial f (u , v), partial u), frac(partial f (u , v), partial v); frac(partial g (u , v), partial u), frac(partial g (u , v), partial v))^(- 1) vec(f (u_k , v_k), g (v_k , v_k)) , $

for $k = 0 , 1 , 2 , dots.h.c$ .

Suppose that $x_1 = u + upright(i) v$ with $u , v in bb(R)$ is a (complex) root of the polynomial $p_a (x)$ . Since the coefficients of $p_a (x)$ are all real, the conjugate $x_2 = macron(x)_1 = u - upright(i) v$ is also a (complex) root. Let

$ alpha = x_1 + x_2 ,  beta = x_1 x_2 = u^2 + v^2 $

and

$ d (x) = x^2 - alpha x + beta . $

We can divide the polynomial $p_a (x)$ by $d (x)$ to reduce the degree by 2 .

Divide the polynomial

$ p_a (x) = a_n x^n + a_(n - 1) x^(n - 1) + dots.h.c + a_1 x + a_0 $

by the quadratic polynomial

$ p_a (x) = d (x) p_b (x) + r (x) $

with

$ p_b (x) = b_(n - 2) x^(n - 2) + b_(n - 3) x^(n - 3) + dots.h.c + b_1 x + b_0 $

and

$ r (x) = s x + t . $

We have the formula for the coefficients

$ b_(n - 2) &= a_n \
b_(n - 3) &= a_(n - 1) + alpha b_(n - 2) \
b_(n - 4) &= a_(n - 2) - beta b_(n - 2) + alpha b_(n - 3) , \
&dots.v \
b_(k - 2) &= a_k - beta b_k + alpha b_(k - 1) ,  quad "for" k = n - 2 , n - 3 , dots.h.c , 3 , 2 $

and

$ s &= a_1 - beta b_1 + alpha b_0 \
t &= a_0 - beta b_0 $

When $s$ and $t$ are identically zero,the quadratic function $d (x)$ divides the polynomial $p_a (x)$ exactly. The roots $x_1$ and $x_2$ of $d (x)$ satisfying

$ x_1 + x_2 = alpha , #h(0em) upright(" and ") #h(0em) x_1 x_2 = beta $

are also roots of the polynomial $p_a (x)$ .