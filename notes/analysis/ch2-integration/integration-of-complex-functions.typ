#import "../book.typ": *

#show: book-page.with(
  title: "2.3 Integration of Complex Functions"
)

== Integration of Complex Functions

This section extends the concept of the Lebesgue integral from non-negative measurable functions to real and complex-valued measurable functions. We will define the space of integrable functions, explore its properties, and establish fundamental convergence theorems.

=== Integration of Real-Valued Functions

Previously, the integral was defined for any non-negative measurable function $f : (X , cal(F)) arrow.r [0 , +oo]$. We now extend this definition to arbitrary measurable functions $f : (X , cal(F) , mu) arrow.r overline(bb(R))$.

Any such function $f$ can be uniquely decomposed into its #strong[positive part] $f^(+)$ and #strong[negative part] $f^(-)$, where: $f^(+) (x) = max (f (x) , 0)$ $f^(-) (x) = max (- f (x) , 0)$.

Both $f^(+)$ and $f^(-)$ are non-negative measurable functions, and we have the relations $f = f^(+) - f^(-)$ and $abs(f) = f^(+) + f^(-)$.

#definition[
Let $f$ be a measurable function from $(X , cal(F) , mu)$ to $overline(bb(R))$. The #strong[Lebesgue integral] of $f$ over $X$ with respect to the measure $mu$ is defined as:
$ integral_X f dif mu := integral_X f^(+) dif mu - integral_X f^(-) dif mu, $
provided that at least one of the integrals on the right-hand side is finite.
]

#definition[
A measurable function $f : X arrow.r overline(bb(R))$ is said to be #strong[integrable] if its integral is finite. The set of all such functions is denoted by $L^1 (X , cal(F) , mu)$ or simply $L^1 (mu)$.
]

Integrability is equivalent to the condition:
$ integral_X abs(f) dif mu < oo. $
This is because $integral_X abs(f) dif mu = integral_X f^(+) dif mu + integral_X f^(-) dif mu$. Thus, $integral abs(f) dif mu$ is finite if and only if both $integral f^(+) dif mu$ and $integral f^(-) dif mu$ are finite.

#proposition[
The space of integrable functions $L^1 (X , cal(F) , mu)$ is a real vector space, and the integral operator $integral : L^1 (X , cal(F) , mu) arrow.r bb(R)$ is a linear operator.
]

#proof[
1. #strong[Vector Space:] Let $f , g in L^1 (mu)$ and $alpha , beta in bb(R)$. We must show that $alpha f + beta g in L^1 (mu)$. Using the triangle inequality:

  $ integral_X abs(alpha f + beta g) dif mu lt.eq integral_X (abs(alpha) abs(f) + abs(beta) abs(g)) dif mu. $

  By the linearity of the integral for non-negative functions:
  
  $ integral_X abs(alpha f + beta g) dif mu lt.eq abs(alpha) integral_X abs(f) dif mu + abs(beta) integral_X abs(g) dif mu < oo. $
  
  Thus, $alpha f + beta g$ is integrable, and $L^1 (mu)$ is a vector space.

2. #strong[Linearity of the Integral:]
  - #strong[Homogeneity:] For $alpha in bb(R)$, it is straightforward to show from the definition that $integral (alpha f) dif mu = alpha integral f dif mu$.

  - #strong[Additivity:] For $f , g in L^1$, let $h = f + g$. We have the decomposition $f = f^(+) - f^(-)$, $g = g^(+) - g^(-)$, and $h = h^(+) - h^(-)$. From $f + g = h$, we can rearrange to get $f^(+) + g^(+) + h^(-) = f^(-) + g^(-) + h^(+)$. Since all terms are non-negative, we can integrate both sides:

    $ integral (f^(+) + g^(+) + h^(-)) dif mu = integral (f^(-) + g^(-) + h^(+)) dif mu. $

    By the additivity of the integral for non-negative functions:
    
    $ integral f^(+) dif mu + integral g^(+) dif mu + integral h^(-) dif mu = integral f^(-) dif mu + integral g^(-) dif mu + integral h^(+) dif mu. $
    
    Since all terms are finite, we can rearrange them to obtain:
    
    $ (integral h^(+) dif mu - integral h^(-) dif mu) = (integral f^(+) dif mu - integral f^(-) dif mu) + (integral g^(+) dif mu - integral g^(-) dif mu), $
    
    which is precisely $integral h dif mu = integral f dif mu + integral g dif mu$. This confirms the linearity of the integral operator.
]


