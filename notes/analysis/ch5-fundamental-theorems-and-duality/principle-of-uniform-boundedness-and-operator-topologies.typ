#import "../book.typ": *

#show: book-page.with(
  title: "5.2 The Principle of Uniform Boundedness and Operator Topologies"
)

== The Principle of Uniform Boundedness and Operator Topologies

In functional analysis, the Principle of Uniform Boundedness is a cornerstone result that provides a crucial link between the pointwise boundedness of a family of operators and its uniform boundedness. Informally, the principle states that if a family of continuous linear operators from a Banach space to a normed vector space is bounded at every single point, then the family must be uniformly bounded in the operator norm. This powerful theorem is also widely known as the Banach-Steinhaus Theorem.

=== The Banach-Steinhaus Theorem

#theorem(title: "Banach-Steinhaus")[
Let $X$ be a Banach space and $Y$ be a normed vector space. Let $cal(F)$ be a collection of continuous linear operators from $X$ to $Y$, i.e., $cal(F) subset cal(B) (X, Y)$.  If for every $x in X$, the set of norms ${ norm(T x)_Y : T in cal(F) }$ is bounded, then the set of operator norms ${ norm(T)_(B (X, Y)) : T in F }$ is uniformly bounded. 

In more formal terms: If for each $x in X$, there exists a constant $M_x gt.eq 0$ such that
$ norm(T x)_Y lt.eq M_x, quad forall T in cal(F), $
then there exists a single constant $M gt.eq 0$ such that
$ norm(T)_(B (X, Y)) lt.eq M, quad forall T in cal(F) . $
This implies $norm(T x)_Y lt.eq M norm(x)_X$ for all $T in cal(F)$ and all $x in X$. 
]

#proof[
The proof relies fundamentally on the Baire Category Theorem.

+ #strong[Define a sequence of sets:] For each integer $n gt.eq 1$, define the set $G_n$ as follows: $ G_n = { x in X : sup_(T in cal(F)) norm(T x)_Y lt.eq n } = inter.big_(T in cal(F)) { x in X : norm(T x)_Y lt.eq n } $ 

+ #strong[Show that each $G_n$ is closed:] For any fixed $T in cal(F)$, the operator $T$ is continuous. The norm function $norm(dot.op)_Y : Y arrow.r bb(R)$ is also continuous. Therefore, the function $x mapsto norm(T x)_Y$ is a continuous real-valued function on $X$. Consequently, the set ${ x in X : norm(T x)_Y lt.eq n }$ is a closed set (as it's the preimage of the closed set $[ 0 , n ]$ under a continuous function). Since $G_n$ is the intersection of closed sets, $G_n$ is itself a closed set in $X$.

+ #strong[Apply the Baire Category Theorem:] The initial hypothesis of the theorem is that for every $x in X$, the set ${ norm(T x)_Y : T in cal(F) }$ is bounded. Therefore, $ X = union.big_(n = 1)^oo G_n $ 

  Since $X$ is a Banach space (and thus a complete metric space) and it is expressed as a countable union of closed sets $G_n$, the Baire Category Theorem asserts that at least one of these sets must have a non-empty interior. That is, there exists an integer $N gt.eq 1$ such that $interior(G_N) eq.not nothing$. 

+ #strong[Use the non-empty interior:] Let's say $interior(G_N)$ is non-empty. This means there exists an open ball $ball (x_0 , r_0) = { x in X : norm(x - x_0)_X < r_0 }$ centered at some $x_0 in G_N$ with radius $r_0 > 0$, such that $ball (x_0 , r_0) subset G_N$.  By the definition of $G_N$, for any $y in ball (x_0 , r_0)$, we have $norm(T y)_Y lt.eq N$ for all $T in cal(F)$. Note that since $x_0 in G_N$, we also have $norm(T x_0)_Y lt.eq N$.

