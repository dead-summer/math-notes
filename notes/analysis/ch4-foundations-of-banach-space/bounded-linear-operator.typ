#import "../book.typ": *

#show: book-page.with(
  title: "4.2 Bounded Linear Operator"
)

== Bounded Linear Operator

=== Definitions and Fundamental Properties

#definition(title: "Bounded Linear Operator")[
Let $(X , norm(dot.op)_X)$ and $(Y , norm(dot.op)_Y)$ be normed vector spaces over the same scalar field $bb(F)$ (where $bb(F)$ is $bb(R)$ or $bb(C)$). A linear operator $T : X arrow.r Y$ is called a #strong[bounded linear operator] if there exists a real constant $M gt.eq 0$ such that for all $x in X$, the following inequality holds:

$ norm(T x)_Y lt.eq M norm(x)_X. $
]<def:bounded-linear-operator>

The set of all bounded linear operators from $X$ to $Y$ is denoted by $cal(B) (X , Y)$.
- If the codomain $Y$ is the scalar field $bb(F)$, then $cal(B) (X , bb(F))$ is called the #strong[dual space] of $X$ and is denoted by $X^*$. Its elements are called #strong[bounded linear functionals];.
- If the domain and codomain are the same, i.e., $Y = X$, we write $cal(B) (X)$ instead of $cal(B) (X , X)$.

#definition(title: "Operator Norm")[
For a bounded linear operator $T in cal(B) (X , Y)$, the #strong[operator norm] of $T$, denoted by $norm(T)$, is the smallest constant $M$ that satisfies the inequality in @def:bounded-linear-operator. It is formally defined as:

$ norm(T) = inf { M gt.eq 0 : norm(T x)_Y lt.eq M norm(x)_X "for all" x in X }. $
]





This definition has several equivalent and useful formulations:

$ norm(T) = sup_(x eq.not 0) frac(norm(T x)_Y, norm(x)_X) = sup_(norm(x)_X = 1) norm(T x)_Y = sup_(norm(x)_X lt.eq 1) norm(T x)_Y. $

The equivalence of these forms is a direct consequence of the linearity of $T$. For any $x eq.not 0$, the vector $u = x \/ norm(x)_X$ is a unit vector. Thus,

$ frac(norm(T x)_Y, norm(x)_X) = norm(frac(T (x), norm(x)_X))_Y = norm(T (frac(x, norm(x)_X)))_Y = norm(T u)_Y, $

which shows that the supremum over all non-zero vectors is the same as the supremum over all unit vectors.

From the definition, the fundamental inequality for a bounded linear operator is: $ norm(T x)_Y lt.eq norm(T) norm(x)_X , quad forall x in X $

The set $cal(B) (X , Y)$ forms a vector space under the standard operations of operator addition and scalar multiplication. The operator norm defined above turns $cal(B) (X , Y)$ into a normed vector space.


A crucial property of the space of bounded operators is that it inherits completeness from its codomain.

#theorem[
Let $X$ be a normed vector space and $Y$ be a Banach space. Then the space $(cal(B) (X , Y) , norm(dot.op))$ is also a Banach space.
]

#proof[
Let ${ T_n }_(n = 1)^oo$ be a Cauchy sequence in $cal(B) (X , Y)$. By definition, for any $epsilon > 0$, there exists an integer $N$ such that $norm(T_n - T_j) < epsilon$ for all $n , j > N$. For any $x in X$, consider the sequence ${ T_n x }$ in $Y$:

$ norm(T_n x - T_j x)_Y = norm((T_n - T_j) x)_Y lt.eq norm(T_n - T_j) norm(x)_X < epsilon norm(x)_X. $

Since $norm(T_n - T_j) arrow.r 0$ as $n , j arrow.r oo$, the sequence ${ T_n x }$ is a Cauchy sequence in $Y$. Since $Y$ is a Banach space (i.e., complete), the sequence ${ T_n x }$ converges to some element in $Y$.

