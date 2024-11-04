#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(3)
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

= The Gauss-Seidel method
<the-gauss-seidel-method>
If the preconditioner $upright(bold(P))$ is chosen to be the lower or upper triangular part of $upright(bold(A))$ , the resulting iterative method is the so-called *Gauss-Seidel method*.

Let

$ upright(bold(P)) = upright(bold(D)) - upright(bold(L)) . $

The Gauss-Seidel method entry by entry reads

$ x_i^((k + 1)) = 1 / a_(i , i) [b_i - sum_(j = 1)^(i - 1) a_(i , j) x_j^((k + 1)) - sum_(j = i + 1)^n a_(i , j) x_j^((k))] , $<eq:25>

for $i = 1 , 2 , dots.h.c , n$ , since we can sequentially get the following identities

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + (upright(bold(D)) - upright(bold(L)))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) $

$ (upright(bold(D)) - upright(bold(L))) upright(bold(x))_(k + 1) = (upright(bold(D)) - upright(bold(L))) upright(bold(x))_k + upright(bold(b)) - upright(bold(A)) upright(bold(x))_k $

$ (upright(bold(D)) - upright(bold(L))) upright(bold(x))_(k + 1) = upright(bold(b)) + upright(bold(U)) upright(bold(x))_k $

and

$ upright(bold(D)) upright(bold(x))_(k + 1) = upright(bold(b)) + upright(bold(L)) upright(bold(x))_(k + 1) + upright(bold(U)) upright(bold(x))_k $

the last one of which implies (@eq:25).

The iteration matrix of the Gauss-Seidel method reads

$ upright(bold(B)) = upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A)) = (upright(bold(D)) - upright(bold(L)))^(- 1) upright(bold(U)) . $

#thm[
If the matrix $upright(bold(A))$ is a strictly diagonally dominant or irreducibly diagonally dominant matrix,the Gauss-Seidel method for $upright(bold(A x)) = upright(bold(b))$ converges.
]

#prf[
We need to show that the spectral radius of the iteration matrix $upright(bold(B)) = (upright(bold(D)) - upright(bold(L)))^(- 1) upright(bold(U))$ is less than one. Assume the spectral radius is not less than one. Then there exists an eigenvalue $lambda$ of $upright(bold(B))$ whose modulus is not less than one, i.e., $lr(|lambda|) gt.eq 1$ . Let $upright(bold(x))$ be the associated non-zero eigenvector. We have

$ (upright(bold(D)) - upright(bold(L)))^(- 1) upright(bold(U)) upright(bold(x)) = upright(bold(B)) upright(bold(x)) = lambda upright(bold(x)) . $

It implies that

$ 1 / lambda upright(bold(U x)) = (upright(bold(D)) - upright(bold(L))) upright(bold(x)) $

and

$ (upright(bold(D)) - upright(bold(L)) - 1 / lambda upright(bold(U))) upright(bold(x)) = 0 . $

Let

$ upright(bold(A))_lambda = upright(bold(D)) - upright(bold(L)) - 1 / lambda upright(bold(U)) $

be the coefficient matrix. It is easy to verify that if the matrix $upright(bold(A))$ is strictly diagonally dominant, the matrix $upright(bold(A))_lambda$ is also strictly diagonally dominant; if the matrix $upright(bold(A))$ is irreducible and (weakly) diagonally dominant, so is the matrix $upright(bold(A))_lambda$ . Thus, we see in either case $upright(bold(A))_lambda$ is invertible. This indicates the non-zero eigenvector should satisfy $upright(bold(x)) = 0$ , which is a contradiction.
]

#thm[
For symmetric positive definite matrices, the Gauss-Seidel method converges.
]

#prf[
It is easy to verify that the matrix

$ upright(bold(P)) - 1 / 2 upright(bold(A)) = upright(bold(D)) - upright(bold(L)) - 1 / 2 (upright(bold(D)) - upright(bold(L)) - upright(bold(L))^(upright(T))) = 1 / 2 upright(bold(D)) - 1 / 2 upright(bold(L)) + 1 / 2 upright(bold(L))^(upright(T)) $

is positive definite. By the Samarskii theorem, we see the convergence of the Gauss-Seidel method.
] 

#exr[
Show that the symmetric Gauss-Seidel iteration below,

$ upright(bold(x))_(k + 1 \/ 2) = upright(bold(x))_k + (upright(bold(D)) - upright(bold(L)))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) $

$ upright(bold(x))_(k + 1) = upright(bold(x))_(k + 1 \/ 2) + (upright(bold(D)) - upright(bold(U)))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_(k + 1 \/ 2)) , $

for a symmetric and positive definite system converges with any initial guess.
]

#prf[
Let $upright(bold(A)) = upright(bold(D)) - upright(bold(L)) - upright(bold(L))^(upright(T))$ . The preconditioner matrix by the symmetric Gauss-Seidel iteration reads

$ upright(bold(P)) = (upright(bold(D)) - upright(bold(L))) upright(bold(D))^(- 1) (upright(bold(D)) - upright(bold(L))^(upright(T))) . $

By the Sarmarskii theorem, we only need to show that the matrix $upright(bold(P)) - upright(bold(A)) \/ 2$ is positive definite. In fact, straightforward calculation shows that

$ upright(bold(P)) - upright(bold(A)) \/ 2 = (upright(bold(D)) - upright(bold(L))) upright(bold(D))^(- 1) (upright(bold(D)) - upright(bold(L))^(upright(T))) - 1 / 2 (upright(bold(D)) - upright(bold(L)) - upright(bold(L))^(upright(T))) $

$ = 1 / 2 upright(bold(D)) - 1 / 2 upright(bold(L)) - 1 / 2 upright(bold(L))^(upright(T)) + upright(bold(L D))^(- 1) upright(bold(L))^(upright(T)) = 1 / 2 upright(bold(A)) + upright(bold(L D))^(- 1) upright(bold(L))^(upright(T)) . $

It is obvious to see that the matrix $upright(bold(P)) - upright(bold(A)) \/ 2$ is symmetric and positive definite.
]
