#import "../book.typ": *

#show: book-page.with(
  title: "1.2 单调类定理"
)

== 单调类定理

=== 生成集类

#proposition[
设 ${ cal(C)_i }_(i in I)$ 为一族集类. 若每一个 $cal(C)_i$ 都对某种运算 (如有限交, 可数并等) 封闭, 则它们的交 $inter_(i in I) cal(C)_i$ 也对该运算封闭.
]

根据此性质, 我们可以定义由某个集类生成的最小集类.

#definition(title: "生成的集类")[
给定任意集类 $cal(C)$,

1. 包含 $cal(C)$ 的最小的 $sigma$-代数称为由 $cal(C)$ #strong[生成的 $sigma$-代数];, 记为 $sigma (cal(C))$. 其定义为:
  
  $ sigma (cal(C)) = inter.big { cal(F) : cal(C) subset cal(F) "且" cal(F) "是一个" sigma "-代数" }. $

2. 包含 $cal(C)$ 的最小的单调类称为由 $cal(C)$ #strong[生成的单调类];, 记为 $m (cal(C))$.

3. 包含 $cal(C)$ 的最小的 $lambda$-类称为由 $cal(C)$ #strong[生成的 $lambda$-类];, 记为 $lambda (cal(C))$.
]

#example[
令 $Omega = bb(R)$ (实数集), $cal(C)$ 为所有开区间 $(a , b)$ 构成的集类. 则由 $cal(C)$ 生成的 $sigma$-代数 $sigma (cal(C))$ 是实数集上的 #strong[Borel $sigma$-代数];, 记为 $cal(B) (bb(R))$.
]

由上述定义可以直接推知, 任何 $sigma$-代数同时也是一个代数, 一个 $pi$-类, 一个 $lambda$-类和一个单调类. 因此, 对于任意集类 $cal(C)$, 以下包含关系恒成立:

$ m (cal(C)) subset sigma (cal(C)), quad lambda (cal(C)) subset sigma (cal(C)). $

#question-box[
在何种条件下, 生成的单调类或 $lambda$-类与生成的 $sigma$-代数相等? 即, 何时成立 $m (cal(C)) = sigma (cal(C))$ 或 $lambda (cal(C)) = sigma (cal(C))$? 单调类定理正是为了回答此问题.
]


=== 单调类定理

#lemma[
一个集类是 $sigma$-代数的充要条件是它同时满足以下两组条件之一:

1. 该集类既是一个 #strong[代数];, 也是一个 #strong[单调类];.
2. 该集类既是一个 #strong[$pi$-类];, 也是一个 #strong[$lambda$-类];.
]<lem:collection-sigma-algebra>

#proof[
+ 设 $cal(C)$ 是一个代数和单调类. 要证其为 $sigma$-代数, 只需验证其对可数并运算封闭. 设 ${ A_k }_(k gt.eq 1) subset cal(C)$. 定义 $B_n = union.big_(k = 1)^n A_k$. 由于 $cal(C)$ 是代数, 它对有限并封闭, 故 $B_n in cal(C)$ 对任意 $n gt.eq 1$ 成立. 同时, ${ B_n }_(n gt.eq 1)$ 是一个单调递增的集合序列 ($B_n arrow.t union.big_(k = 1)^oo A_k$). 由于 $cal(C)$ 是单调类, 它对单调递增序列的极限封闭, 故 $union.big_(k = 1)^oo A_k = lim_(n arrow.r oo) B_n in cal(C)$. 因此, $cal(C)$ 是一个 $sigma$-代数.

+ 设 $cal(C)$ 是一个 $pi$-类和 $lambda$-类. 要证其为 $sigma$-代数, 我们先证明它是一个代数.
  + $Omega in cal(C)$ (由 $lambda$-类定义).
  + 对补运算封闭: 若 $A in cal(C)$, 因为 $Omega in cal(C)$ 且 $A subset Omega$, 根据 $lambda$-类定义, $A^complement = Omega \\ A in cal(C)$.
  + 对有限并封闭: 若 $A , B in cal(C)$, 则 $A^complement , B^complement in cal(C)$. 由于 $cal(C)$ 是 $pi$-类, $A^complement inter B^complement in cal(C)$. 再由封闭性, $(A^complement inter B^complement)^complement in cal(C)$. 根据德摩根定律, $A union B = (A^complement inter B^complement)^complement$, 故 $A union B in cal(C)$. 至此, 我们证明了 $cal(C)$ 是一个代数.
  
    现在证明其对可数不交并封闭. 设 ${ A_n }_(n gt.eq 1)$ 是 $cal(C)$ 中互不相交的集合序列. 令 $B_n = union.big_(k = 1)^n A_k$. 由于 $cal(C)$ 是代数, $B_n in cal(C)$. 序列 ${ B_n }$ 单调递增, 其极限为 $union.big_(k = 1)^oo A_k$. 根据 $lambda$-类的定义, 此极限属于 $cal(C)$.
    
    最后, 对于任意可数并 $union.big A_n$, 我们可以将其转化为可数不交并: $union.big_(n = 1)^oo A_n = union.big_(n = 1)^oo B_n$, 其中 $B_1 = A_1$, $B_n = A_n \\ (union.big_(k = 1)^(n - 1) A_k)$. 由于 $cal(C)$ 是代数, 每个 $B_n$ 都在 $cal(C)$ 中. 因此, $union.big A_n in cal(C)$. 综上, $cal(C)$ 是一个 $sigma$-代数.
]

