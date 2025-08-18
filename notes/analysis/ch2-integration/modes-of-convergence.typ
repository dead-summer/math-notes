#import "../book.typ": *

#show: book-page.with(
  title: "2.5 Modes of Convergence"
)

== Modes of Convergence

In analysis, understanding the limiting behavior of a sequence of functions is fundamental.
We now formally define and compare several different ways in which a sequence of functions ${ f_n }$ can converge to a limit function $f$.

#definition[
Let ${ f_n }$ be a sequence of measurable functions on a measure space $(X , cal(M) , mu)$.

+ #strong[Pointwise Convergence (a.e.):] $f_n arrow.r f$ almost everywhere (a.e.) if there exists a null set $N$ (i.e., $mu (N) = 0$) such that for all $x in X \\ N$,
  $ lim_(n arrow.r oo) f_n (x) = f (x). $

+ #strong[Uniform Convergence:] $f_n arrow.r f$ uniformly if
  $ lim_(n arrow.r oo) sup_(x in X) abs(f_n (x) - f (x)) = 0. $

+ #strong[Convergence in $L^1$ (or Convergence in Mean):] $f_n arrow.r f$ in $L^1$ if
  $ lim_(n arrow.r oo) integral_X abs(f_n - f) d mu = 0. $

+ #strong[Convergence in Measure:] $f_n arrow.r f$ in measure if for every $epsilon > 0$,
  $ lim_(n arrow.r oo) mu ({ x in X : abs(f_n (x) - f (x)) > epsilon }) = 0. $
]

The relationships between these modes of convergence are subtle. An example can illustrate how one mode of convergence does not necessarily imply another.

#example[
Consider the sequence of functions $f_n (x) = n^2 indicator_([- 1 \/ n , 1 \/ n]) (x)$ on $bb(R)$ with the Lebesgue measure. The sequence converges pointwise to $f (x) = 0$ for $x eq.not 0$, and $f_n (0) arrow.r oo$. Let's check for convergence in measure to the zero function. For any $epsilon > 0$, the set where $abs(f_n (x) - 0) > epsilon$ is a subset of $[- 1 \/ n , 1 \/ n]$. The measure of this set is at most $2 \/ n$, which tends to 0 as $n arrow.r oo$. Therefore, $f_n arrow.r 0$ in measure. 

However, note that the $L^1$-norm convergence fails spectacularly: $ norm(f_n - 0)_(L^1) = integral_(bb(R)) abs(f_n (x)) d x = integral_(- 1 \/ n)^(1 \/ n) n^2 d x = n^2 dot.op 2 / n = 2 n arrow.r oo. $
]

Convergence in measure is a particularly useful concept because it allows for the approximation of general measurable functions by "simpler" functions.

#proposition[
Let $f$ be a Lebesgue measurable function on a finite interval $[a , b]$. Then there exist sequences of functions ${ f_n }$ such that $f_n arrow.r f$ in measure, where the functions $f_n$ can be chosen to be:

1. Bounded and measurable.
2. Simple functions (or step functions).
3. Continuous functions. 
]<prp:approximation-in-measure>

This proposition highlights the robustness of convergence in measure as a way to approximate measurable functions with simpler, more well-behaved ones.

A natural question that arises from above proposition is how closely a measurable function can be approximated by a continuous function. Lusin's Theorem provides a profound answer.

#theorem(title: "Lusin's Theorem")[
Let $f : bb(R)^d arrow.r bb(R)$ be a Lebesgue measurable function. For any $epsilon > 0$, there exists a continuous function $g : bb(R)^d arrow.r bb(R)$ and a measurable set $E$ such that:

$ f (x) = g (x) quad "for all" x in.not E. $

and the Lebesgue measure of the exceptional set is small, i.e., $mu (E) < epsilon$.
]

In essence, Lusin's theorem states that any measurable function is continuous outside a set of arbitrarily small measure. 

#proof[
1. Without loss of generality, assume $f$ is bounded (otherwise, approximate $f$ by a sequence of bounded functions).

