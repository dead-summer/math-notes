#import "../book.typ": *

#show: book-page.with(
  title: "4.1 Banach Spaces"
)

== Banach Spaces

=== Definitions and Properties

#definition[
A #strong[Banach space] is a complete normed vector space.
]



A #strong[norm] on a vector space $X$ over a field $bb(F)$ (where $bb(F)$ is either $bb(R)$ or $bb(C)$) is a function $norm(dot.op) : X arrow.r [ 0 , oo )$ that satisfies the following axioms for all $x , y in X$ and $lambda in bb(F)$:

1. #strong[Positive-definiteness:] $norm(x) = 0$ if and only if $x = 0$.
2. #strong[Absolute homogeneity:] $norm(lambda x) = abs(lambda) norm(x)$.
3. #strong[Triangle inequality:] $norm(x + y) lt.eq norm(x) + norm(y)$.

Every normed vector space is a metric space with the metric $d (x , y) = norm(x - y)$. However, the converse is not true; not every metric space can be derived from a norm.

=== Examples of Banach Spaces

==== Finite-Dimensional Spaces

The spaces $bb(R)^d$ and $bb(C)^d$ are finite-dimensional normed vector spaces under various norms. Common examples include the $p$-norms for a vector $x = (x_1 , x_2 , dots.h , x_d)$:

- The $1$-norm: $norm(x)_1 = sum_(i = 1)^d abs(x_i)$.
- The Euclidean norm (or $2$-norm): $norm(x)_2 = sqrt(sum_(i = 1)^d abs(x_i)^2)$.
- The $oo$-norm: $norm(x)_oo = max_(1 lt.eq i lt.eq d) abs(x_i)$.

For $1 lt.eq p < oo$, the $p$-norm is defined as $norm(x)_p = (sum_(i = 1)^d abs(x_i)^p)^(1 \/ p)$. The $oo$-norm is the limit of the $L^p$-norms as $p arrow.r oo$.

A fundamental result in functional analysis is that #strong[all finite-dimensional normed vector spaces are complete];, and therefore, they are all Banach spaces. Furthermore, any two norms on a finite-dimensional vector space are equivalent.

The #strong[unit ball] in $(bb(R)^d , norm(dot.op)_p)$ is the set $ball (0, 1) = { x in bb(R)^d : norm(x)_p lt.eq 1 }$. The shape of the unit ball depends on the norm.

#import "@preview/cetz:0.4.0": canvas, draw

#figure(
  canvas(length: 1cm, {
    import draw: *
    
    // 设置坐标系
    let axis-style = (stroke: gray + 0.5pt)
    
    // 绘制三个子图
    for (i, (p-val, title)) in ((1, $p=1$), (2, $p=2$), (calc.inf, $p=infinity$)).enumerate() {
      let x-offset = i * 6
      
      // 坐标轴
      line((x-offset - 2, -2), (x-offset + 2, -2), ..axis-style)
      line((x-offset, -4), (x-offset, 0), ..axis-style)
      
      // 绘制单位圆
      if p-val == 1 {
        // p = 1: 菱形 |x| + |y| = 1
        line((x-offset + 1, -2), (x-offset, -1), (x-offset - 1, -2), (x-offset, -3), 
             (x-offset + 1, -2), stroke: blue + 1.5pt, close: true)
      } else if p-val == 2 {
        // p = 2: 圆形 x² + y² = 1
        circle((x-offset, -2), radius: 1, stroke: red + 1.5pt)
      } else {
        // p = ∞: 正方形 max(|x|, |y|) = 1
        rect((x-offset - 1, -3), (x-offset + 1, -1), stroke: green + 1.5pt)
      }
      
      // 标题
      content((x-offset, -4.5), text(size: 12pt, weight: "bold", title))
    }
  }),
  caption: [The unit ball for different $p$]
)

The concept of #strong[uniform convexity] is an important geometric property of a Banach space. A normed space $X$ is uniformly convex if for every $epsilon > 0$, there exists a $delta > 0$ such that for any $x , y in X$ with $norm(x) = 1 , norm(y) = 1$ and $norm(x - y) gt.eq epsilon$, we have $norm((x + y) \/ 2) lt.eq 1 - delta$. This property implies that the unit ball is "round" and has no "flat" parts. The spaces $(bb(R)^d , norm(dot.op)_p)$ are uniformly convex for $1 < p < oo$.

==== Infinite-Dimensional Spaces

The finite-dimensional spaces serve as a foundation for understanding their infinite-dimensional counterparts:

