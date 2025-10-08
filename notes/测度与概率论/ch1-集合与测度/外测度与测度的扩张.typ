#import "../book.typ": *

#show: book-page.with(
  title: "1.4 外测度与测度的扩张"
)

== 外测度与测度的扩张

本节的核心目标是建立一套严谨的理论, 将一个定义在相对简单的集合类 (例如, 半环) 上的具有可加性的集合函数, 扩张为一个定义在更广泛的 $sigma$-代数上的测度. 实现这一目标的关键工具是 #strong[外测度] 的概念以及 #strong[Carathéodory 可测性条件];.



=== 外测度

#definition(title: "外测度")[
设 $Omega$ 是一个非空集合, $cal(P) (Omega)$ 是 $Omega$ 的幂集. 一个集函数 $mu^* : cal(P) (Omega) arrow.r [ 0, + oo ]$ 若满足以下三个条件, 则称 $mu^*$ 为 $Omega$ 上的一个#strong[外测度];:

+ #strong[空集性质];: $mu^* (nothing) = 0$.

+ #strong[单调性];: 对任意 $A, B subset Omega$, 若 $A subset B$, 则 $mu^* (A) lt.eq mu^* (B)$.

+ #strong[可数次加性];: 对任意一列集合 ${ A_n }_(n = 1)^oo$ ($A_n subset Omega$), 均有:
  
  $ mu^* (union.big_(n = 1)^oo A_n) lt.eq sum_(n = 1)^oo mu^* (A_n). $
]


外测度虽然定义在幂集 $cal(P) (Omega)$ 上, 具有良好的延展性, 但它通常不满足可数可加性, 而可数可加性是测度的核心性质. 为构造一个真正的测度, 我们需要从 $cal(P) (Omega)$ 中筛选出一个子集类, 使得外测度在该集类上具有可数可加性. Carathéodory 提出的可测性条件为此提供了筛选准则.

#theorem[
设 $mu^*$ 为 $Omega$ 上的一个外测度. 定义 $Omega$ 的子集构成的集类 $cal(M)$ 如下:

$ cal(M) = { A subset Omega divides forall D subset Omega, mu^* (D) = mu^* (D inter A) + mu^* (D inter A^complement) }. $

则 $cal(M)$ 是 $Omega$ 上的一个 $sigma$-代数, 且 $mu^*$ 在 $cal(M)$ 上的限制 $mu = mu^* mid(|)_(cal(M)) : cal(M) arrow.r [ 0, + oo ]$ 是一个#strong[完备测度];. 我们称 $cal(M)$ 中的元素为 #strong[$mu^*$-可测集];.
]<thm:caratheodory>

#proof[
我们需要证明 $cal(M)$ 是一个 $sigma$-代数, 并且 $mu^*$ 在 $cal(M)$ 上是可数可加的. 注意到, 由外测度的次可加性, $mu^* (D) lt.eq mu^* (D inter A) + mu^* (D inter A^complement)$ 自动成立. 因此, 证明 $A in cal(M)$ 只需证明 $mu^* (D) gt.eq mu^* (D inter A) + mu^* (D inter A^complement)$ 对所有 $D subset Omega$ 成立.