2. By @prp:approximation-in-measure, we can find a sequence of continuous functions ${ g_n }_(n = 1)^oo$ that approximate partial sums of our target function. Specifically, we construct them iteratively.

3. Find a continuous $g_1$ such that $abs(f - g_1)  < 1 \/ 2$ outside a set $E_1$ with $mu (E_1) < epsilon \/ 2$.

4. Next, find a continuous $g_2$ approximating the remainder, such that $abs((f - g_1) - g_2)  < 1 \/ 4$ outside a set $E_1 union E_2$ with $mu (E_2) < epsilon \/ 4$.

5. Continuing this process, we obtain a sequence of continuous functions ${ g_j }$ such that $abs(f - sum_(j = 1)^n g_j)  < 2^(- n)$ outside the set $union.big_(j = 1)^n E_j$, where $mu (E_j) < epsilon \/ 2^j$.

6. The series $g = sum_(j = 1)^oo g_j$ converges uniformly on the complement of the set $E = union.big_(j = 1)^oo E_j$. As a uniform limit of continuous functions, $g$ is continuous on this complement.

7. The total measure of the exceptional set is bounded by the sum of the measures: $mu (E) lt.eq sum_(j = 1)^oo mu (E_j) < sum_(j = 1)^oo epsilon \/ 2^j = epsilon$.  On the set $bb(R)^d \\ E$, we have $f = g$.
]


=== Relationships Between Modes of Convergence

#proposition[
Let $(X , cal(M) , mu)$ be a measure space with $mu (X) < oo$. If $f_n arrow.r f$ a.e. on $X$, then $f_n arrow.r f$ in measure on $X$. 
]<prp:ae-implies-measure>

#proof[
Let $f_n arrow.r f$ a.e. on $X$. For a given $epsilon > 0$, define the sets $E_n = { x in X : abs(f_n (x) - f (x)) > epsilon }$. Then for any $x in X$, $x$ belongs to only finitely many sets $E_n$. This means $limsup_(n arrow.r oo) E_n = inter.big_(k = 1)^oo union.big_(n = k)^oo E_n = nothing$.  Since $mu (X) < oo$, by the continuity of measure, we have: $ lim_(n arrow.r oo) mu (union.big_(k = n)^oo E_k) = mu (limsup_(n arrow.r oo) E_n) = mu (nothing) = 0 $ As ${ abs(f_n - f) >  epsilon } subset.eq union.big_(k = n)^oo E_k$, we conclude $lim_(n arrow.r oo) mu ({ abs(f_n - f) > epsilon }) = 0$.
]

#remark[
1. The condition $mu (X) < oo$ is necessary. Consider $f_n = indicator_([n , n + 1])$ on $bb(R)$. Then $f_n (x) arrow.r 0$ pointwise for all $x$, but for any $epsilon in (0 , 1)$, $mu ({ abs(f_n - 0) > epsilon }) = mu ([n , n + 1]) = 1$, which does not converge to $0$.

2. The converse is false, even on a finite measure space. 
]

#example(title: "Counterexample")[
This is famously known as the "typewriter" sequence. On the interval $[0 , 1]$, define a sequence of indicator functions on dyadic intervals that sweep across the interval with increasing frequency. For $n = 0 , 1 , 2 , dots.h$ and $k = 0 , 1 , dots.h , 2^n - 1$, let

$ f_(2^n + k) (x) = indicator_([k / 2^n , frac(k + 1, 2^n)]) (x). $

For any $epsilon > 0$, the measure $mu ({ abs(f_m ( x)) > epsilon } )$ is the length of the interval, which is $1 \/ 2^n$ (where $m = 2^n + k$). As $m arrow.r oo$, $n arrow.r oo$, so the measure goes to 0. Thus, $f_m arrow.r 0$ in measure.  However, for any $x in [0 , 1]$, the function $f_m (x)$ takes the value $1$ infinitely often and $0$ infinitely often. The sequence ${ f_m (x) }$ does not converge for any $x$. 
]

