#import "../book.typ": *

#show: book-page.with(
  title: "3.3 Signed Measures"
)

== Signed Measures

=== Definition of a Signed Measure

We begin by generalizing the concept of a measure to allow for negative values. This extension is crucial for various areas of analysis, including the study of distributions and integration theory.

#definition(title: "Signed Measure")[
Let $(X , cal(F))$ be a measurable space. A #strong[signed measure] is a function $nu : cal(F) arrow.r [ - oo , + oo ]$ that satisfies the following properties:

1. #strong[Empty Set:] $nu (nothing) = 0$.
2. #strong[Range:] The function $nu$ assumes at most one of the values $+ oo$ or $- oo$. That is, the range of $nu$ is a subset of either $(- oo , oo ]$ or $[ - oo , oo)$.
3. #strong[Countable Additivity ($sigma$-additivity):] For any sequence ${ E_i }_(i = 1)^oo$ of pairwise disjoint sets in $cal(F)$, the following equality holds:

  $ nu (union.big_(i = 1)^oo E_i) = sum_(i = 1)^oo nu (E_i), $

  where the series on the right-hand side must converge absolutely if $nu (union.big_(i = 1)^oo E_i)$ is finite.
]


To understand the structure of a signed measure, we classify sets based on the sign of the measure of their measurable subsets.

#definition(title: "Positive, Negative, and Null Sets")[
Let $nu$ be a signed measure on $(X , cal(F))$. A set $E in cal(F)$ is called:

- A #strong[positive set] for $nu$ if $nu (A) gt.eq 0$ for every measurable subset $A subset.eq E$.
- A #strong[negative set] for $nu$ if $nu (A) lt.eq 0$ for every measurable subset $A subset.eq E$.
- A #strong[null set] for $nu$ (or a $nu$-null set) if $nu (A) = 0$ for every measurable subset $A subset.eq E$.
]


