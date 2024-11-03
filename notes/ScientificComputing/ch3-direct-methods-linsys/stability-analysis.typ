#import "/book.typ": book-page, cross-link
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(3)
#set heading(numbering: "1.1.1")

// 由于上一节编号到 13
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

= Stability Analysis

Due to the computer round-off, some errors are inevitably introduced during arithmetic operations in a direct method for the linear system (1). The system that a numerical method actually solves is a perturbed one. To see how the eror in the solution depends on the perturbation to the right hand side and the coefficient matrix, we will consider three cases, separately. Only the right hand side is perturbed in the first case. Only the coefficient matrix is perturbed in the second case. Both the right hand side and the coefficient matrix are perturbed in the third case.

- *Case One*. Suppose that the right hand side of the linear system (1) is perturbed. The perturbed system reads

  $ upright(bold(A)) tilde(upright(bold(x))) = tilde(upright(bold(b))) $

  Let

  $ tilde(upright(bold(b))) = upright(bold(b)) + delta upright(bold(b)) . $

  and

  $ tilde(upright(bold(x))) = upright(bold(x)) + delta upright(bold(x)) . $

  We have

  $ upright(bold(A)) (upright(bold(x)) + delta upright(bold(x))) = upright(bold(b)) + delta upright(bold(b)) $

  which implies

  $ upright(bold(A)) delta upright(bold(x)) = delta upright(bold(b)) . $

  and

  $ delta upright(bold(x)) = upright(bold(A))^(- 1) delta upright(bold(b)) . $

  The norm of the absolute perturbation in the solution can be bounded,

  $ norm(delta upright(bold(x))) lt.eq norm(upright(bold(A))^(- 1)) norm(delta upright(bold(b))) . $<eq:14>

  From the linear system (1), we have

  $ norm(upright(bold(b))) lt.eq norm(upright(bold(A))) norm(upright(bold(x))) $

  and

  $ frac(1, norm(upright(bold(x)))) lt.eq frac(norm(upright(bold(A))), norm(upright(bold(b)))) $<eq:15>

  Multiplying (@eq:14) with (@eq:15) yields the estimate for the relative perturbation in the solution (called the relative error),

  $ frac(norm(delta upright(bold(x))), norm(upright(bold(x)))) lt.eq norm(upright(bold(A))^(- 1)) norm(upright(bold(A))) frac(norm(delta upright(bold(b))), norm(upright(bold(b)))) . $<eq:16>

  The result states that the relative perturbation in the solution (relative error) is bounded by the relative pertubation in the right hand side multiplied by $norm(upright(bold(A))^(- 1)) norm(upright(bold(A)))$ .

  #def[
  We call

  $ kappa (upright(bold(A))) = norm(upright(bold(A))^(- 1)) norm(upright(bold(A))) $

  or

  $ "cond" (upright(bold(A))) equiv norm(upright(bold(A))^(- 1)) norm(upright(bold(A))) $

  as the condition number of an invertible matrix $upright(bold(A)) in bb(R)^(n times n)$ .
  ]

  We have the estimate for the relative error,

  $ frac(norm(delta upright(bold(x))), norm(upright(bold(x)))) lt.eq kappa (upright(bold(A))) frac(norm(delta upright(bold(b))), norm(upright(bold(b)))) . $<eq:17>

- *Case Two*. Now we consider the case that the coefficient matrix $upright(bold(A))$ is perturbed with the perturbed system given by
  
  $ tilde(upright(bold(A))) tilde(upright(bold(x))) = upright(bold(b)) . $

  Let

  $ tilde(upright(bold(A))) = upright(bold(A)) + delta upright(bold(A)) . $

  We have

  $ (upright(bold(A)) + delta upright(bold(A))) (upright(bold(x)) + delta upright(bold(x))) = upright(bold(b)) $

  which implies

  $ upright(bold(A)) delta upright(bold(x)) = - delta upright(bold(A)) (upright(bold(x)) + delta upright(bold(x))) . $

  and

  $ delta upright(bold(x)) = - upright(bold(A))^(- 1) [delta upright(bold(A)) (upright(bold(x)) + delta upright(bold(x)))] . $

  By the norm inequality, we get

  $ norm(delta upright(bold(x))) lt.eq norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) (norm(upright(bold(x))) + norm(delta upright(bold(x)))) . $

  Assume that

  $ norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) < 1 $<eq:18>

  We have

  $ (1 - norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A)))) norm(delta upright(bold(x))) lt.eq norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) norm(upright(bold(x))) , $

  and arrive at the bound for the relative perturbation in the solution

  $ frac(norm(delta upright(bold(x))), norm(upright(bold(x)))) lt.eq frac(norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))), 1 - norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A)))) $

  $ = frac(norm(upright(bold(A))^(- 1)) norm(upright(bold(A))), 1 - norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A)))) frac(norm(delta upright(bold(A))), norm(upright(bold(A)))) , $

  or alternatively,

  $ frac(norm(delta upright(bold(x))), norm(upright(bold(x)))) lt.eq frac(kappa (upright(bold(A))), 1 - kappa (upright(bold(A))) norm(delta upright(bold(A))) \/ norm(upright(bold(A)))) frac(norm(delta upright(bold(A))), norm(upright(bold(A)))) . $<eq:19>