+ #strong[证明 $cal(M)$ 是一个 $sigma$-代数.]

  + #strong[$Omega in cal(M)$];: 取 $A = Omega$, 则 $A^complement = nothing$. 对任意 $D subset Omega$, 我们有 $D inter A = D$ 且 $D inter A^complement = nothing$. 由外测度定义, $mu^* (nothing) = 0$, 故 $mu^* (D inter A) + mu^* (D inter A^complement) = mu^* (D) + mu^* (nothing) = mu^* (D)$. 因此, $Omega in cal(M)$.

  + #strong[对补集封闭];:  若 $A in cal(M)$, 则对任意 $D subset Omega$, $mu^* (D) = mu^* (D inter A) + mu^* (D inter A^complement)$. 由于 $(A^complement)^complement = A$, 我们可以将 $A$ 与 $A^complement$ 的角色互换, 上式变为 $mu^* (D) = mu^* (D inter (A^complement)^complement) + mu^* (D inter A^complement)$, 这正好是 $A^complement$ 满足可测性条件的定义. 故 $A^complement in cal(M)$.

  + #strong[对可数并封闭];: 我们分三步进行.

    + #strong[对有限并封闭];: 首先证明若 $A, B in cal(M)$, 则 $A union B in cal(M)$. 对任意 $D subset Omega$, 因为 $A in cal(M)$, 所以:
      
      $ mu^* (D) = mu^* (D inter A) + mu^* (D inter A^complement). $
      
      现在, 将 $D inter A^complement$ 作为测试集, 应用 $B in cal(M)$ 的可测性条件:
      
      $ mu^* (D inter A^complement) = mu^* ((D inter A^complement) inter B) + mu^* ((D inter A^complement) inter B^complement). $
      
      代入第一式, 并注意到 $(A union B)^complement = A^complement inter B^complement$, 得:
      
      $ mu^* (D) = mu^* (D inter A) + mu^* (D inter A^complement inter B) + mu^* (D inter (A union B)^complement). $
      
      由于 $D inter (A union B) = (D inter A) union (D inter A^complement inter B)$, 利用外测度的次可加性:
      
      $ mu^* (D inter (A union B)) lt.eq mu^* (D inter A) + mu^* (D inter A^complement inter B). $
      
      结合上两式, 得到 $mu^* (D) gt.eq mu^* (D inter (A union B)) + mu^* (D inter (A union B)^complement)$. 如前所述, 反向不等式自动成立, 故 $A union B in cal(M)$. 通过数学归纳法可知, $cal(M)$ 对有限并运算封闭.

    + #strong[对可数不交并封闭];: 设 ${ A_n }_(n = 1)^oo$ 是 $cal(M)$ 中一列两两不交的集合, 令 $A = union.big_(n = 1)^oo A_n$. 令 $S_N = union.big_(n = 1)^N A_n$. 由有限并的结论可知 $S_N in cal(M)$. 因此对任意 $D subset Omega$: $mu^* (D) = mu^* (D inter S_N) + mu^* (D inter S_N^complement)$.
      
      由于 $S_N subset A$, 故 $A^complement subset S_N^complement$, 由单调性得 $mu^* (D inter A^complement) lt.eq mu^* (D inter S_N^complement)$. 所以
      
      $ mu^* (D) gt.eq mu^* (D inter S_N) + mu^* (D inter A^complement). $
      
      对 $mu^* (D inter S_N)$ 反复应用 $A_n in cal(M)$ 的可测性 (利用其两两不交的性质), 可通过归纳法证明: $mu^* (D inter S_N) = mu^* (D inter (union.big_(n = 1)^N A_n)) = sum_(n = 1)^N mu^* (D inter A_n)$. 所以
      
      $ mu^* (D) gt.eq sum_(n = 1)^N mu^* (D inter A_n) + mu^* (D inter A^complement). $
      
      令 $N arrow.r oo$, 得到 $mu^* (D) gt.eq sum_(n = 1)^oo mu^* (D inter A_n) + mu^* (D inter A^complement)$. 由外测度的可数次加性, $sum_(n = 1)^oo mu^* (D inter A_n) gt.eq mu^* (union.big_(n = 1)^oo (D inter A_n)) = mu^* (D inter A)$. 结合上两式, 得到 $mu^* (D) gt.eq mu^* (D inter A) + mu^* (D inter A^complement)$, 故 $A = union.big_(n = 1)^oo A_n in cal(M)$.

    + #strong[对一般可数并封闭];: 对 $cal(M)$ 中任意序列 ${ A_n }$, 我们可以构造一个两两不交的序列 ${ B_n } subset cal(M)$ 如下: $B_1 = A_1$, $B_n = A_n \\ (union.big_(k = 1)^(n - 1) A_k) = A_n inter (union.big_(k = 1)^(n - 1) A_k)^complement in cal(M)$. 易知 $union.big_(n = 1)^oo A_n = union.big_(n = 1)^oo B_n$. 根据不交并的结论, $union.big A_n in cal(M)$.

  至此, 我们证明了 $cal(M)$ 是一个 $sigma$-代数.

