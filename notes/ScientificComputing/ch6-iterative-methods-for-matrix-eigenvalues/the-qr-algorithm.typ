#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(6)
#set heading(numbering: "1.1.1")

// 上一节编号到 30
#counter(math.equation).update(30)

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

= The QR algorithm
<the-qr-algorithm>
The QR method/algorithm to be introduced in this section is a modified or simplified version of the generalized power method. In each iteration of the method, the matrix-matrix multiplication and the QR decomposition can be made efficiently.

Let

$ upright(bold(A))_k = upright(bold(X))_k^(upright(T)) upright(bold(A)) upright(bold(X))_k $

which is similar to the matrix $upright(bold(A))$ . By the generalized power method, we see that

$ upright(bold(A))_k = upright(bold(X))_k^(upright(T)) upright(bold(Z))_(k + 1) = upright(bold(X))_k^(upright(T)) upright(bold(X))_(k + 1) upright(bold(R))_(k + 1) . $

Let

$ upright(bold(Q))_(k + 1) = upright(bold(X))_k^(upright(T)) upright(bold(X))_(k + 1) , $

which is an orthogonal matrix, too. We have

$ upright(bold(X))_(k + 1) = upright(bold(X))_k upright(bold(Q))_(k + 1) $

and

$ upright(bold(A))_k = upright(bold(Q))_(k + 1) upright(bold(R))_(k + 1) , $

which is a QR decomposition of $upright(bold(A))_k$ . In the next, we will find a relation between $upright(bold(A))_k$ and $upright(bold(A))_(k + 1)$ by $upright(bold(Q))_(k + 1)$ and $upright(bold(R))_(k + 1)$ . In fact, we see that

$
upright(bold(A))_(k + 1) &= upright(bold(X))_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(X))_(k + 1) = upright(bold(Q))_(k + 1)^(upright(T)) upright(bold(X))_k^(upright(T)) upright(bold(A)) upright(bold(X))_k upright(bold(Q))_(k + 1) = upright(bold(Q))_(k + 1)^(upright(T)) upright(bold(A))_k upright(bold(Q))_(k + 1) \
&= upright(bold(Q))_(k + 1)^(upright(T)) upright(bold(Q))_(k + 1) upright(bold(R))_(k + 1) upright(bold(Q))_(k + 1) = upright(bold(R))_(k + 1) upright(bold(Q))_(k + 1) .
$

Now the generalized power method has the form: given an initial orthogonal matrix $upright(bold(X))_0$ and matrix $upright(bold(A))_0 = upright(bold(X))_0^T upright(bold(A)) upright(bold(X))_0$ , for $k = 0 , 1 , 2 , dots.h.c$ , do as follows

- Step 1. make QR decomposition for matrix $upright(bold(A))_k$

$ upright(bold(A))_k arrow.r.double upright(bold(Q))_(k + 1) upright(bold(R))_(k + 1) $

- Step 2. compute new matrix $upright(bold(A))_(k + 1)$ by

$ upright(bold(R))_(k + 1) upright(bold(Q))_(k + 1) arrow.r.double upright(bold(A))_(k + 1) $

- Step 3. compute matrix $upright(bold(X))_(k + 1)$ by

  $ upright(bold(X))_k upright(bold(Q))_(k + 1) arrow.r.double upright(bold(X))_(k + 1) . $

  Check the difference of matrices $upright(bold(X))_k$ and $upright(bold(X))_(k + 1)$ . Stop the iteration if $norm(upright(bold(X))_(k + 1) - upright(bold(X))_k)$ is less than some pre-specified tolerance; otherwise, increase $k$ by one and go to Step 1.

This is the so-called QR algorithm for simultaneously computing eigenvalues of matrix A.

We remark the third step in the QR algorithm above can be removed. In this case, the stopping criteria is correspondingly replaced by checking whether the orthogonal matrix $upright(bold(Q))_(k + 1)$ is sufficiently close to the identity matrix or matrix $upright(bold(A))_k$ is nearly a right triangular matrix.

Furthermore, in the iteration with the QR algorithm, if matrix $upright(bold(A))_k$ becomes a right block-triangular matrix, assuming