A key result is that any measurable space can be partitioned into a positive set and a negative set. This provides a fundamental decomposition of the space with respect to the signed measure.

  #theorem(title: "Hahn Decomposition Theorem")[
  Let $nu$ be a signed measure on a measurable space $(X , cal(F))$. Then there exists a partition of $X$ into a positive set $P$ and a negative set $N$, i.e.,

  $ X = P union N quad "and" quad P inter N = nothing. $

  This decomposition is unique up to $nu$-null sets. That is, if $X = P' union N'$ is another such decomposition, then the symmetric difference $P Delta P' = (P \\ P') union (P' \\ P)$ is a $nu$-null set.
  ]

  #proof[
  The proof is constructive and relies on identifying a "maximal" positive set.

  + #strong[Setup:] Without loss of generality, assume $nu$ does not take the value $+ oo$, i.e., its range is in $[ - oo , oo \)$. Let $M = sup { nu (E) : E in cal(F) "is a positive set" }$.
  + #strong[Construct $P$:] Let ${ P_j }_(j = 1)^oo$ be a sequence of positive sets such that $lim_(j arrow.r oo) nu (P_j) = M$. We define $P = union.big_(j = 1)^oo P_j$.
    
    - First, we show that P is a positive set. Let $E subset.eq P$ be a measurable set. To show that $nu (E) gt.eq 0$, we construct a sequence of disjoint sets. Let $Q_1 = P_1$ and for $j > 1$, let $Q_j = P_j \\ union.big_(i = 1)^(j - 1) P_i$. The sets ${ Q_j }$ are pairwise disjoint, and their union is $P$. We can write $E$ as a disjoint union: $E = union.big_(j = 1)^oo (E inter Q_j)$. By countable additivity:
    
      $ nu (E) = sum_(j = 1)^oo nu (E inter Q_j). $
      
      Since $E inter Q_j$ is a measurable subset of the positive set $Q_j$, we have $nu (E inter Q_j) gt.eq 0$ for all $j$. Therefore, $nu (E) gt.eq 0$, which proves that $P$ is a positive set.

    - Then, we prove that $nu (P) = M$. By its definition, $P$ is a candidate for the supremum, so $nu (P) lt.eq M$. Also, for each $j$, $P_j subset.eq P$. Since $P$ is a positive set and $P \\ P_j$ is a measurable subset of $P$, we have $nu (P \\ P_j) gt.eq 0$. Therefore,
      
      $ nu (P) = nu (P_j) + nu (P \\ P_j) gt.eq nu (P_j). $
      
      Taking the limit as $j arrow.r oo$, we get $nu (P) gt.eq lim_(j arrow.r oo) nu (P_j) = M$. Combining the inequalities, we conclude that $nu (P) = M$.

  + #strong[Construct $N$:] Let $N = X \\ P$. We prove by contradiction that $N$ is a negative set.
    - First, we show that $N$ contains no non-null positive subset. If $A subset.eq N$ were a positive set with $nu (A) > 0$, then $P union A$ would also be a positive set, and $nu (P union A) = nu (P) + nu (A) = M + nu (A) > M$. This contradicts the definition of $M$ as the supremum.
    - Next, observe that if $exists B subset.eq N$ , s.t. $nu(B) > 0$ . Then $exists C subset B$ s.t. $nu(C) > nu(B)$ . This because $B$ is not positive, so $exists D subset B$ , s.t. $nu(D) < 0$ . Then take $C = B without D$ and $nu(C) = nu(B) - nu(D) > nu(B)$ .

      Now if $N$ were not negative, then $exists E subset N$ , s.t. $nu(E) > 1\/n$ for some $n in NN$ . Let $n_1$ be the smallest such $n$ and let $E_1$ be such $E$ . But for $E_1, exists E_2 subset E_1$ , s.t. $nu(E_2) > nu(E_1)$ . We can see that $nu(E_2) > nu(E_1) + 1/n_2$ ($n_2$ is the smallest such $n_2$ ). Inductively, we obtain $N supset E_1 supset E_2 supset dots.c$ s.t.
      $
      nu(E_j) > sum_(k=1)^(j) 1/(n_k) .
      $
      By continuity from above of $nu$ (check) , $F := inter.big_(j=1)^(infinity)E_j$ satisfies
      $
      nu(F) = lim_(j -> oo) nu(E_j) = sum_(j=1)^(infinity) 1/(n_j)
      $
      But $nu$ dosen't attain to $+infinity$ , so $n_i arrow + infinity$ . Then $exists G subset F$ , s.t.
      $
      nu(G) > nu(F) + 1/n, quad "for some" n .
      $
      Say $n < n_j$ . Then $G subset F subset E_(j-1)$ while $E_j$ is a subset of $E_(j-1)$ s.t.
      $
      nu(E_j) > nu(E_(j-1)) + 1/(n_j), quad "where" n_j "is  minimal" .
      $
      However, $nu(G) > nu(F) + 1/n > nu(E_(j-1)) + 1/n$ , which contradicts the minimum of $E_j$ . Therefore, $N = X without P$ is negative.

  + #strong[Uniqueness:] If $X = P union N = P' union N'$ are two Hahn decompositions, consider the set $P \\ P'$. Since $P \\ P' subset.eq P$, it is a positive set. Since $P \\ P' subset.eq N'$, it is also a negative set. The only way a set can be both positive and negative is if it is a $nu$-null set. Similarly, $P' \\ P$ is a $nu$-null set. Therefore, their union, $P Delta P'$, is also a $nu$-null set.
  ]


=== Jordan Decomposition

The Hahn decomposition allows us to split any signed measure into two positive measures.

#theorem(title: "Jordan Decomposition Theorem")[
Let $nu$ be a signed measure on $(X , cal(F))$. There exist two mutually singular positive measures, $nu^(+)$ and $nu^(-)$, such that

$ nu = nu^(+) - nu^(-). $

These measures are defined for any $E in cal(F)$ by

$ nu^(+) (E) = nu (E inter P) quad "and" quad nu^(-) (E) = - nu (E inter N), $

where $X = P union N$ is a Hahn decomposition for $nu$. The decomposition is unique and is called the #strong[Jordan decomposition] of $nu$.
]