+ #strong[Establish the uniform bound:] Now, consider any $x in X$ such that $norm(x)_X < r_0$. Then the vector $y = x_0 + x$ is in the ball $ball (x_0 , r_0)$. For any $T in cal(F)$, we can write: $ norm(T x)_Y = norm(T (x_0 + x) - T x_0)_Y lt.eq norm(T (x_0 + x))_Y + norm(T x_0)_Y $  Since $x_0 + x in ball (x_0 , r_0) subset G_N$ and $x_0 in G_N$, we have: $ norm(T x)_Y lt.eq N + N = 2 N $  This holds for all $x$ with $norm(x)_X < r_0$ and for all $T in cal(F)$.

  Finally, for any arbitrary non-zero $z in X$, we can scale it to fit within this radius. Let $x = frac(r_0, 2 norm(z)_X) z$. Then $norm(x)_X = r_0 \/ 2 < r_0$. Applying our previous result to $x$: $ norm(T x)_Y = norm(T (frac(r_0, 2 norm(z)_X) z))_Y = frac(r_0, 2 norm(z)_X) norm(T z)_Y lt.eq 2 N $ Rearranging this inequality, we get: $ norm(T z)_Y lt.eq frac(4 N, r_0) norm(z)_X $ This holds for any $z in X$ and any $T in cal(F)$. Setting $M = frac(4 N, r_0)$, we have $norm(T z)_Y lt.eq M norm(z)_X$, which implies that $norm(T)_(cal(B) (X, Y)) lt.eq M$.  The family $F$ is therefore uniformly bounded.
]


The Banach-Steinhaus theorem has an important corollary regarding the convergence of sequences of operators.

#corollary[
Let $X$ and $Y$ be Banach spaces and let ${ T_n }_(n = 1)^oo subset cal(B) (X, Y)$ be a sequence of continuous linear operators.  The following are equivalent:

+ There exists an operator $T in cal(B) (X, Y)$ such that $T_n x arrow.r T x$ in $Y$ for all $x in X$. 
+ For every $x in X$, the sequence ${ T_n x }$ is convergent in $Y$. 
+ The sequence of operator norms is bounded (i.e., $sup_n norm(T_n) < oo$), and the sequence ${ T_n z }$ converges for all $z$ in a dense subset $Z$ of $X$.
]

#proof[
- #strong[(1) $=>$ (2):] This implication is trivial by definition.  If the sequence ${ T_n x }$ converges to $T x$, it is by definition a convergent sequence.

- #strong[(2) $=>$ (3):] If ${ T_n x }$ is a convergent sequence for every $x in X$, it must be a bounded sequence in $Y$. That is, for each $x$, $sup_n norm(T_n x)_Y < oo$. By the Banach-Steinhaus Theorem, this pointwise boundedness implies uniform boundedness of the operator norms: $sup_n norm(T_n)_(B (X, Y)) = M < oo$.  The second condition of (3) is also satisfied, as convergence for all $x in X$ implies convergence on any subset of $X$.