While convergence in measure does not imply pointwise convergence, it does imply that a subsequence converges pointwise a.e.

#theorem(title: "Riesz Theorem")[
If $f_n arrow.r f$ in measure, then there exists a subsequence ${ f_(n_k) }$ such that $f_(n_k) arrow.r f$ almost everywhere.
]

#proof[
Since $f_n arrow.r f$ in measure, for each integer $k gt.eq 1$, we can choose an index $n_k > n_(k - 1)$ such that

$ mu ({ x : abs(f_(n_k) ( x) - f (x)) > 2^(- k) } ) < 2^(- k). $

Let $E_k = { x : abs(f_(n_k) (x) - f (x)) > 2^(- k) }$. We have constructed the subsequence such that $sum_(k = 1)^oo mu (E_k) < sum_(k = 1)^oo 2^(- k) = 1 < oo$.  By the first Borel-Cantelli Lemma, the measure of the set of points that are in infinitely many $E_k$ is zero. That is,

$ mu (limsup_(k arrow.r oo) E_k) = 0. $

If $x in.not limsup_(k arrow.r oo) E_k$, then $x$ belongs to only finitely many $E_k$. This means there exists some $K$ such that for all $k > K$, $x in.not E_k$. This implies that for all $k > K$, $abs(f_(n_k) (x) - f (x)) lt.eq 2^(- k)$. As $k arrow.r oo$, this difference goes to 0. Therefore, $f_(n_k) (x) arrow.r f (x)$ for all $x in.not limsup E_k$. Since this exceptional set has measure zero, $f_(n_k) arrow.r f$ a.e.
]

#theorem(title: "Borel-Cantelli Lemma")[
Let $(Omega , cal(F) , bb(P))$ be a probability space and ${ A_n }_(n = 1)^oo$ be a sequence of events.

1. #strong[First Borel-Cantelli Lemma:] If $sum_(n = 1)^oo bb(P) (A_n) < oo$, then $bb(P) (limsup_(n arrow.r oo) A_n) = 0$.  That is, with probability 1, only finitely many of the events $A_n$ occur.

2. #strong[Second Borel-Cantelli Lemma:] If the events ${ A_n }$ are independent and $sum_(n = 1)^oo bb(P) (A_n) = oo$, then $bb(P) (limsup_(n arrow.r oo) A_n) = 1$.  That is, with probability 1, infinitely many of the events $A_n$ occur.
]

#proof[
1. By the definition of the limit superior of events, we have:
  
  $ limsup_(n arrow.r oo) A_n = inter.big_(k = 1)^oo union.big_(i = k)^oo A_i. $
  
  By the monotonicity of probability measures,
  
  $ PP (limsup_(n arrow.r oo) A_n) lt.eq PP (union.big_(i = k)^oo A_i). $
  
  Using subadditivity, the probability of the union is less than or equal to the sum of the probabilities:
  
  $ PP (union.big_(i = k)^oo A_i) lt.eq sum_(i = k)^oo PP (A_i). $
  
  Combining these inequalities, we get:
  
  $ 0 lt.eq PP (limsup_(n arrow.r oo) A_n) lt.eq sum_(i = k)^oo PP (A_i). $
  
  The assumption of the lemma is that $sum_(n = 1)^oo PP (A_n)$ converges. Therefore,
  
  $ lim_(k arrow.r oo) sum_(i = k)^oo PP (A_i) = 0. $
  
  Since $PP (limsup_(n arrow.r oo) A_n)$ is a non-negative constant bounded above by a quantity that approaches $0$, it must be $0$. This concludes the proof.

