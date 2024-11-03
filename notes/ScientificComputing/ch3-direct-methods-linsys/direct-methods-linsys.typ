#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with(title: "Direct Methods for Linear Systems")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

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

In this chapter, we will study on two direct methods for linear systems. One is based on the LU decomposition. Another one is based on the QR decomposition.

Let

$ upright(bold(A)) = mat(delim: "(", a_(1 , 1), a_(1 , 2), a_(1 , 3), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), a_(2 , 3), dots.h.c, a_(2 , n); a_(3 , 1), a_(3 , 2), a_(3 , 3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n); a_(n , 1), a_(n , 2), dots.h.c, a_(n , n - 1), a_(n , n)) $

be the $n$ by $n$ matrix in $bb(R)^(n times n)$ ;

$ upright(bold(x)) = vec(x_1, x_2, dots.v, x_n)  quad "and"  upright(bold(b)) = vec(b_1, b_2, dots.v, b_n) $

be unknown and known vectors in $bb(R)^n$ of the linear system below,

$
upright(bold(A x)) = upright(bold(b)) .
$<eq:1>


Assume the coefficient matrix $upright(bold(A))$ is invertible.
