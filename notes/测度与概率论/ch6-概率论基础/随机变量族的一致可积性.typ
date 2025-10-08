#import "../book.typ": *

#show: book-page.with(
  title: "6.3 随机变量族的一致可积性"
)

== 随机变量族的一致可积性

在概率论中, 我们经常讨论随机变量序列的收敛性. 一个基本的问题是: 若已知随机变量序列 $X_n$ 依概率收敛于 $X$ (记作 $X_n arrow.r.long^PP X$), 在何种附加条件下, 我们可以得到 $L^1$ 收敛, 即 $EE [abs(X_n - X)] arrow.r 0$ ?

一个广为人知的#strong[充分条件];是勒贝格控制收敛定理: 若存在一个可积的随机变量 $Y$ (即 $EE [Y] < oo$), 使得对所有的 $n$, 都有 $abs(X_n)  lt.eq Y$ 几乎必然成立, 那么 $EE [X_n] arrow.r EE [X]$, 并且可以进一步证明 $EE [abs(X_n - X)] arrow.r 0$.

然而, 这个条件有时过强. 为了得到一个#strong[充要条件];, 我们需要引入#strong[一致可积性 (Uniform Integrability)] 的概念.



=== 一致可积性的定义

#definition(title: "一致可积")[
设 $cal(H)$ 是一个由随机变量组成的集合 (或族). 如果满足以下条件, 我们称 $cal(H)$ 是#strong[一致可积的 (Uniformly Integrable)];:

$ lim_(M arrow.r oo) sup_(X in cal(H)) integral_({ abs(X) > M }) abs(X) dif PP = 0, $

或者等价地写作:

$ lim_(M arrow.r oo) sup_(X in cal(H)) EE [abs(X) dot indicator_({ abs(X) > M })] = 0, $

其中 $indicator_({ abs(X) > M })$ 是事件 ${ abs(X) > M }$ 的示性函数.
]


这个定义直观地说明, 对于一个一致可积的随机变量族, 所有随机变量的"尾部"积分(或期望)可以被一致地控制. 也就是说, 当 $M$ 足够大时, 族中所有随机变量取值大于 $M$ 的部分的期望都可以任意小, 且这种"小"的程度不依赖于族中具体的某个随机变量.


为了在实践中更方便地验证一致可积性, 我们通常使用以下等价条件.

#theorem[
令 $cal(H)$ 是 $L^1 ( Omega , cal(F) , PP )$ 的一个子集. 那么, $cal(H)$ 是一致可积的当且仅当下列两个条件同时成立:

+ #strong[期望一致有界];: $sup_(X in cal(H)) EE [abs(X)] < oo$.
+ #strong[积分一致绝对连续];: 对任意的 $epsilon > 0$, 存在 $delta > 0$, 使得对任意满足 $PP (A) < delta$ 的事件 $A in cal(F)$, 都有 $sup_(X in cal(H)) integral_A abs(X) dif PP < epsilon$.
]<thm:uniformly-integrable>