2. We want to show that $PP (limsup_(n arrow.r oo) A_n) = 1$. This is equivalent to showing that the probability of its complement is $0$. The complement of "infinitely many $A_n$ occur" is "only finitely many $A_n$ occur". This event can be expressed as:
  
  $ (limsup_(n arrow.r oo) A_n)^complement = union.big_(N = 1)^oo inter.big_(i = N)^oo A_i^complement. $
  
  This is the event that there exists some $N$ such that for all $i gt.eq N$, the event $A_i$ does not occur.

  Since the events ${ A_n }$ are independent, their complements ${ A_n^complement }$ are also independent. Thus, we can write the probability of the interinterion as the product of the probabilities:
  
  $ PP (inter.big_(i = N)^oo A_i^complement) = product_(i = N)^oo PP (A_i^complement) = product_(i = N)^oo (1 - PP (A_i)). $
  
  We use the fundamental inequality $1 - x lt.eq e^(- x)$ for all $x in bb(R)$. This gives:
  
  $ product_(i = N)^oo (1 - PP (A_i)) lt.eq product_(i = N)^oo e^(- PP (A_i)) = exp (- sum_(i = N)^oo PP (A_i)). $
  
  By the hypothesis of the lemma, $sum_(n = 1)^oo PP (A_n) = oo$. Therefore,
  
  $ exp (- sum_(i = N)^oo PP (A_i)) = 0. $
  
  This shows that for any $N gt.eq 1$, $PP (inter.big_(i = N)^oo A_i^complement) = 0$.

  Finally, using subadditivity again on the union: $ PP ((limsup_(n arrow.r oo) A_n)^complement) = PP (union.big_(N = 1)^oo inter.big_(i = N)^oo A_i^complement) lt.eq sum_(N = 1)^oo PP (inter.big_(i = N)^oo A_i^complement) = sum_(N = 1)^oo 0 = 0 $ Thus, $PP ((limsup_(n arrow.r oo) A_n)^complement) = 0$, which implies $PP (limsup_(n arrow.r oo) A_n) = 1$.

]

#example[
A real number $x in [0 , 1]$ is said to be #strong[normal in base 10] if, for any finite sequence of digits $S$ of length $k$, the asymptotic frequency of occurrence of $S$ in the decimal expansion of $x$ is $1 \/ 10^k$.

The decimal expansion of almost every number contains every possible finite string of digits.
]

#proof[
Let $cal(N)$ be the set of numbers in $[0 , 1]$ whose decimal expansion contains every finite string of digits. We will show that the Lebesgue measure of this set, $mu (cal(N))$, is 1.

Let $S = d_1 d_2 . . . d_k$ be an arbitrary finite string of digits of length $k$. We want to show that $S$ appears in the decimal expansion of almost every $x in [0 , 1]$.

To apply the Borel-Cantelli Lemma, we can construct a sequence of independent events. A simple way to do this is to look at non-overlapping blocks of digits. For $n = 1 , 2 , 3 , dots.h$, define the event $E_n$ as:

$ E_n = { x in [0 , 1] : "the block of" k "digits starting at position" n k + 1 "is" S }. $

The digits in these blocks, $(x_(k + 1) , . . . , x_(2 k))$, $(x_(2 k + 1) , . . . , x_(3 k))$, etc., are independent and uniformly distributed random variables on ${ 0 , 1 , . . . , 9 }$.

Therefore, the events ${ E_n }_(n = 1)^oo$ are mutually independent. The probability of any specific $k$-digit block appearing is $(1 \/ 10)^k$. So,

$ PP (E_n) = 1 / 10^k quad "for all" n . $

Now we check the condition for the Second Borel-Cantelli Lemma:

$ sum_(n = 1)^oo PP (E_n) = sum_(n = 1)^oo 1 / 10^k = oo. $

Since the events are independent and the sum of their probabilities diverges, the lemma tells us that with probability $1$, infinitely many of the events $E_n$ occur. $ PP (limsup_(n arrow.r oo) E_n) = 1 $ This means that, with probability 1, the string $S$ appears infinitely often in the decimal expansion of a number chosen uniformly from $[0 , 1]$. If it appears infinitely often, it certainly appears at least once.

Let $cal(N)_S$ be the set of numbers in $[0 , 1]$ containing the string $S$. We have just shown that $mu (cal(N)_S) = 1$.

