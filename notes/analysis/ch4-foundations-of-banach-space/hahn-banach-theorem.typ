#import "../book.typ": *

#show: book-page.with(
  title: "4.4 Hahn-Banach Theorem"
)


== Hahn-Banach Theorem

The Hahn-Banach Theorem is a cornerstone of functional analysis. In essence, it asserts that any continuous linear functional defined on a subspace of a normed vector space can be extended to the entire space without increasing its norm. This powerful result ensures that the dual space of any non-trivial normed space is itself non-trivial, which is essential for developing the rich theory of duality, weak topologies, and reflexivity.

We will explore three main versions of the theorem: the most general form involving sublinear functionals on real vector spaces, the classic version for normed spaces, and its extension to complex vector spaces.

=== The Hahn-Banach Theorem for Real Vector Space

To properly state the theorem, we first define the key concepts.

#definition(title: "Dual Spaces")[
Let $X$ be a normed vector space over a field $bb(F)$, where $bb(F) = bb(R)$ or $bb(F) = bb(C)$.

- The #strong[algebraic dual space] of $X$, denoted by $X'$, is the vector space of all linear functionals $f : X arrow.r bb(F)$.
- The #strong[continuous dual space] (or simply the #strong[dual space];) of $X$, denoted by $X^*$, is the vector space of all bounded linear functionals $f : X arrow.r bb(F)$. It is a Banach space equipped with the operator norm $norm(f)_(X^*) = sup_(norm(x) lt.eq 1) abs(f (x))$.
]

It is clear that $X^* subset.eq X'$. If $Y$ is a subspace of $X$ and $f in X^*$, then its restriction to $Y$, denoted $f mid(|)_Y$, is a bounded linear functional on $Y$ (i.e., $f mid(|)_Y in Y^*$). Furthermore, the norm of the restriction is bounded by the norm of the original functional: $norm(f mid(|)_Y)_(Y^*) lt.eq norm(f)_(X^*)$.

#definition(title: "Sublinear Functional")[
Let $X$ be a vector space over $bb(R)$. A function $p : X arrow.r bb(R)$ is called a #strong[sublinear functional] if it satisfies the following two conditions:
1. #strong[Positive Homogeneity:] $p (lambda x) = lambda p (x)$ for all $x in X$ and for all $lambda gt.eq 0$.
2. #strong[Subadditivity:] $p (x + y) lt.eq p (x) + p (y)$ for all $x , y in X$.
]

#definition(title: "Seminorm")[
Let $X$ be a vector space over a field $bb(F)$, where $bb(F) = bb(R)$ or $bb(F) = bb(C)$. A function $p : X arrow.r [0, +infinity)$ is called a #strong[seminorm] if it satisfies the following two conditions:
1. #strong[Absolutely Homogeneity:] $p (lambda x) = abs(lambda) p (x)$ for all $x in X$ and for all $lambda in FF$.
2. #strong[Subadditivity:] $p (x + y) lt.eq p (x) + p (y)$ for all $x , y in X$.
]

#example[
Any norm or seminorm on a real vector space is a sublinear functional.
]

#example[
The function $p : bb(R)^n arrow.r bb(R)$ defined by $p (x_1 , dots.h , x_n) = max { x_n , 0 }$ is a sublinear functional, but it is not a seminorm (since $p (- x) eq.not p (x)$ in general).
]

This is the most general form of the theorem, concerning the extension of linear functionals dominated by a sublinear functional.

#theorem(title: "Hahn-Banach Extension Theorem")[
Let $X$ be a vector space over $bb(R)$, and let $p : X arrow.r bb(R)$ be a sublinear functional. Let $Y$ be a subspace of $X$, and let $f : Y arrow.r bb(R)$ be a linear functional such that $f (y) lt.eq p (y)$ for all $y in Y$. Then there exists a linear functional $F : X arrow.r bb(R)$ that is an extension of $f$, i.e., $F mid(|)_Y = f$, and is also dominated by $p$, i.e., $F (x) lt.eq p (x)$ for all $x in X$.
]<thm:hahn-banach-extension>

#proof[
The proof proceeds in two main steps. First, we show that we can extend the functional to a space that is one dimension larger. Then, we use Zorn's Lemma to generalize this to the entire space $X$.