#proof[
- #strong[($=>$)]: 

  1. 对任意 $X in cal(H)$, 我们有分解:
  
    $ EE [abs(X)] = EE [abs(X) dot indicator_({ abs(X) lt.eq M })] + EE [abs(X) dot indicator_({ abs(X) >  M })]. $
    
    由一致可积性的定义, 对任意 $epsilon > 0$ (例如 $epsilon = 1$), 存在一个 $M_0 > 0$, 使得对任意 $X in cal(H)$, 都有 $EE [abs(X) dot indicator_({ abs(X) >  M_0 })] < epsilon$. 因此,
    
    $ EE [abs(X)] lt.eq EE [M_0 dot.op indicator_({ abs(X) lt.eq M_0 })] + epsilon lt.eq M_0 + epsilon. $
    
    这意味着 $sup_(X in cal(H)) EE [abs(X)] lt.eq M_0 + epsilon < oo$, 条件 (1) 成立.

  2. 对任意事件 $A$ 和任意 $M > 0$, 我们有:
  
    $
    integral_A abs(X) dif PP &= integral_(A inter { abs(X) lt.eq M }) abs(X) dif PP + integral_(A inter { abs(X) >  M }) abs(X) dif PP \
    &lt.eq integral_A M dif PP + integral_({ abs(X) > M }) abs(X) dif PP \
    &= M dot.op PP (A) + EE [abs(X) dot indicator_({ abs(X) >  M })]. $
    
    对任意 $epsilon > 0$, 由一致可积性, 存在 $M_1 > 0$, 使得 $sup_(X in cal(H)) EE [abs(X) dot indicator_({ abs(X) >  M_1 })] < epsilon / 2$. 取 $delta = frac(epsilon, 2 M_1)$. 当 $PP (A) < delta$ 时, 对所有 $X in cal(H)$, 我们有:
    
    $ integral_A abs(X) dif PP lt.eq M_1 dot.op PP (A) + epsilon / 2 < M_1 dot.op frac(epsilon, 2 M_1) + epsilon / 2 = epsilon. $
    
    条件 (2) 成立.

- #strong[($arrow.l.double$)]: 我们的目标是证明 $lim_(N arrow.r oo) sup_(X in cal(H)) integral_({ abs(X)  gt.eq N }) abs(X) dif PP = 0$. 根据条件 (1), 存在常数 $C < oo$ 使得 $sup_(X in cal(H)) EE [abs(X)] lt.eq C$. 由马尔可夫 (或切比雪夫) 不等式, 对任意 $N > 0$ 和 $X in cal(H)$:
  
  $ PP (abs(X) gt.eq N) lt.eq frac(EE [abs(X)], N) lt.eq C / N. $

  因此, $sup_(X in cal(H)) PP (abs(X) gt.eq N) lt.eq C / N$. 这意味着当 $N arrow.r oo$ 时, 事件 ${ abs(X) gt.eq N }$ 的概率一致地趋向于 $0$.

  根据条件 (2), 对任意 $epsilon > 0$, 存在 $delta > 0$ 使得当 $PP (A) < delta$ 时, $sup_(X in cal(H)) integral_A abs(X) dif PP < epsilon$. 我们可以选择足够大的 $N_0$, 使得当 $N gt.eq N_0$ 时, $C / N < delta$. 令 $A_X = { abs(X)  gt.eq N }$. 那么对于 $N gt.eq N_0$, 我们有 $sup_(X in cal(H)) PP (A_X) < delta$. 将此应用到条件 (2) 中, 可得对所有 $N gt.eq N_0$,
  
  $ sup_(X in cal(H)) integral_({ abs(X)  gt.eq N }) abs(X) dif PP lt.eq epsilon. $

  这正是是一致可积性的定义.
]








=== 一致可积性与 $L^1$ 收敛的关系

以下定理 (Vitali 收敛定理) 揭示了一致可积性在 $L^1$ 收敛理论中的核心地位.

#theorem(title: "Vitali 收敛定理")[
设 ${ X_n }_(n gt.eq 1)$ 为一个随机变量序列, 且 $X_n$ 依概率收敛于 $X$. 则下列三个条件是等价的:

+ $X_n arrow.r X$ 在 $L^1$ 中收敛, 即 $lim_(n arrow.r oo) EE [abs(X_n - X)] = 0$.
+ 序列 ${ X_n }_(n gt.eq 1)$ 是一致可积的.
+ $EE [abs(X_n)] arrow.r EE [abs(X)] < oo$.
]

