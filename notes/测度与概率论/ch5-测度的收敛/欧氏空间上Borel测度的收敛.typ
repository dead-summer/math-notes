#import "../book.typ": *

#show: book-page.with(
  title: "5.1 欧氏空间上Borel测度的收敛"
)

== 欧氏空间上Borel测度的收敛

=== Radon测度及其性质

在讨论测度的收敛之前, 我们首先需要引入一类在欧氏空间 $bb(R)^d$ 上具有良好性质的测度, 即Radon测度.

#definition(title: "正则性")[
设 $mu$ 为定义在 $(bb(R)^d , cal(B) ( bb(R)^d) )$ 上的一个测度, 其中 $cal(B) (bb(R)^d)$ 是 $bb(R)^d$ 上的Borel $sigma$-代数.

- #strong[内正则];: 若对任意开集 $O subset bb(R)^d$, 均有

  $ mu (O) = sup { mu (K) : K subset O , K "为紧集" } $
  
  成立, 则称 $mu$ 是内正则的.

- #strong[外正则];: 若对任意Borel集 $A in cal(B) (bb(R)^d)$, 均有
  
  $ mu (A) = inf { mu (O) : O supset A , O "为开集" } $
  
  成立, 则称 $mu$ 是外正则的.

- #strong[正则测度];: 若一个测度同时是内正则和外正则的, 则称其为正则测度.
]

#definition(title: "Radon 测度")[
一个定义在 $(bb(R)^d , cal(B) ( bb(R)^d) )$ 上的测度 $mu$ 若满足以下条件:
+ $mu$ 为正则测度.
+ $mu$ 在所有紧集上取有限值.
则称 $mu$ 为一个 #strong[Radon测度];.
]

#remark[
- 一个重要的结论是: 在 $bb(R)^d$ 上, 所有的#strong[有限];Borel测度都是Radon测度.
- 若 $mu$ 为Radon测度, 则对于任意有界Borel集 $A in cal(B) (bb(R)^d)$, 都有 $mu (A) < oo$. 这是因为有界集的闭包是紧集.
]




#definition(title: "原子与连续点")[
给定一个Radon测度 $mu$ 以及一点 $a in bb(R)^d$.
- 若 $mu ({ a }) > 0$, 则称 $a$ 是 $mu$ 的一个#strong[原子];.
- 若 $mu ({ a }) = 0$, 则称 $a$ 是 $mu$ 的一个#strong[连续点];.
]

我们将 $mu$ 的所有连续点组成的集合记为 $C (mu)$.

#proposition[
Radon 测度的原子集是可数的.
]

#proof[
令 $A_n = { x in bb(R)^d : norm(x)  lt.eq n }$ 为半径为 $n$ 的闭球. 由于 $A_n$ 是有界集, 根据Radon测度的性质, $mu (A_n) < oo$. 对于任意正整数 $n , k gt.eq 1$, 定义集合

$ C_(n , k) = { x in A_n : mu ({ x }) > 1 \/ k }. $

$C_(n , k)$ 中的元素个数必然是有限的. 若不然, 假设 $C_(n , k)$ 包含无穷多个点, 我们可以从中取出 $m$ 个点, 其中 $m > k mu (A_n)$. 那么

$ mu (A_n) gt.eq sum_(x in { x_1 , . . . , x_m } subset C_(n , k)) mu ({ x }) > m dot.op (1 \/ k) > mu (A_n), $

这导致矛盾. 因此, $C_(n , k)$ 必然是有限集. $bb(R)^d$ 中 $mu$ 的所有原子构成的集合为 $union.big_(n = 1)^oo union.big_(k = 1)^oo C_(n , k)$. 这是一个可数个有限集的并集, 因此它本身也是一个可数集. 证明完毕.
]

#corollary[
Radon 测度的连续点集 $C (mu)$ 在 $bb(R)^d$ 中是稠密的.
]

#proof[
采用反证法. 假设 $C (mu)$ 在 $bb(R)^d$ 中不是稠密的, 那么存在一个非空开集 $O subset bb(R)^d$, 使得 $O inter C (mu) = nothing$. 这意味着 $O$ 中的每一个点都是 $mu$ 的原子. 由于任何非空开集 $O$ 都包含无穷多个点 (事实上是不可数个), 这就意味着 $mu$ 拥有不可数个原子, 与原子集可数矛盾. 因此, $C (mu)$ 必须在 $bb(R)^d$ 中稠密. 证明完毕.
]

