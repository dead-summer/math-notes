#import "../book.typ": *

#show: book-page.with(
  title: "6.1 事件的独立性与0-1律"
)

== 事件的独立性与0-1律

我们首先引入一些基本定义.

#definition(title: "概率空间")[
一个概率空间由三元组 $(Omega , cal(F) , PP)$ 构成, 其中 $Omega$ 是样本空间, $cal(F)$ 是 $Omega$ 上的一个 $sigma$-代数, $P$ 是定义在 $cal(F)$ 上的概率测度.
]

#definition(title: "随机变量")[
一个可测函数 $xi : (Omega , cal(F)) arrow.r (bb(R) , cal(B) (bb(R)))$ 被称为一个 (实值) 随机变量, 其中 $cal(B) (bb(R))$ 是实数集上的Borel $sigma$-代数.
]

#definition(title: "数学期望")[
若随机变量 $xi$ 关于概率测度 $P$ 的积分存在, 则其数学期望定义为 $EE [ xi ] = integral_Omega xi dif PP$.
]


=== 独立性

独立性是概率论区别于测度论的基石概念之一, 它刻画了随机事件之间互不影响的性质.

#definition(title: "事件的独立性")[
- #strong[两个事件的独立性:] 设 $A , B in cal(F)$. 若 $PP (A inter B) = PP (A) PP (B)$ 成立, 则称事件 $A$ 与 $B$ #strong[相互独立];.
- #strong[有限个事件的独立性:] 设 $A_1 , A_2 , dots.h , A_n$ 为 $cal(F)$ 中的 $n$ 个事件. 若对于 ${ 1 , 2 , dots.h , n }$ 的任意子集 ${ k_1 , k_2 , dots.h , k_m }$, 都有
  
  $ PP (inter.big_(j = 1)^m A_(k_j)) = product_(j = 1)^m PP (A_(k_j)) $
  
  成立, 则称事件 $A_1 , A_2 , dots.h , A_n$ #strong[相互独立];.
- #strong[任意族事件的独立性:] 设 $cal(C) = { A_i : i in I }$ 为一族事件. 若对任意有限, 非空的索引子集 $S subset I$, 事件族 ${ A_i : i in S }$ 都是相互独立的, 即
  
  $ PP (inter.big_(i in S) A_i) = product_(i in S) PP (A_i), $
  
  则称事件族 $cal(C)$ #strong[相互独立];.
]

独立性的概念可以推广到事件的集合以及由随机变量生成的 $sigma$-代数上.

#definition(title: "事件类与随机变量的独立性")[
- #strong[事件类的独立性:] 设 ${ cal(C)_t : t in I }$ 为一族事件类 (即 $cal(C)_t subset cal(F)$) . 如果在每个 $cal(C)_t$ 中任取一个事件 $A_t$, 所构成的事件族 ${ A_t : t in I }$ 总是相互独立的, 则称事件类族 ${ cal(C)_t : t in I }$ #strong[相互独立];.
- #strong[随机变量的独立性:] 设 ${ xi_t : t in I }$ 为一族随机变量. 若由它们各自生成的 $sigma$-代数所构成的族 ${ sigma (xi_t) : t in I }$ 是相互独立的事件类族, 则称这族随机变量#strong[相互独立];. 此处, $sigma (xi_t)$ 是使得 $xi_t$ 可测的最小 $sigma$-代数, 定义为 $sigma (xi_t) = { xi_t^(- 1) (B) : B in cal(B) (bb(R)) }$.
]

#theorem(title: "独立类的扩张")[
设 ${ cal(C)_t : t in I }$ 为一族相互独立的事件类, 且每个 $cal(C)_t$ 都是一个 #strong[$pi$-类]; (即对交运算封闭) . 那么, 由它们各自生成的 $sigma$-代数所构成的族 ${ sigma (cal(C)_t) : t in I }$ 也是相互独立的.
]<thm:expansion-of-independent-classes>

#proof[
该定理的证明是Dynkin $pi$-$lambda$ 定理的经典应用.

