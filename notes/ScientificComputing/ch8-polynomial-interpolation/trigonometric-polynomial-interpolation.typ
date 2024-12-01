#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#show figure.where(
  kind: table
): set figure.caption(position: top)
#show figure.where(
  kind: table
): set block(breakable: true)

#counter(figure).update(3)

#counter(heading).update(6)
#set heading(numbering: "1.1.1")

// 上一节编号到 16
#counter(math.equation).update(26)

// 带有 label 的公式才编号
#set math.equation(numbering: "(1)", supplement: none, number-align: bottom)
#show math.equation.where(block: true): it => {
 if not it.has("label") {
   let fields = it.fields()
   fields.remove("body")
   fields.numbering = none
   return [#counter(math.equation).update(v => v - 1)#math.equation(..fields, it.body)<math-equation-without-label>]
 }
 return it
}

= Trigonometric polynomial interpolation
<trigonometric-polynomial-interpolation>
== Gibbs phenomenon
<gibbs-phenomenon>
#exm[
Let $H (x)$ be the Heaviside function given by

$ H (x) = cases(delim: "{", 1 & upright(" if ") x > 0, 1 / 2 & upright(" if ") x = 0, 0 & upright(" if ") x < 0) $

Let $m > 1$ be an integer. Let $h = 1 / m$ and $x_j = j h$ for $j = 0 , plus.minus 1 , plus.minus 2 , dots.h.c , plus.minus m$ . Approximate the heaviside function by trigonometric function

$ u_(2 m) (x) = a_0 / 2 + sum_(k = 1)^(m - 1) [a_k cos (k pi x) + b_k sin (k pi x)] + a_m cos (m pi x) $

so that

$ u_(2 m) (x_j) = H (x_j) quad "for" j = 0 , plus.minus 1 , plus.minus 2 , dots.h.c , plus.minus (m - 1) , m . $

Please write a $C \/ C + +$ program to find the maximum value of the trigonometric interpolant $u_(2 m) (x)$ in the interval $(0, h)$ for different $m in { 2 , 4 , dots.h.c , 128 }$ . Observe the convergence of the values.

#figure(
  align(center)[
    // #set text(10pt)
    #table(
      columns: (auto, 40pt, 40pt, 40pt, 40pt, 40pt, 40pt, 40pt),
      [$m$], [2], [4], [8], [16], [32], [64], [128],
      [], [], [], [], [], [], [], [],
  )]
  , kind: table,
)
]