- #strong[Sequence spaces] $ell^p$: For $1 lt.eq p < oo$, the space $ell^p$ consists of all sequences $alpha = (alpha_j)_(j = 1)^oo$ such that $sum_(j = 1)^oo abs(alpha_j)^p < oo$. The norm is defined as $norm(alpha)_(ell^p) = (sum_(j = 1)^oo abs(alpha_j)^p)^(1 \/ p)$. The space $ell^oo$ consists of all bounded sequences with the norm $norm(alpha)_(ell^infinity) = sup_(j in bb(N)) abs(alpha_j)$.

- #strong[Function spaces] $L^p$: For $1 lt.eq p < oo$, the space $L^p ([ 0 , 1 ])$ consists of all (equivalence classes of) functions $f : [ 0 , 1 ] arrow.r bb(R)$ such that $integral_0^1 abs(f (x))^p dif x < oo$. The norm is given by $norm(f)_(L^p) = (integral_0^1 abs(f (x))^p dif x)^(1 \/ p)$.

All these spaces, $(ell^p , norm(dot.op)_(ell^p))$ and $(L^p , norm(dot.op)_(L^p))$, for $1 lt.eq p lt.eq oo$, are complete and thus are Banach spaces.

The space $L^2 (bb(R)^d)$ is of particular importance as it possesses an inner product, making it a #strong[Hilbert space];: $ angle.l f , g angle.r = integral_(bb(R)^d) f (x) overline(g (x)) dif x $ The norm induced by this inner product is $norm(f)_(L^2) = sqrt((angle.l f , f angle.r)) = (integral_(bb(R)^d) abs(f (x))^2 dif x)^(1 \/ 2)$.

==== Spaces of Bounded and Continuous Functions

Let $Omega subset bb(R)^d$ be a set.

1. The space of bounded real-valued functions on $Omega$, denoted by $cal(F)_b (Omega)$, is a Banach space under the supremum norm: $norm(f)_oo = sup_(x in Omega) abs(f (x))$.
2. The space of continuous and bounded functions on $Omega$, denoted by $C_b (Omega)$, is a closed subspace of $cal(F)_b (Omega)$ and is therefore a Banach space.
3. The space of functions vanishing at infinity, $C_0 (bb(R)^d)$, consists of all continuous functions $f : bb(R)^d arrow.r bb(R)$ such that for every $epsilon > 0$, there exists a compact set $K$ where $abs(f (x)) < epsilon$ for all $x in.not K$. $C_0 (bb(R)^d)$ is a closed subspace of $cal(F)_b (bb(R)^d)$ and is a Banach space.
4. The space of continuous functions with compact support, $C_c (bb(R)^d)$, is a subspace of $C_0 (bb(R)^d)$, but it is #strong[not] a Banach space under the supremum norm because it is not complete. For example, a sequence of functions in $C_c (bb(R)^d)$ can converge uniformly to a function in $C_0 (bb(R)^d)$ that does not have compact support.


=== Completeness and Subspaces

A crucial theorem connects the property of being a Banach space to the closedness of its subspaces.

#theorem[
Let $(X , norm(dot.op))$ be a Banach space, and let $Y$ be a vector subspace of $X$. Then $(Y , norm(dot.op))$ is a Banach space if and only if $Y$ is a closed subspace of $X$.
]

#proof[
- *$arrow.r.double.long$:* Assume $Y$ is a Banach space. Let ${y_j}_(j in bb(N))$ be a sequence in $Y$ that converges to some $x in X$ (i.e., $norm(y_j - x) arrow.r 0$ as $j arrow.r oo$). A convergent sequence is a Cauchy sequence, so ${y_j}$ is a Cauchy sequence in $X$. Since ${y_j}$ is also a sequence in the Banach space $Y$, it must converge to a limit in $Y$. Let this limit be $y in Y$. By the uniqueness of limits in a metric space, we must have $x = y$. Therefore, $x in Y$, which proves that $Y$ is closed in $X$.

- *$arrow.l.double.long$:* Assume $Y$ is a closed subspace of $X$. Let ${y_j}_(j in bb(N))$ be a Cauchy sequence in $Y$. Since $Y subset X$, ${y_j}$ is also a Cauchy sequence in the Banach space $X$. By the completeness of $X$, there exists a limit $x in X$ such that $y_j arrow.r x$ in $X$. Since $Y$ is a closed subspace and the sequence ${y_j}$ is in $Y$, its limit $x$ must also be in $Y$. Therefore, every Cauchy sequence in $Y$ converges to a limit in $Y$, which means $Y$ is complete. Hence, $Y$ is a Banach space.
]

#example[
Let

$ Z = c_00 = { x = (x_1 , x_2 , dots.h) in ell^p : x_j = 0 "for all but a finite number of ") j }. $