$ upright(bold(A))_k = mat(delim: "(", upright(bold(A))_(1 , 1), upright(bold(A))_(1 , 2); #none, upright(bold(A))_(2 , 2)) , $

we can instead apply the QR method to the block matrices $upright(bold(A))_(1 , 1)$ and $upright(bold(A))_(2 , 2)$ , which have lower dimensions than the initial matrix $upright(bold(A))$ and will involve much less computational work. If the dimension of the block matrix $upright(bold(A))_(1 , 1)$ or $upright(bold(A))_(2 , 2)$ is one or two, the eigenvalues can even be computed analytically. This is also a deflation technique. The corresponding method is called the QR method with deflation.

At the moment, we have not seen how the QR method can involve much less computational work than the generalized power method since each iteration in the algorithm also has QR decomposition and the matrix-matrix multiplication.

Surprisingly, if matrix $upright(bold(A))_k$ has some special forms, the computational work involved in the QR decomposition or the matrix-matrix multiplication will at most be linearly proportional to $n^2$ (when matrix $upright(bold(A))_k$ is non-symmetric) or even $n$ (when matrix $upright(bold(A))_k$ is symmetric). Moreover, the matrix $upright(bold(A))_(k + 1)$ will remain in the same special form as $upright(bold(A))_k$ .

The special form matrix is called an *upper Hessenberg matrix*. Any matrix $upright(bold(A))$ is orthogonally similar to an upper Hessenberg matrix, which is guaranteed by the Schur theorem. When matrix $upright(bold(A))$ is symmetric, it is orthogonally similar to a symmetric tridiagonal matrix.

If the matrix $upright(bold(A))_0 = upright(bold(X))_0^(upright(T)) upright(bold(A)) upright(bold(X))_0$ is an upper Hessenberg (or symmetric tridiagonal) matrix, all resulting matrices $upright(bold(A))_k$ generated by the QR iteration are also upper Hessenberg (or symmetric tridiagonal) matrices.

== The Hessenberg matrix
<the-hessenberg-matrix>
A matrix in the form

$ upright(bold(H)) = mat(delim: "[", a_(1 , 1), a_(1 , 2), a_(1 , 3), a_(1 , 4), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), a_(2 , 3), a_(2 , 4), dots.h.c, a_(2 , n); 0, a_(3 , 2), a_(3 , 3), a_(3 , 4), dots.h.c, a_(3 , n); 0, 0, a_(4 , 3), a_(4 , 4), dots.down, dots.v; dots.v, dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n); 0, 0, 0, dots.h.c, a_(n , n - 1), a_(n , n)) , $

whose $(i , j)^(t h)$ entry equals zero for $j < i - 1$ , is called an *upper Hessenberg matrix*.

$ mat(delim: "[", X, X, X, X, X; X, X, X, X, X; 0, X, X, X, X; 0, 0, X, X, X; 0, 0, 0, X, X) $

$ upright(bold(A)) = mat(delim: "[", a_(1 , 1), a_(1 , 2), a_(1 , 3), a_(1 , 4), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), a_(2 , 3), a_(2 , 4), dots.h.c, a_(2 , n); a_(3 , 1), a_(3 , 2), a_(3 , 3), a_(3 , 4), dots.h.c, a_(3 , n); a_(4 , 1), a_(4 , 2), a_(4 , 3), a_(4 , 4), dots.down, dots.v; dots.v, dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n); a_(1 , 1), a_(n , 2), a_(n , 3), dots.h.c, a_(n , n - 1), a_(n , n)) $

$ upright(bold(A)) = mat(delim: "[", a_(1 , 1), a_(1 , 2), a_(1 , 3), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), a_(2 , 3), dots.h.c, a_(2 , n); a_(3 , 1), a_(3 , 2), a_(3 , 3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n); a_(n , 1), a_(n , 2), dots.h.c, a_(n , n - 1), a_(n , n)) $

We construct a Householder matrix $tilde(upright(bold(H)))_1 in bb(R)^((n - 1) times (n - 1))$ such that

$ tilde(upright(bold(H)))_1 mat(delim: "[", a_(2 , 1); a_(3 , 1); dots.v; a_(n , 1)) = mat(delim: "[", a_(2 , 1)^((1)); 0; dots.v; 0) . $

Let

