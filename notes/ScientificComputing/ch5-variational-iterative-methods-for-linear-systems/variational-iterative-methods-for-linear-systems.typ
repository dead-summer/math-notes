#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(0)
#set heading(numbering: "1.1.1")

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

Let $n > 0$ be a positive integer. Let $upright(bold(A)) = (a_(i , j))_(n times n) in bb(R)^(n times n)$ be an invertible matrix. Let $upright(bold(x)) =$ $(x_1 , x_2 , dots.h.c , x_n)^(upright(T)) in bb(R)^n$ and $upright(bold(b)) = (b_1 , b_2 , dots.h.c , b_n)^(upright(T)) in bb(R)^n$ be vectors. In this notes,we consider solving the linear system

$ upright(bold(A x)) = upright(bold(b)) $<eq:1>

with non-stationary iterative methods.

We will study the non-stationary iterative methods based on variational principles, which are called *Krylov subspace methods*. There are mainly two classes of variational principle based methods. The first kind methods (also called the Ritz methods) are for symmetric positive definite matrices and compute the solution of the linear system by finding the minimizer of a quadratic functional. The second kind methods (also called the Galerkin methods) are for general matrices and solve the linear system by projection. The steepest descent method and the conjugate gradient method are two examples of the first kind methods. The generalized minimal residual (GMRES) method is a typical example of the second kind methods. We will introduce the three non-stationary iterative methods in the sections below.