Let's define an operator $T : X arrow.r Y$ by $T x := lim_(n arrow.r oo) T_n x$. It's straightforward to show that $T$ is a linear operator. To show that $T$ is bounded and that $T_n arrow.r T$ in operator norm, we use the Cauchy property. For any $n , j > N$, we have $norm(T_n - T_j) < epsilon$. This implies that for any $x$ with $norm(x)_X lt.eq 1$, $norm(T_n x - T_j x)_Y < epsilon$. Taking the limit as $j arrow.r oo$, we get $norm(T_n x - T x)_Y lt.eq epsilon$. Taking the supremum over all $x$ with $norm(x)_X lt.eq 1$, we obtain $norm(T_n - T) lt.eq epsilon$. This shows that the sequence ${ T_n }$ converges to $T$ in the operator norm. The boundedness of $T$ follows from the fact that $T$ is the limit of bounded operators, as $norm(T) lt.eq norm(T_N - T) + norm(T_N) < oo$.
]

#corollary[
For any normed vector space $X$, its dual space $X^*$ is a Banach space.
]

For linear operators, the topological property of continuity is equivalent to the algebraic property of boundedness.

#proposition[
For a linear operator $T : X arrow.r Y$ between normed spaces, the following statements are equivalent:
1. $T$ is bounded.
2. $T$ is uniformly continuous on $X$.
3. $T$ is continuous on $X$.
4. $T$ is continuous at a single point in $X$ (e.g., at the origin $0_X$).
]

#proof[
- #strong[1 $arrow.r.double$ 2:] If $T$ is bounded, then for any $x , y in X$, $norm(T x - T y)_Y = norm(T (x - y))_Y lt.eq norm(T) norm(x - y)_X$. This shows that $T$ is Lipschitz continuous, which implies uniform continuity.
- #strong[2 $arrow.r.double$ 3:] Uniform continuity implies continuity.
- #strong[3 $arrow.r.double$ 4:] Continuity on the entire space implies continuity at any single point.
- #strong[4 $arrow.r.double$ 1:] Assume $T$ is continuous at the origin $0_X$. Then for $epsilon = 1$, there exists a $delta > 0$ such that if $norm(x)_X < delta$, then $norm(T x)_Y < 1$. Now, for any non-zero $z in X$, consider the vector $x = frac(delta, 2 norm(z)_X) z$. We have $norm(x)_X = delta \/ 2 < delta$, so $norm(T x)_Y < 1$. By linearity:

  $ norm(T (frac(delta, 2 norm(z)_X)) z)_Y = frac(delta, 2 norm(z)_X) norm(T z)_Y < 1 arrow.r.double.long norm(T z)_Y < 2 / delta norm(z)_X. $
  
  This inequality holds for all $z in X$. Thus, $T$ is bounded with $M = 2 \/ delta$.
]

This equivalence is powerful because it allows us to establish global continuity by simply checking the operator's behavior at the origin or by finding a bounding constant.



=== Illustrative Examples

==== Operators on Finite-Dimensional Spaces

Any linear transformation $T : bb(F)^n arrow.r bb(F)^m$ is a bounded linear operator. If we represent $T$ by an $m times n$ matrix $A$, its operator norm depends on the choice of norms for $bb(F)^n$ and $bb(F)^m$. Since all norms on a finite-dimensional space are equivalent, every linear operator between finite-dimensional spaces is bounded.

==== Diagonal Operators on $ell^p$

Let $X = ell^p (bb(C))$ for $1 lt.eq p lt.eq oo$. Let ${ lambda_k }_(k = 1)^oo$ be a sequence of scalars. Define the diagonal operator $Lambda : X arrow.r X$ by:

$ Lambda (x_1 , x_2 , dots.h) = (lambda_1 x_1 , lambda_2 x_2 , dots.h). $

The operator $Lambda$ is a bounded linear operator if and only if the sequence ${ lambda_k }$ is bounded, i.e., ${ lambda_k } in ell^oo$. Furthermore, the operator norm is given by:

$ norm(Lambda)_(cal(B) (X)) = sup_(k gt.eq 1) abs(lambda_k) = norm({ lambda_k })_(ell^oo). $

