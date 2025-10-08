#import "../book.typ": *

#show: book-page.with(
  title: "1.1 集合及其基本运算"
)

== 集合及其基本运算

=== 基本概念

在数学中, 我们将研究对象的特定汇集称为#strong[集合];, 而构成集合的每个对象称为该集合的#strong[元素];. 在概率论与测度论的语境下, 我们通常将所研究的所有可能结果构成的全集称为#strong[全空间] 或 #strong[样本空间];, 并记作 $Omega$. 按照约定, $Omega$ 是一个非空集合.

- #strong[元素与集合的关系]
  - 若对象 $omega$ 是集合 $A$ 的一个元素, 我们称 $omega$ #strong[属于] $A$, 记作 $omega in A$.
  - 若对象 $omega$ 不是集合 $A$ 的元素, 我们称 $omega$ #strong[不属于] $A$, 记作 $omega in.not A$.
- #strong[集合与集合的关系]
  - #strong[子集:] 我们称集合 $A$ 是全空间 $Omega$ 的一个子集, 是指 $A$ 中的所有元素均来自 $Omega$, 记作 $A subset Omega$. 更一般地, 若集合 $B$ 中的任意元素都属于集合 $A$, 则称 $B$ 是 $A$ 的子集, 记作 $B subset A$. 其形式化定义为: $ B subset A arrow.l.r.double (forall omega , omega in B arrow.r.double.long omega in A) $
  - #strong[集合相等:] 若 $A subset B$ 且 $B subset A$, 则称集合 $A$ 与 $B$ 相等, 记作 $A = B$.
  - #strong[空集:] 不包含任何元素的集合称为空集, 记作 $nothing$. 空集是任何集合的子集.

=== 集合的运算

设 $A$ 和 $B$ 是全空间 $Omega$ 的两个子集.

- #strong[并集:] 集合 $A$ 和 $B$ 的并集是由所有属于 $A$ 或属于 $B$ (或同时属于两者) 的元素构成的集合, 记作 $A union B$.
  
  $ A union B = { omega in Omega : omega in A "or" omega in B }. $

- #strong[交集:] 集合 $A$ 和 $B$ 的交集是由所有同时属于 $A$ 和 $B$ 的元素构成的集合, 记作 $A inter B$.
  
  $ A inter B = { omega in Omega : omega in A "and" omega in B }. $
  
  若 $A inter B = nothing$, 则称集合 $A$ 和 $B$ #strong[互不相交] 或#strong[互斥];.

- #strong[差集:] 集合 $A$ 与 $B$ 的差集是由所有属于 $A$ 但不属于 $B$ 的元素构成的集合, 记作 $A \\ B$.
  
  $ A \\ B = { omega in Omega : omega in A "and" omega in.not B }. $

- #strong[补集:] 集合 $A$ 关于全空间 $Omega$ 的补集是由所有属于 $Omega$ 但不属于 $A$ 的元素构成的集合, 记作 $A^complement$.

  $ A^complement = Omega \\ A = { omega in Omega : omega in.not A }. $
  
  差集与补集运算密切相关, 易见 $A \\ B = A inter B^complement$.

- #strong[对称差:] 集合 $A$ 和 $B$ 的对称差是由所有仅属于 $A$ 或仅属于 $B$ 的元素构成的集合, 记作 $A Delta B$.

  $ A Delta B = (A \\ B) union (B \\ A) = (A union B) \\ (A inter B). $

=== 集合运算的基本定律

集合的并集与交集运算满足以下基本定律:

+ #strong[交换律:]
  
  $ A union B = B union A , quad A inter B = B inter A. $

+ #strong[结合律:]
  
  $ (A union B) union C = A union (B union C) , quad (A inter B) inter C = A inter (B inter C). $

+ #strong[分配律:]
  
  $ A inter (B union C) = (A inter B) union (A inter C) $ $ A union (B inter C) = (A union B) inter (A union C). $

+ #strong[对偶律 (De Morgan's Laws):]
  
  $ (A union B)^complement = A^complement inter B^complement $ $ (A inter B)^complement = A^complement union B^complement. $
  
  #proof[
  证明 $(A union B)^complement = A^complement inter B^complement$. 我们采用元素法, 通过逻辑等价关系证明.
  
  $
  omega in (A union B)^complement & arrow.l.r.double omega in.not (A union B)\
   & arrow.l.r.double not (omega in A "or" omega in B)\
   & arrow.l.r.double (omega in.not A) "and" (omega in.not B)\
   & arrow.l.r.double omega in A^complement "and" omega in B^complement\
   & arrow.l.r.double omega in A^complement inter B^complement.
   $
   
   由于上述关系对任意 $omega in Omega$ 均成立, 故 $(A union B)^complement = A^complement inter B^complement$.
  ]


