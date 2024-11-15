#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(1)
#set heading(numbering: "1.1.1")

// 上一节编号到 10
#counter(math.equation).update(10)

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

= The power method for symmetric matrices
<the-power-method-for-symmetric-matrices>
The power method introduced in the previous section works for a general matrix, which may be non-symmetric, as long as the matrix has a single modulus dominant eigenvalue. However, the linear convergence rate of the power method is not satisfying.

For symmetric matrices, the method can work with the 2-norm in the normalization process for vector $upright(bold(z))_(k + 1)$ . The corresponding power method takes the form, for $k = 0 , 1 , 2 , dots.h.c$ ,

- Step 1. compute the matrix-vector product: $upright(bold(z))_(k + 1) = upright(bold(A)) upright(bold(x))_k$ ;

- Step 2. normalize vector $upright(bold(z))_(k + 1)$ : choose $r_(k + 1)$ such that the 2-norm of vector

  $ upright(bold(x))_(k + 1) = 1 / r_(k + 1) upright(bold(z))_(k + 1) $

  is equal to one and its first modulus-maximum entry has positive sign. If $norm(upright(bold(x))_(k + 1) - upright(bold(x))_k)_oo$ is less than a specified tolerance, compute

  $ mu_(k + 1) = upright(bold(x))_(k + 1)^T upright(bold(A)) upright(bold(x))_(k + 1) $

  and stop the iteration; otherwise, increase $k$ by one and go to step 1 .

We will see that the sequence of scalars ${mu_k}_(k = 1)^oo$ generated by the modified power method converges to the modulus-maximum eigenvalue quadratically in some sense (while the sequence of vectors ${upright(bold(x))_k}_(k = 1)^oo$ still converges linearly) if it does converge.

For a symmetric matrix $upright(bold(A))$ , we assume that its eigenvectors ${upright(bold(v))_j}_(j = 1)^n$ form an orthonormal basis of $bb(R)^n$ , i.e.,

$ upright(bold(v))_i^(upright(T)) upright(bold(v))_j = 0 quad "if" i eq.not j quad "for" norm(upright(bold(v))_j)_2 = 1 quad "for" j = 1 , 2 , dots.h.c , n . $

In particular, we additionally assume that the first modulus-maximum entry of $upright(bold(v))_1$ has positive sign. As the non-symmetric case, the normalization step amounts to normalize the vector $upright(bold(A))^k upright(bold(x))_0$ by dividing it by a scalar $s_k$ such that the 2-norm of vector

$ upright(bold(x))_k = lambda_1^k / s_k [alpha_1 upright(bold(v))_1 + alpha_2 (lambda_2 / lambda_1)^k upright(bold(v))_2 + dots.h.c + alpha_n (lambda_n / lambda_1)^k upright(bold(v))_n] $<eq:11>

is equal to one and its first modulus-maximum entry has positive sign. From (@eq:11), we get

$ lim_(k arrow.r oo) lambda_1^k / s_k alpha_1 = 1 $

since $lim_(k arrow.r oo) upright(bold(x))_k = upright(bold(v))_1$ ; and moreover

$ mu_k &= upright(bold(x))_k^(upright(T)) upright(bold(A)) upright(bold(x))_k = lambda_1^(2 k) / s_k^2 [alpha_1^2 lambda_1 + alpha_2^2 (lambda_2 / lambda_1)^(2 k) lambda_2 + dots.h.c + alpha_n^2 (lambda_n / lambda_1)^(2 k) lambda_n] \
&= lambda_1 + [(alpha_2 / alpha_1)^2 (lambda_2 / lambda_1)^(2 k) lambda_2 + (alpha_3 / alpha_1)^2 (lambda_3 / lambda_1)^(2 k) lambda_3 + dots.h.c + (alpha_n / alpha_1)^2 (lambda_n / lambda_1)^(2 k) lambda_n] . $

We see that

$ mu_k - lambda_1 = (alpha_2 / alpha_1)^2 (lambda_2 / lambda_1)^(2 k) lambda_2 + (alpha_3 / alpha_1)^2 (lambda_3 / lambda_1)^(2 k) lambda_3 + dots.h.c + (alpha_n / alpha_1)^2 (lambda_n / lambda_1)^(2 k) lambda_n $<eq:12>

and

$ lr(|mu_k - lambda_1|) lt.eq C lr(|lambda_2 / lambda_1|)^(2 k) lr(|lambda_2|) $<eq:13>

with some generic positive constant $C$ , independent of $k$ . It is also easy to see that

$ mu_(k + 1) - lambda_1 approx (mu_k - lambda_1) (lambda_2 / lambda_1)^2 . $<eq:14>

This indicates that the sequence of scalars ${mu_k}_(k = 1)^oo$ converges to the modulus-maximum eigenvalue $lambda_1$ quadratically with respect to the ratio $lambda_2 \/ lambda_1$ .

We can study the convergence of scalars ${mu_k}_(k = 1)^oo$ by an alternative approach, which involves a ratio called _Rayleigh quotient_.

#def[
For a symmetric matrix $upright(bold(A))$ , the ratio below

$ r (upright(bold(x))) = frac(upright(bold(x))^T upright(bold(A x)), upright(bold(x))^T upright(bold(x))) $