#proof[
1. #strong[Existence:] Let $X = P union N$ be a Hahn decomposition for $nu$, where $P$ is a positive set and $N$ is a negative set, with $P inter N = nothing$. We define $nu^(+)$ and $nu^(-)$ as stated above.

  - #strong[$nu^(+)$ and $nu^(-)$ are positive measures:] For any measurable set $E in cal(F)$, the set $E inter P$ is a subset of the positive set $P$. By the definition of a positive set, $nu (E inter P) gt.eq 0$. Thus, $nu^(+) (E) gt.eq 0$ for all $E in cal(F)$. Similarly, $E inter N$ is a subset of the negative set $N$, so $nu (E inter N) lt.eq 0$. Consequently, $nu^(-) (E) = - nu (E inter N) gt.eq 0$ for all $E in cal(F)$. The countable additivity of $nu^(+)$ and $nu^(-)$ follows directly from the countable additivity of $nu$. Therefore, $nu^(+)$ and $nu^(-)$ are positive measures.

  - #strong[Decomposition $nu = nu^(+) - nu^(-)$:] For any $E in cal(F)$, since $P$ and $N$ form a partition of $X$, we have $E = (E inter P) union (E inter N)$. As these two sets are disjoint, the additivity of $nu$ implies: $ nu (E) = nu (E inter P) + nu (E inter N) = nu^(+) (E) - (- nu (E inter N)) = nu^(+) (E) - nu^(-) (E) . $

  - #strong[Mutual Singularity of $nu^(+)$ and $nu^(-)$:] The measures $nu^(+)$ and $nu^(-)$ are mutually singular because they are supported on disjoint sets. Specifically, $P$ supports $nu^(+)$ and $N$ supports $nu^(-)$. We can verify this:

    $
    nu^(+) (N) &= nu (N inter P) = nu (nothing) = 0 , \
    nu^(-) (P) &= - nu (P inter N) = - nu (nothing) = 0 .
    $
    
    Since $X = P union N$, $nu^(+)$ and $nu^(-)$ are mutually singular ($nu^(+) perp nu^(-)$).

2. #strong[Uniqueness:] Suppose there is another decomposition $nu = mu_1 - mu_2$. By the definition of mutual singularity, there exist disjoint sets $A , B in cal(F)$ such that $X = A union B$, $mu_1 (B) = 0$, and $mu_2 (A) = 0$.

  For any measurable set $E subset.eq A$, we have $nu (E) = mu_1 (E) - mu_2 (E) = mu_1 (E) - 0 gt.eq 0$. Thus, $A$ is a positive set for $nu$. For any measurable set $E subset.eq B$, we have $nu (E) = mu_1 (E) - mu_2 (E) = 0 - mu_2 (E) lt.eq 0$. Thus, $B$ is a negative set for $nu$.

  This implies that $X = A union B$ is a Hahn decomposition for $nu$. By the uniqueness of the Hahn decomposition (up to $nu$-null sets), we know that for any Hahn decomposition $X = P union N$, the symmetric differences $A Delta P$ and $B Delta N$ are $nu$-null sets.

  Now, for any $E in cal(F)$:
  
  $ mu_1 (E) = mu_1 (E inter A) = nu (E inter A) + mu_2 (E inter A) = nu (E inter A) . $
  
  Since $A Delta P$ is a $nu$-null set, $nu (E inter A) = nu (E inter P) = nu^(+) (E)$. Therefore, $mu_1 = nu^(+)$. Similarly,
  
  $ mu_2 (E) = mu_2 (E inter B) = mu_1 (E inter B) - nu (E inter B) = - nu (E inter B) . $
  
  Since $B Delta N$ is a $nu$-null set, $- nu (E inter B) = - nu (E inter N) = nu^(-) (E)$. Therefore, $mu_2 = nu^(-)$. The decomposition is unique.
]

The Jordan decomposition is not just any decomposition; it possesses a key minimality property.

#proposition(title: "Minimality")[
If $nu = lambda - mu$ for any two positive measures $lambda$ and $mu$, then $nu^(+) lt.eq lambda$ and $nu^(-) lt.eq mu$. This means the Jordan decomposition is the most "efficient" way to represent $nu$ as a difference of two positive measures.
]