=== 测度的收敛

我们引入两种在测度论和概率论中至关重要的收敛方式. 为方便记号, 我们定义如下的左开右闭区间:

  $ (a , b ] = { x = ( x_1 , . . . , x_d) in bb(R)^d : a_i < x_i lt.eq b_i , forall i = 1 , . . . , d }, $

其中 $a , b in bb(R)^d$. 我们称这样的区间为#strong[连续性区间];, 如果其所有顶点(即所有由坐标 $a_i , b_i$ 构成的点)都是测度 $mu$ 的连续点. 由于 $C (mu)$ 的稠密性, 这样的区间是存在的.

#definition(title: "淡收敛与弱收敛")[
设 ${ mu_n }_(n = 1)^oo$ 和 $mu$ 都是 $bb(R)^d$ 上的Radon测度.

- #strong[淡收敛 (Vague Convergence)];: 如果对于任意的 $a , b in C (mu)$, 都有

  $ lim_(n arrow.r oo) mu_n (( a , b ]) = mu (( a , b ]) $
  
  成立, 则称测度序列 ${ mu_n }$ #strong[淡收敛];到 $mu$, 记作 $mu_n arrow.r.long^v mu$.

- #strong[弱收敛 (Weak Convergence)];: 如果 $mu_n arrow.r.long^v mu$, 并且总质量收敛, 即

  $ lim_(n arrow.r oo) mu_n (bb(R)^d) = mu (bb(R)^d) < oo $
  
  成立, 则称测度序列 ${ mu_n }$ #strong[弱收敛];到 $mu$, 记作 $mu_n arrow.r.long^w mu$.
]

#remark[
淡收敛不一定保证对任意区间 $(a , b ]$ 都有 $mu_n ( ( a , b ]) arrow.r mu (( a , b ])$. 例如: 在 $bb(R)$ 上, 取 $mu_n = delta_(1 \/ n)$ (在点 $1 \/ n$ 处的Dirac测度), $mu = delta_0$. 不难验证 $mu_n arrow.r.long^v mu$. 但是, 考虑区间 $(- 1 , 0 ]$, 点 $0$ 不是 $mu = delta_0$ 的连续点. 我们有 $mu_n ( ( - 1 , 0 ]) = 0$ 对所有 $n gt.eq 1$ 成立, 而 $mu (( - 1 , 0 ]) = delta_0 ({ 0 }) = 1$. 因此, $lim_(n arrow.r oo) mu_n (( - 1 , 0 ]) eq.not mu (( - 1 , 0 ])$.
]

=== 收敛的等价刻画

将测度的收敛与函数积分的收敛联系起来, 可以得到更实用且深刻的等价定义.

令 $C_c (bb(R)^d)$ 表示 $bb(R)^d$ 上所有紧支撑连续函数的集合, $C_b (bb(R)^d)$ 表示 $bb(R)^d$ 上所有有界连续函数的集合.

#theorem(title: "淡收敛的等价条件")[
设 ${ mu_n }$ 和 $mu$ 是 $bb(R)^d$ 上的Radon测度. 则 $mu_n arrow.r.long^v mu$ 当且仅当对任意 $f in C_c (bb(R)^d)$, 都有:

$ lim_(n arrow.r oo) integral_(bb(R)^d) f dif mu_n = integral_(bb(R)^d) f dif mu. $
]<thm:vague-conergebce>

#proof[
- *($arrow.r.double$)*: 假设 $mu_n arrow.r.long^v mu$. 对任意 $f in C_c (bb(R)^d)$, 我们可以用一个由连续性区间的示性函数构成的阶梯函数 $f_k$ 来一致逼近 $f$. 利用 $mu_n arrow.r.long^v mu$, 可证得 $integral f_k dif mu_n arrow.r integral f_k dif mu$. 再通过三角不等式控制逼近误差项, 即可证明 $integral f dif mu_n arrow.r integral f dif mu$.

