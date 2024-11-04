#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(2)
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

= The Jacobi Method
<the-jacobi-method>

Assume the matrix $upright(bold(A))$ has the form

$ upright(bold(A)) = mat(delim: "[", a_(1 , 1), a_(1 , 2), a_(1 , 3), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), a_(2 , 3), dots.h.c, a_(2 , n); a_(3 , 1), a_(3 , 2), a_(3 , 3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n); a_(n , 1), a_(n , 2), dots.h.c, a_(n , n - 1), a_(n , n)) . $

Let

$ upright(bold(D)) = "diag" (a_(1 , 1) , a_(2 , 2) , dots.h.c , a_(n , n)) $

be the diagonal part of $upright(bold(A))$ . Let

$ upright(bold(L)) = mat(delim: "[", 0, , , , ; - a_(2 , 1), 0, , , ; - a_(3 , 1), - a_(3 , 2), 0, , ; dots.v, dots.v, dots.down, dots.down, ; - a_(n , 1), - a_(n , 2), dots.h.c, - a_(n , n - 1), 0) $

and

$ upright(bold(U)) = mat(delim: "[", 0, - a_(1 , 2), - a_(1 , 3), dots.h.c, - a_(1 , n); #none, 0, - a_(2 , 3), dots.h.c, - a_(2 , n); #none, , 0, dots.down, dots.v; #none, , , dots.down, - a_(n - 1 , n); #none, , , , 0) $

be respectively the negative of the lower and upper triangular parts of $upright(bold(A))$ . Then we have the matrix splitting

$ upright(bold(A)) = upright(bold(D)) - upright(bold(L)) - upright(bold(U)) . $

If the preconditioner $upright(bold(P))$ is chosen to be the diagonal of $upright(bold(A))$ ,

$ upright(bold(P)) = upright(bold(D)) = "diag" (a_(1 , 1) , a_(2 , 2) , dots.h.c , a_(n , n)) , $

the resulting iterative method is the so-called Jacobi method.

Let $upright(bold(x))_k = (x_1^((k)) , x_2^((k)) , dots.h.c , x_n^((k)))^T$ . The stationary iteration,

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + upright(bold(P))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) , quad "for" k = 0 , 1 , 2 , dots.h.c , $

entry by entry reads

$ x_i^((k + 1)) = x_i^((k)) + a_(i , i)^(- 1) (b_i - sum_(j = 1)^n a_(i , j) x_j^((k))) = a_(i , i)^(- 1) (b_i - sum_(j eq.not i) a_(i , j) x_j^((k))) , quad i = 1 , 2 , dots.h.c , n , $

for $k = 0 , 1 , 2 , dots.h.c$ .

== Diagonally dominant matrix
<diagonally-dominant-matrix>

#def[
A matrix $upright(bold(A)) = (a_(i , j))_(n times n)$ is said to be strictly diagonally dominant if the absolute value of the diagonal entry is greater than the sum of the absolute values of the off-diagonal entries in each row, that is,

$ lr(|a_(i , i)|) > sum_(1 lt.eq j lt.eq n\
j eq.not i) lr(|a_(i , j)|) quad forall i = 1 , 2 , dots.h.c , n . $
]

#thm[
A strictly diagonally dominant matrix is invertible.
]

#def[
A matrix $upright(bold(A)) = (a_(i , j))_(n times n)$ is said to be diagonally dominant or weakly diagonally dominant if the absolute value of the diagonal entry is not less than the sum of the absolute values of the off-diagonal entries in each row, that is,

$ lr(|a_(i , i)|) gt.eq sum_(1 lt.eq j lt.eq n\
j eq.not i) lr(|a_(i , j)|) quad forall i = 1 , 2 , dots.h.c , n $

and there is at least one index $k$ such that

$ lr(|a_(k , k)|) > sum_(1 lt.eq j lt.eq n\
j eq.not k) lr(|a_(k , j)|) . $
]

#exm[
$ upright(bold(A)) = mat(delim: "[", 2, - 1, 0; - 2, 2, 0; - 1, 1, 2) $

and

$ upright(bold(B)) = mat(delim: "[", 1, - 1, 0; - 2, 2, 0; - 1, 1, 3) $

are weakly diagonally dominant matrices.
]

A (weakly) diagonally dominant matrix is not necessarily invertible. For example, the matrix B above is diagonally dominant but not invertible. For a (weakly) diagonally dominant matrix to be invertible, we need to impose an additional condition.

== Irreducible matrix
<irreducible-matrix>

#def[
A matrix $upright(bold(A)) = (a_(i , j))_(n times n)$ is said to be reducible if there are two non-empty index sets $cal(I)$ and $cal(J)$ satisfying

