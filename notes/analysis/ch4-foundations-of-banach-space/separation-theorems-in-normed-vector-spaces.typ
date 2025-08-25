#import "../book.typ": *

#show: book-page.with(
  title: "4.6 Separation Theorems in Normed Vector Spaces"
)

== Separation Theorems in Normed Vector Spaces

This interion explores the concept of separating convex sets in vector spaces using continuous linear functionals. The cornerstone of this theory is the Hahn-Banach theorem. A key tool used in its proof is the Minkowski functional, which provides a way to generate a seminorm from a convex set.

=== The Minkowski Functional

We begin by defining a functional associated with a subset of a vector space. This functional measures how much the set must be scaled to contain a given vector.

#definition(title: "Minkowski Functional")[
Let $X$ be a vector space over a field $bb(F)$ (where $bb(F) = bb(R)$ or $bb(C)$), and let $A subset.eq X$. The #strong[Minkowski functional] (or gauge functional) of $A$ is the function $mu_A : X arrow.r \[ 0 , oo \]$ defined by $ mu_A (x) := inf { t > 0 : x in t A } . $ By convention, the infimum of an empty set is $oo$.
]

For $mu_A (x)$ to be finite for all $x in X$, the set $A$ must have a certain property.

#definition(title: "Absorbing Set")[
A set $A subset.eq X$ is #strong[absorbing] if for every $x in X$, there exists some $t > 0$ such that $x in t A$.
]

#remark[
If $A$ is an absorbing set, then $mu_A (x)$ is finite for all $x in X$. In any topological vector space, any neighborhood (open or not) of the origin is an absorbing set.
]

#definition(title: "Balanced Set")[
A set $B subset.eq X$ is #strong[balanced] (or circled) if for every $lambda in bb(F)$ with $abs(lambda) lt.eq 1$, we have $lambda B subset.eq B$.
]

Minkowski functionals are deeply connected to seminorms and, more generally, sublinear functionals.

#definition[
Let $p : X arrow.r \[ 0 , oo \)$ be a functional on a vector space $X$.

- $p$ is a #strong[seminorm] if it is absolutely homogeneous ($p (lambda x) = abs(lambda) p (x)$) and subadditive ($p (x + y) lt.eq p (x) + p (y)$).
- $p$ is a #strong[sublinear functional] if it is positively homogeneous ($p (lambda x) = lambda p (x)$ for $lambda gt.eq 0$) and subadditive.

Every seminorm is a sublinear functional, but the converse is not true.
]

The following theorems establish the precise relationship between these concepts.

#theorem[
Let $p$ be a seminorm on a vector space $X$. Then:

1. $p (0) = 0$.
2. $abs(p (x) - p (y)) lt.eq p (x - y)$ for all $x , y in X$.
3. The set ${ x in X : p (x) = 0 }$ is a subspace of $X$.
4. The set $ball = { x in X : p (x) < 1 }$ is a convex, balanced, and absorbing set, and its Minkowski functional is the seminorm itself, i.e., $mu_ball = p$.
]<thm:seminorm>

#proof[
1. $p (0) = p (0 dot.op x) = 0 dot.op p (x) = 0$.

2. By the triangle inequality, $p (x) = p (x - y + y) lt.eq p (x - y) + p (y)$, which implies $p (x) - p (y) lt.eq p (x - y)$. By symmetry, interchanging $x$ and $y$ yields $p (y) - p (x) lt.eq p (y - x) = p (- (x - y)) = abs(- 1) p (x - y) = p (x - y)$. Combining these gives $abs(p (x) - p (y)) lt.eq p (x - y)$.

3. Let $N = { x in X : p (x) = 0 }$. For any $x , y in N$ and $lambda , eta in bb(F)$, we have $0 lt.eq p (lambda x + eta y) lt.eq p (lambda x) + p (eta y) = abs(lambda) p (x) + abs(eta) p (y) = 0$. Thus, $p (lambda x + eta y) = 0$, which shows $N$ is a subspace.