- #strong[(3) $=>$ (1):] Let $M = sup_n norm(T_n) < oo$, and let $Z subset X$ be a dense subset on which ${ T_n z }$ converges for every $z in Z$. We need to show that ${ T_n x }$ converges for all $x in X$. Since $Y$ is a Banach space, it is sufficient to show that ${ T_n x }$ is a Cauchy sequence for every $x in X$. 

  Let $x in X$ and $epsilon > 0$ be given. Since $Z$ is dense in $X$, there exists a $z in Z$ such that $norm(x - z)_X < frac(epsilon, 3 M)$. Since ${ T_n z }$ is a convergent sequence, it is a Cauchy sequence. Thus, there exists an integer $N$ such that for all $n , k > N$, we have $norm(T_n z - T_k z)_Y < epsilon / 3$.

  Now, consider $norm(T_n x - T_k x)_Y$ for $n , k > N$:
  $ norm(T_n x - T_k x)_Y &= norm(T_n x - T_n z + T_n z - T_k z + T_k z - T_k x)_Y \
  &lt.eq norm(T_n (x - z))_Y + norm(T_n z - T_k z)_Y + norm(T_k (z - x))_Y \
  &lt.eq norm(T_n) dot.op norm(x - z)_X + norm(T_n z - T_k z)_Y + norm(T_k) dot.op norm(x - z)_X $ Using our bounds, for $n , k > N$: $ norm(T_n x - T_k x)_Y < M (frac(epsilon, 3 M)) + epsilon / 3 + M (frac(epsilon, 3 M)) = epsilon / 3 + epsilon / 3 + epsilon / 3 = epsilon $ Thus, ${ T_n x }$ is a Cauchy sequence for any $x in X$. Since $Y$ is complete, the limit $lim_(n arrow.r oo) T_n x$ exists. Let us define an operator $T$ by $T x = lim_(n arrow.r oo) T_n x$. It is straightforward to show that $T$ is linear. Furthermore, $norm(T x) = lim_(n arrow.r oo) norm(T_n x) lt.eq sup_n (norm(T_n) dot.op norm(x)) lt.eq M norm(x)$, so $T$ is bounded and in $cal(B) (X, Y)$.
]


=== Topologies on the Space of Bounded Operators

There are several important ways to define convergence for a sequence of operators ${ T_n }$ in $B (X, Y)$.

- #strong[Uniform Operator Topology (or Norm Topology):] $T_n arrow.r T$ if $norm(T_n - T)_(B (X, Y)) arrow.r 0$. This is the strongest type of convergence.

- #strong[Strong Operator Topology (SOT):] $T_n arrow.r T$ in SOT if for every $x in X$, the sequence of vectors ${ T_n x }$ converges to $T x$ in the norm of $Y$. That is, $norm(T_n x - T x)_Y arrow.r 0$. 

- #strong[Weak Operator Topology (WOT):] $T_n arrow.r T$ in WOT if for every $x in X$ and every continuous linear functional $f in Y^*$, the sequence of scalars ${ f (T_n x) }$ converges to $f (T x)$ in the scalar field. That is, $f (T_n x) arrow.r f (T x)$. 



#strong[Relationship between Topologies:] Norm convergence is stronger than SOT, which in turn is stronger than WOT.  $ upright("Norm Convergence") => upright("SOT Convergence") => upright("WOT Convergence") $ This hierarchy can be seen from the following inequalities for any $x in X$ and $f in Y^*$:

$
abs(f (T_n x) - f (T x)) lt.eq norm(f)_(Y^*) norm((T_n - T) x)_Y lt.eq norm(f)_(Y^*) norm(T_n - T)_(B (X, Y)) norm(x)_X.
$

If $norm(T_n - T) arrow.r 0$, the right side goes to 0, implying SOT and WOT convergence. If $norm((T_n - T) x)_Y arrow.r 0$, the middle term goes to 0, implying WOT convergence.

Related to the WOT is the concept of weak convergence for vectors.

#definition(title: "Weak Convergence")[
Let $X$ be a Banach space.  A sequence ${ x_n }$ in $X$ is said to #strong[converge weakly] to a vector $x in X$ if for every continuous linear functional $f in X^*$, we have $f (x_n) arrow.r f (x)$.  This is denoted by $x_n weakTo x$.
]

Here are two illustrative examples.

The following example demonstrates a sequence of functions in a Hilbert space that converges weakly to zero but not strongly. It uses the standard orthonormal basis of complex exponentials in $L^2 ([ 0 , 2 pi])$ 

#example(title: [Weak but not Strong Convergence in $L^2 ([ 0 , 2 pi])$])[
Consider the Hilbert space $X = L^2 ([ 0 , 2 pi ] , bb(C))$ and the sequence of functions $e_n (x) = 1 / sqrt(2 pi) e^(imUnit n x)$ for $n in bb(Z)$. This is an orthonormal basis for the space. Let's show that $e_n weakTo 0$ as $abs(n) arrow.r oo$, but $e_n$ does not converge to 0 in norm.