$ cal(I) union cal(J) = { 1 , 2 , dots.h.c , n } quad upright(" and ") quad cal(I) sect cal(J) = diameter $

such that

$ a_(i , j) = 0 quad forall i in cal(I) , j in cal(J) . $
]

#prp[
If there exists a permutation matrix $upright(bold(P))$ such that

$ upright(bold(P))^T upright(bold(A P)) = mat(delim: "(", A_(1 , 1), 0; A_(2 , 1), A_(2 , 2)) $

or

$ upright(bold(P))^T upright(bold(A P)) = mat(delim: "(", A_(1 , 1), A_(1 , 2); 0, A_(2 , 2)) $

if and only if the matrix $upright(bold(A))$ is reducible.
]

#def[
A matrix is said to be irreducible if it is not reducible.
]

#prp[
An irreducible and weakly diagonally dominant matrix is invertible.
]

#prf[
Let $upright(bold(A)) = (a_(i , j))_(n times n) in bb(R)^(n times n)$ be an irreducible and weakly diagonally dominant matrix. Assume it is not invertible. That is, there exists a non-zero vector $upright(bold(x)) = (x_1 , x_2 , dots.h.c , x_n)^(upright(T)) in bb(R)^n$ such that

$ upright(bold(A x)) = 0 . $

We assume the maximum norm of $upright(bold(x))$ is equal to one,i.e., $parallel upright(bold(x)) parallel_oo = 1$ . Let

$ cal(I) = {i : lr(|x_i|) = 1} $

be the set of indices of those entries whose modulus equals one. Let

$ cal(J) = { 1 , 2 , dots.h.c , n } without cal(I) $

be the complement set. By our assumption on $upright(bold(x))$ ,we have

$ lr(|x_j|) < 1 quad forall j in cal(J) . $

First,we need to show that both index sets are not empty. It is obvious that $cal(I) eq.not diameter$ . As a matter of fact,if $cal(J) = diameter$ ,we will have

$ lr(|a_(i , i)|) lt.eq sum_(j = 1\
j eq.not i)^n lr(|a_(i , j)|) $

for all $i = 1 , 2 , dots.h.c , n$ . This contradicts the assumption on the weakly diagonal dominance of $upright(bold(A))$ since we should have at least one index $i_0$ such that

$ lr(|a_(i_0 , i_0)|) > sum_(j = 1\
j eq.not i_0)^n lr(|a_(i_0 , j)|) $

As the matrix $upright(bold(A))$ is irreducible,there exists indices $k in cal(I)$ and $ell in cal(J)$ such that $a_(k , ell) eq.not 0$ . By the definition for the index sets $cal(I)$ and $cal(J)$ , we have $lr(|x_k|) = 1$ and $lr(|x_ell|) < 1$ . Furthermore,we get

$ lr(|a_(k , k)|) = lr(|a_(k , k) x_k|) lt.eq sum_(j = 1\
j eq.not k)^n lr(|a_(k , j)|) lr(|x_j|) = lr(|a_(k , ell)|) lr(|x_ell|) + sum_(j = 1\
j eq.not k , ell)^n lr(|a_(k , j)|) lr(|x_j|) < lr(|a_(k , ell)|) + sum_(j = 1\
j eq.not k , ell)^n lr(|a_(k , j)|) . $

This again contradicts the diagonal dominance of the matrix.
]



== Convergence of the Jacobi method
<convergence-of-the-jacobi-method>
The iteration matrix of the Jacobi method reads

$ upright(bold(B)) = upright(bold(I)) - upright(bold(D))^(- 1) upright(bold(A)) = upright(bold(D))^(- 1) (upright(bold(L)) + upright(bold(U))) . $

#thm[
If the matrix $upright(bold(A))$ is strictly diagonally dominant or irreducibly diagonally dominant, the Jacobi method converges.
]

#prf[
We need to show that the spectral radius of the iteration matrix $upright(bold(B)) = upright(bold(D))^(- 1) (upright(bold(L)) + upright(bold(U)))$ is less than one. Assume the spectral radius is not less than one. Then there exists an eigenvalue $lambda$ of $upright(bold(B))$ whose modulus is not less than one,i.e., $lr(|lambda|) gt.eq 1$ . Let $upright(bold(x))$ be the associated non-zero eigenvector. We have

$ upright(bold(D))^(- 1) (upright(bold(L)) + upright(bold(U))) upright(bold(x)) = upright(bold(B)) upright(bold(x)) = lambda upright(bold(x)) . $

It implies that

$ 1 / lambda (upright(bold(L)) + upright(bold(U))) upright(bold(x)) = upright(bold(D)) upright(bold(x)) $

and

$ (upright(bold(D)) - 1 / lambda upright(bold(L)) - 1 / lambda upright(bold(U))) upright(bold(x)) = 0 . $

