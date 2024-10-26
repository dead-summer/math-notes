#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "Efficiency")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

= 6 Stability

Stability means sensitivity of solution to external perturbation. We say a numerical method is stable if its solution to a problem is insensitive to external perturbation; otherwise, a numerical method is unstable if its solution is sensitive to external perturbation.

#exm[

Evaluate the integral
$
I_n = integral_0^1 x^n/(10+x) dif x
$
for some $n = 20, 30, 40$.

]

First note that
$
I_n + 10 I_(n-1) = integral_0^1(x^n + 10 x^(n-1)/(10+x)) dif x = integral_0^1 x^(n-1) dif x = 1/n.
$
We have the recursion,
$
I_n = 1/n - 10 I_(n-1), n = 1, 2, dots.h, N
$
with
$
I_0 = integral_0^1 1/(10+x) dif x = ln(11/10).
$

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[])
{
  int n = 20;
  float I0 = log(1.1);
  for (int i = 1; i <= n; i++) {
    float I = 1.0 / i - 10.0 * I0;
    std::cout << "i = " << i << ", I = " << I << std::endl;
    I0 = I;
  }
  return EXIT_SUCCESS;
}
```

The results in the experiments are wrong since the values should always be positive (the sequence ${I_n}$ is strictly monotonely decreasing) and actually we have the estimate
$
1/(11(n+1)) = 1/11 integral_0^1x^n dif x < I_n  < 1/10 integral_0^1 x^n dif x =  1/(10(n+1))
$
which is never greater than one.

As an alternative approach, one can work with the following recursion
$
I_(n-1) = 1/(10n) - 1/10 I_n, n = N, N-1, ..., 2, 1,
$
starting with a number $N$ larger than $n$ except that the value $I_N$ is unknown and can only be replaced with an approximate value.

For example, when $N = 99$ , since we have
$
1/1100 < I_(99) < 1/1000,
$
we can approximate $I_(99)$ by
$
tilde(I)_(99) equiv 1/2 (1/1100 + 1/1000) = 21/22000,
$
with the error between $I_(99)$ and $tilde(I)_(99)$ be less than $1 \/ 22000$.

At the first glance, one may think that a good approximation for $I_N$ should be provided. In fact, there is no such need at all. One can try with a very rough value for $I_N$ as long as $N$ is sufficiently large.

For any $n$ , one can choose $N > n + 20$ and even try with $tilde(I)_N = 1$ , which has an obviously large error, close to one. But the error will decay quickly to zero by the recursion.

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[ ])
{
  int n = 40;
  int N = 60;
  float I1 = 1.0;
  for (int i = N; i >= n; i--) {
    float I = 1.0 / (10.0 * i) - 0.1 * I1;
    std::cout << "i = " << i << ", I = " << I << std::endl;
    I1 = I;
  }
  return EXIT_SUCCESS;
}
```