=== 集合序列及其极限

并集和交集的定义可推广至任意一个集合族. 设 ${ A_i }_(i in I)$ 是由指标集 $I$ 索引的集合族, 其中 $I$ 可以是有限集, 可数集或不可数集.

- #strong[广义并:] 元素 $omega$ 至少属于族中一个集合
  
  $ union.big_(i in I) A_i = { omega in Omega : exists i in I , "s.t." omega in A_i }. $
  
- #strong[广义交:] 元素 $omega$ 属于族中所有集合

  $ inter.big_(i in I) A_i = { omega in Omega : forall i in I , omega in A_i }. $

#remark[
De Morgan 定律同样适用于广义运算:

$ (union.big_(i in I) A_i)^complement = inter.big_(i in I) A_i^complement , quad (inter.big_(i in I) A_i)^complement = union.big_(i in I) A_i^complement. $
]


=== 集合序列的极限

给定一个集合序列 ${ A_n }_(n gt.eq 1)$, 我们可基于广义运算定义其上极限和下极限.

- #strong[上极限:]

  $
  limsup_(n -> infinity) A_n = inter.big_(n = 1)^infinity union.big_(k = n)^infinity A_k.
  $
  

  其直观含义是: 一个元素 $omega$ 属于上极限, 当且仅当它属于序列 ${ A_n }$ 中的无穷多个集合. 这通常被称为"无穷地经常出现 (infinitely often)".

- #strong[下极限:]
  
  $
  liminf_(n -> oo) A_n = union.big_(n = 1)^infinity inter.big_(k = n)^infinity A_k.
  $
  
  
  其直观含义是: 一个元素 $omega$ 属于下极限, 当且仅当它至多不属于序列 ${ A_n }$ 中的有限多个集合. 换言之, 存在某个正整数 $N$, 使得对所有 $n > N$, 都有 $omega in A_n$. 这通常被称为"最终地 (eventually)".

- #strong[基本关系:] 对于任意集合序列, 其下极限总是其上极限的子集.

  $
  liminf_(n -> oo) A_n subset limsup_(n -> infinity).
  $
  

- #strong[极限:] 若一个集合序列的上极限与下极限相等, 则称该序列的#strong[极限存在];, 并将此公共集合定义为该序列的极限.

  $
  lim_(n -> oo) A_n = liminf_(n -> oo) A_n = limsup_(n -> infinity).
  $
  

=== 单调集合序列

单调集合序列是一类特殊的集合序列, 其极限总是存在的.

#definition[
+ 若对任意 $n gt.eq 1$, 都有 $A_n subset A_(n + 1)$, 则称 ${ A_n }$ 为#strong[单调递增序列];, 记作 $A_n arrow.t$.
+ 若对任意 $n gt.eq 1$, 都有 $A_n supset A_(n + 1)$, 则称 ${ A_n }$ 为#strong[单调递减序列];, 记作 $A_n arrow.b$.
]

#proposition[
+ 若 $A_n arrow.t$, 则 $lim_(n arrow.r oo) A_n = union.big_(n = 1)^oo A_n$.
+ 若 $A_n arrow.b$, 则 $lim_(n arrow.r oo) A_n = inter.big_(n = 1)^oo A_n$.
]

#proof[
+ 设 $A = union.big_(k = 1)^oo A_k$. 我们需证明 $liminf A_n = limsup A_n = A$.
  + #strong[证明 $limsup A_n = A$:] 根据上极限定义, $limsup A_n = inter.big_(n = 1)^oo union.big_(k = n)^oo A_k$. 由于序列递增, 对任意 $n gt.eq 1$, $union.big_(k = n)^oo A_k = union.big_(k = 1)^oo A_k = A$. 因此, $limsup A_n = inter.big_(n = 1)^oo A = A$.
  
  + #strong[证明 $liminf A_n = A$:] 已知 $liminf A_n subset limsup A_n = A$, 故只需证 $A subset liminf A_n$. 任取 $omega in A = union.big_(k = 1)^oo A_k$, 则存在 $k_0 gt.eq 1$ 使得 $omega in A_(k_0)$. 由于序列单调递增, 对所有 $k gt.eq k_0$, 均有 $A_(k_0) subset A_k$, 从而 $omega in A_k$. 这意味着 $omega in inter.big_(k = k_0)^oo A_k$. 因此, $omega in union.big_(n = 1)^oo inter.big_(k = n)^oo A_k = liminf A_n$. 故 $A subset liminf A_n$. 结合两方面, $liminf A_n = A$.
  
  综上, $lim_(n arrow.r oo) A_n = A$.