=== Integration of Complex-Valued Functions

We now extend the integral to complex-valued functions.

#definition[
A function $f : (X , cal(F) , mu) arrow.r bb(C)$ is #strong[measurable] if its real part $Re(f)$ and imaginary part $Im(f)$ are both real-valued measurable functions.
]

#definition[
If $f : X arrow.r bb(C)$ is a measurable function such that its real and imaginary parts are integrable (i.e., $Re(f) , Im(f) in L^1 (mu)$), then $f$ is said to be #strong[integrable];. Its integral is defined as:

$ integral_X f dif mu := integral_X Re(f) dif mu + imUnit integral_X Im(f) dif mu. $

A complex-valued function $f$ is integrable if and only if $integral_X abs(f) dif mu < oo$. This is because $abs(Re(f)) lt.eq abs(f)$, $abs(Im(f)) lt.eq abs(f)$, and $abs(f) lt.eq abs(Re(f)) + abs(Im(f))$.
]


=== Equivalence Classes of Functions

In measure theory, functions that differ only on a set of measure zero are often considered equivalent. This is because the value of an integral is not affected by changing the function on such a set.

#proposition[
Let $f , g in L^1 (mu)$. The following statements are equivalent:
1. $integral_E f dif mu = integral_E g dif mu$ for all $E in cal(F)$.
2. $f = g$ almost everywhere (a.e.), meaning $mu ({ x in X : f (x) eq.not g (x) }) = 0$.
3. $integral_X abs(f - g) dif mu = 0$.
]


This proposition justifies redefining $L^1 (mu)$ as the space of #strong[equivalence classes] of integrable functions, where two functions are equivalent if they are equal almost everywhere. This ensures that the property $integral_X abs(f) dif mu = 0 arrow.r.double f = 0$ (in the a.e. sense) holds, which is necessary for defining a norm.



=== The $L^p$ Spaces

The concept of integrable functions can be generalized to the $L^p$ spaces.

#definition[
For $1 lt.eq p < oo$, the space $L^p (X , cal(F) , mu)$ consists of all measurable functions $f : X arrow.r bb(C)$ for which

$ norm(f)_(L^p) := (integral_X abs(f)^p dif mu)^(1 \/ p) < oo. $

For $p = oo$, the space $L^oo (X , cal(F) , mu)$ consists of all measurable functions $f : X arrow.r bb(C)$ that are #strong[essentially bounded];, meaning there exists a constant $M > 0$ such that $abs(f (x)) lt.eq M$ for almost every $x in X$. The norm is the #strong[essential supremum];:

$ norm(f)_(L^oo) := upright("ess sup")_(x in X) abs(f (x)) = inf { M gt.eq 0 : mu ({ x in X : abs(f (x)) > M }) = 0 }. $

For $1 lt.eq p lt.eq oo$, the spaces $L^p (mu)$ are complete normed vector spaces, also known as #strong[Banach spaces];, when functions equal a.e. are identified.
]


=== Fundamental Convergence Theorems

The true power of the Lebesgue integral is demonstrated by its convergence theorems, which provide conditions under which the limit of integrals equals the integral of the limit.

#theorem(title: "Lebesgue's Dominated Convergence Theorem")[
Let ${ f_n }$ be a sequence of functions in $L^1 (X , cal(F) , mu)$ such that:

1. $f_n (x) arrow.r f (x)$ for $mu$-almost every $x in X$.
2. There exists a dominating function $g in L^1 (mu)$ such that $abs(f_n (x)) lt.eq g (x)$ for all $n$ and for $mu$-almost every $x in X$.

Then $f in L^1 (mu)$, and

$ lim_(n arrow.r oo) integral_X f_n dif mu = integral_X f dif mu. $
]<thm:LDCT>