The set of all possible finite strings of digits is countable. Let this set be ${ S_1 , S_2 , S_3 , dots.h }$. The set of numbers containing #emph[every] string is the interinterion of the sets of numbers containing each specific string:

$ cal(N) = inter.big_(j = 1)^oo cal(N)_(S_j). $

Since $mu (cal(N)_(S_j)) = 1$ for all $j$, the measure of their countable interinterion is also 1. This is because the complement of the interinterion is the union of the complements: $ mu (cal(N)^complement) = mu (union.big_(j = 1)^oo cal(N)_(S_j)^complement) lt.eq sum_(j = 1)^oo mu (cal(N)_(S_j)^complement) = sum_(j = 1)^oo 0 = 0 $ Therefore, $mu (cal(N)) = 1$. Almost every real number in $[0 , 1]$ contains every finite sequence of digits in its decimal representation.
]

We saw that pointwise convergence on a finite measure space implies convergence in measure. A much stronger connection exists, known as "almost uniform convergence."

#theorem(title: "Egoroff's Theorem")[
Let $(X , cal(M) , mu)$ be a measure space with $mu (X) < oo$. Let ${ f_n }$ be a sequence of measurable functions that converges to $f$ a.e. on $X$. Then for every $epsilon > 0$, there exists a measurable set $E subset X$ with $mu (E) < epsilon$ such that $f_n$ converges to $f$ uniformly on the complement $X \\ E$.
]

Egoroff's theorem shows that on a finite measure space, pointwise convergence is nearly uniform.

#proof[
Define the functions $delta_n (x) = sup_(k gt.eq n) abs(f_k (x) - f (x))$.Since $f_n arrow.r f$ pointwise, for each $x$, $delta_n (x) arrow.r 0$ as $n arrow.r oo$. Also, the sequence ${ delta_n (x) }$ is non-increasing.

By @prp:ae-implies-measure, the sequence ${ delta_n }$ converges to $0$ in measure. Thus for each integer $nu gt.eq 1$,, we can find an integer $n (nu)$ such that

$ mu ({ x : delta_(n ( nu)) (x) > 1 \/ nu } ) < epsilon \/ 2^nu. $

Let $E_nu = { x : delta_(n (nu)) (x) > 1 \/ nu }$ and define the exceptional set as $E = union.big_(nu = 1)^oo E_nu$. The measure of this set is

$ mu (E) lt.eq sum_(nu = 1)^oo mu (E_nu) < sum_(nu = 1)^oo epsilon \/ 2^nu = epsilon. $

On the complement $X \\ E$, for any $nu$, if $n gt.eq n (nu)$, then $delta_n (x) lt.eq delta_(n (nu)) (x) lt.eq 1 \/ nu$. This means $sup_(x in X \\ E) abs(f_n (x) - f (x))  lt.eq 1 \/ nu$ for $n gt.eq n (nu)$, which is the definition of uniform convergence. 
]

=== Application in Probability Theory: The Law of Large Numbers

The concepts of convergence in measure and a.e. convergence are central to probability theory, where they are known as convergence in probability and almost sure convergence, respectively.

Consider a sequence of independent random variables ${ X_i }$ with mean $mu$ and finite variance. The sample mean is $macron(X)_n = 1 / n sum_(i = 1)^n X_i$.

- #strong[Weak Law of Large Numbers:] The sample mean converges to the true mean #emph[in probability];.

  $ lim_(n arrow.r oo) PP (abs(macron(X)_n - mu) > epsilon) = 0 , quad "for any" epsilon > 0. $

  This is equivalent to convergence in measure. A common proof uses Chebyshev's inequality.

- #strong[Strong Law of Large Numbers:] The sample mean converges to the true mean #emph[almost surely];.

  $ PP (lim_(n arrow.r oo) macron(X)_n = mu) = 1. $
  
  This is equivalent to a.e. convergence.

The Strong Law of Large Numbers is a more powerful result, and as we have seen, it implies the Weak Law of Large Numbers. The relationship between these two fundamental theorems of probability perfectly mirrors the relationship between a.e. convergence and convergence in measure.

