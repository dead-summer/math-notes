#import "../book.typ": *

#show: book-page.with(
  title: "2.1 Measurable Functions"
)

== Measurable Functions

In measure theory, we are interested in functions that are compatible with the structure of measurable spaces. These functions, known as #strong[measurable functions];, are fundamental to the theory of integration. They play a role analogous to that of continuous functions in topology.

=== Basic Concepts

#definition(title: "Measurable Function")[
Let $(X , cal(F))$ and $(Y , cal(G))$ be two measurable spaces. A function $f : X arrow.r Y$ is said to be $(cal(F) , cal(G))$#strong[-measurable] if the preimage of every measurable set in $Y$ is a measurable set in $X$. That is,
$ f^(- 1) (E) = { x in X : f (x) in E } in cal(F) quad "for all " E in cal(G) . $
This condition can be compactly written as $f^(- 1) (cal(G)) subset.eq cal(F)$, where $f^(- 1) (cal(G)) := { f^(- 1) (E) : E in cal(G) }$.
]

There is a strong analogy between measurable functions and continuous functions in topology.
- A function $f : (X , cal(T)_X) arrow.r (Y , cal(T)_Y)$ between two topological spaces is #strong[continuous] if the preimage of every open set in $Y$ is an open set in $X$, i.e., $f^(- 1) (cal(T)_Y) subset.eq cal(T)_X$.
- A function $f : (X , cal(F)) arrow.r (Y , cal(G))$ between two measurable spaces is #strong[measurable] if the preimage of every measurable set in $Y$ is a measurable set in $X$, i.e., $f^(- 1) (cal(G)) subset.eq cal(F)$.

In essence, both types of functions "preserve structure" when mapping from one space to another. This connection is formalized by the following proposition.

#proposition[
Let $X$ and $Y$ be topological spaces equipped with their respective Borel $sigma$-algebras, $cal(B)_X$ and $cal(B)_Y$. Any continuous function $f : X arrow.r Y$ is $(cal(B)_X , cal(B)_Y)$-measurable.
]

#proof[
Let $cal(T)_Y$ be the collection of all open sets in the topological space $Y$, then $cal(B)_Y = sigma (cal(T)_Y)$. 

To prove that $f$ is measurable, we must show that for any set $E in cal(B)_Y$, its preimage $f^(- 1) (E)$ is in $cal(B)_X$. As we will establish in the next section(@prp:cirteria-for-measurability), it is sufficient to verify this condition for a collection of sets that generates the $sigma$-algebra $cal(B)_Y$. We choose the collection of open sets $cal(T)_Y$.

Let $U$ be an arbitrary open set in $Y$, so $U in cal(T)_Y$. By the definition of a continuous function between topological spaces, $f^(- 1) (U)$ is an open set in $X$. Since every open set is a Borel set, so $f^(-1)(U) in cal(T)_X subset.eq cal(B)_X$. Thus, $f^(- 1) (U) in cal(B)_X$.

Since the condition $f^(- 1) (U) in cal(B)_X$ holds for all sets $U$ in the generating collection $cal(T)_Y$, we conclude that the function $f$ is $(cal(B)_X , cal(B)_Y)$-measurable.
]


#proposition[
Let $f : (X , cal(F)) arrow.r (Y , cal(G))$ and $g : (Y , cal(G)) arrow.r (Z , cal(H))$ be measurable functions. Then their composition, $g compose f : (X , cal(F)) arrow.r (Z , cal(H))$, is also measurable.
]

#proof[
For any set $E in cal(H)$, we need to show that $(g compose f)^(- 1) (E) in cal(F)$. By definition of composition, $(g compose f)^(- 1) (E) = f^(- 1) (g^(- 1) (E))$. Since $g$ is measurable, $g^(- 1) (E)$ is a set in $cal(G)$. Since $f$ is measurable, the preimage of any set in $cal(G)$ is in $cal(F)$. Therefore, $f^(- 1) (g^(- 1) (E)) in cal(F)$, as required.
]

When the codomain of a function is $bb(R)$, $bb(C)$, or the extended real line $overline(bb(R)) = [ - oo , + oo ]$, we adopt a standard convention for the $sigma$-algebra unless otherwise stated.

- The default $sigma$-algebra on $bb(R)$, $bb(C) tilde.equiv bb(R)^2$, or $overline(bb(R))$ is the #strong[Borel $sigma$-algebra];, denoted $cal(B)_(bb(R))$, $cal(B)_(bb(C))$, or $cal(B)_(overline(bb(R)))$, respectively.
- A function $f : (X , cal(F)) arrow.r bb(R)$ is called #strong[$cal(F)$-measurable] if it is $(cal(F) , cal(B)_(bb(R)))$-measurable.
- A function $f : bb(R) arrow.r bb(R)$ is #strong[Borel measurable] if it is $(cal(B)_(bb(R)) , cal(B)_(bb(R)))$-measurable.
- Let $cal(M)_(cal(L))$ denote the $sigma$-algebra of Lebesgue measurable sets on $bb(R)$. A function $f : bb(R) arrow.r bb(R)$ is #strong[Lebesgue measurable] if it is $(cal(M)_(cal(L)) , cal(B)_(bb(R)))$-measurable.