首先, 不妨设 $Omega in cal(C)_t$ 对所有 $t in I$ 成立, 这不影响 $pi$-系或其生成的 $sigma$-代数, 也不影响独立性. 取索引集 $I$ 的一个任意有限子集 $S = { s_1 , s_2 , dots.h , s_n }$. 固定 $C_(s_j) in cal(C)_(s_j)$, $j = 2 , dots.h , n$. 定义一个集合类:

$ cal(L) = { A in cal(F) : PP (A inter inter.big_(j = 2)^n C_(s_j)) = PP (A) product_(j = 2)^n PP (C_(s_j)) }. $

可以验证 $cal(L)$ 是一个 #strong[$lambda$-类];. 根据 ${ cal(C)_t }$ 的独立性假设, 显然有 $cal(C)_(s_1) subset cal(L)$. 由于 $cal(C)_(s_1)$ 是一个 $pi$-系, 根据 $pi$-$lambda$ 定理, 有 $sigma (cal(C)_(s_1)) subset cal(L)$. 这意味着, 对于任意 $C_1 in sigma (cal(C)_(s_1))$ 和任意 $C_j in cal(C)_(s_j)$, $j = 2 , dots.h , n$, 独立性关系式成立.

接下来, 可以固定 $C_1 in sigma (cal(C)_(s_1)) , C_j in cal(C)_(s_j)$, $j = 3 , dots.h , n$, 对 $cal(C)_(s_2)$ 重复上述论证, 证明独立性对任意 $C_2 in sigma (cal(C)_(s_2))$ 成立. 依次类推, 最终可证得对任意 $C_j in sigma (cal(C)_(s_j))$, $j = 1 , dots.h , n$, 均有 $PP (inter.big_(j = 1)^n C_j) = product_(j = 1)^n PP (C_j)$. 由于 $S$ 是 $I$ 的任意有限子集, 这就证明了 ${ sigma (cal(C)_t) : t in I }$ 是相互独立的.
]

#proposition(title: "随机变量独立的判据")[
一族随机变量 ${ xi_t : t in I }$ 相互独立, 当且仅当对任意有限子集 ${ t_1 , dots.h , t_n } subset I$ 和任意实数 $x_1 , dots.h , x_n$, 下式成立:

$ PP (xi_(t_1) lt.eq x_1 , dots.h , xi_(t_n) lt.eq x_n) = product_(j = 1)^n PP (xi_(t_j) lt.eq x_j). $
]

#proof[
- ($arrow.r.double$): 必要性是显然的, 因为事件 ${ xi_t lt.eq x }$ 属于 $sigma (xi_t)$.
- ($arrow.l.double$): 充分性. 对每个 $t in I$, 定义事件类 $cal(C)_t = { { xi_t lt.eq x } : x in bb(R) }$. 易知每个 $cal(C)_t$ 都是一个 $pi$-类, 且 $sigma (cal(C)_t) = sigma (xi_t)$. 命题的条件即意味着事件类族 ${ cal(C)_t : t in I }$ 相互独立. 根据 @thm:expansion-of-independent-classes, ${ sigma (cal(C)_t) = sigma (xi_t) : t in I }$ 也相互独立, 因此随机变量族 ${ xi_t : t in I }$ 相互独立.
]


=== Borel-Cantelli 引理与 0-1 律

#theorem(title: "Borel-Cantelli 引理")[
设 ${ A_n }_(n = 1)^oo$ 为一列事件.
+ #strong[第一引理:] 若 $sum_(n = 1)^oo PP (A_n) < oo$, 则 $PP (limsup_(n arrow.r oo) A_n) = 0$.

+ #strong[第二引理:] 若事件 ${ A_n }$ 相互独立且 $sum_(n = 1)^oo PP (A_n) = oo$, 则 $PP (limsup_(n arrow.r oo) A_n) = 1$.
]

#proof[
1. 根据定义和概率的性质:
  
  $ PP (limsup_(n arrow.r oo) A_n) = PP (inter.big_(n = 1)^oo union.big_(k = n)^oo A_k) = lim_(n arrow.r oo) PP (union.big_(k = n)^oo A_k). $
  
  利用概率的次可加性:
  
  $ PP (union.big_(k = n)^oo A_k) lt.eq sum_(k = n)^oo PP (A_k). $
  
  因为 $sum_(n = 1)^oo PP (A_n)$ 收敛, 所以当 $n arrow.r oo$ 时, 级数的尾部 $sum_(k = n)^oo PP (A_k) arrow.r 0$. 因此, $PP (limsup A_n) = 0$.

