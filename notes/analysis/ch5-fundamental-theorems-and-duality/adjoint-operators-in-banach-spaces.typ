#import "../book.typ": *

#show: book-page.with(
  title: "5.4 Adjoint (Dual) Operators in Banach Spaces"
)

== Adjoint (Dual) Operators in Banach Spaces

The adjoint operator generalizes the notion of the transpose of a matrix in finite-dimensional linear algebra. It is a fundamental tool for analyzing the properties of an operator, such as its injectivity, surjectivity, and the closedness of its range, by relating them to corresponding properties of its adjoint.


=== Definition and Fundamental Properties

#definition(title: "Adjoint Operator")[
Let $X$ and $Y$ be Banach spaces, and let $T in cal(B) (X , Y)$ be a bounded linear operator. The #strong[adjoint operator] $T^* : Y^* arrow.r X^*$ is defined by the relation:
$ (T^* f) (x) = f (T x) , quad forall x in X , quad forall f in Y^* . $
Here, $X^*$ and $Y^*$ denote the continuous dual spaces of $X$ and $Y$, respectively.
]


The operator $T^*$ is a well-defined linear operator. Furthermore, it is bounded. For any $f in Y^*$:

$ norm(T^* f)_(X^*) = sup_(x in X , norm(x)_X lt.eq 1) abs((T^* f) (x)) = sup_(x in X , norm(x)_X lt.eq 1) abs(f (T x)). $

By the definition of the operator norm,

$ abs(f (T x)) lt.eq norm(f)_(Y^*) norm(T x)_Y lt.eq norm(f)_(Y^*) norm(T)_(cal(B) (X , Y)) norm(x)_X. $

Thus, for $norm(x)_X lt.eq 1$:

$ norm(T^* f)_(X^*) lt.eq norm(f)_(Y^*) norm(T)_(cal(B) (X , Y)). $

This shows that $T^*$ is a bounded operator, i.e., $T^* in cal(B) (Y^* , X^*)$, and its norm is bounded by $norm(T^*) lt.eq norm(T)$.

#proposition[
Let $X$ and $Y$ be Banach spaces, and let $T in cal(B) (X , Y)$. The following properties hold:
1. The norm of the adjoint operator is equal to the norm of the original operator: $ norm(T^*)_(cal(B) (Y^* , X^*)) = norm(T)_(cal(B) (X , Y)). $
2. If $S in cal(B) (Y , Z)$, where $Z$ is another Banach space, then the adjoint of the composition $S T$ is the composition of the adjoints in reverse order: $ (S T)^* = T^* S^* . $
]

#proof[
+ We have already shown that $norm(T^*) lt.eq norm(T)$. To prove the reverse inequality, $norm(T) lt.eq norm(T^*)$, we use a corollary of the Hahn-Banach theorem. For any $x in X$, there exists a functional $f in Y^*$ with $norm(f)_(Y^*) = 1$ such that $f (T x) = norm(T x)_Y$. Then, for this particular $x$: $ norm(T x)_Y = f (T x) = (T^* f) (x) lt.eq norm(T^* f)_(X^*) norm(x)_X lt.eq norm(T^*) norm(f)_(Y^*) norm(x)_X = norm(T^*) norm(x)_X . $ Dividing by $norm(x)_X$ (for $x eq.not 0$) and taking the supremum over all such $x$ gives: $ norm(T) = sup_(x eq.not 0) frac(norm(T x)_Y, norm(x)_X) lt.eq norm(T^*) . $ Combining the two inequalities, we conclude that $norm(T^*) = norm(T)$.

+ For any $g in Z^*$ and $x in X$, we have by definition: $ ((S T)^* g) (x) = g ((S T) x) = g (S (T x)). $ Applying the definition of the adjoint for $S$, we get: $ g (S (T x)) = (S^* g) (T x). $ Applying the definition of the adjoint for $T$, we get: $ (S^* g) (T x) = (T^* (S^* g)) (x) = (T^* S^* g) (x). $ Since this holds for all $x in X$, we have $(S T)^* g = T^* S^* g$. As this is true for all $g in Z^*$, we conclude that $(S T)^* = T^* S^*$.
]



=== Annihilators

To systematically study the relationship between an operator and its adjoint, we introduce the concepts of annihilators and pre-annihilators.

