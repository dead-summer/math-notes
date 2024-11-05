#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

// 上一节编号到 24
#counter(math.equation).update(25)

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

= The SOR method
<the-sor-method>
The successive over-relaxation (SOR) method we will study in this section is a generalization of the Gauss-Seidel method. It does not simply take the one computed by the Gauss-Seidel iteration as the updated value during the iteration. Instead, it successively uses a weighted average of the previous value and the one computed by the Gauss-Seidel iteration.

A relaxation of the Gauss-Seidel method reads

$
cases(
z_i^((k + 1)) = 1 / a_(i , i) [b_i - sum_(j = 1)^(i - 1) a_(i , j) x_j^((k + 1)) - sum_(j = i + 1)^n a_(i , j) x_j^((k))] \, \
x_i^((k + 1)) = (1 - omega) x_i^((k)) + omega z_i^((k + 1))
)
$<eq:26>


for $i = 1 , 2 , dots.h.c , n$ . Here, $omega$ is a relaxation parameter. If $omega > 1$ , the method is called *successive over-relaxation (SOR) method*; otherwise if $omega < 1$ , the method is called *successive under-relaxation method*. In practice, the relaxation scheme usually converges faster when the parameter $omega$ is chosen to be greater than one. So we often choose $omega > 1$ and the method is usually called the successive over-relaxation (SOR) method.

Combining the two steps above together, we may rewrite the SOR iteration as

$ x_i^((k + 1)) = (1 - omega) x_i^((k)) + omega 1 / a_(i , i) [b_i - sum_(j = 1)^(i - 1) a_(i , j) x_j^((k + 1)) - sum_(j = i + 1)^n a_(i , j) x_j^((k))] . $

Multiplying both sides of the identity above by $a_(i , i)$ yields

$ a_(i , i) x_i^((k + 1)) = (1 - omega) a_(i , i) x_i^((k)) + omega [b_i - sum_(j = 1)^(i - 1) a_(i , j) x_j^((k + 1)) - sum_(j = i + 1)^n a_(i , j) x_j^((k))] $

for $i = 1 , 2 , dots.h.c , n$ . In the matrix-vector notation, the SOR iteration reads

$ upright(bold(D)) upright(bold(x))_(k + 1) = (1 - omega) upright(bold(D)) upright(bold(x))_k + omega (upright(bold(b)) + upright(bold(L)) upright(bold(x))_(k + 1) + upright(bold(U)) upright(bold(x))_k) . $

After rearrangement, we obtain

$ (upright(bold(D)) - omega upright(bold(L))) upright(bold(x))_(k + 1) = (1 - omega) upright(bold(D)) upright(bold(x))_k + omega (upright(bold(b)) + upright(bold(U)) upright(bold(x))_k) $

$ = (upright(bold(D)) - omega upright(bold(L))) upright(bold(x))_k + omega (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) . $

Finally, we get the SOR iteration in the form

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + omega (upright(bold(D)) - omega upright(bold(L)))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) . $<eq:27>

Now we see the preconditioner $upright(bold(P))$ for the SOR method takes

$ upright(bold(P)) = 1 / omega (upright(bold(D)) - omega upright(bold(L))) $

The iteration matrix of the SOR method reads

$ upright(bold(B)) = upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A)) = upright(bold(I)) - omega (upright(bold(D)) - omega upright(bold(L)))^(- 1) upright(bold(A)) = (upright(bold(D)) - omega upright(bold(L)))^(- 1) [(1 - omega) upright(bold(D)) + omega upright(bold(U))] . $

#thm("The Kahan theorem")[
If the SOR method converges, then the relaxation parameter $omega$ must be in the interval $(0,2)$.
]

#prf[
That the SOR method converges implies that the spectral radius of the iteration matrix $upright(bold(B))$ is less than one. In other words, all eigenvalues of $upright(bold(B))$ have modulus less than one. The absolute value of the determinant of $upright(bold(B))$ is less than one since the determinant of a matrix equals the product of its eigenvalues. Now we see the determinant of $upright(bold(B))$ should satisfy

$ lr(|det (upright(bold(B)))|) = lr(|det [(upright(bold(D)) - omega upright(bold(L)))^(- 1)] det [(1 - omega) upright(bold(D)) + omega upright(bold(U))]|) = lr(|(1 - omega)^n|) < 1 . $

The inequality implies $0 < omega < 2$ .
]

#thm[
For symmetric positive definite matrices, the SOR method with $0 < omega < 2$ converges.
]

#prf[
Let $upright(bold(A))$ be the symmetric and positive definite coefficient matrix of the linear system to be solved with the SOR method. It is easy to verify the matrix

$ upright(bold(P)) - 1 / 2 upright(bold(A)) = 1 / omega upright(bold(D)) - upright(bold(L)) - 1 / 2 (upright(bold(D)) - upright(bold(L)) - upright(bold(L))^(upright(T))) = frac(2 - omega, 2 omega) upright(bold(D)) - 1 / 2 upright(bold(L)) + 1 / 2 upright(bold(L))^(upright(T)) $

is positive definite with $omega in (0 , 2)$ . By the Samarskii theorem, we see the convergence of the SOR method.
]

#thm[
For a symmetric matrix with positive diagonal entries, the SOR method converges if and only if the matrix is positive definite and $0 < omega < 2$ .
]