#proof[
The pointwise limit $f$ is measurable. The condition $abs(f_n) lt.eq g$ implies $abs(f) lt.eq g$ a.e., and since $g in L^1$, we have $integral abs(f) dif mu lt.eq integral g dif mu < oo$, so $f in L^1$. Consider the sequence of non-negative functions $g + f_n gt.eq 0$ and $g - f_n gt.eq 0$. By #strong[Fatou's Lemma];:

$ integral_X liminf_(n arrow.r oo) (g + f_n) dif mu lt.eq liminf_(n arrow.r oo) integral_X (g + f_n) dif mu, $

$ integral_X (g + f) dif mu lt.eq integral_X g dif mu + liminf_(n arrow.r oo) integral_X f_n dif mu. $

Since $integral g dif mu$ is finite, we can subtract it to get:

$ integral_X f dif mu lt.eq liminf_(n arrow.r oo) integral_X f_n dif mu. $

Applying Fatou's Lemma to $g - f_n$:

$ integral_X liminf_(n arrow.r oo) (g - f_n) dif mu lt.eq liminf_(n arrow.r oo) integral_X (g - f_n) dif mu, $

$ integral_X (g - f) dif mu lt.eq integral_X g dif mu - limsup_(n arrow.r oo) integral_X f_n dif mu. $

Subtracting the finite $integral g dif mu$ gives:

$ - integral_X f dif mu lt.eq - limsup_(n arrow.r oo) integral_X f_n dif mu arrow.r.double.long limsup_(n arrow.r oo) integral_X f_n dif mu lt.eq integral_X f dif. $

Hence:

$ limsup_(n arrow.r oo) integral_X f_n dif mu lt.eq integral_X f dif mu lt.eq liminf_(n arrow.r oo) integral_X f_n dif mu. $

This implies that the limit exists and equals the integral of $f$.
]


#theorem[
Suppose $f_n , g_n , f , g in L^1 (mu)$. Assume:

1. $f_n arrow.r f$ a.e.
2. $g_n arrow.r g$ a.e.
3. $abs(f_n) lt.eq g_n$ a.e. for all $n$.
4. $integral g_n dif mu arrow.r integral g dif mu$.

Then $integral f_n dif mu arrow.r integral f dif mu$.
]<thm:generalized-LDCT>

#proof[
The sequences $g_n + f_n$ and $g_n - f_n$ are non-negative a.e. Applying Fatou's Lemma to them:

$
integral (g + f) dif mu &= integral liminf_(n arrow.r oo) (g_n + f_n) \
&lt.eq liminf_(n arrow.r oo) integral (g_n + f_n) dif mu \
&= integral g dif mu + liminf_(n arrow.r oo) integral f_n dif mu. $

Subtracting the finite $integral g dif mu$ gives:

$ integral f dif mu lt.eq liminf_(n arrow.r oo) integral f_n dif mu. $

And also:

$
integral (g - f) dif mu &= integral liminf_(n arrow.r oo) (g_n - f_n) \
&lt.eq liminf_(n arrow.r oo) integral (g_n - f_n) dif mu \
&= integral g dif mu - limsup_(n arrow.r oo) integral f_n dif mu. $
$ arrow.r.double.long limsup_(n arrow.r oo) integral f_n dif mu lt.eq integral f dif mu $ The result follows.
]

#theorem[
Suppose that $f_n , f in L^1 (mu)$ and $f_n arrow.r f$ a.e. Then the following are equivalent:

$ integral_X abs(f_n - f) dif mu arrow.r 0 quad arrow.l.r.double quad integral_X abs(f_n) dif mu arrow.r integral_X abs(f) dif mu. $
]

#proof[
- *$arrow.r.double$:* By the reverse triangle inequality, $abs(abs(f_n) - abs(f) abs(lt.eq) f_n - f)$. Integrating both sides: $ lr(|integral abs(f_n) dif mu - integral abs(f) dif mu|) lt.eq integral abs(abs(f_n) - abs(f) abs(dif mu lt.eq integral) f_n - f) dif mu $ As the right side goes to 0, the left side must also go to 0.

