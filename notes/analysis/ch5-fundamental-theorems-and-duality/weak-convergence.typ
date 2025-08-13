#import "../book.typ": *

#show: book-page.with(
  title: "5.5 Weak Convergence"
)

== Weak Convergence

In the study of infinite-dimensional normed vector spaces, we often encounter sequences that do not converge in the standard sense (i.e., in norm), yet they possess a different, more subtle type of limiting behavior. This motivates the introduction of a weaker notion of convergence. 

=== Weak Convergence in a Normed Vector Space

We begin by defining weak convergence for a sequence of vectors in a normed space $X$. This concept replaces the convergence of norms with the convergence of the sequence when "tested" against continuous linear functionals.

#definition(title: [ Weak Convergence])[
Let $X$ be a normed vector space. A sequence ${ x_n }_(n in bb(N)) subset X$ is said to #strong[converge weakly] to an element $x in X$ if, for every continuous linear functional $f in X^*$, the sequence of scalars ${ f (x_n) }_(n in bb(N))$ converges to $f (x)$ in the underlying field $bb(F)$ (which is typically $bb(R)$ or $bb(C)$).
]

This is denoted by: $ x_n weakTo x quad "as" n arrow.r oo. $ This is equivalent to stating that $f (x_n) arrow.r f (x)$ for all $f in X^*$.

#theorem[
Let $X$ be a normed vector space. If the sequence ${ x_n }$ converges weakly to $x$ (i.e., $x_n weakTo x$), then:
1. The sequence ${ x_n }$ is bounded. That is, $sup_(n gt.eq 1) norm(x_n)  < oo$. 
2. The norm of the limit is less than or equal to the limit inferior of the norms of the sequence elements. That is, $norm(x)  lt.eq liminf_(n arrow.r oo) norm(x_n)$.
]

#proof[
+ #strong[Boundedness:] We consider the canonical isometric embedding $J : X arrow.r X^(**)$, where $X^(**)$ is the second dual space of $X$. For each $x in X$, $J (x)$ is a functional in $X^(**)$ defined by $J (x) (f) = f (x)$ for all $f in X^*$. 

  The condition $x_n weakTo x$ implies that for any $f in X^*$, we have $f (x_n) arrow.r f (x)$. 
  In the language of the embedding $J$, this means:
  $ J (x_n) (f) arrow.r J (x) (f) quad "for all" f in X^* . $
  This is precisely the definition of pointwise convergence of the sequence of functionals ${ J (x_n) }$ to the functional $J (x)$ on $X^*$. 
  
  Since $X^*$ is a Banach space, we can apply the #strong[Uniform Boundedness Principle];. Here, the family of functionals ${ J (x_n) }$ is pointwise bounded on $X^*$. Therefore, their norms in $X^(**)$ must be uniformly bounded: $ sup_(n gt.eq 1) norm(J (x_n))_(X^(**)) < oo. $ Since $J$ is an isometry, $norm(J (x_n))_(X^(**)) = norm(x_n)_X$. Thus, we conclude that $sup_(n gt.eq 1) norm(x_n)  < oo$.

+ #strong[Norm Inequality:] By the Hahn-Banach theorem, for the element $x in X$, there exists a "norming functional" $f_0 in X^*$ such that $norm(f_0)_(X^*) = 1$ and $f_0 (x) = norm(x)$. 
  
  Using this functional, we have:
  $ norm(x) = f_0 (x) = lim_(n arrow.r oo) f_0 (x_n). $
  Since $abs(f_0 (x_n)) lt.eq norm(f_0)_(X^*) norm(x_n) = norm(x_n)$, it follows that:
  $ lim_(n arrow.r oo) f_0 (x_n) lt.eq liminf_(n arrow.r oo) norm(x_n). $
  (We use the limit inferior because the limit of $norm(x_n)$ may not exist.) Combining these results, we get $norm(x)  lt.eq liminf_(n arrow.r oo) norm(x_n)$. 
  
]

