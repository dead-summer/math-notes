#import "../book.typ": *

#show: book-page.with(
  title: "4.1 Banach Spaces"
)

== Banach Spaces

#definition[
A complete normed vector space is a Banach space.
]


A norm $norm(dot.op)$ on $X: X arrow.r \[ 0 , oo \)$ satisfying

+ *Nondegeneracy*: $norm(x) = 0 arrow.l.r.double x = 0$ .
+ *1-homogeneity*: $forall lambda in bb(F) = bb(R)$ or $bb(C)$ , $forall x in X , norm(lambda x) = abs(lambda) norm(x)$ .
+ *Triangle inequality*: $forall x , y in X , norm(x + y) lt.eq norm(x) + norm(y)$

All normed vector spaces are metric spaces since we can let $norm(x - y) := d (x , y)$ , $forall x, y in X$. Converse is false.

#example[
Both $bb(R)^d$ and $bb(C)^d$ are normed vector spaces under whatever norm. Common norms such as
$
norm(x)_1 = sum_(i=1)^(d) abs(x_i), quad norm(x)_2 = sqrt(sum_(i=1)^(d) x_i^2), quad norm(x)_infinity = max{x_i: 1 angle.l= i angle.l= d} ,
$
where $x = (x_1, x_2, ..., x_d)$ .
]

*Fact*: Finite dimensional normed vector space are all Banach spaces.

For $1 lt.eq p lt.eq oo$, let

$
norm(x)_p := cases(delim: "{", (sum_(i = 1)^d abs(x_i)^p)^(1 \/ p) & "for " 1 lt.eq p angle.l oo, max { abs(x_1) , . . . , abs(x_d) } & "for " p = oo .)
$

#question-box[
Question: What does the unit ball, $bold(B)_1 (0) subset (bb(R)^d , norm(dot.op)_p)$ look like?
]


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




Observe that $bold(B)_1 (0) subset (bb(R)^d , norm(dot.op)_p), forall 1 lt.eq p angle.l oo$ is uniformly convex. I.e., $forall x , y in partial bold(B)_1 (0) ,  "dist" (frac(x + y, 2) , partial bold(B)_1 (0)) gt.eq delta angle.r 0$. (Intuitively: unit ball is round).

Toy model $(bb(R)^d , norm(dot.op)_p)$ essentially captures the geometry of the $oo$-dimensional analogues:

$
ell^p := {{ alpha_j }_(j = 1)^oo : (sum_(j = 1)^oo abs(alpha_j)^p)^(1 / p) angle.l oo } ,
$

$
L^p ([0 , 1]) := { f : [0 , 1] arrow.r bb(R) , (integral_0^1 abs(f)^p)^(1 / p) angle.l oo } .
$

Only $L^2 (bb(R)^d , bb(C))$ has an inner product (so it is a Hilbert space) :

$
angle.l f , g angle.r := integral_(bb(R)^d) f overline(g) thin dif x .
$
Then $angle.l f, f angle.r = integral_(bb(R)^d) f overline(f) thin dif x =: norm(f)^2$ .

#example[
Consider supremum - norm on $Omega subset bb(R)^d$: $norm(f) := sup_(x in Omega) abs(f (x))$ .

1. $cal(F)^b (Omega) := { f : Omega arrow.r bb(R) : f "is bounded"}$ is a Banach space.
2. $C (Omega) = { f in cal(F)^b (Omega) : f "is continuous" }$.  is a Banach space.
3. Both $C_0 (bb(R)^d)$ and $C_c (bb(R)^d)$ are Banach spaces.
]

#theorem[
Let $(X , norm(dot.op))$ be a Banach space, $Y subset.eq X$ be a vector subspace. Then $(Y , norm(dot.op))$ is a Banach space iff $Y$ is a closed subspace of $X$ (i.e., if ${ y_j } subset Y$ s.t. $norm(y_j - x) arrow.r 0$ as $j arrow.r oo$ for some $x in X$, then $x in Y$).
]

#proof[
$arrow.r.double$: Let ${ y_j } subset Y$ be a sequence in $Y$ s.t. $y_j arrow.r x$ in $(X , norm(dot.op))$. Then ${ y_j }$ is Cauchy in $(Y , norm(dot.op))$, which is a Banach space. Hence $exists y in Y$ s.t. $y_j arrow.r y$, so $(Y , norm(dot.op))$ is closed.

$arrow.l.double$: Assume $Y subset.eq (X , norm(dot.op))$ is a closed subspace. Take any ${ y_j }$ Cauchy in $(Y , norm(dot.op))$. Then ${ y_j }$ is Cauchy in $(X , norm(dot.op))$. So $exists x in X$ s.t. $norm(y_j - x) arrow.r 0$. But $Y$ is closed, so $x in Y$. Hence $Y$ is Banach space.
]

If $(X , norm(dot.op)_X)$, $(Y , norm(dot.op)_Y)$ are Banach spaces, then $X xor Y$ (or $X times Y$) is a Banach space. Write $norm((x , y)) := norm(x)_X + norm(y)_Y$ or $max { norm(x)_X , norm(y)_Y }$.

Let $(X , norm(dot.op))$ be a Banach space. Let $X_1$, $X_2$ be closed subspaces s.t. $X_1 inter X_2 = { 0 }$. Consider the (internal) direct sum $X_1 xor X_2$. Then it's not necessarily closed in $X$.

#example[
Consider

$
c &= { upright("convergent sequences") } subset l^oo = { { a_j }_(j = 1)^infinity : sup_(j in bb(N)) abs(a_j) angle.l oo } , \
c_0 &= { { a_j }_(j = 1)^infinity in c : abs(a_j) arrow.r 0 } , \
c_(00) &= { { a_j }_(j = 1)^infinity in c_0 : upright("all but finitely many ") a_j "are " 0 }
$
on $norm(dot.op)_oo$ . Let $X = c_0$ , $X_1 = { (a_1, a_2, ...) in c_0 : a_(2 j - 1) = 0 , forall j gt.eq 1 , 2 , . . . }$ and $X_2 = { (a_1, a_2, ...) in c_0 : a_(2 j) = j^2 a_(2 j - 1) , forall j gt.eq 1 , 2 , . . . }$ be closed subspaces. Then $X_1 inter X_2 = { 0 }$.

Take $x = (1 , 0 , 1 / 4 , 0 , 1 / 9 , 0 , . . .)$. If $x in X_1 + X_2$, say $x = y + z$, $y in X_1$, $z in X_2$. Then $z = (1 , * , 1 / 4 , * , 1 / 9 , . . .)$. But $z in X_2$. So
$
z = (1 , 1 , 1 / 4 , 1 , 1 / 9 , 1 , . . .) in.not c_0 .
$
However, $x in overline(X_1 xor X_2)$ since $exists x_n arrow.r x$, where $x_n$ is the cutoff of $x$ by $(2 n)$-th coordinate with $x_n in X_1 xor X_2, forall n in bb(N)$.
]

*Conclusion*: $x in overline(X_1 xor X_2)$ and $x in.not X_1 xor X_2$ .