2. 我们考虑对立事件, 即 $liminf_(n arrow.r oo) A_n^complement = union.big_(n = 1)^oo inter.big_(k = n)^oo A_k^complement$. $PP (limsup A_n) = 1$ 等价于 $PP (liminf A_n^complement) = 0$. 对于任意固定的 $n$ 和 $m > n$, 由于事件的独立性, 有:
  
  $ PP (inter.big_(k = n)^m A_k^complement) = product_(k = n)^m PP (A_k^complement) = product_(k = n)^m (1 - PP (A_k)). $
  
  利用不等式 $1 - x lt.eq e^(- x)$, 可得:
  
  $ product_(k = n)^m (1 - PP (A_k)) lt.eq product_(k = n)^m e^(- PP (A_k)) = exp (- sum_(k = n)^m PP (A_k)). $
  
  令 $m arrow.r oo$, 由于 $sum PP (A_k) = oo$, 则对任意 $n$, $sum_(k = n)^oo PP (A_k) = oo$. 因此:
  
  $ PP (inter.big_(k = n)^oo A_k^complement) = lim_(m arrow.r oo) PP (inter.big_(k = n)^m A_k^complement) lt.eq lim_(m arrow.r oo) exp (- sum_(k = n)^m PP (A_k)) = 0. $
  
  所以对任意 $n$,  $PP (inter.big_(k = n)^oo A_k^complement) = 0$, 从而 $PP (liminf A_n^complement) = 0$, 即 $PP (limsup A_n) = 1$.
]

#remark[
结合这两个引理可知, 对于一个#strong[独立];事件序列 ${ A_n }$, $A_n$ 无穷多次发生的概率只能是 $0$ 或 $1$, 这体现了 0-1 律的思想.
]


#definition(title: [尾 $sigma$-代数])[
设 ${ xi_n }_(n = 1)^oo$ 为一列随机变量. 其 #strong[尾 $sigma$-代数] $cal(T)$ 定义为:

$ cal(T) = inter.big_(n = 1)^oo sigma ({xi_(n + 1) , xi_(n + 2) , dots.h}). $

其中 $sigma ({xi_(n + 1) , xi_(n + 2) , dots.h})$ 是由随机变量序列 ${ xi_k }_(k > n)$ 生成的 $sigma$-代数. 由于这是一个递减的 $sigma$-代数序列, 其交集仍然是一个 $sigma$-代数. $cal(T)$ 中的事件被称为#strong[尾事件];.
]

直观地, 一个事件是否为尾事件, 取决于它是否仅由序列的无穷远处的行为决定. 也就是说, 改变, 增加或删除序列中任意有限个随机变量的取值, 都不会影响该事件的发生与否.

#example(title: "尾事件的例子")[
对于一个随机变量序列 ${ xi_n }$:
- #strong[序列的上/下极限]: 关于 $limsup_(n arrow.r oo) xi_n$ 或 $liminf_(n arrow.r oo) xi_n$ 的任何事件. 例如, 事件 $A = { limsup_(n arrow.r oo) xi_n > c }$.

- #strong[级数的收敛性]: 级数 $sum_(n = 1)^oo xi_n$ 是否收敛.

- #strong[经验平均的极限]: 序列的经验平均（或称算术平均）的收敛性及其极限值. 例如, 事件 $A = { lim_(n arrow.r oo) 1 / n sum_(k = 1)^n xi_k = mu }$.
  
- #strong[事件序列的极限]: 设 ${ A_n }_(n = 1)^oo$ 是一个事件序列, 且每个 $A_n in sigma (xi_n)$. 那么事件"$A_n$ 无穷多次发生" ($limsup A_n$) 和"$A_n$ 从某项起恒发生" ($liminf A_n$) 都是尾事件.
  
尾事件刻画了随机序列的长期或渐近性质. 根据 #strong[Kolmogorov 0-1 律];, 如果 ${ xi_n }$ 是#strong[独立];的, 那么上述任何一个尾事件发生的概率只能是 $0$ 或 $1$.
]