- *Case Three*. Now we consider the case that both the matrix and the right hand side of the linear system are perturbed. Assume the perturbed system reads

  $ tilde(upright(bold(A))) tilde(upright(bold(x))) = tilde(upright(bold(b))) $

  We have

  $ (upright(bold(A)) + delta upright(bold(A))) (upright(bold(x)) + delta upright(bold(x))) = upright(bold(b)) + delta upright(bold(b)) , $

  $ upright(bold(A x)) + upright(bold(A)) delta upright(bold(x)) + delta upright(bold(A)) (upright(bold(x)) + delta upright(bold(x))) = upright(bold(b)) + delta upright(bold(b)) . $

  The first terms on both sides of the identity above are cancelled,

  $ upright(bold(A)) delta upright(bold(x)) + delta upright(bold(A)) (upright(bold(x)) + delta upright(bold(x))) = delta upright(bold(b)) , $

  which implies

  $ upright(bold(A)) delta upright(bold(x)) = delta upright(bold(b)) - delta upright(bold(A)) (upright(bold(x)) + delta upright(bold(x))) $

  and

  $ delta upright(bold(x)) = upright(bold(A))^(- 1) delta upright(bold(b)) - upright(bold(A))^(- 1) delta upright(bold(A)) (upright(bold(x)) + delta upright(bold(x))) . $

  Using norm and matrix inequalities, we get

  $ norm(delta upright(bold(x))) lt.eq norm(upright(bold(A))^(- 1)) norm(delta upright(bold(b))) + norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) (norm(upright(bold(x))) + norm(delta upright(bold(x)))) . $

  Again, assume that

  $ norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) < 1 $

  We further obtain

  $ (1 - norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A)))) norm(delta upright(bold(x))) lt.eq norm(upright(bold(A))^(- 1)) norm(delta upright(bold(b))) + norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) norm(upright(bold(x))) $

  and

  $ (1 - norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A)))) frac(norm(delta upright(bold(x))), norm(upright(bold(x)))) lt.eq norm(upright(bold(A))^(- 1)) frac(norm(delta upright(bold(b))), norm(upright(bold(x)))) + norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) . $

  Using again

  $ norm(upright(bold(b))) lt.eq norm(upright(bold(A))) norm(upright(bold(x))) , $

  i.e.,

  $ frac(1, norm(upright(bold(x)))) lt.eq frac(norm(upright(bold(A))), norm(upright(bold(b)))) $

  we arrive at

  $ (1 - norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A)))) frac(norm(delta upright(bold(x))), norm(upright(bold(x)))) lt.eq norm(upright(bold(A))^(- 1)) norm(upright(bold(A))) frac(norm(delta upright(bold(b))), norm(upright(bold(b)))) + norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) $

  $ = norm(upright(bold(A))^(- 1)) norm(upright(bold(A))) (frac(norm(delta upright(bold(b))), norm(upright(bold(b)))) + frac(norm(delta upright(bold(A))), norm(upright(bold(A))))) , $

  thus

  $ frac(norm(delta upright(bold(x))), norm(upright(bold(x)))) lt.eq frac(norm(upright(bold(A))^(- 1)) norm(upright(bold(A))), 1 - norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A)))) (frac(norm(delta upright(bold(b))), norm(upright(bold(b)))) + frac(norm(delta upright(bold(A))), norm(upright(bold(A))))) . $<eq:20>

From the three estimates (@eq:17)-(@eq:20) above, we see that the stability of the linear system is determined by the condition number of the matrix. The larger is the condition number, the relative error is more sensitive to the perturbations, $delta upright(bold(b))$ and $delta upright(bold(A))$ , to the linear system.