#proof[
Let $nu = lambda - mu$ and let $X = P union N$ be a Hahn decomposition for $nu$. For any $E in cal(F)$:

$ nu^(+) (E) = nu (E inter P) = lambda (E inter P) - mu (E inter P) . $

Since $mu$ is a positive measure, $mu (E inter P) gt.eq 0$. Thus, $lambda (E inter P) - mu (E inter P) lt.eq lambda (E inter P)$. Furthermore, since $lambda$ is a positive measure, $lambda (E inter P) lt.eq lambda (E)$. Combining these inequalities, we get $nu^(+) (E) lt.eq lambda (E)$.

Similarly,

$ nu^(-) (E) = - nu (E inter N) = - (lambda (E inter N) - mu (E inter N)) = mu (E inter N) - lambda (E inter N) . $

Since $lambda$ is a positive measure, $lambda (E inter N) gt.eq 0$, which implies $mu (E inter N) - lambda (E inter N) lt.eq mu (E inter N)$. Also, since $mu$ is a positive measure, $mu (E inter N) lt.eq mu (E)$. Combining these inequalities gives $nu^(-) (E) lt.eq mu (E)$.
]

#definition(title: "Total Variation Measure")[
The #strong[total variation measure] of $nu$, denoted by $abs(nu)$, is defined as:

$ abs(nu) = nu^(+) + nu^(-). $

For any set $E in cal(F)$, $abs(nu) (E) = nu (E inter P) - nu (E inter N)$.
]

#proposition[
For any $E in cal(F)$:

1. $nu^(+) (E) = sup { nu (F) : F in cal(F) , F subset.eq E }$.
2. $nu^(-) (E) = - inf { nu (G) : G in cal(F) , G subset.eq E }$.
3. $abs(nu) (E) = sup {sum_(i = 1)^n abs(nu (E_i)) : { E_i }_(i = 1)^n "is a finite partition of" E}$.
]

#proof[
+ For any measurable $F subset.eq E$, we have $nu (F) = nu^(+) (F) - nu^(-) (F) lt.eq nu^(+) (F)$. Since $nu^(+)$ is a positive measure, $nu^(+) (F) lt.eq nu^(+) (E)$. Thus, $nu (F) lt.eq nu^(+) (E)$ for all $F subset.eq E$, which implies $sup { nu (F) } lt.eq nu^(+) (E)$. To show equality, consider the set $F_0 = E inter P$. $F_0$ is a measurable subset of $E$. Then $nu (F_0) = nu (E inter P) = nu^(+) (E)$. Since we have found a set for which the supremum is attained, we conclude $nu^(+) (E) = sup { nu (F) : F in cal(F) , F subset.eq E }$.

+ For any measurable $G subset.eq E$, we have $nu (G) = nu^(+) (G) - nu^(-) (G) gt.eq - nu^(-) (G)$. Since $nu^(-)$ is a positive measure, $- nu^(-) (G) gt.eq - nu^(-) (E)$. Thus, $nu (G) gt.eq - nu^(-) (E)$ for all $G subset.eq E$, which implies $inf { nu (G) } gt.eq - nu^(-) (E)$, or $nu^(-) (E) gt.eq - inf { nu (G) }$. To show equality, consider the set $G_0 = E inter N$. $G_0$ is a measurable subset of $E$. Then $nu (G_0) = nu (E inter N) = - nu^(-) (E)$. This value is in the set ${ nu (G) }$, so the infimum must be less than or equal to it: $inf { nu (G) } lt.eq - nu^(-) (E)$. Combining the inequalities, we get $nu^(-) (E) = - inf { nu (G) : G in cal(F) , G subset.eq E }$.

+ Let ${ E_i }_(i = 1)^n$ be a finite measurable partition of $E$. Then,