$ upright(bold(H))_1 = mat(delim: "[", 1, , ; #none, tilde(upright(bold(H)))_1, ) in bb(R)^(n times n) . $

We have

$ upright(bold(H))_1 upright(bold(A)) = mat(delim: "[", a_(1 , 1), a_(1 , 2), a_(1 , 3), dots.h.c, a_(1 , n); a_(2 , 1)^((1)), a_(2 , 2)^((1)), a_(2 , 3)^((1)), dots.h.c, a_(2 , n)^((1)); 0, a_(3 , 2)^((1)), a_(3 , 3)^((1)), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n)^((1)); 0, a_(n , 3)^((1)), dots.h.c, a_(n , n)^((1)), a_(n , n)^((1))) . $

To get a similar matrix, we should right-multiply the matrix above by the orthogonal matrix $upright(bold(H))_1$ , which yields

$ upright(bold(H))_1 upright(bold(A H))_1 = mat(delim: "[", a_(1 , 1), a_(1 , 2)^((1)), a_(1 , 3)^((1)), dots.h.c, a_(1 , n)^((1)); a_(2 , 1)^((1)), a_(2 , 2)^((2)), a_(2 , 3)^((2)), dots.h.c, a_(2 , n)^((2)); 0, a_(3 , 2)^((2)), a_(3 , 3)^((2)), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n)^((2)); 0, a_(n , 3)^((2)), dots.h.c, a_(n , n)^((2)), a_(n , n)^((2))) . $

$
& mat(delim: "[", X, X, X, X, X; X, X, X, X, X; X, X, X, X, X; X, X, X, X, X; X, X, X, X, X) arrow.r mat(delim: "[", X, X, X, X, X; X, X, X, X, X; 0, X, X, X, X; 0, X, X, X, X; 0, X, X, X, X) \
arrow.r & mat(delim: "[", X, X, X, X, X; X, X, X, X, X; 0, X, X, X, X; 0, 0, X, X, X; 0, 0, X, X, X) arrow.r mat(delim: "[", X, X, X, X, X; X, X, X, X, X; 0, X, X, X, X; 0, 0, X, X, X; 0, 0, 0, X, X) .
$

== The Givens rotation
<the-givens-rotation>
A Givens rotation matrix takes the form

$ upright(bold(G))_(i , j) = (g_(r , s))_(n times n) = mat(delim: "[", 1, , , , , , ; #none, dots.down, , , , , ; #none, , cos theta, dots.h.c, sin theta, , ; #none, , dots.v, dots.down, dots.v, , ; #none, , - sin theta, dots.h.c, cos theta, , ; #none, , , , , dots.down, ; #none, , , , , , 1) , $

which is almost the identity matrix except the four entries

$ g_(i , i) = cos theta , quad g_(i , j) = sin theta , quad g_(j , i) = - sin theta , quad g_(j , j) = cos theta . $

It is easy to see that the Givens rotation matrix is also orthogonal even though it is not symmetric. However, if we switch the sign for one of those two non-trivial rows or columns, the resulting matrix will be both symmetric and orthogonal.

#exm[
Let

$ upright(bold(u)) = mat(delim: "[", a; b) in bb(R)^2 $

be a vector to be transformed to another vector in the form

$ upright(bold(v)) = mat(delim: "[", c; 0) $

by the Givens rotation. We set $c = sqrt(a^2 + b^2)$ . The corresponding Givens rotation matrix reads

$ upright(bold(G)) = mat(delim: "[", cos theta, sin theta; - sin theta, cos theta) = 1 / sqrt(a^2 + b^2) mat(delim: "[", a, b; - b, a) . $

We have

$ upright(bold(v)) = upright(bold(G u)) . $

A question is for you now. Do we still have the equality if we switch the positions of $upright(bold(u))$ and $upright(bold(v))$ in the identity above?
]

The Givens rotation can also be used for the QR decomposition of a general matrix or applied to reduce a general matrix to the upper Hessenberg form except that it will be more expensive than the Housesholder reflection for dense matrices.

The Givens rotation is especially suited for making orthogonal transformations for sparse vectors or matrices, only a few of whose entries are non-zero.

For example, the Givens rotation is often used to transform an upper Hessenberg to a right triangular matrix in the QR algorithm for computing matrix eigenvalues.