1. #strong[One-Dimensional Extension]

  Let $x_0 in X \\ Y$. Consider the subspace $hat(Y) = Y plus.circle span{ x_0 }$. Any element in $hat(Y)$ can be uniquely written as $y + alpha x_0$ for some $y in Y$ and $alpha in bb(R)$. We seek to define an extension $hat(f) : hat(Y) arrow.r bb(R)$ by setting
  
  $ hat(f) (y + alpha x_0) = f (y) + alpha c. $
  
  for some constant $c = hat(f) (x_0)$ that we must choose appropriately. For $hat(f)$ to be dominated by $p$, we require $hat(f) (y + alpha x_0) lt.eq p (y + alpha x_0)$ for all $y in Y , alpha in bb(R)$. This is equivalent to:
  
  $ f (y) + alpha c lt.eq p (y + alpha x_0) arrow.l.r.double alpha c lt.eq p (y + alpha x_0) - f (y). $
    - If $alpha > 0$, dividing by $alpha$ gives:
      
      $ c lt.eq 1 / alpha (p (y + alpha x_0) - f (y)) = p (y / alpha + x_0) - f (y / alpha). $
      
      Letting $y' = y \/ alpha$, this becomes $c lt.eq p (y' + x_0) - f (y')$ for all $y' in Y$.
      
    - If $alpha < 0$, dividing by $alpha$ reverses the inequality:
      
      $ c gt.eq 1 / alpha (p (y + alpha x_0) - f (y)) = - p (- y / alpha - x_0) + f (- y / alpha). $
      
      Letting $y'' = - y \/ alpha$, this becomes $c gt.eq f (y'') - p (y'' - x_0)$ for all $y'' in Y$.

  Thus, a suitable value for $c$ exists if and only if
  
  $ sup_(y'' in Y) { f (y'') - p (y'' - x_0) } lt.eq inf_(y' in Y) { p (y' + x_0) - f (y') }. $
  
  To show this inequality holds, we must prove that for any $y' , y'' in Y$:
  
  $
  &f (y'') - p (y'' - x_0) lt.eq p (y' + x_0) - f (y') \
  arrow.l.r.double &f (y') + f (y'') lt.eq p (y' + x_0) + p (y'' - x_0).
  $
  
  Using the linearity of $f$ and subadditivity of $p$, we have:
  
  $
  f (y') + f (y'') &= f (y' + y'') \
  &lt.eq p (y' + y'') \
  &= p ((y' + x_0) + (y'' - x_0)) \
  &lt.eq p (y' + x_0) + p (y'' - x_0).
  $
  
  The inequality holds. Thus, we can always choose a value $c$ in the interval $[ sup_(y'' in Y) { f (y'') - p (y'' - x_0) } , inf_(y' in Y) { p (y' + x_0) - f (y') } ]$, completing the one-dimensional extension.

2. #strong[General Extension via Zorn's Lemma]

  Let $cal(G)$ be the set of all pairs $(Z , g)$, where $Z$ is a subspace of $X$ containing $Y$, and $g : Z arrow.r bb(R)$ is a linear functional such that $g mid(|)_Y = f$ and $g (z) lt.eq p (z)$ for all $z in Z$. We define a partial order $lt.eq$ on $cal(G)$ by setting $(Z_1 , g_1) lt.eq (Z_2 , g_2)$ if $Z_1 subset.eq Z_2$ and $g_2 mid(|)_(Z_1) = g_1$.

  The set $cal(G)$ is non-empty since $(Y , f) in cal(G)$. Now, let $cal(C) = { (Z_i , g_i) }_(i in I)$ be a totally ordered subset (a chain) in $cal(G)$. We can construct an upper bound for this chain. Let $tilde(Z) = union.big_(i in I) Z_i$. This is a subspace of $X$. Define $tilde(g) : tilde(Z) arrow.r bb(R)$ by $tilde(g) (z) = g_i (z)$ if $z in Z_i$. This is well-defined because if $z in Z_i$ and $z in Z_j$, one subspace must be contained in the other (e.g., $Z_i subset.eq Z_j$), and by the partial order definition, $g_j mid(|)_(Z_i) = g_i$, so $g_j (z) = g_i (z)$. The pair $(tilde(Z) , tilde(g))$ is in $cal(G)$ and is an upper bound for the chain $cal(C)$.

  By Zorn's Lemma, $cal(G)$ has a maximal element, say $(Y_oo , F)$. We claim that $Y_oo = X$. Suppose, for the sake of contradiction, that $Y_oo eq.not X$. Then there exists an element $x_0 in X \\ Y_oo$. By Step 1, we can extend $F$ to a functional $F_*$ on the larger subspace $Y_oo plus.circle span{ x_0 }$. This means $(Y_oo , F) < (Y_oo plus.circle span{ x_0 } , F_*)$, which contradicts the maximality of $(Y_oo , F)$. Therefore, we must have $Y_oo = X$, and $F$ is the desired extension of $f$ to all of $X$.
]

=== The Hahn-Banach Theorem for Normed Spaces

The most common application of the Hahn-Banach theorem is for extending bounded linear functionals on normed spaces.

#corollary(title: "Hahn-Banach Theorem for Real Normed Spaces")[
Let $X$ be a normed vector space over $bb(R)$, and let $Y$ be a subspace of $X$. For any bounded linear functional $f in Y^*$, there exists an extension $F in X^*$ such that $F mid(|)_Y = f$ and $norm(F)_(X^*) = norm(f)_(Y^*)$.
]<cor:hahn-banach-for-real-normed-spaces>

#proof[
Define the function $p : X arrow.r bb(R)$ by $p (x) = norm(f)_(Y^*) norm(x)_X$. This function is a norm on $X$ and is therefore a sublinear functional. For any $y in Y$, we have:

$ f (y) lt.eq abs(f (y)) lt.eq norm(f)_(Y^*) norm(y)_Y = p (y). $

The conditions of Hahn-Banach Extension Theorem are satisfied. Therefore, there exists a linear functional $F : X arrow.r bb(R)$ such that $F mid(|)_Y = f$ and $F (x) lt.eq p (x)$ for all $x in X$.

The condition $F (x) lt.eq p (x)$ implies $F (x) lt.eq norm(f)_(Y^*) norm(x)_X$. Replacing $x$ with $- x$, we get $F (- x) lt.eq norm(f)_(Y^*) norm(- x)_X$, which means $- F (x) lt.eq norm(f)_(Y^*) norm(x)_X$. Combining these gives:

$ abs(F (x)) lt.eq norm(f)_(Y^*) norm(x)_X. $

This inequality shows that $F$ is bounded and that $norm(F)_(X^*) lt.eq norm(f)_(Y^*)$. On the other hand,

$ norm(F)_(X^*) = sup_(x in X , norm(x) = 1) abs(F (x)) gt.eq sup_(y in Y , norm(y) = 1) abs(F (y)) = sup_(y in Y , norm(y) = 1) abs(f (y)) = norm(f)_(Y^*). $

Thus, we conclude that $norm(F)_(X^*) = norm(f)_(Y^*)$.
]


=== The Hahn-Banach Theorem for Complex Vector Spaces

The theorem can be extended to vector spaces over $bb(C)$. The strategy is to first treat the complex space as a real one, apply the real version of the theorem, and then recover the complex structure.

Let $X$ be a vector space over $bb(C)$, and let $f : X arrow.r bb(C)$ be a complex linear functional. We can write $f$ in terms of its real and imaginary parts: $f (x) = f_1 (x) + imUnit f_2 (x)$, where $f_1 = Re(f)$ and $f_2 = Im(f)$ are real-valued functionals. Since $f$ is complex linear, $f (imUnit x) = imUnit f (x)$. This implies:

$ f_1 (imUnit x) + imUnit f_2 (imUnit x) = i (f_1 (x) + imUnit f_2 (x)) = - f_2 (x) + imUnit f_1 (x). $

Equating the real and imaginary parts, we find the crucial relationship:

$ f_2 (x) = - f_1 (imUnit x) quad "and" quad f_1 (x) = f_2 (imUnit x). $

This means that the entire complex functional $f$ can be recovered from its real part $f_1$:

$ f (x) = f_1 (x) - imUnit f_1 (imUnit x). $

#theorem(title: "Hahn-Banach Theorem for Complex Normed Spaces")[
Let $X$ be a normed vector space over $bb(C)$, and let $Y$ be a subspace. For any $f in Y^*$, there exists an extension $F in X^*$ such that $F mid(|)_Y = f$ and $norm(F)_(X^*) = norm(f)_(Y^*)$.
]