#theorem(title: "单调类定理")[
1. 若 $cal(C)$ 是一个 #strong[代数 (algebra)];, 则 $m (cal(C)) = sigma (cal(C))$.
2. 若 $cal(C)$ 是一个 #strong[$pi$-类 ($pi$-system)];, 则 $lambda (cal(C)) = sigma (cal(C))$.
]<thm:dynkin>


#proof[
+ 已知 $m (cal(C)) subset sigma (cal(C))$, 只需证明 $sigma (cal(C)) subset m (cal(C))$. 这等价于证明 $m (cal(C))$ 本身就是一个 $sigma$-代数. 根据@lem:collection-sigma-algebra, 由于 $m (cal(C))$ 按定义是一个单调类, 我们只需证明 $m (cal(C))$ 是一个代数即可.

  + #strong[包含 $Omega$];: 因为 $cal(C)$ 是代数, 所以 $Omega in cal(C) subset m (cal(C))$.
  
  + #strong[对补运算封闭];: 定义集类 $cal(G)_1 = { A in m (cal(C)) : A^complement in m (cal(C)) }$. 首先, $cal(C) subset cal(G)_1$, 因为 $cal(C)$ 是代数, 对任意 $A in cal(C)$, $A^complement in cal(C) subset m (cal(C))$, 故 $A in cal(G)_1$. 其次, 证明 $cal(G)_1$ 是一个单调类. 若 ${ A_n } subset cal(G)_1$ 且 $A_n arrow.t A$, 则 $A_n^complement arrow.b A^complement$. 因为 $A_n in cal(G)_1$, 所以 $A_n^complement in m (cal(C))$. 由于 $m (cal(C))$ 是单调类, $A^complement = lim A_n^complement in m (cal(C))$, 这意味着 $A in cal(G)_1$.
  
    同理可证递减序列的情况. 因此, $cal(G)_1$ 是一个包含 $cal(C)$ 的单调类. 由 $m (cal(C))$ 的最小性可知 $m (cal(C)) subset cal(G)_1$. 而由 $cal(G)_1$ 的定义, $cal(G)_1 subset m (cal(C))$. 故 $cal(G)_1 = m (cal(C))$. 这证明了 $m (cal(C))$ 对补运算封闭.
  
  + #strong[对有限并封闭];: 对任意固定的 $B in cal(C)$, 定义集类 $cal(G)_2 = { A in m (cal(C)) : A union B in m (cal(C)) }$. 通过与上面类似的论证, 可以证明 $cal(G)_2$ 是一个包含 $cal(C)$ 的单调类, 从而 $cal(G)_2 = m (cal(C))$. 这意味着, 对任意 $A in m (cal(C))$ 和 $B in cal(C)$, 都有 $A union B in m (cal(C))$.
  
    现在, 对任意固定的 $A in m (cal(C))$, 定义集类 $cal(G)_3 = { B in m (cal(C)) : A union B in m (cal(C)) }$. 由上一步结论可知 $cal(C) subset cal(G)_3$. 再次使用相同的论证, 可证明 $cal(G)_3 = m (cal(C))$. 这表明, 对任意 $A , B in m (cal(C))$, 都有 $A union B in m (cal(C))$. 综上, $m (cal(C))$ 是一个代数, 也是一个单调类, 故 $m (cal(C))$ 是一个 $sigma$-代数. 证毕.