- *($arrow.l.double$)*: 假设对所有 $f in C_c (bb(R)^d)$ 积分都收敛. 要证明 $mu_n (( a , b ]) arrow.r mu (( a , b ])$, 其中 $a , b in C (mu)$, 我们可以构造两个紧支撑连续函数 $g_1 , g_2$, 使得它们分别从内部和外部逼近示性函数 $indicator((a , b ])$: $g_1 lt.eq indicator(( a , b ]) lt.eq g_2$. 于是有 $integral g_1 dif mu_n lt.eq mu_n ( ( a , b ]) lt.eq integral g_2 dif mu_n$. 两边取极限, 得到 $integral g_1 dif mu lt.eq liminf mu_n (( a , b ]) lt.eq limsup mu_n (( a , b ]) lt.eq integral g_2 dif mu$. 通过精心构造 $g_1 , g_2$, 可以使 $integral (g_2 - g_1) dif mu$ 任意小, 从而证明极限存在且等于 $mu (( a , b ])$.
]

#theorem(title: "弱收敛的等价条件")[
设 ${ mu_n }$ 和 $mu$ 是 $bb(R)^d$ 上的有限测度, 且 $sup_n mu_n (bb(R)^d) < oo$. 则 $mu_n arrow.r.long^w mu$ 当且仅当对任意 $f in C_b (bb(R)^d)$, 都有: $ lim_(n arrow.r oo) integral_(bb(R)^d) f dif mu_n = integral_(bb(R)^d) f dif mu. $
]

#proof[
- *($arrow.l.double$)*: 充分性是显然的. 由于 $C_c (bb(R)^d) subset C_b (bb(R)^d)$, 根据 @thm:vague-conergebce, $mu_n arrow.r.long^v mu$. 再取 $f (x) equiv 1$, 这是一个有界连续函数, 于是 $integral 1 dif mu_n arrow.r integral 1 dif mu$, 即 $mu_n (bb(R)^d) arrow.r mu (bb(R)^d)$. 满足弱收敛的定义.

- *($arrow.r.double$)*: 假设 $mu_n arrow.r.long^w mu$. 对于任意 $f in C_b (bb(R)^d)$, 我们需要证明积分收敛. 其核心思想是用一个紧支撑函数来逼近 $f$. 因为总质量不会 "逃逸到无穷", 我们可以找到一个足够大的连续性区间 $(a , b ]$, 使得其补集 $( a , b ]^c$ 的测度 $mu ( ( a , b ]^c)$ 和 $mu_n (( a , b ]^c)$ (对于足够大的 $n$) 都任意小. 构造一个截断函数 $phi.alt in C_c (bb(R)^d)$, 使其在 $\[ a , b ]$ 上为1, 在 $\[ a , b ]$ 外部很快衰减为0. 令 $f_epsilon.alt = f dot.op phi.alt$, 则 $f_epsilon.alt in C_c (bb(R)^d)$. 于是 $integral f_epsilon.alt dif mu_n arrow.r integral f_epsilon.alt dif mu$. 再利用三角不等式
  
  $ abs(integral f dif mu_n - integral f dif mu) lt.eq abs(integral (f - f_epsilon.alt) dif mu_n) + abs(integral f_epsilon.alt dif mu_n - integral f_epsilon.alt dif mu) + abs(integral (f_epsilon.alt - f) dif mu) $ 来控制误差, 即可完成证明.
]

对于概率测度 (即总质量为1的测度), 弱收敛有几个非常重要的等价命题, 通常被称为 Portmanteau 定理.

#theorem(title: "Portmanteau 定理")[
设 ${ mu_n }$ 和 $mu$ 是 $bb(R)^d$ 上的概率测度. 则以下命题是等价的:

1. $mu_n arrow.r.long^w mu$.
2. 对所有开集 $O subset bb(R)^d$, 有 $liminf_(n arrow.r oo) mu_n (O) gt.eq mu (O)$.
3. 对所有闭集 $F subset bb(R)^d$, 有 $limsup_(n arrow.r oo) mu_n (F) lt.eq mu (F)$.
4. 对所有Borel集 $A in cal(B) (bb(R)^d)$ 且满足 $mu (partial A) = 0$, 有 $lim_(n arrow.r oo) mu_n (A) = mu (A)$.
]