#definition(title: "Annihilator and Pre-annihilator")[
Let $X$ be a Banach space and $X^*$ its dual.
- For a subset $S subset X$, its #strong[annihilator] $ann(S)$ is a subspace of the dual space $X^*$ defined as: $ ann(S) := { f in X^* : f (s) = 0 , forall s in S }. $ 
- For a subset $Sigma subset X^*$, its #strong[pre-annihilator] $preann(Sigma)$ is a subspace of $X$ defined as: $ preann(Sigma) := { x in X : f (x) = 0 , forall f in Sigma } = inter.big_(f in Sigma) ker (f). $
]

It is straightforward to verify that both $ann(S)$ and $preann(Sigma)$ are norm-closed subspaces of $X^*$ and $X$, respectively.

A fundamental result connecting a set to its double annihilator is the #strong[Bipolar Theorem];.

#theorem(title: "Bipolar Theorem")[
Let $X$ be a Banach space.

1. If $A subset X$ is a subset, then $overline(span(A)) = preann((ann(A)))$.
2. If $B subset X^*$ is a subset, then $overline(span(B)) = ann((preann(B)))$, where the closure is taken in the weak-\* topology.
]<thm:bipolar>

#proof[
1. Let $M = overline(span(A))$.
   - *$M subset preann((ann(A)))$*: Let $x in A$. For any $f in ann(A)$, we have $f (x) = 0$. By linearity, this holds for all $x in span (A)$. By continuity, it holds for all $x in overline(span(A)) = M$. Thus, every element of $M$ is annihilated by every functional in $ann(A)$, which means $M subset preann((ann(A)))$.
   
   - *$preann((ann(A))) subset M$*: Suppose there exists an $x_0 in preann((ann(A)))$ such that $x_0 in.not M$. Since $M$ is a closed subspace, by the Hahn-Banach separation theorem, there exists a functional $f in X^*$ such that $f (x_0) = 1$ and $f mid(|)_M = 0$. Since $f$ is zero on $M$, it is certainly zero on $A subset M$, which implies $f in ann(A)$. But since $x_0 in preann((ann(A)))$, we must have $f (x_0) = 0$ for this $f$. This contradicts $f (x_0) = 1$. Therefore, our assumption was false, and we must have $preann((ann(A))) subset M$.
2. The proof is analogous, leveraging the fact that the dual of $X^*$ is isometrically isomorphic to $X$.
]


=== Kernel and Range Relationships

The true power of the adjoint operator lies in the following set of fundamental identities that connect the kernel ($ker$) and range ($ran$) of an operator $T$ with those of its adjoint $T^*$.

#theorem[
Let $X , Y$ be Banach spaces and $T in cal(B) (X , Y)$. The following relationships hold:
1. $ker (T) = preann((ran(T^*)))$.
2. $ker (T^*) = ann((ran(T)))$.
3. $overline(ran(T)) = preann((ker (T^*)))$.
4. $overline(ran(T^*)) = ann((ker (T)))$.
]<thm:ker-range>


#proof[
+ *$ker (T) subset preann((ran(T^*)))$*: Let $x in ker (T)$, so $T x = 0$. For any functional in the range of $T^*$, say $T^* f$ for some $f in Y^*$, we have $(T^* f) (x) = f (T x) = f (0) = 0$. Since this holds for all $f in Y^*$, $x$ is in the pre-annihilator of $ran(T^*)$. 


  *$preann((ran(T^*))) subset ker (T)$*: Let $x in preann((ran(T^*)))$. By definition, this means $(T^* f) (x) = 0$ for all $f in Y^*$. This is equivalent to $f (T x) = 0$ for all $f in Y^*$. By the Hahn-Banach theorem, one can check that $T x = 0$, which implies $x in ker (T)$.

+ This follows directly from the definitions: $ f in ker (T^*) & arrow.l.r.double T^* f = 0\
   & arrow.l.r.double (T^* f) (x) = 0 , quad forall x in X\
   & arrow.l.r.double f (T x) = 0 , quad forall x in X\
   & arrow.l.r.double f "annihilates the set" { T x : x in X }\
   & arrow.l.r.double f in ann((ran(T))). $

+ From part (2), we have $ker (T^*) = ann((ran(T)))$. Taking the pre-annihilator of both sides gives $preann((ker (T^*))) = preann((ann((ran(T)))))$. By the Bipolar Theorem (@thm:bipolar), $preann((ann((ran(T))))) = overline(span(ran(T)))$. Since $ran(T)$ is a subspace, its span is itself. Thus, $(ker (T^*))_0 = overline(ran(T))$.