This is a subspace of $ell^p$ for any $1 lt.eq p < oo$. $Z$ is #strong[dense] in $ell^p$. For any $x = { x_j }_(j = 1)^oo in ell^p$, consider the sequence of vectors $x^((n)) = (x_1 , x_2 , dots.h , x_n , 0 , 0 , dots.h) in Z$. Then

$ norm(x - x^((n)))_(ell^p) = (sum_(j = n + 1)^oo abs(x_j)^p)^(1 \/ p) arrow.r 0, quad "as" n arrow.r oo. $

However, $Z$ is #strong[not closed] in $ell^p$. For example, the vector $x = (1 , 1 \/ 2 , 1 \/ 3 , dots.h , 1 \/ j , dots.h)$ is in $ell^2$ but not in $Z$. It can be shown that $x$ is not a finite linear combinationmof ${e_i}_1^infinity$. Because $Z$ is a dense but not closed proper subspace of $ell^p$, it is not a complete space. Therefore, $(Z , norm(dot.op)_(ell^p))$ is not a Banach space.
]

=== #strong[Direct Sums of Subspaces]

If $(X , norm(dot.op)_X)$ and $(Y , norm(dot.op)_Y)$ are Banach spaces, their product space $X times Y$ is also a Banach space under a variety of equivalent product norms, such as $norm((x , y)) = norm(x)_X + norm(y)_Y$ or $norm((x , y)) = max { norm(x)_X , norm(y)_Y }$.

However, the internal direct sum of two closed subspaces of a Banach space is not necessarily a closed subspace itself. The sum of two subspaces $X_1$ and $X_2$ of a vector space $X$ is defined as $X_1 + X_2 = { x_1 + x_2 : x_1 in X_1 , x_2 in X_2 }$. This sum is an #strong[algebraic direct sum];, denoted $X_1 xor X_2$, if $X_1 inter X_2 = { 0 }$.

#example(title: "Counterexample")[
Consider the Banach space $X = c_0 subset ell^infinity$, the space of all sequences of real numbers that converge to zero, with the supremum norm $norm(alpha)_(ell^infinity) = sup_(j in bb(N)) abs(alpha_j)$.

Let $X_1$ and $X_2$ be two closed subspaces of $c_0$:
- $X_1 = { (a_j) in c_0 : a_(2 j - 1) = 0, forall j gt.eq 1 }$.
- $X_2 = { (a_j) in c_0 : a_(2 j) = j^2 a_(2 j - 1), forall j gt.eq 1 }$.

It can be verified that $X_1$ and $X_2$ are closed subspaces and $X_1 inter X_2 = { 0 }$.

Now consider the sequence $x = (1 , 0 , 1 / 4 , 0 , 1 / 9 , 0 , dots.h) in c_0$. Suppose $x in X_1 xor X_2$. Then $x$ can be written uniquely as $x = y + z$ with $y in X_1$ and $z in X_2$.

- Since $y in X_1$, its odd-indexed terms are zero: $y = (0 , y_2 , 0 , y_4 , dots.h)$.
- Since $z in X_2$, its even-indexed terms are determined by its odd-indexed terms: $z = (z_1 , z_2 , z_3 , dots.h)$ with $z_(2 j) = j^2 z_(2 j - 1)$.

From $x = y + z$, we have:
- For odd indices, $x_(2 j - 1) = y_(2 j - 1) + z_(2 j - 1) = 0 + z_(2 j - 1)$. Thus, $z_(2 j - 1) = x_(2 j - 1) = 1 / j^2$.
- For even indices, $x_(2 j) = y_(2 j) + z_(2 j) = 0$. Thus, $y_(2 j) = - z_(2 j)$.

Since $z in X_2$, its even-indexed terms must be $z_(2 j) = j^2 z_(2 j - 1) = j^2 (1 / j^2) = 1$. This implies that the sequence $z$ would be $z = (1 , 1 , 1 / 4 , 1 , 1 / 9 , 1 , dots.h)$. However, this sequence #strong[does not converge to zero];, so $z in.not c_0$. This is a contradiction, meaning $x in.not X_1 xor X_2$.

However, $x$ is in the #strong[closure] of $X_1 xor X_2$. Consider the sequence of "truncated" vectors $x_n in X_1 xor X_2$ defined as: $x_n = (1 , 0 , 1 / 4 , 0 , dots.h , 1 / n^2 , 0 , dots.h)$. For each $n$, $x_n$ is in $X_1 xor X_2$ (as it is a finite linear combination of basis vectors), and we have

$ norm(x_n - x)_oo = sup_(j > n) abs(1 \/ j^2) = 1 \/ (n + 1)^2 arrow.r 0, $

as $n arrow.r oo$.
]

#conclusion[
The sum $X_1 xor X_2$ is not a closed subspace of $c_0$.
]
