#import "../book.typ": *

#show: book-page.with(
  title: "1.3 测度与非负函数"
)

== 测度与非负函数

=== 测度的定义
#definition(title: "测度")[
设 $(Omega , cal(F))$ 为一个可测空间, 其中 $Omega$ 是一个非空集合 (通常称为样本空间), $cal(F)$ 是 $Omega$ 上的一个 $sigma$-代数.

一个定义在 $cal(F)$ 上的集函数 $mu : cal(F) arrow.r [ 0 , + oo ]$ 如果满足以下两个条件, 则称 $mu$ 为可测空间 $(Omega , cal(F))$ 上的一个 #strong[测度];:
+ #strong[空集性质];: $mu (nothing) = 0$.
+ #strong[可数可加性];: 对于 $cal(F)$ 中任意一列两两不交的集合 ${ A_n }_(n = 1)^oo$ (即当 $n eq.not m$ 时, $A_n inter A_m = nothing$), 恒有:
  
  $ mu (union.big_(n = 1)^oo A_n) = sum_(n = 1)^oo mu (A_n). $
]

若 $mu$ 是 $(Omega , cal(F))$ 上的一个测度, 则三元组 $(Omega , cal(F) , mu)$ 称为一个 #strong[测度空间];.

#remark(title: "有限可加性")[
可数可加性是测度定义的核心. 任何一个测度都必然满足 #strong[有限可加性];. 即对于 $cal(F)$ 中任意有限个两两不交的集合 $A_1 , A_2 , dots.h , A_k$, 有: $ mu (union.big_(i = 1)^k A_i) = sum_(i = 1)^k mu (A_i) $ 这可通过在可数可加性的定义中, 取 $A_n = nothing$ (对于所有 $n > k$) 来证明.
]


=== 测度的分类

根据全集 $Omega$ 的测度值, 常见的测度有以下几类:

+ #strong[有限测度];: 若 $mu (Omega) < oo$, 则称 $mu$ 为一个有限测度.
+ #strong[概率测度];: 若 $mu (Omega) = 1$, 则称 $mu$ 为一个概率测度. 此时, 测度空间 $(Omega , cal(F) , mu)$ 也被称为概率空间.
+ #strong[$sigma$-有限测度];: 若存在一列集合 ${ A_n }_(n = 1)^oo subset cal(F)$, 使得 $Omega = union.big_(n = 1)^oo A_n$ 且对任意 $n gt.eq 1$ 都有 $mu (A_n) < oo$, 则称 $mu$ 为一个 $sigma$-有限测度.



=== 测度的基本性质

#proposition[
设 $(Omega , cal(F) , mu)$ 为一个测度空间.

+ #strong[单调性] 对于任意 $A , B in cal(F)$, 若 $A subset B$, 则 $mu (A) lt.eq mu (B)$.

+ #strong[可减性] 对于任意 $A , B in cal(F)$, 若 $A subset B$ 且 $mu (A) < oo$, 则:
  
  $ mu (B \\ A) = mu (B) - mu (A). $

+ #strong[可数次可加性] 对于 $cal(F)$ 中任意一列集合 (不要求两两不交) ${ A_n }_(n = 1)^oo$, 恒有:

  $ mu (union.big_(n = 1)^oo A_n) lt.eq sum_(n = 1)^oo mu (A_n). $
]

#proof[
+ 由于 $A subset B$, 我们可以将 $B$ 分解为两个不交集之并: $B = A union (B \\ A)$. 根据测度的有限可加性, 有: $ mu (B) = mu (A) + mu (B \\ A) $ 因为测度的值域为 $[ 0 , + oo ]$, 所以 $mu (B \\ A) gt.eq 0$. 因此, $mu (B) gt.eq mu (A)$.

+ 由单调性的证明过程可知 $mu (B) = mu (A) + mu (B \\ A)$. 因为 $mu (A)$ 是一个有限实数, 所以可以将其移项, 得到 $mu (B \\ A) = mu (B) - mu (A)$.

+ 构造一列新的两两不交的集合 ${ B_n }_(n = 1)^oo$ 如下: $B_1 = A_1$ $B_n = A_n \\ (union.big_(i = 1)^(n - 1) A_i)$ for $n gt.eq 2$. 显然, ${ B_n }$ 是两两不交的集合, 且 $union.big_(n = 1)^oo B_n = union.big_(n = 1)^oo A_n$. 同时, 对任意 $n$, 都有 $B_n subset A_n$. 根据测度的可数可加性和单调性: $ mu (union.big_(n = 1)^oo A_n) = mu (union.big_(n = 1)^oo B_n) = sum_(n = 1)^oo mu (B_n) lt.eq sum_(n = 1)^oo mu (A_n) $ 证毕.
]


#remark[
条件 $mu (A) < oo$ 是必需的. 如果 $mu (A) = oo$, 那么 $mu (B)$ 也必然为 $oo$ (由单调性). 此时, $mu (B) - mu (A)$ 的形式为 $oo - oo$, 是无定义的. 例如, 在实数集 $bb(R)$ 上的勒贝格测度 $m$ 中, 取 $B = (1 , oo)$ 和 $A = (2 , oo)$, 则 $A subset B$. 我们有 $m (A) = m (B) = oo$, 而 $B \\ A = (1 , 2 ]$, 其测度 $m \( B \\ A) = 1$. 此时, $m (B \\ A) eq.not m (B) - m (A)$.
]

测度作为一种集函数, 具有良好的连续性, 这与序列极限的概念相对应.