4. We prove point by point:

  - #strong[Convexity:] For any $x , y in ball$ and $theta in [0, 1]$, we have $p (x) < 1$ and $p (y) < 1$. Then $p (theta x + (1 - theta) y) lt.eq theta p (x) + (1 - theta) p (y) < theta + (1 - theta) = 1$. Thus, $theta x + (1 - theta) y in ball$.
  
  - #strong[Balanced:] For $x in ball$ and $abs(lambda) lt.eq 1$, $p (lambda x) = abs(lambda) p (x) lt.eq p (x) < 1$. So $lambda x in ball$.
  
  - #strong[Absorbing:] For any $x in X$, if $p (x) = 0$, then $x in t ball$ for all $t > 0$. If $p (x) > 0$, choose any $t > p (x)$. Then $p (x \/ t) = (1 \/ t) p (x) < 1$, which implies $x \/ t in ball$, so $x in t ball$.
  
  - #strong[$mu_ball = p$];: We need to show $mu_ball (x) = p (x)$ for all $x in X$. The argument for absorbing shows that for any $epsilon > 0$, $x in (p (x) + epsilon) ball$. This implies $mu_ball (x) lt.eq p (x) + epsilon$. Since $epsilon$ is arbitrary, $mu_ball (x) lt.eq p (x)$. For the other direction, let $t > 0$ be such that $x in t ball$. By definition of $ball$, this means $p (x \/ t) < 1$, which implies $p (x) < t$. Taking the infimum over all such $t$ yields $p (x) lt.eq mu_ball (x)$. Combining both inequalities, we have $mu_ball (x) = p (x)$.
]

#theorem[
Let $A$ be a convex and absorbing subset of a vector space $X$.

1. The Minkowski functional $mu_A$ is a sublinear functional.

2. If, in addition, $A$ is balanced, then $mu_A$ is a seminorm. In this case, ${ x : mu_A (x) < 1 } subset.eq A subset.eq { x : mu_A (x) lt.eq 1 }$.
]

#proof[
1. We check the definition of sublinear functionals in turn:

  - #strong[Positive Homogeneity:] For $lambda > 0$, $mu_A (lambda x) = inf { t > 0 : lambda x in t A } = inf { t > 0 : x in (t \/ lambda) A }$. Let $s = t \/ lambda$. Then $mu_A (lambda x) = inf { lambda s > 0 : x in s A } = lambda inf { s > 0 : x in s A } = lambda mu_A (x)$.
  
  - #strong[Subadditivity:] Let $epsilon > 0$. Choose $t > mu_A (x)$ and $s > mu_A (y)$ such that $t < mu_A (x) + epsilon$ and $s < mu_A (y) + epsilon$. Then $x in t A$ and $y in s A$. This means $x \/ t in A$ and $y \/ s in A$. Since $A$ is convex:
    
    $ frac(t, t + s) (x / t) + frac(s, t + s) (y / s) = frac(x + y, t + s) in A . $
    
    This implies $x + y in (t + s) A$, so $mu_A (x + y) lt.eq t + s < mu_A (x) + mu_A (y) + 2 epsilon$. Since $epsilon > 0$ was arbitrary, we conclude $mu_A (x + y) lt.eq mu_A (x) + mu_A (y)$.

2. If $A$ is balanced, we must show $mu_A (lambda x) = abs(lambda) mu_A (x)$ for any $lambda in bb(F)$. Let $lambda in bb(F) , lambda eq.not 0$. Write $lambda = abs(lambda) e^(imUnit theta)$. Since $A$ is balanced, $e^(imUnit theta) A = A$. Then:
  
  $
  mu_A (lambda x) &= mu_A (abs(lambda) e^(imUnit theta) x) \
  &= inf { t > 0 : abs(lambda) e^(imUnit theta) x in t A } \
  &= inf { t > 0 : abs(lambda) x in t (e^(- imUnit theta) A) } \
  &= inf { t > 0 : abs(lambda) x in t A } = mu_A (abs(lambda) x) .
  $
  
  Since $abs(lambda) gt.eq 0$, by positive homogeneity from part 1, $mu_A (abs(lambda) x) = abs(lambda) mu_A (x)$.

  For the inclusion relations:

    - If $mu_A (x) < 1$, there exists $t in (mu_A (x) , 1)$ such that $x in t A$. As $A$ is absorbing, $0 in A$. By convexity, $x = t (x \/ t) + (1 - t) 0 in A$. Thus, ${ x : mu_A (x) < 1 } subset.eq A$.
    - If $x in A$, then $x in 1 dot.op A$, so by definition, $mu_A (x) lt.eq 1$. Thus, $A subset.eq { x : mu_A (x) lt.eq 1 }$.
]

#example[
Let $X = bb(R)^2$. The function $p (x_1 , x_2) = abs(x_2)$ is a seminorm. The set $ball = { x in bb(R)^2 : p (x) < 1 }$ is the open slab ${ (x_1 , x_2) : - 1 < x_2 < 1 }$. By @thm:seminorm, $p = mu_ball$.
]

=== The Hahn-Banach Separation Theorem

The Hahn-Banach theorem is a central result in functional analysis. Its analytic form guarantees the extension of a bounded linear functional from a subspace to the whole space. A powerful geometric consequence is that disjoint convex sets can be separated by a hyperplane.