#def[
A linear system, whose coefficient matrix has a large condition number, is said to be ill-conditioned. A linear system, whose coefficient matrix has a small condition number, is said to be well-conditioned.
]

An ill-conditioned linear system is unstable. A well-conditioned linear system is stable in the sense that the conditioning of the coefficient matrix does not amplify significantly small perturbations on the right hand side and the coefficient matrix. However, for a well-conditioned system, the relative error of the solution to the perturbed system may still be large if the perturbations $delta b$ and $delta A$ are large, which depends on the numerical method used.

#exr[
Let $upright(bold(A)) in bb(R)^(n times n)$ be a non-singular matrix. Let $delta upright(bold(A))$ be a perturbation of the matrix $upright(bold(A))$ ,satisfying the condition $norm(upright(bold(A))^(- 1)) norm(delta upright(bold(A))) < 1$ in some induced matrix norm. Show that the matrix $upright(bold(A)) + delta upright(bold(A))$ is invertible and

$ norm(upright(bold(A))^(- 1) - (upright(bold(A)) + delta upright(bold(A)))^(- 1)) / norm(upright(bold(A))^(- 1)) lt.eq frac(kappa (upright(bold(A))) norm(delta upright(bold(A))) \/ norm(upright(bold(A))), 1 - kappa (upright(bold(A))) norm(delta upright(bold(A))) \/ norm(upright(bold(A)))) . $

Here, $kappa (upright(bold(A))) = norm(upright(bold(A))) norm(upright(bold(A))^(- 1))$ stands for the matrix condition number.
]

#prp[
Let $upright(bold(B)) in bb(R)^(n times n)$ be a matrix,satisfying $norm(upright(bold(B))) < 1$ in some induced matrix norm. The matrix $upright(bold(I)) + upright(bold(B))$ is invertible and the following inequality holds

$ norm((upright(bold(I)) + upright(bold(B)))^(- 1)) < frac(1, 1 - norm(upright(bold(B)))) . $<eq:21>
] 

#prf[
Assume that the matrix $upright(bold(I)) + upright(bold(B))$ is not invertible. Then there exists a non-zero vector $upright(bold(x)) in bb(R)^n$ such that

$ (upright(bold(I)) + upright(bold(B))) upright(bold(x)) = 0 $

and

$ upright(bold(x)) = - upright(bold(B x)) . $

This implies

$ norm(upright(bold(x))) = norm(upright(bold(B x))) lt.eq norm(upright(bold(B))) norm(upright(bold(x))) $

and

$ 1 lt.eq norm(upright(bold(B))) . $

This contradicts the assumption on $upright(bold(B))$ . So the matrix $upright(bold(I)) + upright(bold(B))$ is invertible.

Let $upright(bold(C)) = (upright(bold(I)) + upright(bold(B)))^(- 1)$ . We have

$ (upright(bold(I)) + upright(bold(B))) upright(bold(C)) = upright(bold(I)) $

and

$ upright(bold(C)) = upright(bold(I)) - upright(bold(B C)) . $

This implies

$ norm(upright(bold(C))) lt.eq norm(upright(bold(I))) + norm(upright(bold(B))) norm(upright(bold(C))) = 1 + norm(upright(bold(B))) norm(upright(bold(C))) $

and

$ (1 - norm(upright(bold(B)))) norm(upright(bold(C))) lt.eq 1 , $

which further leads to the inequality (@eq:21).
]


For the purpose of comparison, I also put two similar propositions here.

#prp[
For a matrix $upright(bold(B)) in bb(R)^(n times n)$ ,if $norm(upright(bold(B))) < 1$ in some induced matrix norm,then the matrix $upright(bold(I)) - upright(bold(B))$ is invertible; the inverse $(upright(bold(I)) - upright(bold(B)))^(- 1)$ satisfies the geometric series

$ (upright(bold(I)) - upright(bold(B)))^(- 1) = upright(bold(I)) + upright(bold(B)) + upright(bold(B))^2 + dots.h.c + upright(bold(B))^k + dots.h.c . $

and the inequality

$ norm((upright(bold(I)) - upright(bold(B)))^(- 1)) lt.eq frac(1, 1 - norm(upright(bold(B)))) $
]