#note-box[
The composition of two Lebesgue measurable functions is not necessarily Lebesgue measurable. This is because $cal(M)_(cal(L))$ is a strictly larger set than $cal(B)_(bb(R))$. However, if $f : (bb(R) , cal(M)_(cal(L))) arrow.r (bb(R) , cal(B)_(bb(R)))$ is Lebesgue measurable and $g : (bb(R) , cal(B)_(bb(R))) arrow.r (bb(R) , cal(B)_(bb(R)))$ is Borel measurable, their composition $g compose f$ is Lebesgue measurable.
]

=== Criteria for Measurability

To verify that a function is measurable, it is not always necessary to check the preimage of #emph[every] set in the codomain's $sigma$-algebra. It is sufficient to check only the sets in a generating collection.

#proposition[
Let $(X , cal(F))$ and $(Y , cal(G))$ be measurable spaces, and suppose $cal(C)$ is a collection of subsets of $Y$ that generates $cal(G)$ (i.e., $cal(G) = sigma (cal(C))$). A function $f : X arrow.r Y$ is $(cal(F) , cal(G))$-measurable if and only if $f^(- 1) (E) in cal(F)$ for all $E in cal(C)$.
]<prp:cirteria-for-measurability>

#proof[
The "only if" implication is trivial. For the converse, assume $f^(- 1) (E) in cal(F)$ for all $E in cal(C)$. We need to show that $f^(- 1) (A) in cal(F)$ for all $A in cal(G)$.

Consider the collection of subsets of $Y$ whose preimages under $f$ are in $cal(F)$. Let this collection be $cal(A)$: $ cal(A) = { A subset.eq Y: f^(- 1) (A) in cal(F) }. $
Our goal is to show that $cal(G) subset.eq cal(A)$. We first prove that $cal(A)$ is a $sigma$-algebra on $Y$.

1. #strong[Contains Y];: $f^(- 1) (Y) = X$. Since $cal(F)$ is a $sigma$-algebra on $X$, we have $X in cal(F)$. Thus, $Y in cal(A)$.

2. #strong[Closed under complementation];: Let $A in cal(A)$. This implies $f^(- 1) (A) in cal(F)$. The preimage of the complement is the complement of the preimage: $f^(- 1) (A^complement) = (f^(- 1) (A))^complement$. Since $cal(F)$ is a $sigma$-algebra, it is closed under complementation, so $(f^(- 1) (A))^complement in cal(F)$. This means $f^(- 1) (A^complement) in cal(F)$, so $A^complement in cal(A)$.

3. #strong[Closed under countable unions];: Let ${ A_n }_(n = 1)^oo$ be a sequence of sets in $cal(A)$. Then $f^(- 1) (A_n) in cal(F)$ for all $n$. The preimage of the union is the union of the preimages: $f^(- 1) (union.big_(n = 1)^oo A_n) = union.big_(n = 1)^oo f^(- 1) (A_n)$. Since $cal(F)$ is a $sigma$-algebra, it is closed under countable unions, so $union.big_(n = 1)^oo f^(- 1) (A_n) in cal(F)$. Thus, $union.big_(n = 1)^oo A_n in cal(A)$.

We have shown that $cal(A)$ is a $sigma$-algebra on $Y$.

By our initial assumption, for every $E in cal(C)$, we have $f^(- 1) (E) in cal(F)$. By the definition of $cal(A)$, this means that $cal(C) subset.eq cal(A)$.
Since $cal(A)$ is a $sigma$-algebra containing $cal(C)$, $cal(G) = sigma (cal(C)) subset.eq cal(A)$.
This means that for any set $A in cal(G)$, we have $A in cal(A)$, which by definition implies $f^(- 1) (A) in cal(F)$.
This completes the proof.
]

Hence, a function $f : (X , cal(F)) arrow.r bb(R)$ is $cal(F)$-measurable if and only if any one of the following conditions holds for all $a in bb(R)$:
- ${ x in X : f (x) lt.eq a } in cal(F)$.
- ${ x in X : f (x) < a } in cal(F)$.
- ${ x in X : f (x) gt.eq a } in cal(F)$.
- ${ x in X : f (x) > a } in cal(F)$.

This is because collections like ${ ( - oo , a ] : a in bb(R) }$ generate the Borel $sigma$-algebra $cal(B)_(bb(R))$.



=== Functions into Product Spaces