#example[
Consider the space $ell^p$ for $1 < p < oo$. Let $e_n$ be the sequence where the $n$-th component is 1 and all other components are 0. 
We claim that the sequence ${ e_n }$ converges weakly to 0: 
$ e_n weakTo 0. $

To prove this, we recall that the dual space of $ell^p$ is isometrically isomorphic to $ell^q$, where $1 / p + 1 / q = 1$. 
Any functional $f in (ell^p)^*$ can be represented by a sequence $y = (y_k) in ell^q$ such that for any $x = (x_k) in ell^p$: $ f (x) = sum_(k = 1)^oo x_k y_k $ Applying this to our sequence $e_n$, we have: $ f (e_n) = sum_(k = 1)^oo (e_n)_k y_k = y_n $ Since $y in ell^q$, the terms of the sequence must converge to zero, i.e., $lim_(n arrow.r oo) y_n = 0$. Therefore, for any $f in (ell^p)^*$, we have: $ lim_(n arrow.r oo) f (e_n) = 0 = f (0) $ This confirms that $e_n weakTo 0$. It is important to note that ${ e_n }$ does not converge strongly (in norm), as $norm(e_n - 0)_(ell^p) = norm(e_n)_(ell^p) = 1$ for all $n$.

This example illustrates that in infinite-dimensional spaces, weak convergence is a strictly weaker condition than strong (norm) convergence.
]



Mazur's Lemma provides a crucial link between weak convergence and strong convergence. It states that if a sequence converges weakly, then one can construct a sequence of convex combinations of its elements that converges strongly to the same limit.

#theorem(title: [Mazur's Lemma])[
Let $X$ be a normed vector space and suppose $x_n weakTo x$. Then there exists a sequence ${u_n}$ where each $u_n$ is a finite convex combination of the elements ${ x_k }_(k gt.eq n)$, such that $u_n$ converges strongly to $x$ (i.e., $norm(u_n - x) arrow.r 0$). 
Specifically, for each $n$, $u_n$ has the form: $ u_n = sum_(k = n)^(N (n)) a_k^((n)) x_k , quad "with" a_k^((n)) gt.eq 0 "and" sum_(k = n)^(N (n)) a_k^((n)) = 1. $
]

#proof[
+ #strong[Define Convex Hulls:] Let $W_n = upright("conv") { x_k : k gt.eq n }$ be the convex hull of the tail of the sequence. Our goal is to show that we can find an element in each $W_n$ that gets arbitrarily close to $x$.

+ #strong[Show the Limit is in the Closure:] We will prove that $x in overline(W_n)$ for every $n in bb(N)$. We argue by contradiction. Assume, for some fixed $n$, that $x in.not overline(W_n)$. Since $overline(W_n)$ is a closed and convex set, the #strong[Hahn-Banach Separation Theorem] guarantees the existence of a continuous linear functional $f in X^*$, a real number $alpha$, and an $epsilon > 0$ such that:

  $ f (x) lt.eq alpha - epsilon quad "and" quad f (y) gt.eq alpha quad "for all" y in overline(W_n). $
  This implies $f (x) < inf_(y in W_n) f (y)$. Since each $x_k$ for $k gt.eq n$ is in $W_n$, it follows that:
  $ f (x_k) gt.eq inf_(y in W_n) f (y) > f (x) quad "for all" k gt.eq n. $
  However, we are given that $x_n weakTo x$. This leads to a contradiction. Therefore, our initial assumption must be false, and we conclude that $x in overline(W_n)$ for all $n$.

