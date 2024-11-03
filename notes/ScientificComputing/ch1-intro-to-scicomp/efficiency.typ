#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "Efficiency")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

= Efficiency

The rule to improve efficiency is (obviously) to minimize the number of arithmetic operations.

#exm[
Evaluate the polynomial
$
p_n(x) = a_n + a_(n-1) x + a_(n-1) x^2 + dots.c + a_1 x^(n-1) + a_0 x^n.
$
Straightforward evaluation of the polynomial may involve $cal(O)(n^2)$ multiplications.

Let
$
p_(n-1)(x) = a_(n-1) + a_(n-1) x + dots.c + a_1 x^(n-2) + a_0 x^(n-1)
$
and
$
p_k(x) = a_k + a_(k-1)x + a_(k-2)x^2 + dots.c + a_1x^(k-1) + a_0x^k
$
for $k = n, n - 1, dots.c ,2,1,0$ . Note that two consecutive polynomials have the relation
$
p_k(x) = a_k + x p_(k-1)(x).
$
We can start with $p_0(x) = a_0$ and use the recursion above for $k = 1,2, dots.c , n$ to get $p_n(x)$ . The procedure only involves $cal(O)(n)$ multiplications. It called Horner’s rule.
]

#exm[
Evaluate $ln(2)$ with the Taylor series expansion
$
ln(1+x) = x - x^2/2 + x^3/3 - x^4/4 +x^5 + dots.c
$

]

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[])
{
  int n = 100;
  for (int i = 0; i <= 4; i++) {
    float sum = 0.0;
    float x = 1.0;
    float z = x;
    for (int k = 1; k <= n; k++) {
      if ((k%2) == 0) {
        sum -= z / k;
      } else {
        sum += z / k;
      }
      z *= x;
      }
      float error = fabs(sum - log(2.0));
      std::cout << "n = " << n << ", sum = " << sum
      << ", error = " << error << std::endl;
      n *= 10;
  }
  return EXIT_SUCCESS;
}
```

One may alternatively use the formula
$
ln((1+x)/(1-x)) &= ln(1+x) - ln(1-x)\
&=2(x + x^3/3 + x^5/5 + x^7/7 + dots.c )
$
for $x=1\/3$.
```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[])
{
  int n = 1;
  for (int i = 0; i < 8; i++) {
    float sum = 0.0;
    float x = 1.0 / 3.0;
    float x2 = x * x;
    float z = x;
    for (int k = 1, m = 1; k <= n; k++) {
      sum += z / m;
      z *= x2;
      m += 2;
    }
    sum *= 2;
    float error = fabs(sum - log(2.0));
    std::cout << "n = " << n << ", sum = " << sum
    << ", error = " << error << std::endl;
    n++;
  }
  return EXIT_SUCCESS;
}
```