#definition[
Let $X$ be a set, ${ (Y_alpha , cal(G)_alpha) }_(alpha in I)$ be a family of measurable spaces, and ${ f_alpha : X arrow.r Y_alpha }_(alpha in I)$ be a family of functions. The #strong[$sigma$-algebra on $X$ generated by ${ f_alpha }$] is the smallest $sigma$-algebra on $X$ that makes every function $f_alpha$ measurable. It is denoted by:
$ sigma (f_alpha : alpha in I) := sigma (union.big_(alpha in I) f_alpha^(- 1) (cal(G)_alpha)). $
]

#proposition[
Let $f : (X , cal(F)) arrow.r (Y , cal(G))$ where $Y = product_(alpha in I) Y_alpha$ is a product space equipped with the product $sigma$-algebra $cal(G) = times.circle.big_(alpha in I) cal(G)_alpha$. Let $pi_alpha : Y arrow.r Y_alpha$ be the canonical projection map for each $alpha in I$. The function $f$ is $(cal(F) , cal(G))$-measurable if and only if each component function $pi_alpha compose f : X arrow.r Y_alpha$ is $(cal(F) , cal(G)_alpha)$-measurable for all $alpha in I$.
]

#proof[
- *$arrow.r.double$:* Assume $f : (X , cal(F)) arrow.r (Y , cal(G))$ is measurable. By the definition of the product $sigma$-algebra $cal(G)$, each projection map $pi_alpha : (Y , cal(G)) arrow.r (Y_alpha , cal(G)_alpha)$ is measurable. The component function is the composition $pi_alpha compose f$. Since both $f$ and $pi_alpha$ are measurable functions, their composition is measurable. Thus, $pi_alpha compose f$ is $(cal(F) , cal(G)_alpha)$-measurable for all $alpha in I$.

- *$arrow.l.double$:* Assume each component function $f_alpha := pi_alpha compose f$ is $(cal(F) , cal(G)_alpha)$-measurable for all $alpha in I$. The product $sigma$-algebra $cal(G) = times.circle.big_(alpha in I) cal(G)_alpha$ is, by definition, generated by the collection of all cylinder sets:
  $ cal(C) = { pi_alpha^(- 1) (E_alpha) : E_alpha in cal(G)_alpha , alpha in I }. $
  
  By @prp:cirteria-for-measurability, it is sufficient to show that the preimage of any set in this generating collection $cal(C)$ is in $cal(F)$.
  
  Let $C in cal(C)$ be an arbitrary cylinder set. Then $C = pi_beta^(- 1) (E_beta)$ for some index $beta in I$ and some measurable set $E_beta in cal(G)_beta$. The preimage of $C$ under $f$ is:
  $ f^(- 1) (C) = f^(- 1) (pi_beta^(- 1) (E_beta)) = (pi_beta compose f)^(- 1) (E_beta) = f_beta^(- 1) (E_beta). $
  By our assumption, the component function $f_beta$ is $(cal(F) , cal(G)_beta)$-measurable. Therefore, $f^(- 1) (C) in cal(F)$. Since this holds for all cylinder sets $C$ in the generating collection $cal(C)$, we conclude that $f$ is $(cal(F) , cal(G))$-measurable.
]

#corollary[
A function $f : (X , cal(F)) arrow.r bb(C)$ is $cal(F)$-measurable if and only if its real and imaginary parts, $Re(f) : X arrow.r bb(R)$ and $Im(f) : X arrow.r bb(R)$, are both $cal(F)$-measurable.
]


=== Algebraic Operations on Measurable Functions

#proposition[
If $f , g : (X , cal(F)) arrow.r bb(C)$ are $cal(F)$-measurable functions, then the functions $f plus.minus g$ and $f g$ are also $cal(F)$-measurable.
]

#proof[
Define a helper function $H : X arrow.r bb(C) times bb(C)$ by $H (x) = (f (x) , g (x))$. The component functions of $H$ are $pi_1 compose H = f$ and $pi_2 compose H = g$. Since $f$ and $g$ are measurable, by the proposition for product spaces, $H$ is $(cal(F) , cal(B)_(bb(C)) times.circle cal(B)_(bb(C)))$-measurable.
  
  Define the addition map $A : bb(C) times bb(C) arrow.r bb(C)$ by $A (z , w) = z + w$. As $A$ is a continuous function, it is Borel measurable. We can write $(f + g) (x) = A (f (x) , g (x)) = (A compose H) (x)$. Since $f + g$ is the composition of two measurable functions, $A$ and $H$, it is $cal(F)$-measurable. The proofs for $f - g$ and $f g$ are analogous.
]


=== Sequences of Measurable Functions

