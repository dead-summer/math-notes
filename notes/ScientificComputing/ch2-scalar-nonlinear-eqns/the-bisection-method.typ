#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "Efficiency")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

= 1 The Bisection Method

Assume the values of function $f(x)$ at the end points of the interval $[a, b]$ take opposite signs, i.e.,
$
f(a) f(b) < 0.
$
let
$
c = (a+b) / 2,
$
if $f(a)f(c) > 0$ , replace $a$ with $c$ ; otherwise, replace $b$ with $c$ . Repeat the process. Each time the length/size of the interval $[a, b]$ is reduced by a half. When the interval $[a, b]$ is sufficiently small, any value on interval $[a, b]$ can be used as an approximate solution to the equation with error not greater than the size $(b - a)$ of the interval.

#exm[

Consider the nonlinear equation
$
f(x) = x - e^(-x), quad x in [-1, 1].
$

]

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
double F(double x)
{
  double f = x - exp(-x);
  return f;
}
int main(int argc, char *argv[])
{
  double a = -1;
  double b = 1;
  double fa = F(a);
  double fb = F(b);
  double c = 0.5 * (a + b);
  double d = b - a;
  double tol = 1.0E-8;
  int count = 0;
  int max itr num = 100;

  do {
    count++;
    double fc = F(c);
    std::cout << "count = " << count << ", d = " << d
              << ", c = " << c << ", fc = " << fc << std::endl;
    if ((fa * fc) > 0.0) {
      a = c;
      fa = fc;
    } else {
      b = c;
      fb = fc;
    }
    c = 0.5 * (a + b);
    d *= 0.5;
  } while ((d > tol) && (count < max itr num));

  if (count == max itr num) {
    std::cout << "The bisection method failed to converge." << std::endl;
    exit(EXIT FAILURE);
  }
  std::cout << "An approximate solution found, x = " << c << std::endl;

  return EXIT SUCCESS;
}
```