- *$arrow.l.double$:* Let $h_n = abs(f_n - f)$. We want to show $integral h_n arrow.r 0$. We use @thm:generalized-LDCT. Let $g_n = abs(f_n) + abs(f)$. Then $abs(h_n) = abs(f_n - f) lt.eq abs(f_n) + abs(f) = g_n$. We have $g_n arrow.r 2 abs(f) = : g$ a.e. By assumption, $integral abs(f_n) arrow.r integral abs(f)$, so $integral g_n = integral abs(f_n) + integral abs(f) arrow.r integral abs(f) + integral abs(f) = integral g$. All conditions of @thm:generalized-LDCT are met for the sequence $h_n$. Therefore:

$ lim_(n arrow.r oo) integral_X abs(f_n - f) dif mu = integral_X lim_(n arrow.r oo) abs(f_n - f) dif mu = integral_X 0 dif mu = 0. $
]


=== Applications and Examples

#example(title: "A Limit Involving the Gamma Function")[
Calculate $I = lim_(k arrow.r oo) integral_0^k x^n (1 - x / k)^k dif x$ for a non-negative integer $n$.
]

#solution[
Let $f_k (x) = x^n (1 - x / k)^k indicator_([0 , k]) (x)$, where $indicator_([0 , k])$ is the indicator function for the interval $[0 , k]$. We can rewrite the integral as $I = lim_(k arrow.r oo) integral_0^oo f_k (x) dif x$.

+ #strong[Pointwise Limit:] For any fixed $x gt.eq 0$, as $k arrow.r oo$, $indicator_([0 , k]) (x) arrow.r 1$ and $(1 - x / k)^k arrow.r e^(- x)$. Thus, the pointwise limit of the integrand is $f (x) = x^n e^(- x)$.
+ #strong[Monotonicity:] The sequence of functions $f_k (x)$ is non-negative and monotonically increasing for $k > x$.
+ #strong[Convergence Theorem:] By the Monotone Convergence Theorem, we can interchange the limit and the integral: $ I = integral_0^oo lim_(k arrow.r oo) f_k (x) dif x = integral_0^oo x^n e^(- x) dif x $ This integral defines the Gamma function $Gamma (n + 1)$. For integer $n$, $Gamma (n + 1) = n !$. Therefore, $I = n !$.
]

#theorem(title: "Differentiation Under the Integral Sign")[
Let $f : X times [a , b] arrow.r bb(C)$, where $- oo < a < b < oo$. Assume that:

1. For each fixed $t in [a , b]$, the function $x mapsto f (x , t)$ is in $L^1 (mu)$.
2. The partial derivative $frac(partial f, partial t)$ exists for all $(x , t)$.
3. There exists a dominating function $g in L^1 (mu)$ such that $abs(frac(partial f, partial t) (x , t)) lt.eq g (x)$ for all $(x , t) in X times [a , b]$.

Then the function $F (t) = integral_X f (x , t) dif mu (x)$ is differentiable on $[a , b]$, and its derivative is given by:

$ F' (t) = integral_X frac(partial f, partial t) (x , t) dif mu (x). $
]

#example(title: "Gaussian Integrals")[
Show that
$ integral_(- oo)^oo x^(2 n) e^(- x^2) dif x = sqrt(pi) frac((2 n) !, n ! 4^n). $
]

#solution[
We start with the well-known Gaussian integral $integral_(- oo)^oo e^(- x^2) dif x = sqrt(pi)$. Consider the function $I (t) = integral_(- oo)^oo e^(- t x^2) dif x$ for $t > 0$. By a change of variables $u = sqrt(t) x$, we find $I (t) = 1 / sqrt(t) integral_(- oo)^oo e^(- u^2) dif u = sqrt(pi / t)$. We can now differentiate $I (t)$ with respect to $t$. The conditions for differentiation under the integral sign are met for $t$ in any compact subinterval of $(0 , oo)$.

$ frac(dif, dif t) I (t) = integral_(- oo)^oo frac(partial, partial t) (e^(- t x^2)) dif x = integral_(- oo)^oo - x^2 e^(- t x^2) dif x. $