This shows an *isometric isomorphism* between the space of bounded diagonal operators on $ell^p$ and the sequence space $ell^oo$.

#proof[
Let's formally prove the statement that $Lambda$ is a bounded linear operator if and only if ${ lambda_k } in ell^oo$, and that the operator norm equals the $ell^oo$ norm of the sequence.

1. #strong[If ${ lambda_k } in ell^oo$, then $Lambda$ is a bounded linear operator and $norm(Lambda)_(cal(B) (X)) lt.eq norm({ lambda_k })_(ell^oo)$.]

  Assume ${ lambda_k } in ell^oo$. By definition, this means $sup_k abs(lambda_k) = M < oo$. For any $x = (x_1 , x_2 , dots.h) in ell^p$, we need to show that $Lambda x in ell^p$ and that $norm(Lambda x)_(ell^p) lt.eq C norm(x)_(ell^p)$ for some constant $C$. For $1 lt.eq p < oo$:
  
  $ norm(Lambda x)_(ell^p)^p = sum_(k = 1)^oo abs(lambda_k x_k)^p = sum_(k = 1)^oo abs(lambda_k)^p abs(x_k)^p . $
  
  Since $abs(lambda_k) lt.eq M$ for all $k$, we have $abs(lambda_k)^p lt.eq M^p$. Therefore,
  
  $ sum_(k = 1)^oo abs(lambda_k)^p abs(x_k)^p lt.eq sum_(k = 1)^oo M^p abs(x_k)^p = M^p sum_(k = 1)^oo abs(x_k)^p = M^p norm(x)_(ell^p)^p . $
  
  Taking the $p$-th root, we get $norm(Lambda x)_(ell^p) lt.eq M norm(x)_(ell^p) = norm({ lambda_k })_(ell^oo) norm(x)_(ell^p)$. This shows that $Lambda$ is a bounded operator and $norm(Lambda)_(cal(B) (X)) lt.eq norm({ lambda_k })_(ell^oo)$.

  For $p = oo$:
  
  $ norm(Lambda x)_(ell^oo) = sup_(k gt.eq 1) abs(lambda_k x_k) lt.eq sup_(k gt.eq 1) (abs(lambda_k) abs(x_k)) lt.eq (sup_(k gt.eq 1) abs(lambda_k)) (sup_(k gt.eq 1) abs(x_k)) = norm({ lambda_k })_(ell^oo) norm(x)_(ell^oo) . $
  
  Thus, $Lambda$ is bounded with $norm(Lambda)_(cal(B) (X)) lt.eq norm({ lambda_k })_(ell^oo)$.

2. #strong[If $Lambda$ is a bounded linear operator, then ${ lambda_k } in ell^oo$ and $norm(Lambda)_(cal(B) (X)) gt.eq norm({ lambda_k })_(ell^oo)$.]

  Assume $Lambda$ is bounded. This means there exists a constant $C$ such that $norm(Lambda x)_(ell^p) lt.eq C norm(x)_(ell^p)$ for all $x in ell^p$. Consider the standard basis vectors $e_k = (0 , dots.h , 0 , 1 , 0 , dots.h)$, where the $1$ is in the $k$-th position. Each $e_k in ell^p$ and $norm(e_k)_(ell^p) = 1$. Applying the operator to $e_k$, we get:
  
  $ Lambda e_k = Lambda (0 , dots.h , 1 , dots.h) = (0 , dots.h , lambda_k , dots.h) = lambda_k e_k . $
  
  Now, let's calculate the norm of $Lambda e_k$: $ norm(Lambda e_k)_(ell^p) = norm(lambda_k e_k)_(ell^p) = abs(lambda_k) norm(e_k)_(ell^p) = abs(lambda_k) . $ By the definition of a bounded operator, we have:

  $ norm(Lambda e_k)_(ell^p) lt.eq norm(Lambda)_(cal(B) (X)) norm(e_k)_(ell^p) = norm(Lambda)_(cal(B) (X)) dot.op 1 . $
  
  Therefore, $abs(lambda_k) lt.eq norm(Lambda)_(cal(B) (X))$ for every $k gt.eq 1$. This implies that the sequence ${ lambda_k }$ is bounded, i.e., ${ lambda_k } in ell^oo$. Since the inequality holds for all $k$, we must also have $sup_k abs(lambda_k) lt.eq norm(Lambda)_(cal(B) (X))$, which is exactly $norm({ lambda_k })_(ell^oo) lt.eq norm(Lambda)_(cal(B) (X))$.