#definition(title: "Hyperplanes")[
A closed *hyperplane* in a real normed space $X$ is a set of the form $H = { x in X : f (x) = lambda }$ for some non-zero $f in X^*$ and $lambda in bb(R)$. Such a hyperplane separates $X$ into two closed half-spaces, ${ x : f (x) lt.eq lambda }$ and ${ x : f (x) gt.eq lambda }$.
]

#theorem(title: "Hahn-Banach Separation Theorem")[
Let $X$ be a real normed vector space, and let $A , B subset.eq X$ be non-empty, disjoint, convex subsets.

1. #strong[Open Set Separation:] If $A$ is open, then there exists a functional $f in X^*$ and a scalar $lambda in bb(R)$ such that
  
  $ f (a) < lambda lt.eq f (b) quad "for all" a in A , b in B . $
  
  The functional $f$ and hyperplane ${ x : f (x) = lambda }$ are said to #emph[separate] $A$ and $B$.

2. #strong[Compact-Closed Separation:] If $A$ is compact and $B$ is closed, then there exist $g in X^*$, and $c_1 , c_2 in bb(R)$ such that

  $ g (a) lt.eq c_1 < c_2 lt.eq g (b) quad "for all" a in A , b in B . $

  This is called #emph[strict separation];.
]

#proof[
1. The proof relies on the analytic form of the Hahn-Banach theorem (@thm:hahn-banach-extension).

  + #strong[Construct an auxiliary set.] Choose $a_0 in A$ and $b_0 in B$. Define $x_0 = b_0 - a_0$ and consider the set $Omega = A - B - x_0 = { a - b - x_0 : a in A , b in B }$. Then
    
    - $Omega$ is convex because $A$ and $- B$ are convex.
    
    - $Omega$ is open because $A$ is open ($Omega = union.big_(y in - B - x_0) (A + y)$ is a union of open sets).
    
    - $0 = a_0 - b_0 - x_0 in Omega$.
    
    - $- x_0 in.not Omega$. If it were, then $- x_0 = a - b - x_0$ for some $a in A , b in B$, which implies $a = b$, contradicting $A inter B = nothing$.

  + #strong[Define a sublinear functional.] Since $Omega$ is a convex, absorbing (as it's a neighborhood of $0$), its Minkowski functional $mu_Omega$ is sublinear. Since $- x_0 in.not Omega$, we must have $mu_Omega (- x_0) gt.eq 1$.

  + #strong[Apply Hahn-Banach.] Define a linear functional $f_0$ on the subspace $M = span(- x_0)$ by $f_0 (lambda (- x_0)) = lambda mu_Omega (- x_0)$.

    - For $lambda gt.eq 0$, $f_0 (lambda (- x_0)) = lambda mu_Omega (- x_0) = mu_Omega (lambda (- x_0))$.
    - For $lambda < 0$, $f_0 (lambda (- x_0)) = lambda mu_Omega (- x_0) lt.eq 0 lt.eq mu_Omega (lambda (- x_0))$.
    
    Thus, $f_0 (y) lt.eq mu_Omega (y)$ for all $y in M$. By the Hahn-Banach Extension Theorem, there exists a linear functional $f : X arrow.r bb(R)$ such that $f (y) lt.eq mu_Omega (y)$ for all $y in X$ and $f (- x_0) = mu_Omega (- x_0) gt.eq 1$.

  + #strong[Show the functional is continuous.] Since $Omega$ is an open neighborhood of $0$, it contains an open ball $ball (0, rho)$ for some $rho > 0$. For any $x$ with $norm(x) lt.eq 1$, $rho x in Omega$, so $mu_Omega (rho x) lt.eq 1$, which implies $mu_Omega (x) lt.eq 1 \/ rho$. Then for any $x in X$, $f (x) lt.eq mu_Omega (x)$ and $f (x) = - f (- x) gt.eq - mu_Omega (- x)$. This makes $f$ bounded (i.e., $f in X^*$).

  + #strong[Establish separation.] For any $a in A , b in B$, the element $a - b - x_0$ is in $Omega$. Therefore, $mu_Omega (a - b - x_0) lt.eq 1$. Since $f$ is dominated by $mu_Omega$, we have $f (a - b - x_0) lt.eq mu_Omega (a - b - x_0) lt.eq 1$. By linearity, $f (a) - f (b) - f (x_0) lt.eq 1$. Since $f (x_0) = - f (- x_0) = - mu_Omega (- x_0) lt.eq - 1$, we get: $f (a) - f (b) lt.eq 1 + f (x_0) lt.eq 1 - 1 = 0 arrow.r.double.long f (a) lt.eq f (b)$. Let $lambda = sup_(a in A) f (a)$. Then $f (a) lt.eq lambda$ for all $a in A$, and from the above, $lambda lt.eq inf_(b in B) f (b)$, so $f (a) lt.eq lambda lt.eq f (b)$. Since $A$ is open, the set $f (A)$ is an open interval in $bb(R)$. Therefore, $f (a) < lambda$ for all $a in A$. This gives the desired separation: $f (a) < lambda lt.eq f (b)$.