+ #strong[Construct the Strongly Convergent Sequence:] Since $x in overline(W_n)$ for every $n$, the distance from $x$ to the set $W_n$ is zero. This means for any $delta > 0$, we can find an element in $W_n$ that is within a distance $delta$ of $x$. We can construct the desired sequence ${ u_n }$ by choosing, for each $n in bb(N)$, an element $u_n in W_n$ such that: $ norm(u_n - x) < 1 / n $ As $n arrow.r oo$, it is clear that $norm(u_n - x) arrow.r 0$. By definition, each $u_n$ is an element of $W_n$ and is therefore a finite convex combination of elements from ${ x_k }_(k gt.eq n)$. This completes the proof.
]

=== Weak-\* Convergence in the Dual Space

A related but distinct mode of convergence exists for functionals in the dual space $X^*$.

#definition(title: [Weak-\* Convergence])[
Let $X$ be a normed vector space. A sequence of functionals ${ f_n }_(n in bb(N)) subset X^*$ is said to *converge weak-star (weak-\*)* to a functional $f in X^*$ if, for every element $x in X$, the sequence of scalars ${ f_n (x) }_(n in bb(N))$ converges to $f (x)$. 
]

This is denoted by:
$ f_n weakTo f quad "as" n arrow.r oo. $
This is equivalent to pointwise convergence on $X$.

Recalling the canonical embedding $J : X arrow.r X^(**)$, weak-\* convergence $f_n weakTo f$ in $X^*$ is equivalent to the weak convergence of ${ f_n }$ to $f$ when viewed as elements of the space $X^*$, where the testing functionals are restricted to the canonical image of $X$ in $X^(**)$, i.e., $J (X)$. Formally:
$ f_n weakTo f arrow.l.r.double xi (f_n) arrow.r xi (f) quad "for all" xi in J (X) subset X^(**). $

If $X$ is a reflexive space (i.e., $J (X) = X^(**)$), then weak convergence and weak-\* convergence in $X^*$ are identical.

#exercise[
Show that if $f_n weakTo f$, then $sup_n norm(f_n) < oo$ and $norm(f)  lt.eq liminf_n norm(f_n)$.
]

#example[
Let $Omega$ be a compact metric space. By the Riesz Representation Theorem, the dual space of $C (Omega)$ (the space of continuous functions on $Omega$) is the space of Radon measures on $Omega$ with bounded variation, denoted $M(Omega)$. 
A sequence of functionals ${ T_n } subset (C (Omega))^*$ converging weak-\* to $T$ means that $T_n (g) arrow.r T (g)$ for all $g in C (Omega)$. 
If $mu_n$ and $mu$ are the measures representing $T_n$ and $T$, respectively, this translates to:
$ integral_Omega g thin dif mu_n arrow.r integral_Omega g thin dif mu quad "for all" g in C (Omega). $ 
In probability theory, this is often referred to as the #strong[weak convergence of measures];.
]

=== Compactness and Weak Convergence

The following theorems are fundamental results regarding the compactness of sets under weak and weak-\* topologies.


#theorem(title: [The Banach-Alaoglu Theorem])[
Let $X$ be a separable normed vector space. 
Then every bounded sequence in the dual space $X^*$ has a weak-\* convergent subsequence. 
In other words, if ${ f_n } subset X^*$ and $sup_n norm(f_n)  < oo$, there exists a subsequence ${ f_(n_k) }$ and a functional $f in X^*$ such that $f_(n_k) weakTo f$.
]

#proof[
The proof relies on a #strong[diagonalization argument];.

+ #strong[Setup:] Since $X$ is separable, there exists a countable dense subset $D = { x_i }_(i = 1)^oo subset X$. Let the sequence of functionals ${ f_n } subset X^*$ be norm-bounded, i.e., there exists a constant $M > 0$ such that $norm(f_n) lt.eq M$ for all $n in bb(N)$.

+ #strong[Step 1: The first element.] Consider the sequence of scalars ${ f_n (x_1) }_(n = 1)^oo$. This sequence is bounded, since $abs(f_n (x_1)) lt.eq norm(f_n) norm(x_1) lt.eq M norm(x_1)$. By the #strong[Bolzano-Weierstrass theorem];, there exists a convergent subsequence of scalars. Let ${ f_(n_1 , k) }_(k = 1)^oo$ be the corresponding subsequence of functionals.