+ #strong[证明 $mu^* mid(|)_(cal(M))$ 是可数可加的.] 设 ${ A_n }_(n = 1)^oo$ 是 $cal(M)$ 中一列两两不交的集合, 令 $A = union.big_(n = 1)^oo A_n$. 我们需要证明 $mu^* (A) = sum_(n = 1)^oo mu^* (A_n)$.

  由外测度的可数次加性, $mu^* (A) = mu^* (union.big_(n = 1)^oo A_n) lt.eq sum_(n = 1)^oo mu^* (A_n)$. 对于反向不等式, 在第一部分证明不交并时, 我们得到对任意 $D subset Omega$,
  
  $ mu^* (D) gt.eq sum_(n = 1)^oo mu^* (D inter A_n) + mu^* (D inter A^complement). $
  
  现取测试集 $D = A$, 则 $D inter A_n = A inter A_n = A_n$, 且 $D inter A^complement = nothing$. 代入上式, 得到 $mu^* (A) gt.eq sum_(n = 1)^oo mu^* (A_n) + mu^* (nothing) = sum_(n = 1)^oo mu^* (A_n)$. 因此, $mu^* (A) = sum_(n = 1)^oo mu^* (A_n)$. 这证明了 $mu^*$ 在 $cal(M)$ 上是可数可加的, 故其限制 $mu$ 是一个测度. (注: 由此方法构造的测度天然是完备的, 此处不展开证明). #strong[证毕.]
]

=== 由集函数构造外测度

在测度论的实际构造中, 我们通常从一个定义在简单集类 (如区间构成的半环) 上的函数 (如长度) 出发, 期望将其扩张为定义在更复杂集合 (如Borel集) 上的测度. 下述命题是实现该目标的第一步: 从一个定义在任意集类 $cal(C)$ 上的函数构造一个定义在全空间 $cal(P) (Omega)$ 上的外测度.

#proposition[
设 $cal(C)$ 是 $Omega$ 的一个子集族, 满足 $nothing in cal(C)$. 设 $rho : cal(C) arrow.r [ 0, + oo ]$ 是一个集函数, 满足 $rho (nothing) = 0$. 定义 $mu^* : cal(P) (Omega) arrow.r [ 0, + oo ]$ 如下:

$ mu^* (A) := inf {sum_(n = 1)^oo rho (A_n) divides { A_n }_(n = 1)^oo subset cal(C), A subset union.big_(n = 1)^oo A_n}. $

对任意 $A subset Omega$ 成立 (约定 $inf nothing = + oo$). 则:

1. $mu^*$ 是 $Omega$ 上的一个外测度.
2. 若 $rho$ 在 $cal(C)$ 上是#strong[可数次加的] (即对任意 $A in cal(C)$ 及其在 $cal(C)$ 中的任意覆盖 $A subset union.big A_n$, 均有 $rho (A) lt.eq sum rho (A_n)$), 则对任意 $A in cal(C)$, 有 $mu^* (A) = rho (A)$.

我们称 $mu^*$ 为由 $rho$ 在 $cal(C)$ 上#strong[导出的外测度];.
]

#proof[
+ #strong[证明 $mu^*$ 是外测度.]

  + #strong[空集性质];: 因为 $nothing in cal(C)$ 且 $nothing subset nothing$, 故 ${ nothing, nothing, dots.h }$ 是 $nothing$ 的一个 $cal(C)$ 覆盖. 因此 $mu^* (nothing) lt.eq rho (nothing) + 0 + dots.h = 0$. 又因 $mu^*$ 的值域非负, 故 $mu^* (nothing) = 0$.

  + #strong[单调性];: 若 $A subset B$, 则任何对 $B$ 的 $cal(C)$ 覆盖也是对 $A$ 的 $cal(C)$ 覆盖. 因此, 用于计算 $mu^* (A)$ 而取下确界的集合, 是用于计算 $mu^* (B)$ 的集合的超集. 故 $mu^* (A) lt.eq mu^* (B)$.

  + #strong[可数次加性];: 设 $A = union.big_(k = 1)^oo A_k$. 我们要证明 $mu^* (A) lt.eq sum_(k = 1)^oo mu^* (A_k)$. 若存在某个 $k$ 使得 $mu^* (A_k) = + oo$, 则不等式显然成立. 假设对所有 $k$, $mu^* (A_k) < + oo$. 根据下确界的定义, 对任意 $epsilon > 0$, 对每一个 $k$, 存在一个 $cal(C)$ 中的覆盖 ${ C_(n, k) }_(n = 1)^oo$ 使得 $A_k subset union.big_(n = 1)^oo C_(n, k)$ 并且:
    
    $ sum_(n = 1)^oo rho (C_(n, k)) < mu^* (A_k) + epsilon / 2^k. $
    
    那么, 集合族 ${ C_(n, k) }_(n, k = 1)^oo$ 是 $A = union.big_k A_k$ 的一个可数覆盖. 因此, 根据 $mu^*$ 的定义:
    
    $ mu^* (A) lt.eq sum_(k = 1)^oo sum_(n = 1)^oo rho (C_(n, k)) < sum_(k = 1)^oo (mu^* (A_k) + epsilon / 2^k) = (sum_(k = 1)^oo mu^* (A_k)) + epsilon. $
    
    由于 $epsilon > 0$ 是任意的, 令 $epsilon arrow.r 0^(+)$, 我们得到 $mu^* (A) lt.eq sum_(k = 1)^oo mu^* (A_k)$.