Combining the two parts, we have proven that $Lambda$ is a bounded linear operator if and only if ${ lambda_k } in ell^oo$, and that the operator norm is equal to the $ell^oo$ norm of the sequence.
]

==== Shift Operators on $ell^p$

Let $X = ell^p$. The #strong[left shift operator] $L$ and #strong[right shift operator] $R$ are defined as:
- $L (x_1 , x_2 , x_3 , dots.h) = (x_2 , x_3 , x_4 , dots.h)$.
- $R (x_1 , x_2 , x_3 , dots.h) = (0 , x_1 , x_2 , dots.h)$.

Both are bounded linear operators with $norm(L) = norm(R) = 1$.

- $L$ is surjective but not injective (its kernel contains the vector $(1 , 0 , 0 , dots.h)$).
- $R$ is injective but not surjective (its range does not contain vectors with a non-zero first component).

Note that $L R = upright("id")$ (the identity operator), but $R L eq.not upright("id")$. This illustrates that composition in $cal(B) (X)$ is non-commutative.


==== An Integral Operator

Consider $X = C ([ a , b ])$, the space of continuous functions on $[ a , b ]$ with the sup-norm, $norm(f)_(ell^oo) = sup_(x in [ a , b ]) abs(f (x))$. Define the integral operator $I : X arrow.r X$ by:

$ (I f) (x) = integral_a^x f (y) dif y. $

This is a bounded linear operator. To find its norm:

$ abs((I f) (x)) = abs(integral_a^x f (y) dif y) lt.eq integral_a^x abs(f (y)) dif y lt.eq norm(f)_(ell^oo) integral_a^x dif y = (x - a) norm(f)_(ell^oo) lt.eq (b - a) norm(f)_(ell^oo). $

Taking the supremum over $x$, we get $norm(I f)_(ell^oo) lt.eq (b - a) norm(f)_(ell^oo)$. Thus, $norm(I) lt.eq b - a$. For the function $f (x) equiv 1$, we have $norm(f)_(ell^oo) = 1$ and $(I f) (x) = x - a$, so $norm(I f)_(ell^oo) = b - a$. Therefore, the norm is attained, and $norm(I) = b - a$.

==== A Norm that is Not Attained

Let $X = C ([ - 1 , 1 ])$ with the sup-norm. Define the linear functional $T : X arrow.r bb(R)$ by:

$ T f = integral_0^1 f (t) dif t - integral_(- 1)^0 f (t) dif t. $

For any $f in X$ with $norm(f)_(ell^oo) lt.eq 1$:

$ abs(T f) lt.eq integral_0^1 abs(f (t)) dif t + integral_(- 1)^0 abs(f (t)) dif t lt.eq integral_0^1 1 dif t + integral_(- 1)^0 1 dif t = 1 + 1 = 2. $

This shows $norm(T) lt.eq 2$. To show that $norm(T) = 2$, consider a sequence of functions $f_n in X$ that approximate the discontinuous function which is $+ 1$ on $(0 , 1 ]$ and $- 1$ on $[ - 1 , 0)$. For such a sequence, $T f_n arrow.r 2$. However, there is no function $f_* in C ([ - 1 , 1 ])$ with $norm(f_*)_(ell^oo) = 1$ for which $abs(T f_*) = 2$. This would require $f_* (t)$ to be simultaneously $1$ and $- 1$ at $t = 0$, which contradicts continuity. This is an example where the supremum in the definition of the norm is not a maximum.

==== An Unbounded Inverse Operator

Let $X = c_0 subset ell^infinity$, the space of sequences converging to zero, with the sup-norm $norm(dot.op)_(ell^infinity)$. This is a Banach space. Consider the diagonal operator $T : X arrow.r X$:

$ T (a_1 , a_2 , a_3 , dots.h) = (a_1 , a_2 \/ 2 , a_3 \/ 3 , dots.h). $

$T$ is a bounded linear operator with $norm(T) = sup_n abs(1 \/ n) = 1$. The operator is bijective, and its inverse is given by:

$ T^(- 1) (b_1 , b_2 , b_3 , dots.h) = (b_1 , 2 b_2 , 3 b_3 , dots.h). $

The domain of $T^(- 1)$ is the range of $T$, which is a subspace of $c_0$. However, $T^(- 1)$ is not a bounded operator. To see this, consider the standard basis vectors $e_n$ (with a $1$ in the $n$-th position and zeros elsewhere). We have $norm(e_n)_(ell^infinity) = 1$.

$ norm(T^(- 1) e_n)_(ell^infinity) = norm((0 , dots.h , n , dots.h))_(ell^infinity) = n. $

Since $sup_(norm(x) = 1) norm(T^(- 1) x)_(ell^infinity) gt.eq norm(T^(- 1) e_n)_(ell^infinity) = n$ for any $n in bb(N)$, the norm $norm(T^(- 1))$ is not finite. Thus, $T^(- 1)$ is an #strong[unbounded] linear operator.



=== The Group of Invertible Operators

The previous example shows that even if an operator in $cal(B) (X)$ has a linear inverse, that inverse is not guaranteed to be bounded. The completeness of the space $X$ is essential to ensure this property.

#theorem(title: "Bounded Inverse Theorem")[
If $X$ is a Banach space and $T in cal(B) (X)$ is a bijective linear operator, then its inverse $T^(- 1)$ is also a bounded linear operator, i.e., $T^(- 1) in cal(B) (X)$.
]<thm:bounded-inverse>

This theorem motivates the following definition.

#definition(title: "Isomorphism and Automorphism")[
An #strong[isomorphism] between normed spaces $X$ and $Y$ is a bijective linear operator $T : X arrow.r Y$ such that both $T$ and $T^(- 1)$ are bounded. If such a map exists, $X$ and $Y$ are said to be isomorphic.

An isomorphism from $X$ to itself is called an #strong[automorphism];. The set of all automorphisms of $X$ is denoted by $aut(X)$.
]

$aut(X)$ forms a group under composition. The following theorem describes its topological structure within the space $cal(B) (X)$.

#theorem[
If $X$ is a Banach space, then $aut(X)$ is an open subset of $cal(B) (X)$.
]

#proof[
We need to show that for any $S in aut(X)$, there exists an open ball centered at $S$ that is entirely contained in $aut(X)$. Let $S in aut(X)$. By @thm:bounded-inverse, $S^(- 1)$ is bounded. Consider any operator $T in cal(B) (X)$ such that:

$ norm(T - S) < frac(1, norm(S^(- 1))). $

We can write $T$ as $T = S - (S - T) = S (I - S^(- 1) (S - T))$. Let $U = S^(- 1) (S - T)$. The norm of $U$ is:

$ norm(U) = norm(S^(- 1) (S - T)) lt.eq norm(S^(- 1)) norm(S - T) < norm(S^(- 1)) frac(1, norm(S^(- 1))) = 1. $

So, $norm(U) < 1$. We now invoke the result on #strong[Neumann series];: If $norm(U) < 1$, then the operator $(I - U)$ is invertible, and its inverse is given by the absolutely convergent series:

$ (I - U)^(- 1) = sum_(k = 0)^oo U^k. $

Since $X$ is a Banach space, $cal(B) (X)$ is also a Banach space, ensuring this series converges in the operator norm to a bounded operator.

Since $T = S (I - U)$, and both $S$ and $(I - U)$ are invertible bounded operators, their composition $T$ is also an invertible bounded operator. Therefore, $T in aut(X)$. This shows that any operator $T$ in the open ball $B (S , 1 \/ norm(S^(- 1)))$ is an automorphism. Hence, $aut(X)$ is an open set in $cal(B) (X)$.
]