+ #strong[Step 2: Iteration.] Now consider the sequence of scalars ${ f_(n_1 , k) (x_2) }_(k = 1)^oo$. This sequence is also bounded, so we can extract a further subsequence, denoted ${ f_(n_2 , k) }_(k = 1)^oo$, such that ${ f_(n_2 , k) (x_2) }_k$ converges. We continue this process inductively. At the $j$-th step, we obtain a subsequence ${ f_(n_j , k) }_k$ from ${ f_(n_(j - 1) , k) }_k$ such that ${ f_(n_j , k) (x_j) }_k$ converges.

+ #strong[Step 3: Diagonalization.] We construct the diagonal subsequence ${ g_k }_(k = 1)^oo$ by setting $g_k = f_(n_k , k)$. For any fixed $i in bb(N)$, the sequence ${ g_k (x_i) }_(k = i)^oo$ is a tail of the sequence ${ f_(n_i , k) (x_i) }_(k = i)^oo$, which was constructed to be convergent. Therefore, $lim_(k arrow.r oo) g_k (x_i)$ exists for every $x_i$ in the dense set $D$.

+ #strong[Step 4: Extension to the whole space.] We now show that ${ g_k (x) }_k$ converges for every $x in X$. Let $x in X$ and $epsilon > 0$.

  - Since $D$ is dense in $X$, choose $x_i in D$ such that $norm(x - x_i) < frac(epsilon, 3 M)$.
  - Since ${ g_k (x_i) }_k$ converges, it is a Cauchy sequence. Thus, there exists an integer $N$ such that for all $j , k > N$, we have $abs(g_k (x_i) - g_j (x_i)) < epsilon / 3$.
  - For any $j , k > N$, we can write: $ abs(g_k (x) - g_j (x)) & = abs(g_k (x) - g_k (x_i) + g_k (x_i) - g_j (x_i) + g_j (x_i) - g_j (x))\
     & lt.eq abs(g_k (x - x_i)) + abs(g_k (x_i) - g_j (x_i)) + abs(g_j (x_i - x))\
     & lt.eq norm(g_k) norm(x - x_i) + abs(g_k (x_i) - g_j (x_i)) + norm(g_j) norm(x - x_i)\
     & lt.eq M dot.op frac(epsilon, 3 M) + epsilon / 3 + M dot.op frac(epsilon, 3 M) = epsilon . $
     This shows that ${ g_k (x) }_k$ is a Cauchy sequence of scalars for any $x in X$, and thus it converges.

+ #strong[Step 5: Defining the limit functional.] We can now define a functional $f : X arrow.r bb(K)$ (where $bb(K)$ is $bb(R)$ or $bb(C)$) by $f (x) = lim_(k arrow.r oo) g_k (x)$.

  - #strong[Linearity:] The linearity of $f$ follows directly from the linearity of each $g_k$.
  - #strong[Boundedness:] For any $x in X$, $abs(f (x)) = abs(lim_(k arrow.r oo) g_k (x)) = lim_(k arrow.r oo) abs(g_k (x)) lt.eq limsup_(k arrow.r oo) (norm(g_k) norm(x)) lt.eq M norm(x)$. Thus, $f$ is a bounded linear functional, i.e., $f in X^*$.

By construction, we have found a subsequence (which we relabel as ${ f_(n_k) } := { g_k }$) and an $f in X^*$ such that $f_(n_k) (x) arrow.r f (x)$ for all $x in X$. This is precisely the definition of weak-\* convergence, $f_(n_k) weakTo f$.

]


A direct consequence is that the closed unit ball $overline(ball)_(X^*)$ in the dual space is weak-\* compact.

The Banach-Alaoglu theorem is a statement about dual spaces. When the space $X$ is reflexive, we can transfer this compactness property back to $X$ itself.