is called the Rayleigh quotient of the vector $upright(bold(x)) in bb(R)^n$ .
]

For any scalar $xi in bb(R)$ and vector $upright(bold(w)) in bb(R)^n$ , let

$ phi (xi) = r (upright(bold(x)) + xi upright(bold(w))) = frac((upright(bold(x)) + xi upright(bold(w)))^(upright(T)) upright(bold(A)) (upright(bold(x)) + xi upright(bold(w))), (upright(bold(x)) + xi upright(bold(w)))^(upright(T)) (upright(bold(x)) + xi upright(bold(w)))) . $

Differentiating $phi (xi)$ with respect to $xi$ at $xi = 0$ , we get

$ phi^(') (xi)\|_(xi = 0) = frac(2 upright(bold(w))^(upright(T)) upright(bold(A)) upright(bold(x)) dot.op upright(bold(x))^(upright(T)) upright(bold(x)) - 2 upright(bold(w))^(upright(T)) upright(bold(x)) dot.op upright(bold(x))^(upright(T)) upright(bold(A)) upright(bold(x)), (upright(bold(x))^(upright(T)) upright(bold(x)))^2) = upright(bold(w))^(upright(T)) nabla r (upright(bold(x))) . $

Here, the vector

$ nabla r (upright(bold(x))) = frac(2 upright(bold(A)) upright(bold(x)), upright(bold(x))^(upright(T)) upright(bold(x))) - frac(2 upright(bold(x))^(upright(T)) upright(bold(A)) upright(bold(x)), (upright(bold(x))^(upright(T)) upright(bold(x)))^2) upright(bold(x)) . $

is the gradient of the Rayleigh quotient $r (upright(bold(x)))$ .

It is straightforward to verify the following proposition.

#prp[
A vector $upright(bold(x)) = upright(bold(v))$ is an eigenvector of a symmetric matrix $upright(bold(A))$ if and only if the Rayleigh quotient $r (upright(bold(x)))$ has zero gradient at $upright(bold(x)) = upright(bold(v))$ and the Rayleigh quotient itself is the associated eigenvalue,

$ upright(bold(A)) upright(bold(v)) = frac(upright(bold(v))^T upright(bold(A)) upright(bold(v)), upright(bold(v))^T upright(bold(v))) upright(bold(v)) $
]

By the proposition, we have, at the eigenvectors $upright(bold(v))_j$ ,

$ nabla r (upright(bold(v))_j) = 0 quad "for" r (upright(bold(v))_j) = lambda_j quad "for" j = 1 , 2 , dots.h.c , n . $

For large $k$ , as vector $upright(bold(x))_k$ is close to the first eigenvector $upright(bold(v))_1$ , we have the Taylor series expansion

$ r (upright(bold(x))_k) &= r (upright(bold(v))_1) + nabla r (upright(bold(v))_1) (upright(bold(x))_k - upright(bold(v))_1) + 1 / 2 (upright(bold(x))_k - upright(bold(v))_1)^(upright(T)) upright(bold(H)) (upright(bold(x))_k - upright(bold(v))_1) + dots.h.c \

&= r (upright(bold(v))_1) + 1 / 2 (upright(bold(x))_k - upright(bold(v))_1)^(upright(T)) upright(bold(H)) (upright(bold(x))_k - upright(bold(v))_1) + dots.h.c , $<eq:15>

where $upright(bold(H))$ is the Hessian matrix. The terms omitted in the Taylor series expansion are asymptotically smaller than the quadratic term.

With the sequence of vectors ${upright(bold(x))_k}_(k = 1)^oo$ generated by the power method, we have

$ mu_k - lambda_1 = r (upright(bold(x))_k) - r (upright(bold(v))_1) = 1 / 2 (upright(bold(x))_k - upright(bold(v))_1)^(upright(T)) upright(bold(H)) (upright(bold(x))_k - upright(bold(v))_1) + dots.h.c . $

This indicates also the quadratic estimate:

$ lr(|mu_k - lambda_1|) lt.eq C norm(upright(bold(x))_k - upright(bold(v))_1)^2 quad "for large" k , $<eq:16>

in some norm with some generic constant $C$ , independent of $k$ .

#rmk[
For the following matrix

$ upright(bold(A)) = mat(delim: "[", 2, - 1, , , ; - 1, 2, - 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 2, - 1; #none, , , - 1, 2)_(n times n) , $

when $n$ is even, if the initial vector is chosen to be $upright(bold(x))_0 = (1 , 1 , dots.h.c , 1)^T$ , the power method only converges to the eigenvalue which has the second maximum modulus if the iteration stops when the error between two consecutive vectors is found to be small. However, if we continue the iteration without stopping, we will see that the sequence of the scalars $mu_k$ will finally converge to the modulus-maximum eigenvalue $lambda_1$ . This is because, even though the initial vector $upright(bold(x))_0$ is orthogonal to the eigenvector $upright(bold(v))_1$ , the introduction of the computer round-off errors during the normalization process makes the iterated vector $upright(bold(x))_k$ no longer orthogonal to $upright(bold(v))_1$ , and the power iteration finally amplifies the eigenvector component associated with the modulus-maximum eigenvalue.
]