Also, $frac(dif, dif t) sqrt(pi / t) = sqrt(pi) (- 1 / 2 t^(- 3 \/ 2))$. Differentiating $n$ times yields:

$ frac(dif^n, dif t^n) I (t) = integral_(- oo)^oo (- 1)^n x^(2 n) e^(- t x^2) dif x. $

And

$
frac(dif^n, dif t^n) (sqrt(pi) t^(- 1 \/ 2)) &= sqrt(pi) (- 1 / 2) (- 3 / 2) dots.h.c (- frac(2 n - 1, 2)) t^(- (n + 1 \/ 2)) \
&= (- 1)^n sqrt(pi) frac((2 n - 1) ! !, 2^n) t^(- (2 n + 1) \/ 2).
$

Equating these two expressions and setting $t = 1$:

$
integral_(- oo)^oo x^(2 n) e^(- x^2) dif x &= sqrt(pi) frac((2 n - 1) ! !, 2^n) \
&= sqrt(pi) frac((2 n) !, 2 n dot.op (2 n - 2) dots.h.c 2 dot.op 2^n) = sqrt(pi) frac((2 n) !, 2^n n ! dot.op 2^n) \
&= sqrt(pi) frac((2 n) !, n ! 4^n).
$
]

#example(title: "Fourier Transform of a Gaussian")[
Find $I (a) = integral_(- oo)^oo e^(- x^2) cos (a x) dif x$ for $a in bb(R)$.
]


#solution[
We use term-by-term integration based on the Taylor series for $cos (a x) = sum_(n = 0)^oo frac((- 1)^n (a x)^(2 n), (2 n) !)$: 

$ I (a) = integral_(- oo)^oo e^(- x^2) sum_(n = 0)^oo frac((- 1)^n a^(2 n) x^(2 n), (2 n) !) dif x. $

To justify swapping the integral and sum, we can use the following corollary of @thm:LDCT.
]

#proposition[
 Let ${ f_j } subset L^1 (mu)$ be a sequence such that $sum_(j = 1)^oo integral abs(f_j) dif mu < oo$. Then the series $sum_(j = 1)^oo f_j$ converges a.e. to an $L^1$ function, and $ integral_X (sum_(j = 1)^oo f_j) dif mu = sum_(j = 1)^oo integral_X f_j dif mu $
]

#proof[
Let $S_N = sum_(j = 1)^N f_j$. The dominating function is $G (x) = sum_(j = 1)^oo abs(f_j (x))$. By the Monotone Convergence Theorem, $integral G dif mu = sum integral abs(f_j) dif mu < oo$, so $G in L^1$. Since $abs(S_N) lt.eq G$, @thm:LDCT applies to the sequence $S_N$, yielding the result.
]


For our problem, let $f_n (x) = e^(- x^2) frac((- 1)^n (a x)^(2 n), (2 n) !)$. We check the condition:

$ sum_(n = 0)^oo integral_(- oo)^oo abs(f_n (x)) dif x = sum_(n = 0)^oo frac(a^(2 n), (2 n) !) integral_(- oo)^oo x^(2 n) e^(- x^2) dif x. $

Using the previous result:

$ = sum_(n = 0)^oo frac(a^(2 n), (2 n) !) (sqrt(pi) frac((2 n) !, n ! 4^n)) = sqrt(pi) sum_(n = 0)^oo frac((a^2 \/ 4)^n, n !) = sqrt(pi) e^(a^2 \/ 4). $

Since the sum is finite, we can swap the integral and summation: $
I (a) &= sum_(n = 0)^oo frac((- 1)^n a^(2 n), (2 n) !) integral_(- oo)^oo x^(2 n) e^(- x^2) dif x = sum_(n = 0)^oo frac((- 1)^n a^(2 n), (2 n) !) (sqrt(pi) frac((2 n) !, n ! 4^n)) \
&= sqrt(pi) sum_(n = 0)^oo frac((- a^2 \/ 4)^n, n !) = sqrt(pi) e^(- a^2 \/ 4) $ Thus, $integral_(- oo)^oo e^(- x^2) cos (a x) dif x = sqrt(pi) e^(- a^2 \/ 4)$.