#proof[
Let $f in Y^*$ and let $f_1 = Re(f)$. Note that $f_1$ is a real-linear functional on $Y$ (viewed as a real vector space). For any $y in Y$:

$ abs(f_1 (y)) = abs(Re(f (y))) lt.eq abs(f (y)) lt.eq norm(f)_(Y^*) norm(y)_Y. $

This shows that $f_1$ is a bounded real linear functional on $Y$, and $norm(f_1)_(Y_((bb(R)))^*) lt.eq norm(f)_(Y_((bb(C)))^*)$.

By @cor:hahn-banach-for-real-normed-spaces, there exists a real-linear extension $F_1 : X arrow.r bb(R)$ of $f_1$ such that $norm(F_1)_(X_((bb(R)))^*) = norm(f_1)_(Y_((bb(R)))^*)$. We now define a complex functional $F : X arrow.r bb(C)$ using $F_1$ as its real part, via the reconstruction formula:

$ F (x) := F_1 (x) - imUnit F_1 (imUnit x) quad "for all" x in X. $

We must verify three properties for $F$:

1. #strong[$F$ is a complex-linear extension of $f$:] For any $y in Y$, $F (y) = F_1 (y) - imUnit F_1 (imUnit y)$. Since $F_1 mid(|)_Y = f_1$, this becomes $F (y) = f_1 (y) - imUnit f_1 (imUnit y)$. Using the relation $f_2 (y) = - f_1 (imUnit y)$, we get $F (y) = f_1 (y) + imUnit f_2 (y) = f (y)$. So $F$ is an extension. To check complex linearity, note that $F$ is already real-linear since $F_1$ is. We just need to check $F (imUnit x) = imUnit F (x)$:

  $
  F (imUnit x) &= F_1 (imUnit x) - imUnit F_1 (imUnit (imUnit x)) = F_1 (imUnit x) - imUnit F_1 (- x) \
  &= F_1 (imUnit x) + imUnit F_1 (x) = imUnit (- imUnit F_1 (imUnit x) + F_1 (x)) \
  &= imUnit F (x).
  $