#cor[
For a matrix $upright(bold(B)) in bb(R)^(n times n)$ , if its spectral radius is less than one,then the matrix $upright(bold(I)) - upright(bold(B))$ is invertible; the inverse $(upright(bold(I)) + upright(bold(B)))^(- 1)$ satisfies the geometric series

$ (upright(bold(I)) + upright(bold(B)))^(- 1) = upright(bold(I)) - upright(bold(B)) + upright(bold(B))^2 + dots.h.c + (- 1)^k upright(bold(B))^k + dots.h.c $ 

and the inequality

$ norm((upright(bold(I)) + upright(bold(B)))^(- 1)) lt.eq frac(1, 1 - norm(upright(bold(B)))) . $
]


Note that the assumption (@eq:18) implies

$ norm(upright(bold(A))^(- 1) delta upright(bold(A))) < 1 $

The proposition above further indicates that the matrix $upright(bold(I)) + upright(bold(A))^(- 1) delta upright(bold(A))$ is invertible so is the perturbed matrix $tilde(upright(bold(A))) = upright(bold(A)) + delta upright(bold(A)) = upright(bold(A)) (upright(bold(I)) + upright(bold(A))^(- 1) delta upright(bold(A)))$ , provided that the assumption (@eq:18) holds.

#exr[
Let $upright(bold(A)) = (a_(i , j))_(n times n) in bb(R)^(n times n)$ be the Hilbert matrix,

$ upright(bold(A)) = mat(delim: "(", 1, 1 \/ 2, 1 \/ 3, dots.h.c, 1 \/ n; 1 \/ 2, 1 \/ 3, 1 \/ 4, dots.h.c, 1 \/ (n + 1); 1 \/ 3, 1 \/ 4, 1 \/ 5, dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, 1 \/ (2 n - 2); 1 \/ n, 1 \/ (n + 1), dots.h.c, 1 \/ (2 n - 2), 1 \/ (2 n - 1)) $

whose $(i , j)^(t h)$ entry reads

$ a_(i , j) = frac(1, i + j - 1) #h(0em) upright(" for ") i , j = 1 , 2 , dots.h.c , n . $

Choose the right hand side $upright(bold(b)) in bb(R)^n$ such that the exact solution $upright(bold(x)) in bb(R)^n$ to the linear system $upright(bold(A x)) = upright(bold(b))$ reads

$ upright(bold(x)) = (x_1 , x_2 , dots.h.c , x_n)^T = (1 , 1 , dots.h.c , 1)^T . $

Solve the system with the Gauss elimination method for different $n$ ’s. Denote the computed solution by $tilde(upright(bold(x))) = (tilde(x)_1 , tilde(x)_2 , dots.h.c , tilde(x)_n)^T$ . Print out the maximum-norm error

$ norm(upright(bold(x)) - tilde(upright(bold(x))))_oo equiv max_(1 lt.eq i lt.eq n) lr(|x_i - tilde(x)_i|) $

for $n = 4 , 5 , 6 , dots.h.c$ ,until the Gauss elimination method fails to work. Report on what you observe and make your own explanation.
]

#prp[
The condition number of a matrix $upright(bold(A))$ is always not less than one.
]

The condition number of a matrix $upright(bold(A))$ depends on the norm used. We often write the $ell^2$ -norm condition number as

$ "cond"_2 (upright(bold(A))) equiv norm(upright(bold(A)))_2 norm(upright(bold(A))^(- 1))_2 $

and write the $ell^1$ -norm condition number as

$ "cond"_1 (upright(bold(A))) equiv norm(upright(bold(A)))_1 norm(upright(bold(A))^(- 1))_1 $

#prp[
The $ell^2$ -norm condition number of an invertible matrix $upright(bold(A))$ is equal to the ratio of its maximum singular value $sigma_max$ to the minimum singular value $sigma_min$ ,

$ "cond"_2 (upright(bold(A))) = frac(sigma_max (upright(bold(A))), sigma_min (upright(bold(A)))) . $

For a symmetric and positive definite matrix $upright(bold(A))$ ,its $ell^2$ condition number is equal to the ratio of its maximum eigenvalue $lambda_max (upright(bold(A)))$ to the minimum eigenvalue $lambda_min (upright(bold(A)))$ ,

$ "cond"_2 (upright(bold(A))) = lr(|frac(lambda_max (upright(bold(A))), lambda_min (upright(bold(A))))|) . $
]

#prp[
The $ell^2$ -norm condition number of an orthogonal matrix is equal to one.
]