$
sum_(i = 1)^n abs(nu (E_i)) &= sum_(i = 1)^n abs(nu^(+) (E_i) - nu^(-) (E_i)) \
&lt.eq sum_(i = 1)^n (nu^(+) (E_i) + nu^(-) (E_i)) = sum_(i = 1)^n abs(nu) (E_i) \
&= abs(nu) (E) .
$

Taking the supremum over all such partitions, we have $sup sum abs(nu (E_i)) lt.eq abs(nu) (E)$. To show equality, consider the specific partition of $E$ given by $E_1 = E inter P$ and $E_2 = E inter N$. Then,

$
abs(nu (E_1)) + abs(nu (E_2)) &= abs(nu (E inter P)) + abs(nu (E inter N)) \
&= nu (E inter P) + (- nu (E inter N)) \
&= nu^(+) (E) + nu^(-) (E) \
&= abs(nu) (E) .
$

Since this sum is one of the values in the set over which the supremum is taken, the supremum must be at least this value. Therefore, the equality holds.
]


=== Absolute Continuity and Singularity

The relationship between two measures on the same space can be described using the concepts of singularity and absolute continuity.

#definition(title: "Mutual Singularity")[
Two signed measures $µ$ and $nu$ are mutually singular, denoted $µ tack.t nu$, if there exist disjoint sets $A$, $B in cal(F)$ such that $X = A union B$, and for any $E in cal(F)$,

$ abs(mu) (E) = abs(mu) (E inter A) quad "and" quad abs(nu) (E) = abs(nu) (E inter B). $

This is equivalent to stating that $mu$ is concentrated on $A$ and $nu$ is concentrated on $B$, or simply $abs(nu) (A) = 0$ and $abs(mu) (B) = 0$.
]

#definition(title: "Absolute Continuity")[
Let $nu$ be a signed measure and $mu$ be a positive measure on $(X , cal(F))$. We say that $nu$ is absolutely continuous with respect to $mu$, denoted $nu lt.double mu$, if for every $E in cal(F)$,

$ mu (E) = 0 arrow.r.double.long nu (E) = 0. $
]


#proposition[
1. A set $E in cal(F)$ is $nu$-null if and only if $abs(nu) (E) = 0$.
2. The signed measure $nu$ can be expressed as an integral with respect to its total variation measure:
  
  $ nu (E) = integral_E (indicator_P - indicator_N) dif abs(nu), $
  
  where $indicator_P$ and $indicator_N$ are the indicator functions for the sets in a Hahn decomposition.
3. The total variation of $nu$ on a set $E$ can also be defined as the supremum of the integrals of bounded functions:

  $ abs(nu) (E) = sup {lr(|integral_E f dif nu|) : f "is measurable and" abs(f) lt.eq 1}. $

4. For signed measures $nu$ and $mu$:
  $ nu perp mu arrow.l.r.double abs(nu) perp abs(mu). $
]

#proof[
1. If $abs(nu) (E) = nu^(+) (E) + nu^(-) (E) = 0$, then $nu^(+) (E) = 0$ and $nu^(-) (E) = 0$. For any $A subset.eq E$, we have $0 lt.eq nu^(+) (A) lt.eq nu^(+) (E) = 0$ and $0 lt.eq nu^(-) (A) lt.eq nu^(-) (E) = 0$, so $nu (A) = nu^(+) (A) - nu^(-) (A) = 0$. Conversely, if $E$ is $nu$-null, then $nu^(+) (E) = nu (E inter P) = 0$ and $nu^(-) (E) = - nu (E inter N) = 0$, so $abs(nu) (E) = 0$.
]

#theorem[
Let $nu$ be a finite signed measure and $mu$ be a positive measure on $(X , cal(F))$. Then $nu lt.double mu$ if and only if for every $epsilon > 0$, there exists a $delta > 0$ such that for any $E in cal(F)$:

$ mu (E) < delta arrow.r.double.long abs(nu (E)) < epsilon. $
]<thm:epsilon-delta-formulation>

#proof[
- *$arrow.l.double$:* Assume the $epsilon$-$delta$ condition holds. Let $E in cal(F)$ be a set such that $mu (E) = 0$. Then for any $delta > 0$, we have $mu (E) < delta$. The condition implies that for any given $epsilon > 0$, $abs(nu) (E) < epsilon$. Since $epsilon$ can be arbitrarily small, we must conclude that $abs(nu) (E) = 0$. By definition, this means $nu lt.double mu$.

