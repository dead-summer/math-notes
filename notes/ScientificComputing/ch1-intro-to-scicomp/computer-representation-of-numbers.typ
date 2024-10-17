#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "Computer Representation of Numbers")
#show: codly-init.with()
#codly_init()

= 3 Computer Representation of Numbers

We should first recognize that real numbers (numbers with decimal points) can only be represented

by finite precision in computers. Typically, computer representation has two precisions:

- *Single precision* : computer round-off $#mi("{\epsilon }_{1} = {2}^{-{23}} \approx  1.19 \\times  {10}^{-7}")$ ;

- *Double precision* : computer round-off $#mi("{\epsilon }_{2} = {2}^{-{52}} \approx  2.22 \\times  {10}^{-{16}}")$ .

The corresponding numbers are called floating point numbers. The finite precision introduces computer round-offs, which contributes to the major part of implementation errors.

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>

int main(int argc, char *argv[ ])
{
  float eps = M PI;
  int count = 0;
  while (eps > 0.0) {
    count++;
    std::cout << "count = " << count << ", eps = " << eps << std::endl;
    eps *= 0.1;
  }
  return EXIT SUCCESS;
}
```

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[ ])
{
  float eps = M PI;
  int count = 0;
  float c = 1.0 + eps;
  while (c > 1.0) {
    count++;
    std::cout << "count = " << count << ", eps = " << eps << std::endl;
    eps *= 0.1;
    c = 1.0 + eps;
  }
  return EXIT SUCCESS;
}
```

The next code tells us what value the computer round-off of floating point data is by the single precision. It is $epsilon.alt_(1) = 2^(-23)$ , approximately equal to $1.19  times   10^(-7)$ .

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[ ])
{
  int count = 0;
  float eps = 1.0;
  float c = 1.0 + eps;
  while (c > 1.0) {
    count++;
    std::cout << "count = " << count << ", eps = " << eps << std::endl;
    eps *= 0.5;
    c = 1.0 + eps;
  }
  return EXIT SUCCESS;
}
```

The next code tells us what value the computer round-off of floating point data is by the double precision. It is $epsilon.alt_2 = 2^(-52)$ , approximately equal to $2.22 times  10^(-16)$ .

```cpp
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <iostream>
int main(int argc, char *argv[ ])
{
  int count = 0;
  double eps = 1.0;
  double c = 1.0 + eps;
  while (c > 1.0) {
    count++;
    std::cout << "count = " << count << ", eps = " << eps << std::endl;
    eps *= 0.5;
    c = 1.0 + eps;
  }
  return EXIT SUCCESS;
}
```