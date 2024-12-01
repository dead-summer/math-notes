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

#counter(heading).update(3)
#set heading(numbering: "1.1.1")

// 上一节编号到 13
#counter(math.equation).update(13)

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

= Runge phenomenon
<runge-phenomenon>

#exm[
Let

$ f (x) = frac(1, 1 + x^2) , quad "for" x in [- 5 , 5] . $

Let ${x_j}_(j = 0)^n$ be a set of equidistant nodes on the interval given by $x_j = - 5 + j Delta x$ with $Delta x = 10 \/ n$ .

Make plots for both the Lagrange interpolating polynomial

$ p_10 (x) = sum_(j = 0)^10 ell_j (x) f (x_j) $

and the Hermite interpolation polynomial.

]