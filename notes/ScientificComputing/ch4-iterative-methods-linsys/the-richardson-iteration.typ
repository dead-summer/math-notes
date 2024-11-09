#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(1)
#set heading(numbering: "1.1.1")

// 上一节编号到 24
#counter(math.equation).update(24)

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

= The Richardson Iteration
<the-richardson-iteration>
If the preconditioner $upright(bold(P))$ is simply chosen to be a scalar or a multiple of the identity matrix,the resulting iterative method is the so-called Richardson method.

The Richardson iteration often takes the form

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + Delta t (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) quad "for" k = 0 , 1 , 2 , dots.h.c $

with the parameter $Delta t$ be chosen such that the spectral radius of the iteration matrix is less than one, i.e.,

$ rho (upright(bold(I)) - Delta t upright(bold(A))) < 1 $

Here, I remark that the parameter $Delta t$ may be positive or negative.

#exr[
Let $upright(bold(A)) in bb(R)^(n times n)$ be a symmetric and positive definite matrix. Denote the maximum and minimum eigenvalues of $upright(bold(A))$ by $lambda_max$ and $lambda_min$ ,respectively. We consider the following iteration

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + Delta t (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) quad "for" k = 0 , 1 , 2 , dots.h.c $

with $Delta t$ be a parameter.

1. Show that the iteration converges for any initial guess $upright(bold(x))^((0))$ if the parameter $Delta t$ satisfies 
$ 0 < Delta t < 2 / lambda_max $

1. find the best parameter $Delta t^(\*)$ such that the iteration converges fastest.
]


Another interpretation of the Richardson iteration is that it treats the solution of the linear system $upright(bold(A x)) = upright(bold(b))$ as the steady state of the evolution equation

$ frac(d upright(bold(x)) (t), d t) = upright(bold(F)) (upright(bold(x))) = upright(bold(b)) - upright(bold(A x)) (t) quad "as" t arrow.r + oo "or" - oo , $

assuming the real parts of eigenvalues of $upright(bold(A))$ are all non-zero and have the same sign.