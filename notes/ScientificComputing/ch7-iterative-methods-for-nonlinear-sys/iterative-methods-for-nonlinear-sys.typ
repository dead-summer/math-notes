#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

// 上一节编号到 0
#counter(math.equation).update(0)

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

In this chapter, we consider solving the system of nonlinear equations

$ upright(bold(F)) (upright(bold(x))) = 0 quad "for" upright(bold(x)) in bb(R)^n . $<eq:1>

Here, $upright(bold(x)) = (x_1 , x_2 , dots.h.c , x_n)^(upright(T))$ and
$upright(bold(F)) (upright(bold(x))) = (f_1 , f_2 , dots.h.c , f_n)^(upright(T))$
with each $f_j = f_j (upright(bold(x)))$ be a scalar function of
$upright(bold(x))$ .

We write out the scalar equations of the nonlinear system:

$ cases(delim: "{", f_1 (x_1 , x_2 , x_3 , dots.h.c , x_n) & = 0 ,, f_2 (x_1 , x_2 , x_3 , dots.h.c , x_n) & = 0 ,,  & dots.v, f_n (x_1 , x_2 , x_3 , dots.h.c , x_n) & = 0 .) $

Assume that $upright(bold(F)) (upright(bold(x)))$ is sufficiently smooth and has a root point at
$upright(bold(x)) = upright(bold(x))^(\*) in bb(R)^n$ with the Jacobian
matrix $nabla upright(bold(F)) (upright(bold(x)))$ be invertible in a
neighborhood of $upright(bold(x))^(*)$ . The Jacobian matrix
$nabla upright(bold(F)) (upright(bold(x)))$ reads

$ nabla upright(bold(F)) (upright(bold(x))) = mat(delim: "(", frac(partial f_1, partial x_1), frac(partial f_1, partial x_2), frac(partial f_1, partial x_3), dots.h.c, frac(partial f_1, partial x_n); frac(partial f_2, partial x_1), frac(partial f_2, partial x_2), frac(partial f_2, partial x_3), dots.h.c, frac(partial f_2, partial x_n); frac(partial f_3, partial x_1), frac(partial f_3, partial x_2), frac(partial f_3, partial x_3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, frac(partial f_(n - 1), partial x_n); frac(partial f_n, partial x_1), frac(partial f_n, partial x_2), dots.h.c, frac(partial f_n, partial x_n), frac(partial f_n, partial x_n)) , $

the $(i , j)$-th entry of which is the $j$-th partial derivative of the $i$-th component function $f_i (upright(bold(x)))$ .