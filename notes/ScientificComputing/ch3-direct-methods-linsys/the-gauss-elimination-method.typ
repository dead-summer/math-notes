#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with(title: "Direct Methods for Linear Systems")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(0)
#set heading(numbering: "1.1.1")

// 由于上一节编号到 1，因此本节从 2 开始编号：
#counter(math.equation).update(1)
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

= The Gauss Elimination Method
The idea of the Gauss elimination method is to reduce the matrix $upright(bold(A))$ to an upper triangular matrix or eliminate the entries in the lower part of the coefficient matrix. Let $a_(i , j)^((1)) = a_(i , j)$ and $a_(i , j)^((k))$ be entries of the matrix in the $k^(t h)$ step. The procedure of Gauss elimination can be described by the following pseudo-code:

The linear system after the Gauss elimination reads

$ mat(delim: "(", a_(1 , 1)^((1)), a_(1 , 2)^((1)), a_(1 , 3)^((1)), dots.h.c, a_(1 , n)^((1)); #none, a_(2 , 2)^((2)), a_(2 , 3)^((2)), dots.h.c, a_(2 , n)^((2)); #none, , a_(3 , 3)^((3)), dots.h.c, a_(3 , n)^((3)); #none, , , dots.down, dots.v; #none, , , , a_(n , n)^((n))) vec(x_1, x_2, x_3, dots.v, x_n) = vec(b_1^((1)), b_2^((2)), b_3^((3)), dots.v, b_n^((n))) . $<eq:3>


Assume the diagonal entries are always non-zero in the elimination process, i.e.

$ a_(k , k)^((k)) eq.not 0 . $

Note that the upper/right triangular system (@eq:3) implies

$ sum_(j = k)^n a_(k , j)^((k)) x_j = b_k^((k)) $

$ x_k = (b_k^((k)) - sum_(j = k + 1)^n a_(k , j)^((k)) x_j) \/ a_(k , k)^((k)) $

for $k = 1 , 2 , dots.h.c , n$ . It can be solved by the backward substitution,

$ x_k = (b_k^((k)) - sum_(j = k + 1)^n a_(k , j)^((k)) x_j) \/ a_(k , k)^((k)) , quad "for" k = n , n - 1 , dots.h.c , 2 , 1 . $

The Gauss elimination involves $O (n^3)$ operations and the backward substitution involves $O (n^2)$ operations. The overall algorithm complexity is $O (n^3) + O (n^2) = O (n^3)$ .

*Question*: What can we do if the matrix $upright(bold(A))$ does not satisfy the conditions that the diagonal entries $a_(k , k)^((k))$ are non-zero in the Gauss elimination process?

There are two strategies for the matrix not all of whose primal sub-matrices are invertible.

- *Partial pivoting*

- *Complete pivoting*

To develop/debug a code, we often work with random numbers. We first present two pieces of codes for generating random integers and floating point numbers.