2. The proof of this part relies on the first part of the theorem, the Open Set Separation.

  + #strong[Step 1: Construct a new set.] Let $A$ be a compact, convex set and $B$ be a closed, convex set in a normed vector space $X$. Since $A$ is compact and $B$ is closed, they are disjoint. Hence, the distance between them is positive: $dist(A, B) = inf_(a in A , b in B) norm(a - b) > 0$.

  + #strong[Step 2: Introduce an open neighborhood.] Since the distance $dist(A, B)$ is positive, let's denote it by $delta > 0$. We can construct an open neighborhood of $A$ that is disjoint from $B$. Consider the set $A' = A + ball(0, delta \/ 2) = { a + x : a in A , norm(x) < delta \/ 2 }$. $A'$ is a union of open balls, specifically $A' = union.big_(a in A) B (a , delta \/ 2)$, so it is an #strong[open set];.

  + #strong[Step 3: Show the disjointness of the new sets.] The set $A'$ is convex because it is the sum of two convex sets. We claim that $A' inter B = nothing$. Suppose for the sake of contradiction that there exists some $b in A' inter B$. Then $b in A'$ means there exists $a in A$ and $x in X$ with $norm(x) < delta \/ 2$ such that $b = a + x$. This implies $a - b = - x$, so $norm(a - b) = norm(- x) = norm(x) < delta \/ 2$. The contradiction $norm(a - b) < delta \/ 2$ and $norm(a - b) gt.eq dist(A, B) = delta$ shows that $A' inter B$ must be empty.

  + #strong[Apply the Open Set Separation Theorem.] We now have two disjoint, convex sets $A'$ and $B$, with $A'$ being open. We can apply the #strong[Open Set Separation Theorem] (Part 1) to these sets. Thus, there exists a continuous linear functional $g in X^(\*)$ and a scalar $lambda in bb(R)$ such that:
  
    $ g (a') < lambda lt.eq g (b) quad "for all" a' in A' , b in B . $
    
    Since $A subset.eq A'$, this inequality also holds for all $a in A$:
    
    $ g (a) < lambda lt.eq g (b) quad "for all" a in A , b in B . $

  + #strong[Establish the strict separation.] Since $A$ is a compact set and $g$ is a continuous function, the image $g (A)$ is a compact set in $bb(R)$. A compact set in $bb(R)$ is closed and bounded. Let $C_1 = sup_(a in A) g (a)$. Since $g (A)$ is a compact set in $bb(R)$, the supremum is attained, so $C_1 = max_(a in A) g (a)$. From the previous step, we have $g (a) lt.eq C_1 lt.eq lambda$ for all $a in A$. However, the inequality $g (a) < lambda$ holds for all $a in A$, which implies that the supremum $C_1$ must also satisfy $C_1 < lambda$. Similarly, let $C_2 = inf_(b in B) g (b)$. From the previous step, we have $lambda lt.eq C_2 lt.eq g (b)$ for all $b in B$. The inequality $g (a) lt.eq C_1 < lambda lt.eq C_2 lt.eq g (b)$ holds for all $a in A , b in B$. Let $c_1 = C_1$ and $c_2 = C_2$. Then we have found constants $c_1 , c_2$ such that $c_1 < c_2$ and:
  
    $ g (a) lt.eq c_1 < c_2 lt.eq g (b) quad "for all" a in A , b in B . $
    
    This completes the proof of strict separation.
]

=== Separability in Normed Spaces

We now shift focus to a topological property of normed spaces.

#definition(title: "Separable Space")[
A topological space $X$ is #strong[separable] if it contains a countable dense subset. That is, there exists a set $D = { x_1 , x_2 , dots.h }$ such that $overline(D) = X$.
]

#example[
1. The spaces $ell^p$ for $1 lt.eq p < oo$ and $c_0$ are separable. The set $c_00$ of sequences with finitely many non-zero terms is dense. The subset of $c_00$ where all terms are rational numbers (or complex rationals) is a countable dense subset.