#theorem[
Let $X$ be a #strong[reflexive Banach space] (i.e., $X tilde.equiv X^(**)$ via the canonical embedding). Then every closed and bounded subset of $X$ is weakly compact. This implies that every bounded sequence in $X$ has a weakly convergent subsequence.
]

#proof[
Let ${ x_n }_(n = 1)^oo$ be a bounded sequence in a reflexive Banach space $X$. Let $M$ be a constant such that $norm(x_n) lt.eq M$ for all $n$. We will construct a weakly convergent subsequence.

+ #strong[Construct a Separable Subspace:] Let $Y = overline(upright("span") { x_n divides n in bb(N) })$.

  - $Y$ is a closed subspace of the Banach space $X$, so $Y$ is a Banach space.
  - $Y$ is the closure of the span of a countable set, which means $Y$ is a #strong[separable] space.
  - A closed subspace of a reflexive space is itself #strong[reflexive];. Therefore, $Y$ is a separable, reflexive Banach space.

+ #strong[Apply Banach-Alaoglu to the Dual:] Since $Y$ is reflexive, its dual space $Y^*$ has a separable bidual ($Y^(**) tilde.equiv Y$ is separable). A standard theorem states that if a dual space $Z^*$ has a separable bidual $Z^(**)$, then $Z^*$ must be separable. Applying this to $Z = Y^*$, we conclude that #strong[$Y^*$ is separable];.

+ #strong[Find a Weak-\* Convergent Subsequence in the Bidual:] Consider the sequence ${ x_n }$ as a sequence in $Y$. Through the canonical embedding $J : Y arrow.r Y^(**)$, we can view ${ J (x_n) }$ as a sequence in $Y^(**)$. This sequence is norm-bounded: $ norm(J (x_n))_(Y^(**)) = norm(x_n)_Y lt.eq M $ We have a bounded sequence ${ J (x_n) }$ in the dual space of $Y^*$, which is $Y^(**)$. Since $Y^*$ is separable (from step 2), we can apply the sequential #strong[Banach-Alaoglu Theorem] to ${ J (x_n) }$. This guarantees the existence of a subsequence ${ J (x_(n_k)) }$ and an element $phi.alt in Y^(**)$ such that $J (x_(n_k)) weakTo phi.alt$.

+ #strong[Use Reflexivity:] By definition, the weak-\* convergence $J (x_(n_k)) weakTo phi.alt$ means that for every functional $g in Y^*$: $ lim_(k arrow.r oo) (J (x_(n_k))) (g) = phi.alt (g) $ Since $Y$ is reflexive, the canonical map $J : Y arrow.r Y^(**)$ is a surjective isometry. Therefore, the limit element $phi.alt in Y^(**)$ must be the image of some element $x in Y$, i.e., $phi.alt = J (x)$. Substituting this back and using the definition of the canonical map, $(J (z)) (g) = g (z)$, we get: $ lim_(k arrow.r oo) g (x_(n_k)) = g (x) quad "for all" g in Y^* $ This is the definition of weak convergence in the space $Y$. So, $x_(n_k) weakTo x$ in $Y$.

+ #strong[Extend Convergence to the Full Space:] Finally, we must show that this convergence holds not just for functionals in $Y^*$ but for all functionals in the larger space $X^*$. Let $f in X^*$ be an arbitrary functional. Its restriction to the subspace $Y$, denoted $f mid(|)_Y$, is a continuous linear functional on $Y$, so $f mid(|)_Y in Y^*$. Since $x_(n_k) weakTo x$ in $Y$, we know that $(f mid(|)_Y) (x_(n_k)) arrow.r (f mid(|)_Y) (x)$. By definition of restriction, this means: $ f (x_(n_k)) arrow.r f (x) $ Since this holds for an arbitrary $f in X^*$, we have proven that the subsequence ${ x_(n_k) }$ converges weakly to $x$ in the space $X$. This completes the proof.
]