Let $upright(bold(G))_(i , i + 1)$ be the Givens rotation matrix given by

$ upright(bold(G))_(i , i + 1) = (g_(r , s))_(n times n) = mat(delim: "[", 1, , , , , ; #none, dots.down, , , , ; #none, , cos theta, sin theta, , ; #none, , - sin theta, cos theta, , ; #none, , , , dots.down, ; #none, , , , , 1) , $

with $g_(i , i) = cos theta , g_(i , i + 1) = sin theta , g_(i + 1 , i) = - sin theta$ and $g_(i + 1 , i + 1) = cos theta$ . Other diagonal entries are all equal to one and other off-diagonal entries are all equal to zero.

#prp[
An upper Hessenberg matrix left-multiplied by a Givens rotation matrix $upright(bold(G))_(i , i + 1)$ is still an upper Hessenberg matrix. An upper Hessenberg matrix right-multiplied by a Givens rotation matrix $upright(bold(G))_(i , i + 1)$ is still an upper Hessenberg matrix.
]

#prf[
Left-multiplying an upper Hessenberg matrix by a Givens rotation matrix $upright(bold(G))_(i , i + 1)$ only changes the $i^(t h)$ and $(i + 1)^(t h)$ rows but does not change the first $i - 1$ entries of the $i^(t h)$ and $(i + 1)^(t h)$ rows (since those entries are zeros). Right-multiplying an upper Hessenberg matrix by a Givens rotation matrix $upright(bold(G))_(i , i + 1)$ only changes the $i^(t h)$ and $(i + 1)^(t h)$ columns but does not change the last $n - (i + 1)$ entries of the $i^(t h)$ and $(i + 1)^(t h)$ columns (since those entries are zeros).
]

The proposition guarantees that the similar matrices generated in the QR iteration for eigenvalues are always in the Hessenberg form.

The QR decomposition process of a 4 by 4 upper Hessenberg matrix in the QR iteration by the Givens rotation,

$ upright(bold(R))_(k + 1) = upright(bold(G))_(3 , 4) upright(bold(G))_(2 , 3) upright(bold(G))_(1 , 2) upright(bold(A))_k = upright(bold(Q))_(k + 1)^(upright(T)) upright(bold(A))_k $

is illustrated as follows,

$ & mat(delim: "[", X, X, X, X; X, X, X, X; #none, X, X, X; #none, , X, X) arrow.long.r^(upright(bold(G))_(1 , 2^(\*))) mat(delim: "[", X, X, X, X, ; #none, X, X, X, ; #none, , X, X, X; #none, , , X, X) \
arrow.long.r^(upright(bold(G))_(2 , 3^(\*))) & mat(delim: "[", X, X, X, X; #none, X, X, X; #none, , X, X; #none, , , X) arrow.long.r^(upright(bold(G))_(3 , 4^(\*))) mat(delim: "[", X, X, X, X, ; #none, X, X, X, ; #none, , X, X, ; #none, , , X, X; #none, , , , X) . $

The right-multiplying the right triangular matrix by the Given rotations

$ upright(bold(A))_(k + 1) = upright(bold(R))_(k + 1) upright(bold(Q))_(k + 1) = upright(bold(R))_(k + 1) upright(bold(G))_(1 , 2)^(upright(T)) upright(bold(G))_(2 , 3)^(upright(T)) upright(bold(G))_(3 , 4)^(upright(T)) $

is illustrated below,

$ & mat(delim: "[", X, X, X, X; #none, X, X, X; #none, , X, X; #none, , , X) arrow.long.r^(\* upright(bold(G))_(1 , 2)^(upright(T))) mat(delim: "[", X, X, X, X, ; #none, X, X, X, ; #none, , , X, X; #none, , , , X) \
arrow.long.r^(\* upright(bold(G))_(2 , 3)^(upright(T))) & mat(delim: "[", X, X, X, X; #none, X, X, X; #none, , X, X; #none, , , X) arrow.long.r^(\* upright(bold(G))_(3 , 4)^(upright(T))) mat(delim: "[", X, X, X, X, ; #none, X, X, X, ; #none, , X, X, ; #none, , , X, X) . $