2. The spaces $L^p ([0, 1])$ for $1 lt.eq p < oo$ and $C ([0, 1])$ are separable. For $C ([0, 1])$, the set of all polynomials with rational coefficients is a countable dense subset by the Weierstrass Approximation Theorem.

3. The space $ell^oo$ is #strong[not] separable.

  #proof[
  Consider the set $S$ of all sequences whose terms are either $0$ or $1$. This set is a subset of $ell^oo$ and is uncountable (it has the cardinality of the continuum, $2^(frak(c))$). For any two distinct sequences $x , y in S$, they must differ in at least one coordinate, say $x_k eq.not y_k$. Then $norm(x - y)_(ell^oo) = sup_i abs(x_i - y_i) = 1$.

  Now, consider the collection of open balls ${ ball (x, 1\/3) : x in S }$. These balls are pairwise disjoint. If $ell^oo$ were separable with a countable dense set $D$, then each ball $ball (x, 1\/3)$ must contain at least one point from $D$. Since the balls are disjoint, this would imply an injective map from the uncountable set $S$ to the countable set $D$, which is a contradiction. Therefore, $ell^oo$ is not separable.
  ]

4. Similarly, the dual space $C_0 ([0, 1])^*$ is not separable. By the Riesz-Markov-Kakutani representation theorem, this space is the space of Radon measures on $[0, 1]$. For each $x in [0, 1]$, the Dirac delta measure $delta_x$ is in this space. For any $x_1 eq.not x_2$, the total variation norm of their difference is $norm(delta_(x_1) - delta_(x_2)) = 2$. The set ${ delta_x : x in [0, 1]}$ is an uncountable set of points, all separated by a constant distance, so the space cannot be separable.
]

=== Separability of Dual Spaces and Reflexivity

There is an important connection between the separability of a space and its dual.

#proposition[
Let $X$ be a Banach space. If its dual space $X^*$ is separable, then $X$ is separable.
]<prp:separability-of-dual-spaces>

#proof[
Let ${ f_n }_(n = 1)^oo$ be a countable dense subset of the unit sphere $sphere_(X^*) = { f in X^* : norm(f) = 1 }$. For each $n$, by the definition of the operator norm, we can choose an element $x_n$ from the unit sphere $sphere_X$ such that $abs(f_n (x_n)) > 1 \/ 2$. Let $M = overline(span({ x_n }_(n = 1)^infinity))$. We claim that $M = X$.

Assume for contradiction that $M eq.not X$. By a corollary of the Hahn-Banach theorem (@prp:separation-of-a-point-from-a-closed-subspace), there exists a non-zero functional $g in X^*$ such that $g mid(|)_M = 0$. We can normalize $g$ so that $norm(g) = 1$. Since ${ f_n }$ is dense in $sphere_(X^*)$, there must exist an index $k$ such that $norm(f_k - g) < 1 \/ 2$. Since $x_k in M$, we have $g (x_k) = 0$. Now we estimate:

$ 1 / 2 < abs(f_k (x_k)) = abs(f_k (x_k) - g (x_k)) = abs((f_k - g) (x_k)) lt.eq norm(f_k - g) norm(x_k) < 1 / 2 dot.op 1 = 1 / 2 . $

This yields the contradiction $1 \/ 2 < 1 \/ 2$. Thus, our assumption was false, and we must have $M = X$. The set of all finite linear combinations of ${ x_n }$ with rational (or complex rational) coefficients is a countable dense subset of $X$, so $X$ is separable.
]

#remark[
The converse of this proposition is false. A standard counterexample is $X = ell^1$. - $ell^1$ is separable.

- Its dual is $(ell^1)^* tilde.equiv ell^oo$.
- We have shown that $ell^oo$ is not separable.
]

This relationship has a profound consequence for the reflexivity of spaces. Recall that a Banach space $X$ is #strong[reflexive] if the canonical embedding $J : X arrow.r X^(**)$ is a surjective isomorphism.

#corollary[
The space $ell^1$ is not reflexive.
]

#proof[
We know $(ell^1)^* tilde.equiv ell^oo$. Therefore, $(ell^1)^(**) tilde.equiv (ell^oo)^*$. If $ell^1$ were reflexive, we would have $ell^1 tilde.equiv (ell^1)^(**)$, which implies $ell^1 tilde.equiv (ell^oo)^*$. This would mean $(ell^oo)^*$ is separable (since $ell^1$ is). By @prp:separability-of-dual-spaces, if a dual space ($(ell^oo)^*$) is separable, then the original space ($ell^oo$) must also be separable. But this is a contradiction, as we have proven that $ell^oo$ is not separable. Therefore, $ell^1$ cannot be reflexive.
]