#proof[
- 根据定义, $limsup_(n arrow.r oo) xi_n = inf_(N gt.eq 1) sup_(k gt.eq N) xi_k$. 这个值仅由序列的尾部 ${ xi_(N + 1) , xi_(N + 2) , dots.h }$ 决定, 因为外层的极限会忽略任何有限的前缀.

- 级数 $sum_(n = 1)^oo xi_n$ 的收敛性等价于其尾部级数 $sum_(k = N + 1)^oo xi_k$ 的收敛性, 因为前 $N$ 项的和 $sum_(k = 1)^N xi_k$ 是一个不影响收敛性的有限常数. 注意, 级数的#strong[具体和];不是尾事件.

- 对于任意有限的 $N$, 前 $N$ 项对极限的贡献为 $lim_(n arrow.r oo) 1 / n sum_(k = 1)^N xi_k = 0$. 因此, 极限完全由序列的尾部决定.

- 事件 $limsup_(n arrow.r oo) A_n = inter.big_(N = 1)^oo union.big_(k = N)^oo A_k$. 其发生与否仅取决于在任意点 $N$ 之后是否仍有 $A_k$ 发生, 这自然是由尾部序列 ${ xi_(N + 1) , xi_(N + 2) , dots.h }$ 决定的.
]

#theorem(title: "Kolmogorov's 0-1 律")[
若 ${ xi_n }_(n = 1)^oo$ 是一列#strong[相互独立];的随机变量, $cal(T)$ 是其尾 $sigma$-代数, 则对任意尾事件 $A in cal(T)$, 必有 $PP (A) = 0$ 或 $PP (A) = 1$.
]

#proof[
定义 $cal(F)_n = sigma ({xi_1 , dots.h , xi_n})$ 和 $cal(T)_n = sigma ({xi_(n + 1) , xi_(n + 2) , dots.h})$. 由于 ${ xi_k }$ 的独立性, 可知对任意 $n gt.eq 1$, $sigma$-代数 $cal(F)_n$ 与 $cal(T)_n$ 是相互独立的.

尾 $sigma$-代数 $cal(T) = inter.big_(n = 1)^oo cal(T)_n$, 因此对于任意 $n$, 有 $cal(T) subset cal(T)_n$. 这意味着, 对任意 $n$, $cal(T)$ 都与 $cal(F)_n$ 相互独立. 令 $cal(G) = union.big_(n = 1)^oo cal(F)_n$. 这是一个代数, 但通常不是 $sigma$-代数. 然而, $sigma (cal(G)) = sigma ({xi_1 , xi_2 , dots.h})$. 由于 $cal(T)$ 与所有的 $cal(F)_n$ 独立, 则 $cal(T)$ 与 $cal(G)$ 独立. 由于 $cal(G)$ 为 $pi$-类, 由 @thm:expansion-of-independent-classes 可知, $cal(T)$ 与 $sigma (cal(G))$ 也独立.

但我们有 $cal(T) subset sigma ({xi_1 , xi_2 , dots.h}) = sigma (cal(G))$. 因此, 尾 $sigma$-代数 $cal(T)$ 与其自身相互独立. 这意味着对任意事件 $A in cal(T)$, $A$ 与 $A$ 自身独立. 根据独立的定义:

$ PP (A) = PP (A inter A) = PP (A) dot.op PP (A) = [ PP (A) ]^2. $

故 $PP (A) = 0$ 或 $PP (A) = 1$.
]

#corollary[
若一个随机变量 $X$ 是尾 $sigma$-代数 $cal(T)$-可测的 (即对任意 $a in bb(R)$, 事件 ${ X lt.eq a }$ 都是一个尾事件) , 并且随机变量序列 ${ xi_n }$ 相互独立, 则 $X$ 必定是一个常数 (几乎处处).
]

#proof[
因为 ${ X lt.eq a }$ 是尾事件, 由 Kolmogorov 0-1 律可知, $PP (X lt.eq a)$ 只能取 $0$ 或 $1$. 一个随机变量的分布函数 $F_X (a) = PP (X lt.eq a)$ 只能取 $0$ 或 $1$, 这表明该随机变量几乎处处等于一个常数.
]