+ 递减情况的证明可类似进行或通过考虑补集序列 $A_n^complement$ 来完成.
]
  

#strong[] 

=== 序列的不交化

对于任意一个集合序列 ${ A_n }_(n gt.eq 1)$, 均可构造另一个两两不交的集合序列 ${ B_n }_(n gt.eq 1)$, 使得它们的广义并相等:

$ union.big_(n = 1)^oo B_n = union.big_(n = 1)^oo A_n quad "and" quad B_i inter B_j = nothing "for" i eq.not j. $

事实上, 令

$
cases(
B_1 = A_1 & n = 1,
B_n = A_n \\ union.big_(k = 1)^(n - 1) A_k = A_n inter (union.big_(k = 1)^(n - 1) A_k)^complement & n gt.eq 2
)
$

这一构造在证明测度的可数可加性时起着关键作用.

=== 集类

#strong[集类];是以全空间 $Omega$ 的某些子集为元素的集合. 换言之, 集类是 $Omega$ 的幂集 $cal(P) (Omega)$ 的一个子集. 为简洁起见, 我们约定所讨论的集类均为*非空*集类.



在测度论中, 我们根据集类对特定集合运算的封闭性来定义若干重要的集类结构.

+ #strong[$pi$-类:] 若集类 $cal(C)$ 对#strong[有限交];运算封闭, 则称其为一个 $pi$-类.

  $ forall A , B in cal(C) arrow.r.double.long A inter B in cal(C). $

+ #strong[半环:] 集类 $cal(C)$ 满足以下条件, 则被称为半环:
  + $nothing in cal(C)$.
  + $cal(C)$ 是一个 $pi$-类 (对有限交封闭).
  + 对任意 $A, B in cal(C)$ 且 $A subset B$, 存在有限个两两不交的集合 $C_1, C_2, ... C_n in cal(C)$ 使得 $B \\ A = union.big_(k = 1)^n C_k$.

+ #strong[半代数:] 若集类 $cal(C)$ 为半环, 且 $Omega in cal(C)$, 则称其为半代数.

+ #strong[代数:] 若集类 $cal(C)$ 满足以下条件, 则称其为一个代数:
  + $Omega in cal(C)$.
  + #strong[对补集封闭:] 若 $A in cal(C)$, 则 $A^complement in cal(C)$.
  + #strong[对有限并封闭:] 若 $A , B in cal(C)$, 则 $A union B in cal(C)$.

+ #strong[$sigma$-代数:] 若集类 $cal(C)$ 是一个代数, 并且对#strong[可数并];运算封闭, 则称其为一个 $sigma$-代数. 完整定义如下:
  + $Omega in cal(C)$.
  + #strong[对补集封闭:] 若 $A in cal(C)$, 则 $A^complement in cal(C)$.
  + #strong[对可数并封闭:] 若序列 ${ A_n }_(n = 1)^oo subset cal(C)$, 则 $union.big_(n = 1)^oo A_n in cal(C)$.

+ #strong[单调类:] 若集类 $cal(C)$ 对单调序列的极限运算封闭, 则称其为一个单调类. 即:
  + 若 ${ A_n } subset cal(C)$ 且 $A_n arrow.t A$, 则 $A in cal(C)$.
  + 若 ${ A_n } subset cal(C)$ 且 $A_n arrow.b A$, 则 $A in cal(C)$.

+ #strong[$lambda$-类:] 若集类 $cal(C)$ 满足以下条件, 则称其为一个 $lambda$-类:
  + $Omega in cal(C)$.
  + 若 $A , B in cal(C)$ 且 $A subset B$, 则 $B \\ A in cal(C)$.
  + 若 ${ A_n } subset cal(C)$ 且 $A_n arrow.t A$, 则 $A in cal(C)$.

这些抽象的集类定义是构建测度论理论体系的基石, 其核心目标与意义在于:

+ #strong[构建测度空间:] 测度 (如长度、面积、概率) 是定义在 $sigma$-代数上的集合函数. 因此, $sigma$-代数是承载测度的基本框架.
+ #strong[测度的扩张:] 在实际应用中, 在一个复杂的 $sigma$-代数上直接定义测度往往很困难. 通常的做法是先在一个简单的集类 (如由区间构成的 $pi$-系或半环) 上定义一个满足一定性质的函数 (前测度), 然后利用测度扩张定理将其唯一地扩张到该集类生成的 $sigma$-代数上.
+ #strong[核心工具:] #strong[单调类定理];是实现上述扩张的关键工具. 它们建立了易于验证的简单集类 (如 $pi$-系) 与我们最终关心的 $sigma$-代数之间的桥梁, 是证明测度唯一性与存在性的基石, 也是测度论中最深刻和有力的结果之一.