Let

$ upright(bold(A))_lambda = upright(bold(D)) - 1 / lambda upright(bold(L)) - 1 / lambda upright(bold(U)) $

be the coefficient matrix. It is easy to verify that if the matrix $upright(bold(A))$ is strictly diagonally dominant, the matrix $upright(bold(A))_lambda$ is also strictly diagonally dominant; if the matrix $upright(bold(A))$ is irreducible and (weakly) diagonally dominant,so is the matrix $upright(bold(A))_lambda$ . Thus,we see in either case $upright(bold(A))_lambda$ is invertible. This indicates the non-zero eigenvector $upright(bold(x)) = 0$ , which is a contradiction.
]

#thm[
For a symmetric matrix $upright(bold(A))$ with positive diagonal entries,the Jacobi method converges if and only if both the matrix $upright(bold(A))$ and the matrix $upright(bold(D)) - 1 / 2 upright(bold(A))$ are positive definite.
]

#prf[
Sufficiency. "$arrow.l.double$" Assume both $upright(bold(A))$ and $upright(bold(D)) - 1 / 2 upright(bold(A))$ are positive definite. By the Samarskii theorem, we see the convergence of the Jacobi method.

Necessity. "$arrow.r.double$" Assume the Jacobi method converges for the matrix A. This means the spectral radius of the iteration matrix $upright(bold(B)) = upright(bold(I)) - upright(bold(D))^(- 1) upright(bold(A))$ is less than one. In other words,all eigenvalues of $upright(bold(B))$ have modulus less than one. Note that

$ upright(bold(B)) = upright(bold(I)) - upright(bold(D))^(- 1) upright(bold(A)) = upright(bold(D))^(- 1 \/ 2) (upright(bold(I)) - upright(bold(D))^(- 1 \/ 2) upright(bold(A)) upright(bold(D))^(- 1 \/ 2)) upright(bold(D))^(1 \/ 2) $

is similar to

$ upright(bold(C)) = upright(bold(I)) - upright(bold(D))^(- 1 \/ 2) upright(bold(A)) upright(bold(D))^(- 1 \/ 2) , $

which is a symmetric matrix and has $n$ real eigenvalues. We see all eigenvalues of $upright(bold(C))$ lie in the interval $(-1,1) $and all eigenvalues of $upright(bold(D))^(- 1 \/ 2) upright(bold(A)) upright(bold(D))^(- 1 \/ 2)$ lie in the interval $(0,2)$ . This further indicates

$ 0 < upright(bold(x))^(upright(T)) upright(bold(D))^(- 1 \/ 2) upright(bold(A)) upright(bold(D))^(- 1 \/ 2) upright(bold(x)) < 2 upright(bold(x))^(upright(T)) upright(bold(x)) quad forall 0 eq.not upright(bold(x)) in bb(R)^n . $

By change of variables,letting $upright(bold(y)) = upright(bold(D))^(- 1 \/ 2) upright(bold(x))$ , we see

$ 0 < upright(bold(y))^(upright(T)) upright(bold(A y)) < 2 upright(bold(y))^(upright(T)) upright(bold(D y)) quad forall 0 eq.not upright(bold(y)) in bb(R)^n . $

The first inequality above implies that $upright(bold(A))$ is positive definite. The second inequality implies that $2 upright(bold(D)) - upright(bold(A))$ is positive definite.
]

#thm[
If all off-diagonal entries of a symmetric and positve definite matrix are nonpositive, then the Jacobi iteration with the matrix converges.
]

#thm[
Let $upright(bold(A)) in bb(R)^(n times n)$ be a matrix all whose diagonal entries are positive and off-diagonal entries are non-positive. The Jacobi iteration for this matrix converges if and only if all entries of $upright(bold(A))^(- 1)$ are non-negative (i.e., the matrix $upright(bold(A))$ is an $M$ -matrix).
]

#prf[
The assumption on $upright(bold(A))$ indicates all entries of $upright(bold(B))$ are non-negative.

$ (sum_(i = 0)^k upright(bold(B))^i) (upright(bold(I)) - upright(bold(B))) = upright(bold(I)) - upright(bold(B))^(k + 1) $

$ (sum_(i = 0)^k upright(bold(B))^i) upright(bold(D))^(- 1) upright(bold(A)) = upright(bold(I)) - upright(bold(B))^(k + 1) $

$ sum_(i = 0)^k upright(bold(B))^i = upright(bold(A))^(- 1) upright(bold(D)) - upright(bold(B))^(k + 1) upright(bold(A))^(- 1) upright(bold(D)) . $

The last identity shows that

$ lim_(i arrow.r oo) upright(bold(B))^i = 0 quad "if and only if" quad upright(bold(A))^(- 1) gt.eq 0 . $
]
