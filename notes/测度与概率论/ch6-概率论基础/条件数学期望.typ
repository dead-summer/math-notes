#import "../book.typ": *

#show: book-page.with(
  title: "6.2 条件数学期望"
)

== 条件数学期望

=== 条件数学期望的定义

在初等概率论中, 条件期望 $EE [X mid(|) Y = y]$ 是在一个给定条件下计算的期望. 为了将其推广至更一般的情形, 我们借助测度论的工具给出如下定义.

#definition[
设 $(Omega , cal(F) , bb(P))$ 是一个概率空间, $X$ 是该空间上的一个随机变量, 且其期望存在, 即 $EE [abs(X)] < oo$. 设 $cal(G)$ 是 $cal(F)$ 的一个子 $sigma$-代数.

我们定义一个在 $cal(G)$ 上的有符号测度 $nu$:

$ nu (A) = integral_A X dif bb(P) = EE [X dot.op indicator_A] , quad forall A in cal(G), $

其中 $indicator_A$ 是集合 $A$ 的示性函数.

由于对任意 $A in cal(G)$, 若 $bb(P) (A) = 0$, 则 $nu (A) = integral_A X dif bb(P) = 0$. 因此, 测度 $nu$ 关于测度 $bb(P)$ 是绝对连续的 ($nu lt.double bb(P)$). 根据 #strong[Radon-Nikodym 定理];, 存在一个函数 $Y$, 使得该函数满足:

+ $Y$ 是 $cal(G)$-可测的.
+ 对于任意集合 $A in cal(G)$, 满足以下积分等式: $ integral_A Y dif bb(P) = integral_A X dif bb(P), $

  即 $EE [Y dot.op indicator_A] = EE [X dot.op indicator_A])$.

满足上述条件 (1) 和 (2) 的随机变量 $Y$ 被称为给定 $sigma$-代数 $cal(G)$ 下随机变量 $X$ 的#strong[条件数学期望], 记为:

$ Y = EE [X mid(|) cal(G)]. $
]

#remark[
- 条件期望 $EE [X mid(|) cal(G)]$ 是一个#strong[随机变量];, 而不是一个常数. 它的值依赖于 $omega in Omega$.
- 条件期望在#strong[几乎必然 (almost surely, a.s.)] 的意义下是唯一的. 即如果 $Y_1$ 和 $Y_2$ 都是 $X$ 关于 $cal(G)$ 的条件期望, 那么 $bb(P) (Y_1 = Y_2) = 1$.
]

#example(title: "离散型随机变量")[
设 $cal(G) = { nothing , A , A^complement , Omega }$, 其中 $A in cal(F)$ 且 $0 < bb(P) (A) < 1$. 令 $Y = EE [X mid(|) cal(G)]$. 由于 $Y$ 是 $cal(G)$-可测的, 它可以表示为 $Y = a dot.op indicator_A + b dot.op indicator_(A^complement)$, 其中 $a , b$ 为常数. 根据定义中的性质: 取集合 $A in cal(G)$, 我们有:
  
  $ integral_A Y dif bb(P) = integral_A (a dot.op indicator_A + b dot.op indicator_(A^complement)) dif bb(P) = integral_A a dif bb(P) = a bb(P) (A). $
  同时, $integral_A X dif bb(P) = EE [X dot.op indicator_A]$. 因此, $a bb(P) (A) = EE [X dot.op indicator_A]$, 得到 $a = frac(EE [X dot.op indicator_A], bb(P) (A))$.
  
  取集合 $A^complement in cal(G)$, 同理可得: $b bb(P) (A^complement) = EE [X dot.op indicator_(A^complement)]$, 得到 $b = frac(EE [X dot.op indicator_(A^complement)], bb(P) (A^complement))$.

因此, 条件期望为: $ EE [X mid(|) cal(G)] = frac(EE [X dot.op indicator_A], bb(P) (A)) indicator_A + frac(EE [X dot.op indicator_(A^complement)], bb(P) (A^complement)) indicator_(A^complement) $ 这与初等概率论中基于事件的条件期望定义是一致的. 例如, 若取 $X = indicator_B$, $B in cal(F)$, 则 $a = frac(bb(P) (A inter B), bb(P) (A)) = bb(P) (B mid(|) A)$, $b = frac(bb(P) (A^complement inter B), bb(P) (A^complement)) = bb(P) (B mid(|) A^complement)$.
]

#example(title: "连续型随机变量")[
设 $(X , Y)$ 为二维连续型随机变量, 其联合概率密度函数为 $p (x , y)$. 我们希望计算 $EE [X mid(|) sigma (Y)]$, 其中 $sigma (Y)$ 是由随机变量 $Y$ 生成的 $sigma$-代数. 令 $Z = EE [X mid(|) sigma (Y)]$. 由于 $Z$ 是 $sigma (Y)$-可测的, 根据可测函数的相关定理, 存在一个 Borel 可测函数 $f: bb(R) arrow.r bb(R)$, 使得 $Z = f (Y)$. 根据定义, 对任意 $A = Y^(-1) (B) in sigma (Y)$, 其中 $B$ 是 Borel 集, 应满足:

$ integral_A X dif bb(P) = integral_A f (Y) dif bb(P). $

特别地, 取 $A = { Y lt.eq y }$, 上式可写为:

$ integral_(- oo)^y (integral_(- oo)^(+ oo) x p (x , v) dif x) dif v = integral_(- oo)^y f (v) p_Y (v) dif v, $

其中 $p_Y (v)$ 是 $Y$ 的边际概率密度函数. 为了使上式对任意 $y$ 成立, 两边关于 $y$ 求导可得:

$ integral_(- oo)^(+ oo) x p (x , y) dif x = f (y) p_Y (y). $

当 $p_Y (y) > 0$ 时, 我们可以定义:

$ f (y) = frac(integral_(- oo)^(+ oo) x p (x , y) dif x, p_Y (y)) = integral_(- oo)^(+ oo) x frac(p (x , y), p_Y (y)) dif x. $

右侧的表达式正是条件概率密度 $p_(X mid(|) Y) (x mid(|) y) = frac(p (x , y), p_Y (y))$, 因此:

$ f (y) = integral_(- oo)^(+ oo) x p_(X mid(|) Y) (x mid(|) y) dif x = EE [X mid(|) Y = y]. $

最终我们得到 $EE [X mid(|) sigma (Y)] = f (Y)$, 其中函数 $f (y)$ 就是我们熟知的 $EE [X mid(|) Y = y]$.
]