+ From part (1), we have $ker (T) = preann((ran(T^*)))$. Taking the annihilator of both sides gives $ann((ker (T))) = ann((preann((ran(T^*)))))$. By the Bipolar Theorem for the dual space, this is equal to the weak-\* closure of the span of $ran(T^*)$. Since $ran(T^*)$ is a subspace, this is simply $overline(ran(T^*))$.
]


These identities lead to profound connections between the properties of $T$ and $T^*$.

#proposition[
1. $T$ is injective if and only if the range of $T^*$ is weak-\* dense in $X^*$.
2. $T^*$ is injective if and only if the range of $T$ is norm-dense in $Y$.
]<prp:injective>

#proof[
1. $T$ is injective $arrow.l.r.double ker (T) = { 0 }$. By @thm:ker-range (4), this is equivalent to $overline(ran(T^*)) = ann({ 0 }) = X^*$.
2. $T^*$ is injective $arrow.l.r.double ker (T^*) = { 0 }$. By @thm:ker-range (3), this is equivalent to $overline(ran(T)) = preann({ 0 }) = Y$.
]

=== Closed Range and Surjectivity

The relationship between an operator and its adjoint becomes even more powerful when considering operators with a closed range. An operator that is injective and has a closed range is called an #strong[isomorphism "into"];.

#definition(title: [Isomorphism "Into"])[
An operator $T in cal(B) (X , Y)$ is an #strong[isomorphism "into"] if it is an isomorphism from $X$ onto its range, $ran(T)$. This is equivalent to $T$ being injective and having a closed range.
]

A simple sufficient condition for this property is that the operator is "bounded below".

#theorem[
Let $X , Y$ be Banach spaces, and $T in cal(B) (X , Y)$. If there exists a constant $delta > 0$ such that for all $x in X$,
$
norm(T x) gt.eq delta norm(x),
$ then $T$ is an isomorphism "into" (and thus has a closed range).
]

#proof[
The condition immediately implies injectivity: if $T x = 0$, then $delta norm(x) lt.eq 0$, so $x = 0$. To show the range is closed, let ${ y_n }$ be a sequence in $ran(T)$ with $y_n arrow.r y in Y$. For each $n$, there is an $x_n in X$ such that $y_n = T x_n$. The sequence ${ T x_n }$ is convergent, hence Cauchy. We have:
$
norm(x_n - x_m) lt.eq 1 / delta norm(T (x_n - x_m)) = 1 / delta norm(T x_n - T x_m) arrow.r 0 quad "as" n , m arrow.r infinity.
$ Thus, ${ x_n }$ is a Cauchy sequence in the Banach space $X$, so it converges to some $x in X$. By the continuity of $T$, $T x_n arrow.r T x$. Since we already know $T x_n = y_n arrow.r y$, by the uniqueness of limits, we must have $y = T x$. This shows $y in ran(T)$, so the range is closed.
]

The following theorem, a cornerstone of functional analysis, links surjectivity of an operator to the properties of its adjoint. Its proof relies on the #strong[Closed Range Theorem];, which states that for $T in cal(B) (X , Y)$, $ran(T)$ is closed if and only if $ran(T^*)$ is closed.

#theorem[
Let $X , Y$ be Banach spaces and $T in cal(B) (X , Y)$. Then:
1. $T$ is surjective if and only if its adjoint $T^*$ is an isomorphism "into".
2. $T^*$ is surjective if and only if $T$ is an isomorphism "into".
]

#proof[

+ $T$ is surjective $arrow.l.r.double ran(T) = Y$. This is equivalent to two conditions: (a) $ran(T)$ is dense in $Y$, and (b) $ran(T)$ is closed in $Y$.
  - From @prp:injective, condition (a) is equivalent to $ker (T^*) = { 0 }$ (i.e., $T^*$ is injective).
  - By the Closed Range Theorem, condition (b) is equivalent to $ran(T^*)$ being closed.
  - Therefore, $T$ is surjective if and only if $T^*$ is injective and has a closed range, which is the definition of an isomorphism "into".
+ $T^*$ is surjective $arrow.l.r.double ran(T^*) = X^*$. This is equivalent to (a) $ran(T^*)$ is dense in $X^*$, and (b) $ran(T^*)$ is closed in $X^*$.
  - From @prp:injective, condition (a) (in the weak-\* sense) is equivalent to $ker (T) = { 0 }$ (i.e., $T$ is injective).
  - By the Closed Range Theorem, condition (b) is equivalent to $ran(T)$ being closed.
  - Therefore, $T^*$ is surjective if and only if $T$ is injective and has a closed range, which is the definition of an isomorphism "into".
]