- *$arrow.r.double$:* Assume $nu lt.double mu$. We prove the contrapositive by contradiction. Suppose the $epsilon$-$delta$ condition fails. Then there exists an $epsilon_0 > 0$ such that for any $delta > 0$, we can find a set $E$ with $mu (E) < delta$ but $abs(nu) (E) gt.eq epsilon_0$.

  Let's apply this for a sequence of $delta_n$. For each $n in bb(N)$, set $delta_n = 2^(- n)$. We can find a corresponding sequence of sets ${E_n}_(n gt.eq 1)$ such that:
  
  $ mu (E_n) < 1 / 2^n quad "and" quad abs(nu) (E_n) gt.eq epsilon_0. $
  
  Define the set $F = limsup_(n arrow.r oo) E_n = inter.big_(k = 1)^oo union.big_(n = k)^oo E_n$. Let's analyze the measure of $F$.

  + #strong[Measure of $F$ under $mu$];: For any $k gt.eq 1$, we have:
  
    $ mu (union.big_(n = k)^oo E_n) lt.eq sum_(n = k)^oo mu (E_n) < sum_(n = k)^oo 1 / 2^n = 1 / 2^(k - 1). $
  
    Since $F subset.eq union.big_(n = k)^oo E_n$ for all $k$, it follows that $mu (F) lt.eq 1 \/ 2^(k - 1)$. As this must hold for all $k gt.eq 1$, we can take the limit as $k arrow.r oo$ to find that $mu (F) = 0$.

  + #strong[Measure of $F$ under $abs(nu)$];: Since $nu lt.double mu$ by our initial assumption, and we have shown $mu (F) = 0$, it must be that $abs(nu) (F) = 0$.

  + #strong[Contradiction];: Let $F_k = union.big_(n = k)^oo E_n$. The sequence ${F_k}$ is a decreasing sequence of sets, i.e., $F_1 supset.eq F_2 supset.eq dots.h$. Since $nu$ is a finite measure, $abs(nu)$ is also a finite measure. By the continuity of measure from above: $ abs(nu) (F) = abs(nu) (inter.big_(k = 1)^oo F_k) = lim_(k arrow.r oo) abs(nu) (F_k) $ From step 2, we know $abs(nu) (F) = 0$. However, for any $k$, we have $F_k = union.big_(n = k)^oo E_n supset.eq E_k$. Therefore, $abs(nu) (F_k) gt.eq abs(nu) (E_k) gt.eq epsilon_0$. This implies that $lim_(k arrow.r oo) abs(nu) (F_k) gt.eq epsilon_0$.

  We have reached the contradiction $0 gt.eq epsilon_0$, where $epsilon_0 > 0$. Thus, our initial supposition that the $epsilon$-$delta$ condition fails must be false. This completes the proof.
]


=== The Radon-Nikodym-Lebesgue Theorem

This fundamental theorem provides a decomposition of any $sigma$-finite signed measure into two parts: one that is absolutely continuous with respect to another given measure $mu$, and one that is singular to $mu$.

#theorem(title: "Radon-Nikodym-Lebesgue Decomposition")[
Let $nu$ be a $sigma$-finite signed measure and $mu$ be a $sigma$-finite positive measure on $(X , cal(F))$. Then there exists a unique pair of $sigma$-finite signed measures, $nu_"ac"$ and $nu_"s"$, such that:
1. #strong[Decomposition:] $nu = nu_"ac" + nu_"s"$.
2. #strong[Properties:] $nu_"ac" lt.double mu$ and $nu_"s" perp mu$.

Furthermore, there exists a unique (up to $mu$-a.e. equivalence) integrable function $f in L^1 (mu)$ such that for all $E in cal(F)$:

$ nu_"ac" (E) = integral_E f dif mu. $

The function $f$ is called the #strong[Radon-Nikodym derivative] of $nu_"ac"$ with respect to $mu$, denoted by $f = frac(dif nu_"ac", dif mu)$.
]