+ 已知 $lambda (cal(C)) subset sigma (cal(C))$, 只需证明 $lambda (cal(C))$ 是一个 $sigma$-代数. 根据@lem:collection-sigma-algebra, 由于 $lambda (cal(C))$ 按定义是一个 $lambda$-类, 我们只需证明 $lambda (cal(C))$ 是一个 $pi$-类即可. 证明 $lambda (cal(C))$ 对有限交封闭:

  + 对任意固定的 $A in cal(C)$, 定义集类 $cal(G)_A = { B in lambda (cal(C)) : A inter B in lambda (cal(C)) }$. 不难验证 $cal(G)_A$ 是一个 $lambda$-类. 由于 $cal(C)$ 是 $pi$-类, 对任意 $B in cal(C)$, $A inter B in cal(C) subset lambda (cal(C))$, 故 $B in cal(G)_A$. 因此 $cal(C) subset cal(G)_A$. 由于 $cal(G)_A$ 是一个包含 $cal(C)$ 的 $lambda$-类, 由 $lambda (cal(C))$ 的最小性可知 $lambda (cal(C)) subset cal(G)_A$. 故 $cal(G)_A = lambda (cal(C))$. 这表明, 对任意 $A in cal(C)$ 和任意 $B in lambda (cal(C))$, 都有 $A inter B in lambda (cal(C))$.
  
  + 现在, 对任意固定的 $B in lambda (cal(C))$, 定义集类 $cal(G)_(B') = { A in lambda (cal(C)) : A inter B in lambda (cal(C)) }$. 由已证的结论可知, $cal(C) subset cal(G)_(B')$. 再次, 不难验证 $cal(G)_(B')$ 是一个 $lambda$-类. 因此, $lambda (cal(C)) subset cal(G)_(B')$, 故 $cal(G)_(B') = lambda (cal(C))$. 这表明, 对任意 $A , B in lambda (cal(C))$, 都有 $A inter B in lambda (cal(C))$. 综上, $lambda (cal(C))$ 是一个 $pi$-类, 也是一个 $lambda$-类, 故 $lambda (cal(C))$ 是一个 $sigma$-代数. 证毕.
]



#corollary[
1. 若 $cal(C)$ 是代数, 则 $m (cal(C)) = sigma (cal(C))$ 的一个等价条件是: 对任意 $A in cal(C)$ 和 $B in m (cal(C))$ 都有 $A inter B in m (cal(C))$.
2. 若 $cal(C)$ 是 $pi$-类, 则 $lambda (cal(C)) = sigma (cal(C))$ 的一个等价条件是: 对任意 $A in cal(C)$ 和 $B in lambda (cal(C))$ 都有 $A inter B in lambda (cal(C))$.
]

#proof[
这两个条件的充分性在 @thm:dynkin 的证明中已经作为关键步骤被建立. 必要性是显然的, 因为若 $m (cal(C)) = sigma (cal(C))$ 或 $lambda (cal(C)) = sigma (cal(C))$, 那么生成的类本身就是代数, 自然对交运算封闭.
]

#example[
设 $Omega = bb(R)^n$. 令 $cal(C)_1$ 为 $bb(R)^n$ 中所有开集构成的集类, $cal(C)_2$ 为所有闭集构成的集类. 我们有 $sigma (cal(C)_1) = sigma (cal(C)_2) = cal(B) (bb(R)^n)$. 并且, $m (cal(C)_1) = sigma (cal(C)_1)$, $m (cal(C)_2) = sigma (cal(C)_2)$.
]

#proof[
我们以 $cal(C)_2$ (闭集类) 为例.

1. 验证 $cal(C)_2$ 是一个 $pi$-类: 任意有限个闭集的交仍然是闭集. 此条件满足.

2. 为了应用单调类定理的变体, 我们需要证明 $cal(C)_2$ 是一个代数. 但 $cal(C)_2$ 显然不是代数 (闭集的补是开集, 不一定是闭集).

3. 我们转而应用一个基于 @thm:dynkin 的推论. 设 $cal(A)$ 是由形如 "有限个半开区间的并" 构成的集类, 那么 $cal(A)$ 是一个代数, 且 $sigma (cal(A)) = cal(B) (bb(R)^n)$. 根据@thm:dynkin, $m (cal(A)) = sigma (cal(A)) = cal(B) (bb(R)^n)$.

4. 任何开集都可以表示为可数个闭集的并, 任何闭集也都可以表示为可数个开集的补. 利用这些拓扑性质和单调类的定义, 可以证明所有开集和闭集都属于 $m (cal(A))$. 因此, $sigma (cal(C)_1) subset m (cal(A))$ 且 $sigma (cal(C)_2) subset m (cal(A))$.

5. 结合 $m (cal(A)) = cal(B) (bb(R)^n)$, 最终可得结论.
]