- #strong[Weak Convergence:] To show $e_n weakTo 0$, we must show that for every continuous linear functional $T in (L^2)^*$, we have $T (e_n) arrow.r 0$. By the Riesz Representation Theorem for Hilbert spaces, every such functional $T$ corresponds to taking the inner product with some fixed function $f in L^2$. Thus, we need to show that for any $f in L^2 ([ 0 , 2 pi ])$: $ lim_(abs(n) arrow.r oo) angle.l e_n , f angle.r = 0 $ The inner product is $angle.l e_n , f angle.r = integral_0^(2 pi) e_n (x) overline(f (x)) dif x = 1 / sqrt(2 pi) integral_0^(2 pi) e^(i n x) overline(f (x)) dif x$. The term $integral_0^(2 pi) overline(f (x)) e^(i n x) dif x$ is, up to a constant, the $n$-th Fourier coefficient of the function $overline(f)$. The Riemann-Lebesgue Lemma states that the Fourier coefficients of any $L^1$ function (and thus any $L^2$ function) must tend to zero as $abs(n) arrow.r oo$.  Therefore, $e_n weakTo 0$.

- #strong[No Strong Convergence:] To check for strong (norm) convergence, we compute the norm of $e_n$: $ norm(e_n)_(L^2)^2 = angle.l e_n , e_n angle.r = integral_0^(2 pi) abs( 1 / sqrt(2 pi) e^(i n x))^2 dif x = frac(1, 2 pi) integral_0^(2 pi) 1 thin dif x = 1 $  Since $norm(e_n)_(L^2) = 1$ for all $n$, the norm does not converge to $norm(0)_(L^2) = 0$. Therefore, the sequence ${ e_n }$ does not converge strongly to 0. 
]

The next example illustrates a sequence of linear functionals on $ell^2$that converges in the strong operator topology (SOT) but not in norm.

#example(title: [SOT but not Norm Convergence on $ell^2$])[
Consider the Hilbert space $ell^2$ of square-summable sequences. For each $n gt.eq 1$, define the linear functional $T_n : ell^2 arrow.r bb(C)$ by $T_n (x) = a_n$, where $x = (a_1 , a_2 , a_3 , dots.h)$.  Each $T_n$ is a continuous linear functional. Let's analyze the convergence of the sequence ${ T_n }$ to the zero operator $T = 0$.

- #strong[SOT Convergence:] We check if $T_n x arrow.r 0$ for every $x in ell^2$. For any $x = (a_k) in ell^2$, the defining property is that $sum_(k = 1)^oo abs(a_k)^2 < oo$. Therefore, $lim_(k arrow.r oo) abs(a_k) = 0$. This means for any $x in ell^2$, we have $lim_(n arrow.r oo) T_n x = lim_(n arrow.r oo) a_n = 0$.  This is precisely the definition of SOT convergence to the zero operator.

- #strong[No Norm Convergence:] Now we compute the operator norm of $T_n$:
  $ norm(T_n) = sup_(norm(x)_(ell^2) = 1) abs(T_n x) = sup_(norm(x)_(ell^2) = 1) abs(a_n).
  $
  To find this supremum, we can choose a specific vector. Let $e_n = (0 , 0 , dots.h , 1 , 0 , dots.h)$ be the sequence with a 1 in the $n$-th position and zeros elsewhere. Clearly, $norm(e_n)_(ell^2) = 1$. For this vector, $abs(T_n (e_n)) = 1$.  Therefore, the supremum must be at least $1$. We also have $abs(T_n (x)) = abs(a_n) lt.eq norm(x)_(ell^2)$, so $norm(T_n) lt.eq 1$. Combining these, we have $norm(T_n)  = 1$ for all $n$.  Since $norm(T_n)$ does not converge to 0, the sequence of operators ${ T_n }$ does not converge to the zero operator in the uniform operator norm.
]