+ #strong[证明 $mu^* (A) = rho (A)$.]

  - 一方面, 由于 $A in cal(C)$, 集合序列 ${ A, nothing, nothing, dots.h }$ 是 $A$ 的一个 $cal(C)$ 覆盖, 故由定义有 $mu^* (A) lt.eq rho (A) + rho (nothing) + dots.h = rho (A)$.

  - 另一方面, 设 ${ A_n }$ 是 $A$ 的任意一个 $cal(C)$ 中覆盖, 即 $A subset union.big A_n$. 因为我们假设了 $rho$ 在 $cal(C)$ 上是可数次加的, 所以
    
    $ rho (A) lt.eq sum_(n = 1)^infinity rho (A_n). $

    此不等式对所有覆盖均成立, 故 $rho (A)$ 是所有 $sum rho (A_n)$ 的一个下界. 因此 $rho (A)$ 必不大于其最大下界, 即 $rho (A) lt.eq inf { sum rho (A_n) } = mu^* (A)$.
  
  结合两个不等式, 得 $mu^* (A) = rho (A)$. #strong[证毕.]
]


=== 半环上的测度性质

#strong[半环] 是一种比环和代数更弱的集合系统, 但在测度论的构造中极为重要. 例如, $bb(R)^n$ 中所有形如 $[ a, b )$ 的区间构成的集族就是一个半环.

#proposition[
设 $cal(C)$ 为一个半环, $mu : cal(C) arrow.r [ 0, + oo ]$ 是一个集函数且 $mu (nothing) = 0$. 则 $mu$ 是#strong[可数可加的]当且仅当 $mu$ 是#strong[有限可加的]且#strong[可数次加的];.
]

#proof[
- #strong[$arrow.r.double$];: 若 $mu$ 可数可加, 则其有限可加性是显然的. 对于可数次加性, 设 $A subset union.big_(n = 1)^oo A_n$ 且 $A, A_n in cal(C)$. 令 $B_n = A inter A_n in cal(C)$. 则 $A = A inter (union.big B_n) = union.big B_n$.

  构造不交集列 $C_1 = B_1$, $C_n = B_n \\ union.big_(k = 1)^(n - 1) B_k$. 于是 $A = union.big_(n = 1)^oo C_n$ (不交并). 由于 $cal(C)$ 是半环, 每个 $C_n$ 都是 $cal(C)$ 中有限个不交集之并, 且 $mu$ 在其上是有限可加的. 由 $mu$ 的可数可加性, $mu (A) = sum mu (C_n)$. 一个可加函数在半环上是单调的, 故 $mu (C_n) lt.eq mu (B_n) = mu (A inter A_n) lt.eq mu (A_n)$. 因此 $mu (A) lt.eq sum mu (A_n)$.

- #strong[$arrow.l.double$];: 设 $mu$ 是有限可加且可数次加的. 我们需证明其可数可加性. 设 $A = union.big_(n = 1)^oo A_n$ 是 $cal(C)$ 中的一个可数不交并. 由可数次加性, 我们有 $mu (A) lt.eq sum_(n = 1)^oo mu (A_n)$.

  为证反向不等式, 对任意 $N gt.eq 1$, 令 $S_N = union.big_(n = 1)^N A_n$. 由于 $A_n$ 两两不交, 且 $mu$ 有限可加, $mu (S_N) = sum_(n = 1)^N mu (A_n)$. 因为 $cal(C)$ 是半环, $S_N in cal(C)$ 且 $S_N subset A$, 一个有限可加函数在半环上是单调的, 故 $mu (S_N) lt.eq mu (A)$. 因此, $sum_(n = 1)^N mu (A_n) lt.eq mu (A)$. 令 $N arrow.r oo$, 得到 $sum_(n = 1)^oo mu (A_n) lt.eq mu (A)$. 结合两个不等式, 证得 $mu (A) = sum_(n = 1)^oo mu (A_n)$. #strong[证毕.]
]


=== Carathéodory 测度扩张定理