2. #strong[$F$ has the same norm:] We already have $norm(F)_(X^*) gt.eq norm(f)_(Y^*)$ since it's an extension. We need to show $norm(F)_(X^*) lt.eq norm(f)_(Y^*)$. For any $x in X$, we can write $F (x)$ in polar form as $F (x) = abs(F (x)) e^(- imUnit theta)$ for some $theta in bb(R)$. Then: $ abs(F (x)) = e^(imUnit theta) F (x) = F (e^(imUnit theta) x) $ Since $abs(F (x))$ is a real number, it must be equal to the real part of $F (e^(imUnit theta) x)$, which is $F_1 (e^(imUnit theta) x)$. $ abs(F (x)) = F_1 (e^(imUnit theta) x) lt.eq norm(F_1)_(X_((bb(R)))^*) norm(e^(imUnit theta) x)_X = norm(F_1)_(X_((bb(R)))^*) norm(x)_X $ Using the norm-preserving property of the real extension and the bound on $norm(f_1)$: $ norm(F_1)_(X_((bb(R)))^*) = norm(f_1)_(Y_((bb(R)))^*) lt.eq norm(f)_(Y_((bb(C)))^*) $ Combining these, we get $abs(F (x)) lt.eq norm(f)_(Y^*) norm(x)_X$. Taking the supremum over all $x$ with $norm(x)_X = 1$ gives $norm(F)_(X^*) lt.eq norm(f)_(Y^*)$. Thus, $norm(F)_(X^*) = norm(f)_(Y^*)$, completing the proof.
]


It is crucial to note that the Hahn-Banach theorem is a theorem about linear #emph[functionals] (maps into the scalar field $bb(R)$ or $bb(C)$) and does not, in general, hold for linear #emph[operators] (maps between vector spaces).

#example(title: "Counterexample")[
Consider the identity operator $I : c_0 arrow.r c_0$, where $c_0$ is the space of sequences converging to zero. The space $c_0$ is a subspace of $ell^oo$, the space of all bounded sequences. The operator $I$ is bounded with $norm(I) = 1$. However, there is no bounded linear operator $T : ell^oo arrow.r c_0$ that extends $I$. Such an extension would be a projection from $ell^oo$ onto $c_0$, and it is a known result that $c_0$ is not a complemented subspace of $ell^oo$. This illustrates the special role of the one-dimensional scalar field as the codomain in the Hahn-Banach theorem.
]