#proof[
- #strong[(1) $arrow.r.double$ (2)]: 假设 $X_n arrow.r X$ 在 $L^1$ 中收敛. 我们利用 @thm:uniformly-integrable 来验证 ${ X_n }$ 是一致可积的.

  1. #strong[期望一致有界];: 由三角不等式, $EE [abs(X_n)] lt.eq EE [abs(X_n - X)] + EE [abs(X)]$. 因为 $EE [abs(X_n - X)] arrow.r 0$, 所以序列 ${ EE [abs(X_n - X)] }$ 有界. 同时 $X$ 可积意味着 $EE [abs(X)] < oo$. 因此, $sup_(n gt.eq 1) EE [abs(X_n)] < oo$.

  2. #strong[积分一致绝对连续];: 对任意事件 $A$,
  
    $ integral_A abs(X_n) dif PP lt.eq integral_A abs(X_n - X) dif PP + integral_A abs(X) dif PP lt.eq EE [abs(X_n - X)] + integral_A abs(X) dif PP. $
    
    对任意 $epsilon > 0$:

    + 因为 $EE [abs(X_n - X)] arrow.r 0$, 存在 $n_0$, 使得对所有 $n > n_0$, 有 $EE [abs(X_n - X)] < epsilon \/ 2$.
    + 因为 $X$ 可积, 存在 $delta_1 > 0$, 使得当 $PP (A) < delta_1$ 时, $integral_A abs(X) dif PP < epsilon \/ 2$.
    + 对于有限个随机变量 $X_1 , dots.h , X_(n_0)$, 每一个都是可积的, 因此存在 $delta_2 > 0$, 使得当 $PP (A) < delta_2$ 时,
      
      $ max_(1 lt.eq k lt.eq n_0) integral_A abs(X_k) dif PP < epsilon/2. $
      
    取 $delta = min ( delta_1 , delta_2 )$. 当 $PP (A) < delta$ 时, 对所有 $n gt.eq 1$, 均有 $integral_A abs(X_n) dif PP < epsilon$. 因此, ${ X_n }$ 是一致可积的.

- #strong[(2) $arrow.r.double$ (1)]: 假设 ${ X_n }$ 是一致可积的且 ${X_n}$ 依概率收敛于 $X$. 我们需要证明 $EE [abs(X_n - X)] arrow.r 0$.

  对任意 $epsilon > 0$, 我们分解期望:
  
  $
  EE [abs(X_n - X)] &= EE [abs(X_n - X) dot indicator_({ abs(X_n - X) lt.eq epsilon })] + EE [abs(X_n - X) dot indicator_({ abs(X_n - X) >  epsilon })]\
  &lt.eq epsilon + EE [abs(X_n) dot indicator_({ abs(X_n - X) > epsilon })] + EE [abs(X) dot indicator_({ abs(X_n - X) >  epsilon })]. $

  令事件 $A_n = { abs(X_n - X) >  epsilon }$. 由于 $X_n arrow.r.long^PP X$, 我们有 $lim_(n arrow.r oo) PP (A_n) = 0$.
  
  由于 ${ X_n }$ 是一致可积的, 根据 @thm:uniformly-integrable 的条件 (2), 对上述 $epsilon$, 存在 $delta > 0$, 使得当 $PP (A) < delta$ 时, $sup_n integral_A abs(X_n) dif PP < epsilon$. 因为 $PP (A_n) arrow.r 0$, 所以存在 $N_1$, 使得对所有 $n > N_1$, 有 $PP (A_n) < delta$. 因此, 对这些 $n$, $integral_(A_n) abs(X_n) dif PP = EE [abs(X_n) dot indicator_(A_n)] < epsilon$.

  可以证明, ${ X_n }$ 一致可积且 $X_n arrow.r.long^PP X$ 蕴含了 $X$ 也是可积的. 因此, 同样存在 $N_2$, 使得对所有 $n > N_2$, 有 $integral_(A_n) abs(X) dif PP = EE [abs(X) dot indicator_(A_n)] < epsilon$.

  综合起来, 对足够大的 $n$ (即 $n > max ( N_1 , N_2 )$), 我们有: $EE [abs(X_n - X)] < epsilon + epsilon + epsilon = 3 epsilon$. 这意味着 $limsup_(n arrow.r oo) EE [abs(X_n - X)] lt.eq 3 epsilon$. 由于 $epsilon$ 是任意的正数, 我们可以令 $epsilon arrow.r 0$, 从而得到 $lim_(n arrow.r oo) EE [abs(X_n - X)] = 0$.
]

