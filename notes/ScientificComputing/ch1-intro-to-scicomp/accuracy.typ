#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "Accuracy")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(3)
#set heading(numbering: "1.1.1")

= Accuracy

There are two rules to minimize computer round-offs:

- *Rule one*: avoid adding a large number with a small number;

- *Rule two*: avoid subtracting two similar numbers.

They help improve accuracy.

#exm[
Compare

$
f(x)  = sqrt(x  +  1) -  sqrt(x )
$
with
$
g(x) = 1/(sqrt(x  +  1) +  sqrt(x ))
$

]

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[])
{
  float x = 1.0;
  for (int i = 0; i < 10; i++) {
    float f = sqrt(x + 1) - sqrt(x);
    float g = 1.0 / (sqrt(x + 1) + sqrt(x));
    std::cout << "x = " << x << ", f = " << f << ", g = " << g << std::endl;
    x *= 10;
  }
  return EXIT_SUCCESS;
}
```

#exm[
The roots of the quadratic equation
$
f(x) = a x^2 + b x + c = 0
$
are given by
$
x_1 = (-b + sqrt(b^2 - 4a c))/(2a), x_2 = (-b - sqrt(b^2 - 4a c))/(2a).
$
When $b > 0$ , we first compute $ x_2 $ by the expression above and then compute the other root by
$
x_1 = c/(a x_2)
$
Otherwise, we first compute $x_1$ by the expression above and then compute the other root by
$
x_2 = c/(a x_1)
$


]

#exm[
Compute partial sums of the Euler series,
$
s_n = sum_(k=1)^n 1 + 1/4 + 1/9 + dots.c + 1/n^2
$
for large integer $n$ .

]

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[ ])
{
  int n = 100;
  for (int i = 0; i <= 4; i++) {
    float sum = 0.0;
    for (int k = 1; k <= n; k++) {
      float c = 1.0 / k;
      sum += c * c;
    }
    float error = fabs(sum - M PI * M PI / 6.0);
    std::cout << "n = " << n << ", sum = " << sum
              << ", error = " << error << std::endl;
    n *= 10;
  }
  return EXIT_SUCCESS;
}
```

One may alternatively compute the series by
$
s_n = sum_(k=0)^(n-1) 1/(n - k)^2 = 1/n^2 + 1/(n-1)^2 + dots.c + 1/9 + 1/4 + 1.
$

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[ ])
{
  int n = 100;
  for (int i = 0; i <= 4; i++) {
    float sum = 0.0;
    for (int k = n; k >= 1; k--) {
      float c = 1.0 / k;
      sum += c * c;
    }
    float error = fabs(sum - M PI * M PI / 6.0);
    std::cout << "n = " << n << ", sum = " << sum
              << ", error = " << error << std::endl;
    n *= 10;
  }
  return EXIT_SUCCESS;
}
```