#proposition(title: "Chain Rule for Radon-Nikodym Derivatives")[
Let $nu , mu , lambda$ be $sigma$-finite measures on $(X , cal(F))$ with $mu , lambda$ being positive. If $nu lt.double mu$ and $mu lt.double lambda$, then $nu lt.double lambda$ and the derivatives satisfy the chain rule:

$ frac(dif nu, dif lambda) = frac(dif nu, dif mu) dot.op frac(dif mu, dif lambda) , quad lambda "-a.e." $
]

#proof[
+ #strong[Show $nu lt.double lambda$];: Let $E in cal(F)$ be a set such that $lambda (E) = 0$. Since $mu lt.double lambda$, we must have $mu (E) = 0$. Furthermore, since $nu lt.double mu$, it follows from $mu (E) = 0$ that $nu (E) = 0$. Therefore, $nu lt.double lambda$.

+ #strong[Establish the Chain Rule Identity];: Let $f = frac(dif nu, dif mu)$ and $g = frac(dif mu, dif lambda)$. By the definition of the Radon-Nikodym derivative, these functions satisfy:

  - $nu (E) = integral_E f dif mu$ for all $E in cal(F)$.
  - $mu (A) = integral_A g dif lambda$ for all $A in cal(F)$.

  Our goal is to show that $nu (E) = integral_E (f dot.op g) dif lambda$ for all $E in cal(F)$. By the uniqueness of the Radon-Nikodym derivative, this would imply $frac(dif nu, dif lambda) = f dot.op g$.

  For any $E in cal(F)$, we have: $ nu (E) = integral_E f dif mu = integral_X (f dot.op indicator_E) dif mu $ Applying the change of measure formula, we get:
  
  $ integral_X (f dot.op indicator_E) dif mu = integral_X (f dot.op indicator_E) dot.op g dif lambda. $
  
  Rearranging the terms inside the integral gives:
  
  $ integral_X (f dot.op g) dot.op indicator_E dif lambda = integral_E (f dot.op g) dif lambda. $
  
  Thus, we have shown that for any $E in cal(F)$:
  
  $ nu (E) = integral_E (f dot.op g) dif lambda. $
  
  By the definition and uniqueness of the Radon-Nikodym derivative, this implies that the derivative of $nu$ with respect to $lambda$ is the product $f dot.op g$. That is:
  
  $ frac(dif nu, dif lambda) = f dot.op g = frac(dif nu, dif mu) dot.op frac(d mu, d lambda). $
  
  This equality holds $lambda$-almost everywhere, completing the proof.
]

=== Application: Conditional Expectation

The Radon-Nikodym theorem provides a powerful way to define conditional expectation in probability theory.

#definition(title: "Conditional Expectation")[
Let $(X , cal(F) , mu)$ be a measure space, and let $f in L^1 (mu)$. Let $cal(G) subset.eq cal(F)$ be a $sigma$-subalgebra. Define a signed measure $lambda$ on $(X , cal(G))$ by:

$ lambda (E) = integral_E f dif mu quad "for all" E in cal(G) $

Since $lambda lt.double mu$ (when both are restricted to $cal(G)$), the Radon-Nikodym theorem guarantees the existence of a unique $cal(G)$-measurable function $g in L^1 (X , cal(G) , mu)$ such that for all $E in cal(G)$:

$ lambda (E) = integral_E g dif mu. $

This function $g$ is defined as the #strong[conditional expectation] of $f$ given $cal(G)$, denoted by $g = bb(E) [ f mid(|) cal(G) ]$.
]

#proposition(title: "Tower Property of Conditional Expectation")[
If $cal(H) subset.eq cal(G) subset.eq cal(F)$ are $sigma$-subalgebras and $f in L^1 (mu)$, then

$ bb(E) [ bb(E) [ f abs(cal(G) ]) cal(H) ] = bb(E) [ f mid(|) cal(H) ] , quad mu "-a.e." $

This is a fundamental property expressing the law of iterated expectations.
]