We often work with functions whose values are in the #strong[extended real number system] $overline(bb(R)) = [ - oo , oo ]$. The Borel $sigma$-algebra on $overline(bb(R))$, denoted $cal(B)_(overline(bb(R)))$, is generated by intervals of the form $[ - oo , a \)$ for $a in bb(R)$. A set $E subset.eq overline(bb(R))$ is in $cal(B)_(overline(bb(R)))$ if and only if $E inter bb(R) in cal(B)_(bb(R))$.

#proposition[
If ${ f_j }_(j = 1)^oo$ is a sequence of $cal(F)$-measurable functions from $(X , cal(F))$ to $(overline(bb(R)) , cal(B)_(overline(bb(R))))$, then the following functions are also $cal(F)$-measurable:
1. $sup_(j in bb(N)) f_j$.
2. $inf_(j in bb(N)) f_j$.
3. $limsup_(j arrow.r oo) f_j$.
4. $liminf_(j arrow.r oo) f_j$.
]

#proof[
1. For any $a in bb(R)$, we observe that $(sup_j f_j) (x) > a$ if and only if $f_j (x) > a$ for at least one $j in bb(N)$. Therefore, $ { sup_(j in bb(N)) f_j > a } = union.big_(j in bb(N)) { f_j > a } . $ Since each $f_j$ is measurable, each set ${ f_j > a }$ is in $cal(F)$. A countable union of sets in $cal(F)$ is also in $cal(F)$, so $sup_j f_j$ is measurable.
2. Similarly, ${ inf_(j in bb(N)) f_j < a } = union.big_(j in bb(N)) { f_j < a }$.
3. The result for $limsup$ follows from the identity $limsup_(j arrow.r oo) f_j = inf_(k in bb(N)) (sup_(n gt.eq k) f_n)$.
4. The result for $liminf$ follows from the identity $liminf_(j arrow.r oo) f_j = sup_(k in bb(N)) (inf_(n gt.eq k) f_n)$.
]

#corollary[
If $f , g : (X , cal(F)) arrow.r overline(bb(R))$ are measurable, then so are $max (f , g)$ and $min (f , g)$. Furthermore, if $f : (X , cal(F)) arrow.r overline(bb(R))$ is measurable, then its positive part $f^(+) = max (f , 0)$, negative part $f^(-) = - min (f , 0)$, and absolute value $abs(f) = f^(+) + f^(-)$ are all measurable.
]


=== Simple Functions and Approximation

Simple functions are the building blocks for more general measurable functions and are crucial for defining the Lebesgue integral.

#definition(title: "Simple Function")[
A function $phi.alt : (X , cal(F)) arrow.r bb(C)$ is a #strong[simple function] if it satisfies either of the following equivalent conditions:
1. It is a finite linear combination of indicator functions of measurable sets:
  $ phi.alt (x) = sum_(j = 1)^n alpha_j indicator_(E_j) (x), $
  where $n in bb(N)$, $alpha_j in bb(C)$, and $E_j in cal(F)$ for all $j$.
2. It is a measurable function whose range is a finite set.
]

#theorem[
Let $f : (X , cal(F)) arrow.r [ 0 , oo ]$ be a non-negative measurable function. Then there exists a sequence of simple measurable functions ${ phi.alt_n }_(n = 1)^oo$ such that:
1. The sequence is non-negative and monotonically increasing: $0 lt.eq phi.alt_1 lt.eq phi.alt_2 lt.eq dots.h lt.eq f$.
2. The sequence converges pointwise to $f$: $lim_(n arrow.r oo) phi.alt_n (x) = f (x)$ for all $x in X$.
3. The convergence is uniform on any set where $f$ is bounded (i.e., for any $M > 0$, $phi.alt_n arrow.r f$ uniformly on the set ${ x in X : f (x) lt.eq M }$).
]

#proof[
For each integer $n gt.eq 1$, we partition the range of $f$. We define a grid of values at height $k \/ 2^n$ and cap the function value at $n$. Define the sets:
$ E_(n , k) := {x in X : k / 2^n lt.eq f (x) < frac(k + 1, 2^n)} quad "for" k = 0 , 1 , dots.h , n 2^n - 1, $
$ F_n := { x in X : f (x) gt.eq n }. $
Since $f$ is measurable, each set $E_(n , k)$ and $F_n$ is in $cal(F)$. Now, define the simple function $phi.alt_n$ as: $ phi.alt_n := (sum_(k = 0)^(n 2^n - 1) k / 2^n indicator_(E_(n , k))) + n indicator_(F_n) $ It can be verified that this sequence ${ phi.alt_n }$ is monotone increasing and converges pointwise to $f$. For any $x$ where $f (x) < oo$, for $n$ large enough such that $n > f (x)$, we have $0 lt.eq f (x) - phi.alt_n (x) < 1 \/ 2^n$. This demonstrates the pointwise convergence and the uniform convergence on sets where $f$ is bounded.
]