#lemma[
设 $cal(C)$ 是一个半环, $mu : cal(C) arrow.r [ 0, + oo ]$ 是一个有限可加函数且 $mu (nothing) = 0$. $mu^*$ 是由 $mu$ 导出的外测度. 那么 $cal(C)$ 中的每个集合都是 $mu^*$-可测的, 即 $cal(C) subset cal(M)$.
]

#proof[
对任意 $A in cal(C)$, 我们需要证明对任意 $D subset Omega$, $mu^* (D) gt.eq mu^* (D inter A) + mu^* (D inter A^complement)$. 设 ${ C_n }_(n = 1)^oo$ 是 $D$ 的任意一个 $cal(C)$ 覆盖. 则 $D inter A subset union.big (C_n inter A)$ 且 $D inter A^complement subset union.big (C_n inter A^complement)$. 由于 $cal(C)$ 是半环, $C_n inter A in cal(C)$. 故 ${ C_n inter A }$ 是 $D inter A$ 的一个 $cal(C)$ 覆盖, 因此 $mu^* (D inter A) lt.eq sum mu (C_n inter A)$. 同时, $C_n \\ A = C_n inter A^complement$ 可表示为 $cal(C)$ 中有限个不交集之并, 记为 $union.big_j E_(n, j)$. 集合族 ${ E_(n, j) }_(n, j)$ 是 $D inter A^complement$ 的一个 $cal(C)$ 覆盖, 故 $mu^* (D inter A^complement) lt.eq sum_(n, j) mu (E_(n, j))$. 由于 $mu$ 有限可加, $mu (C_n) = mu (C_n inter A) + sum_j mu (E_(n, j))$. 对 $n$ 求和, 得 $sum_n mu (C_n) = sum_n mu (C_n inter A) + sum_(n, j) mu (E_(n, j)) gt.eq mu^* (D inter A) + mu^* (D inter A^complement)$. 对覆盖 ${ C_n }$ 取下确界, 即得 $mu^* (D) gt.eq mu^* (D inter A) + mu^* (D inter A^complement)$.
]

#lemma(title: [测度扩张的唯一性])[
设 $cal(P)$ 是一个 $pi$-系, $mu_1$ 和 $mu_2$ 是定义在 $sigma (cal(P))$ 上的两个#strong[有限测度];. 如果对任意 $A in cal(P)$, 都有 $mu_1 (A) = mu_2 (A)$, 那么对任意 $A in sigma (cal(P))$, 都有 $mu_1 (A) = mu_2 (A)$.
]

#remark[
此结论可推广至 $sigma$-有限测度的情况. 证明的核心是利用单调类定理.
]


#theorem(title: "Carathéodory 测度扩张定理")[
+ #strong[存在性];: 设 $cal(C)$ 是 $Omega$ 上的一个半环, $mu : cal(C) arrow.r [ 0, + oo ]$ 是一个#strong[可数可加的];集函数. 那么, 存在 $sigma (cal(C))$ 上的一个测度 $overline(mu)$ 使得它在 $cal(C)$ 上的限制等于 $mu$, 即 $overline(mu) mid(|)_(cal(C)) = mu$.

+ #strong[唯一性];: 如果 $mu$ 在 $cal(C)$ 上是 #strong[$sigma$-有限的] (即存在一列 ${ A_n }_(n = 1)^oo subset cal(C)$ 使得 $union.big A_n = Omega$ 且 $mu (A_n) < + oo$), 那么这个扩张是#strong[唯一的];.
]

#proof[
+ #strong[存在性证明];:
  - 根据命题 1.4.4, $mu$ 在半环 $cal(C)$ 上可数可加, 故其是有限可加且可数次加的.
  - 根据命题 1.4.3, 我们可以由 $mu$ 导出一个外测度 $mu^*$, 并且 $mu^*$ 在 $cal(C)$ 上的值与 $mu$ 相同, 即 $mu^* mid(|)_(cal(C)) = mu$.
  - 根据定理 1.4.2, $mu^*$ 确定了一个 $sigma$-代数 $cal(M)$ (所有 $mu^*$-可测集), 且 $mu^*$ 在 $cal(M)$ 上的限制是一个测度.
  - 根据引理 1.4.5, $cal(C) subset cal(M)$.
  - 因为 $cal(M)$ 是一个 $sigma$-代数, 它必然包含由 $cal(C)$ 生成的最小 $sigma$-代数 $sigma (cal(C))$, 即 $sigma (cal(C)) subset cal(M)$.
  - 因此, 将 $mu^*$ 限制在 $sigma (cal(C))$ 上, 得到测度 $overline(mu) = mu^* mid(|)_(sigma (cal(C)))$. 对任意 $A in cal(C)$, $overline(mu) (A) = mu^* (A) = mu (A)$. 这就证明了存在性.