#definition(title: "集合序列的极限")[
设 ${ A_n }_(n = 1)^oo$ 为一列集合. - 若 $A_1 subset A_2 subset dots.h$, 称 ${ A_n }$ 为 #strong[单调增序列];, 记作 $A_n arrow.t$. 其极限为 $lim_(n arrow.r oo) A_n = union.big_(n = 1)^oo A_n$. - 若 $A_1 supset A_2 supset dots.h$, 称 ${ A_n }$ 为 #strong[单调减序列];, 记作 $A_n arrow.b$. 其极限为 $lim_(n arrow.r oo) A_n = inter.big_(n = 1)^oo A_n$.
]

#theorem(title: "测度的连续性")[
设 $(Omega , cal(F) , mu)$ 为一个测度空间.

+ #strong[从下连续:] 若 ${ A_n }_(n = 1)^oo subset cal(F)$ 是一个单调增序列, $A_n arrow.t A$, 则 $A in cal(F)$ 且:
  
  $ mu (A) = lim_(n arrow.r oo) mu (A_n). $

+ #strong[从上连续:] 若 ${ A_n }_(n = 1)^oo subset cal(F)$ 是一个单调减序列, $A_n arrow.b A$, 且存在某个 $n_0$ 使得 $mu (A_(n_0)) < oo$, 则 $A in cal(F)$ 且:
  
  $ mu (A) = lim_(n arrow.r oo) mu (A_n). $
]

#proof[
+ 构造两两不交的集合序列 ${ B_n }$: $B_1 = A_1$, $B_n = A_n \\ A_(n - 1)$ (for $n gt.eq 2$). 则 $union.big_(n = 1)^oo B_n = union.big_(n = 1)^oo A_n = A$. 并且对任意 $k gt.eq 1$, $union.big_(n = 1)^k B_n = A_k$. 由测度的可数可加性和有限可加性:
  
  $
  mu (A) &= mu (union.big_(n = 1)^oo B_n) = sum_(n = 1)^oo mu (B_n) \
  &= lim_(k arrow.r oo) sum_(n = 1)^k mu (B_n) = lim_(k arrow.r oo) mu (union.big_(n = 1)^k B_n) \
  &= lim_(k arrow.r oo) mu (A_k).
  $

+ 由于 $mu (A_(n_0)) < oo$, 对任意 $n gt.eq n_0$, 都有 $A_n subset A_(n_0)$, 因此 $mu (A_n) < oo$. 令 $C_n = A_(n_0) \\ A_n$ (for $n gt.eq n_0$). 则 ${ C_n }$ 是一个单调增序列, $C_n arrow.t A_(n_0) \\ A$. 由从下连续性可知, $lim_(n arrow.r oo) mu (C_n) = mu (A_(n_0) \\ A)$. 因为 $mu (A_n) < oo$, 根据可减性, $mu (C_n) = mu (A_(n_0)) - mu (A_n)$, 且 $mu (A_(n_0) \\ A) = mu (A_(n_0)) - mu (A)$. 因此:
  
  $ lim_(n arrow.r oo) (mu (A_(n_0)) - mu (A_n)) = mu (A_(n_0)) - mu (A). $
  
  由于 $mu (A_(n_0))$ 是一个有限常数, 我们可以得到 $lim_(n arrow.r oo) mu (A_n) = mu (A)$.
]


=== 集函数的可加性与连续性

在更一般的框架下, 我们可以探讨定义在 #strong[代数] 上的集函数, 并建立可数可加性与连续性之间的等价关系. 这在测度扩张理论中至关重要.

#definition[
设 $cal(C)$ 是 $Omega$ 上的一个 #strong[集代数];, $mu : cal(C) arrow.r [ 0 , + oo ]$ 是一个满足 $mu (nothing) = 0$ 的集函数.

- #strong[有限可加];: 若对任意不交的 $A , B in cal(C)$, 都有 $mu (A union B) = mu (A) + mu (B)$.
- #strong[可数可加];: 定义同测度.
- #strong[从下连续];: 若 $A_n in cal(C)$, $A_n arrow.t A$, 且 $A in cal(C)$, 则 $mu (A) = lim_(n arrow.r oo) mu (A_n)$.
- #strong[在 $nothing$ 处连续];: 若 $A_n in cal(C)$, $A_n arrow.b nothing$, 且存在 $mu (A_(n_0)) < oo$, 则 $lim_(n arrow.r oo) mu (A_n) = 0$.
]

#theorem[
设 $mu$ 是集代数 $cal(C)$ 上的一个 #strong[有限可加] 的集函数. 那么, 以下条件是等价的:

+ $mu$ 是可数可加的.
+ $mu$ 是从下连续的.
+ $mu$ 是从上连续的.
+ $mu$ 是在 $nothing$ 处连续的.
]

#proof[
+ *(2) $arrow.r.double$ (1):* 我们证明 #strong[有限可加性 + 从下连续性 $arrow.r.double$ 可数可加性];.
  
  设 ${ A_k }_(k = 1)^oo subset cal(C)$ 是一列两两不交的集合, 且其并集 $A = union.big_(k = 1)^oo A_k$ 也在 $cal(C)$ 中. 令 $B_n = union.big_(k = 1)^n A_k$. 由于 $cal(C)$ 是代数, $B_n in cal(C)$. 显然, ${ B_n }$ 是一个单调增序列, $B_n arrow.t A$. 根据从下连续性的假设:
  
  $ mu (A) = lim_(n arrow.r oo) mu (B_n). $
  
  又因为 $mu$ 是有限可加的, 且 $A_1 , dots.h , A_n$ 两两不交:
  
  $ mu (B_n) = mu (union.big_(k = 1)^n A_k) = sum_(k = 1)^n mu (A_k). $
  
  结合两式可得:
  
  $ mu (A) = lim_(n arrow.r oo) sum_(k = 1)^n mu (A_k) = sum_(k = 1)^oo mu (A_k). $
  
  这正是可数可加性的定义. 证毕.
]