+ #strong[唯一性证明];:
  - 半环是一个 $pi$-系 (因其对有限交封闭).
  - 在 $mu$ 是 #strong[$sigma$-有限] 的条件下, 设 $mu_1$ 和 $mu_2$ 是两个满足条件的扩张测度. 它们在 $pi$-系 $cal(C)$ 上相等.
  - 利用 $sigma$-有限性, 我们可以将全空间分解为可数个测度有限的集合, 并在每个集合上应用引理 1.4.6 的有限测度版本, 证明 $mu_1$ 和 $mu_2$ 在 $sigma (cal(C))$ 上处处相等.
]

=== 测度空间的完备化

一个测度空间 $(Omega, cal(F), mu)$ 称为#strong[完备的];, 如果 $cal(F)$ 中任何一个零测度集的所有子集都属于 $cal(F)$ (从而它们的测度也为零). 由 Carathéodory 定理生成的测度空间是完备的, 但并非所有测度空间都天然完备. 例如, Borel $sigma$-代数配上 Lebesgue 测度就不是完备的. 完备性是一个重要的性质, 任何测度空间都可以通过添加所有零测集的子集来"完备化".

#theorem(title: "完备化定理")[
设 $(Omega, cal(F), mu)$ 是一个测度空间. 令 $cal(N) = { N subset Omega divides exists B in cal(F), N subset B "且" mu (B) = 0 }$ . 令 $overline(cal(F)) = { A union N divides A in cal(F), N in cal(N) }$. 可以定义其上的测度 $overline(mu)$ 如下: 对任意 $E = A union N in overline(cal(F))$, 定义 $overline(mu) (E) = mu (A)$. 那么:
1. $overline(mu)$ 的定义是良性的 (well-defined).
2. $(Omega, overline(cal(F)), overline(mu))$ 是一个完备的测度空间.
3. $overline(mu)$ 是 $mu$ 的扩张, 即 $overline(mu) mid(|)_(cal(F)) = mu$.

我们称 $(Omega, overline(cal(F)), overline(mu))$ 为 $(Omega, cal(F), mu)$ 的#strong[完备化空间];.
]<thm:completion>

#proof[
1. #strong[$overline(mu)$ 是良性的];: 需证明若 $A_1 union N_1 = A_2 union N_2$, 则 $mu (A_1) = mu (A_2)$. 由 $A_1 subset A_1 union N_1 = A_2 union N_2$, 可知 $A_1$ 被 $A_2$ 和一个零测集的子集覆盖, 由测度的单调性和次加性, $mu (A_1) lt.eq mu (A_2)$. 同理 $mu (A_2) lt.eq mu (A_1)$. 故 $mu (A_1) = mu (A_2)$.

2. #strong[$overline(cal(F))$ 是 $sigma$-代数];:

  + $Omega = Omega union nothing in overline(cal(F))$.
  + #strong[对补集封闭];: 若 $E = A union N in overline(cal(F))$, 其中 $N subset B, mu (B) = 0$. 则 $E^complement = (A union N)^complement = A^complement inter N^complement$. 可证明 $E^complement = (A^complement \\ B) union ((A^complement inter B) \\ N)$. 其中 $A^complement \\ B in cal(F)$, 且 $(A^complement inter B) \\ N in cal(N)$. 故 $E^complement in overline(cal(F))$.
  + #strong[对可数并封闭];: 对 ${ A_n union N_n }$, 其并集为 $(union.big A_n) union (union.big N_n)$. $union.big A_n in cal(F)$, $union.big N_n in cal(N)$. 故 $overline(cal(F))$ 对可数并封闭.

- #strong[$overline(mu)$ 是测度];: 主要证明可数可加性. 设 ${ E_n }$ 是 $overline(cal(F))$ 中不交序列, $E_n = A_n union N_n$. 则 $overline(mu) (union.big E_n) = mu (union.big A_n) = sum mu (A_n) = sum overline(mu) (E_n)$.
]

#definition(title: "完备化")[
给定一个测度空间 $(Omega, cal(F), mu)$, 其#strong[完备化空间] $(Omega, overline(cal(F)), overline(mu))$ 由@thm:completion 所构造. 这是包含 $(Omega, cal(F), mu)$ 的最小的完备测度空间.
]
