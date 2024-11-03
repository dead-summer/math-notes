#import "/book.typ": book-page, cross-link
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(2)
#set heading(numbering: "1.1.1")

// 由于上一节编号到 9，因此本节从 10 开始编号
#counter(math.equation).update(9)
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

= The QR Decomposition

The LU decomposition method imposes multiple conditions on the matrix $upright(bold(A))$ , which requre that primal sub-matrices are all invertible. In this section, we will introduce a matrix decomposition, which only asks that the matrix $upright(bold(A))$ is invertible. The method is the so-called QR decomposition. It factorizes the matrix $upright(bold(A))$ as the product of an orthogonal matrix $upright(bold(Q))$ and a right/upper triangular matrix $upright(bold(R))$ in the form

$ upright(bold(A)) = upright(bold(Q R)) . $<eq:10>

Substituting (@eq:10) into the linear system (1) yields

$ upright(bold(Q R x)) = upright(bold(A x)) = upright(bold(b)) . $

Let

$ upright(bold(y)) = upright(bold(R x)) upright(".") $

Then the linear system (1) is decomposed into to linear systems,

$ upright(bold(Q y)) = upright(bold(b)) $<eq:11>

and

$ upright(bold(R x)) = upright(bold(y)) . $<eq:12>

As the matrix $upright(bold(Q))$ is orthogonal, from (@eq:11),we can easily get

$ upright(bold(y)) = upright(bold(Q))^(upright(T)) upright(bold(b)) . $

The lower triangular system (@eq:12) can be solved with the forward substitution. So the QR decomposition provides a method for solving the linear system (1). It is a direct method.

In the next, we will present two approaches to the QR decomposition.

== Gram-Schmidt orthgonalization

First, we assume that the right triangular matrix takes the form

$ upright(bold(R)) = mat(delim: "(", r_(1 , 1), r_(1 , 2), dots.h.c, r_(1 , n); #none, r_(2 , 2), dots.h.c, r_(2 , n); #none, , dots.down, dots.v; #none, , , r_(n , n)) . $

Let

$ upright(bold(Q)) = (upright(bold(q))_1 , upright(bold(q))_2 , dots.h.c , upright(bold(q))_n) in bb(R)^(n times n) $

be the orthogonal matrix with $upright(bold(q))_j in bb(R)^n$ be the $j^(t h)$ column vector of $upright(bold(Q))$ , which satisfy the property,

$ upright(bold(q))_i^(upright(T)) upright(bold(q))_j = cases(delim: "{", 1 & upright(" if ") i = j ,, 0 & upright(" if ") i eq.not j .) $

Let $upright(bold(a))_j in bb(R)^n$ be the $j^(t h)$ column vector of the matrix,

$ upright(bold(A)) = (upright(bold(a))_1 , upright(bold(a))_2 , dots.h.c , upright(bold(a))_n) in bb(R)^(n times n) . $

By the QR decomposition, we have

$ (upright(bold(q))_1 , upright(bold(q))_2 , dots.h.c , upright(bold(q))_n) mat(delim: "(", r_(1 , 1), r_(1 , 2), dots.h.c, r_(1 , n); #none, r_(2 , 2), dots.h.c, r_(2 , n); #none, , dots.down, dots.v; #none, , , r_(n , n)) = (upright(bold(a))_1 , upright(bold(a))_2 , dots.h.c , upright(bold(a))_n) . $

Further, multiplying the orthogonal matrix with columns of the right triangular matrix yields

$ cases(delim: "{", upright(bold(q))_1 r_(1 , 1) & = upright(bold(a))_1 ,, upright(bold(q))_1 r_(1 , 2) + upright(bold(q))_2 r_(2 , 2) & = upright(bold(a))_2 ,, upright(bold(q))_1 r_(1 , 3) + upright(bold(q))_2 r_(2 , 3) + upright(bold(q))_3 r_(3 , 3) & = upright(bold(a))_3 ,, upright(bold(q))_1 r_(1 , 4) + upright(bold(q))_2 r_(2 , 4) + upright(bold(q))_3 r_(3 , 4) + upright(bold(q))_4 r_(4 , 4) & = upright(bold(a))_4 ,,  & dots.v) $<eq:13>

i.e.,

$ sum_(i = 1)^j upright(bold(q))_i r_(i , j) = upright(bold(a))_j , #h(0em) upright(" for ") j = 1 , 2 , dots.h.c , n . $

From the first equation in (@eq:13), we can get

$ r_(1 , 1) = norm(upright(bold(a))_1)_2 $


and

$ upright(bold(q))_1 = upright(bold(a))_1 \/ r_(1 , 1) $

From the second equation in (13), we can get

$ r_(1 , 2) = (upright(bold(a))_2 , upright(bold(q))_1) = upright(bold(q))_1^(upright(T)) upright(bold(a))_2 $

$ r_(2 , 2) = norm(upright(bold(a))_2 - upright(bold(q))_1 r_(1 , 2))_2 $

$  $

and

$ upright(bold(q))_2 = (upright(bold(a))_1 - upright(bold(q))_1 r_(1 , 2)) \/ r_(2 , 2) . $

From the third equation in (13), we can get

$ r_(1 , 3) = (upright(bold(a))_3 , upright(bold(q))_1) = upright(bold(q))_1^(upright(T)) upright(bold(a))_3 $

$ r_(2 , 3) = (upright(bold(a))_3 , upright(bold(q))_2) = upright(bold(q))_2^(upright(T)) upright(bold(a))_3 $

$ r_(3 , 3) = norm(upright(bold(a))_3 - upright(bold(q))_1 r_(1 , 3) - upright(bold(q))_2 r_(2 , 3))_2 $

and

$ upright(bold(q))_3 = (upright(bold(a))_3 - upright(bold(q))_1 r_(1 , 3) - upright(bold(q))_2 r_(2 , 3)) \/ r_(3 , 3) . $

For general $j = 1 , 2 , dots.h.c , n$ ,we can get

$ r_(i , j) = (upright(bold(a))_j , upright(bold(q))_i) = upright(bold(q))_i^(upright(T)) upright(bold(a))_j , #h(0em) i = 1 , 2 , dots.h.c , j - 1 , $

$ r_(j , j) = norm(upright(bold(a))_j - sum_(i = 1)^(j - 1) upright(bold(q))_i r_(i , j))_2 $

and

$ upright(bold(q))_j = (upright(bold(a))_j - sum_(i = 1)^(j - 1) upright(bold(q))_i r_(i , j)) \/ r_(j , j) $

As a matter of fact, the QR decomposition above is exactly the well-known *Gram-Schmidt orthogonalization process* for the column vectors of $upright(bold(A))$ . First normalize $upright(bold(a))_1$ to get $upright(bold(q))_1 = upright(bold(a))_1 \/ r_(1 , 1)$ with $r_(1 , 1) = norm(upright(bold(a))_1)_2$ . Next compute

$ upright(bold(p))_2 = upright(bold(a))_2 - (upright(bold(a))_2 , upright(bold(q))_1) upright(bold(q))_1 $

and normalize $upright(bold(p))_2$ to get $upright(bold(q))_2 = upright(bold(p))_2 \/ r_(2 , 2)$ with $r_(2 , 2) = norm(upright(bold(p))_2)_2$ . For the third column vector $upright(bold(a))_3$ ,we do similarly

$ upright(bold(p))_3 = upright(bold(a))_3 - (upright(bold(a))_3 , upright(bold(q))_1) upright(bold(q))_1 - (upright(bold(a))_3 , upright(bold(q))_2) upright(bold(q))_2 , $

and normalize $upright(bold(p))_3$ to get $upright(bold(q))_3 = upright(bold(p))_3 \/ r_(3 , 3)$ with $r_(3 , 3) = norm(upright(bold(p))_3)_2$ . For the general $j^(t h)$ column vector $upright(bold(a))_j$ ,we

have

$ upright(bold(p))_j = upright(bold(a))_j - sum_(i = 1)^(j - 1) (upright(bold(a))_j , upright(bold(q))_i) upright(bold(q))_i $

and normalize $upright(bold(p))_j$ to get $upright(bold(q))_j = upright(bold(p))_j \/ r_(j , j)$ with $r_(j , j) = norm(upright(bold(p))_j)_2$ .

#exr[
Make the QR decomposition by hand or computer for the matrix below by the Gram-Schmidt orthogonalization method,

$ upright(bold(A)) = mat(delim: "(", 1, 2, 0; 0, 1, 1; 1, 0, 1) $
]

#thm[
The QR decomposition is unique, provided that the diagonal entries of the right triangular matrix are positive.
]

#prf[
Assume that the QR decomposition is not unique, say, there are two QR decomposition,

$ upright(bold(Q))_1 upright(bold(R))_1 = upright(bold(A)) = upright(bold(Q))_2 upright(bold(R))_2 $

where $upright(bold(Q))_1$ and $upright(bold(Q))_2$ are orthogonal matrices; $upright(bold(R))_1$ and $upright(bold(R))_2$ are right triangular matrices with positive diagonal entries. We have

$ upright(bold(Q))_2^(upright(T)) upright(bold(Q))_1 = upright(bold(R))_2 upright(bold(R))_1^(- 1) $

Note that the matrix on the left side of the identity above is also an orthogonal matrix. The matrix on the right side is a right triangular matrix, denote by $upright(bold(U))$ . So $upright(bold(U))$ is an orthogonal matrix with

$ upright(bold(U))^(- 1) = upright(bold(U))^(upright(T)) $

which indicates that the matrix $upright(bold(U))^(upright(T))$ is also a right triangular matrix as it is the inverse of a right triangular matrix and a left triangular matrix as it is the tranpose of a right triangular matrix. So the matrix $upright(bold(U))^(upright(T))$ , i.e., the matrix $upright(bold(U))$ is a diagonal matrix. As the diagonal entries of the right triangular matrices $upright(bold(R))_1$ and $upright(bold(R))_2$ are all positive, the diagonal entries of $upright(bold(U))$ are positive too. On the other hand, the fact that the matrix $upright(bold(U))$ is orthogonal implies that it is the identity matrix. That is,

$ upright(bold(R))_1 = upright(bold(R))_2 , quad "and" quad upright(bold(Q))_1 = upright(bold(Q))_2 . $
]


== The Householder Matrix

The second approach to the QR decomposition works with the so-called Householder matrix, which is a reflection matrix.

A Householder matrix takes the form

$ upright(bold(H)) = upright(bold(I)) - 2 upright(bold(w w))^(upright(T)) $

with $upright(bold(I)) in bb(R)^(n times n)$ be the identity matrix and $upright(bold(w))$ be a vector with unit length in the $ell^2$ -norm. It can be verified that the Householder matrix is a symmetric and orthogonal matrix, i.e.,

$ upright(bold(H))^(upright(T)) = upright(bold(H)) quad "and" quad upright(bold(H))^2 = upright(bold(I)) . $

Let $upright(bold(u))$ and $upright(bold(v))$ be two vectors in $bb(R)^n$ with identical $ell^2$ -norms, i.e.,

$ norm(upright(bold(u)))_2 = norm(upright(bold(v)))_2 $

Let

$ upright(bold(w)) = frac(upright(bold(u)) - upright(bold(v)), norm(upright(bold(u - v)))_2) $

The corresponding Householder matrix has the property

$ upright(bold(H u)) = upright(bold(v)) , $

and

$ upright(bold(H v)) = upright(bold(u)) . $

The vectors $upright(bold(u))$ and $upright(bold(v))$ are mutually reflected by the Householder matrix. As a matter of fact,since

$ (upright(bold(u)) - upright(bold(v)))^(upright(T)) upright(bold(u)) = upright(bold(u))^(upright(T)) upright(bold(u)) - upright(bold(v))^(upright(T)) upright(bold(u)) $

$ = upright(bold(v))^(upright(T)) upright(bold(v)) - upright(bold(v))^(upright(T)) upright(bold(u)) = upright(bold(v))^(upright(T)) upright(bold(v)) - upright(bold(u))^(upright(T)) upright(bold(v)) $

$ = (upright(bold(v)) - upright(bold(u)))^(upright(T)) upright(bold(v)) = - (upright(bold(u)) - upright(bold(v)))^(upright(T)) upright(bold(v)) , $

we have

$ 2 (upright(bold(u)) - upright(bold(v)))^(upright(T)) upright(bold(u)) = (upright(bold(u)) - upright(bold(v)))^(upright(T)) (upright(bold(u)) - upright(bold(v))) . $

Then

$ upright(bold(H u)) = upright(bold(u)) - 2 frac((upright(bold(u)) - upright(bold(v))) (upright(bold(u)) - upright(bold(v)))^(upright(T)), norm(upright(bold(u)) - upright(bold(v)))_2^2) upright(bold(u)) $

$ = upright(bold(u)) - frac((upright(bold(u)) - upright(bold(v))) (upright(bold(u)) - upright(bold(v)))^(upright(T)), norm(upright(bold(u)) - upright(bold(v)))_2^2) (upright(bold(u)) - upright(bold(v))) $

$ = upright(bold(u)) - (upright(bold(u)) - upright(bold(v))) = upright(bold(v)) . $

Now we will use Householder matrices to make the QR decomposition for the matrix,

$ upright(bold(A)) = mat(delim: "(",
a_(1 , 1)^((0)), a_(1 , 2)^((0)), a_(1 , 3)^((0)), dots.h.c, a_(1 , n)^((0));
a_(2 , 1)^((0)), a_(2 , 2)^((0)), a_(2 , 3)^((0)), dots.h.c, a_(2 , n)^((0));
a_(3 , 1)^((0)), a_(3 , 2)^((0)), a_(3 , 3)^((0)), dots.down, dots.v;
dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n)^((0));
a_(n , 1)^((0)), a_(n , 2)^((0)), dots.h.c, a_(n , n - 1)^((0)), a_(n , n)^((0))) . $

First we construct a Householder matrix

$ upright(bold(H))_1 = upright(bold(I)) - 2 upright(bold(w))_1 upright(bold(w))_1^T $

with

$ upright(bold(w))_1 = frac(upright(bold(u))_1 - upright(bold(v))_1, norm(upright(bold(u))_1 - upright(bold(v))_1)_2) $

Here,the vector $upright(bold(u))_1 = upright(bold(a))_1$ is the first column vector of the matrix $upright(bold(A)) , upright(bold(v))_1 = a_(1 , 1)^((1)) upright(bold(e))_1$ is a multiple of $upright(bold(e))_1$ , the first column vector of the identity matrix. The scalar $a_(1 , 1)^((1))$ is chosen so that vectors $upright(bold(u))_1$ and $upright(bold(v))_1$ have identical $ell^2$ -norms, which means

$ a_(1 , 1)^((1)) = plus.minus norm(upright(bold(a))_1)_2 $

With the Householder matrix $upright(bold(H))_1$ , we have

$ upright(bold(H))_1 upright(bold(a))_1 = a_(1 , 1)^((1)) upright(bold(e))_1 $

i.e.,

$ upright(bold(H)) vec(a_(1 , 1)^((0)), a_(2 , 1)^((0)), dots.v, a_(m , 1)^((0))) = vec(a_(1 , 1)^((1)), 0, dots.v, 0) $

Let

$ upright(bold(A))_1 = upright(bold(H))_1 upright(bold(A)) =
mat(delim: "(", a_(1 , 1)^((1)), a_(1 , 2)^((1)), a_(1 , 3)^((1)), dots.h.c, a_(1 , n)^((1));
#none, a_(2 , 2)^((1)), a_(2 , 3)^((1)), dots.h.c, a_(2 , n)^((1));
#none, a_(3 , 2)^((1)), a_(3 , 3)^((1)), dots.down, dots.v;
#none, dots.v, dots.down, dots.down, a_(n - 1 , n)^((1));
#none, a_(n , 3)^((1)), dots.h.c, a_(n , n - 1)^((1)), a_(n , n)^((1))) $

Next we construct a Householder matrix

$ upright(bold(H))_2 = upright(bold(I)) - 2 upright(bold(w))_2 upright(bold(w))_2^T $

with

$ upright(bold(w))_2 = frac(upright(bold(u))_2 - upright(bold(v))_2, norm(upright(bold(u))_2 - upright(bold(v))_2)_2) $

Here,the vector $upright(bold(u))_2 = upright(bold(a))_2$ is the second column vector of the matrix $upright(bold(A))_1$ and the vector $upright(bold(v))_2$ takes the form

$ upright(bold(v))_2 = vec(a_(1 , 2)^((1)), a_(2 , 2)^((2)), 0, dots.v, 0) $

The scalar $a_(2 , 2)^((2))$ is chosen so that vectors $upright(bold(u))_2$ and $upright(bold(v))_2$ have identical $ell^2$ -norms, which means

$ a_(2 , 2)^((2)) = plus.minus sqrt(sum_(i = 2)^n [a_(i , 2)^((1))]^2) . $

With the Householder matrix $upright(bold(H))_2$ , we have

$ upright(bold(H))_2 upright(bold(a))_2 = vec(a_(1 , 2)^((1)), a_(2 , 2)^((2)), 0, dots.v, 0) $

i.e.,

$ upright(bold(H)) vec(a_(1 , 2)^((1)), a_(2 , 2)^((1)), a_(3 , 2)^((1)), dots.v, a_(n , 2)^((1))) = vec(a_(1 , 2)^((1)), a_(2 , 2)^((2)), 0, dots.v, 0) $

Let

$ upright(bold(A))_2 = upright(bold(H))_2 upright(bold(A))_1 = upright(bold(H))_2 upright(bold(H))_1 upright(bold(A)) = 
mat(delim: "(", a_(1 , 1)^((1)), a_(1 , 2)^((1)), a_(1 , 3)^((1)), dots.h.c, a_(1 , n)^((1)) ;
#none, a_(2 , 2)^((2)), a_(2 , 3)^((2)), dots.h.c, a_(2 , n)^((2)) ;
#none, , a_(3 , 3)^((2)), dots.down, dots.v ;
#none, , dots.v, dots.down, a_(n - 1 , n)^((2)) ;
#none,  , a_(n , 3)^((2)), dots.h.c, a_(n , n)^((2))) $

As the third step, we construct a Householder matrix

$ upright(bold(H))_3 = upright(bold(I)) - 2 upright(bold(w))_3 upright(bold(w))_3^T $

with

$ upright(bold(w))_3 = frac(upright(bold(u))_3 - upright(bold(v))_3, norm(upright(bold(u))_3 - upright(bold(v))_3))_2 $

The vector $upright(bold(u))_3 = upright(bold(a))_3$ is the third column vector of the matrix $upright(bold(A))_2$ and the vector $upright(bold(v))_3$ takes the form

$ upright(bold(v))_3 = vec(a_(1 , 3)^((1)), a_(2 , 3)^((2)), a_(3 , 3)^((3)), 0, dots.v, 0) $

The scalar $a_(3 , 3)^((3))$ is chosen so that vectors $upright(bold(u))_3$ and $upright(bold(v))_3$ have identical $ell^2$ -norms, which means

$ a_(3 , 3)^((3)) = plus.minus sqrt(sum_(i = 3)^n [a_(i , 3)^((2))]^2) . $

With the Householder matrix $upright(bold(H))_3$ , we have

$ upright(bold(H))_3 upright(bold(a))_3 = vec(a_(1 , 3)^((2)), a_(2 , 3)^((2)), a_(3 , 3)^((2)), 0, dots.v, 0) $

i.e.,

$ upright(bold(H)) vec(a_(1 , 3)^((2)), a_(2 , 3)^((2)), a_(3 , 3)^((2)), a_(4 , 3)^((2)), dots.v, a_(4 , 3)^((1))) = vec(a_(1 , 3)^((1)), a_(2 , 3)^((2)), a_(3 , 3)^((2)), 0, dots.v, 0) . $

Let

$ upright(bold(A))_3 = upright(bold(H))_3 upright(bold(A))_2 = upright(bold(H))_3 upright(bold(H))_2 upright(bold(H))_1 upright(bold(A)) =
mat(delim: "(", a_(1 , 1)^((1)), a_(1 , 2)^((1)), a_(1 , 3)^((1)), a_(1 , 4)^((1)), dots.h.c, a_(1 , n)^((1)) ;
#none, a_(2 , 2)^((2)), a_(2 , 3)^((2)), a_(2 , 4)^((2)), dots.h.c, a_(2 , n)^((2)) ;
#none, , a_(3 , 3)^((3)), a_(3 , 4)^((3)), dots.down, dots.v ;
#none, , , a_(4 , 4)^((3)), dots.down, a_(n - 1 , n)^((3)) ;
#none, ,  , a_(n , 4)^((3)), dots.h.c, a_(n , n)^((3))) . $

Repeat the process above. In the $k^(t h)$ step,choose the Householder matrix by

$ upright(bold(H))_k = upright(bold(I)) - 2 upright(bold(w))_k upright(bold(w))_k^T $

with

$ upright(bold(w))_k = frac(upright(bold(u))_k - upright(bold(v))_k, norm(upright(bold(u))_k - upright(bold(v))_k)_2) $

The vector $upright(bold(u))_k$ is the $k^(t h)$ column vector of the matrix $upright(bold(A))_(k - 1)$ and the vector $upright(bold(v))_k$ has only its first $k$ entries are non-zero. The first(k - 1)entries of $upright(bold(v))_k$ are the same as those of $upright(bold(u))_k$ and the $k^(t h)$ entry of $upright(bold(v))_k$ reads

$ a_(k , k)^((k)) = plus.minus sqrt(sum_(i = k)^n [a_(i , k)^((k - 1))]^2) . $

The product of the Householder matrices

$ upright(bold(P)) = upright(bold(H))_(n - 1) upright(bold(H))_(n - 2) dots.h.c upright(bold(H))_2 upright(bold(H))_1 $

is an orthogonal matrix. We have

$ upright(bold(P A)) = mat(delim: "(", a_(1 , 1)^((1)), a_(1 , 2)^((1)), a_(1 , 3)^((1)), a_(1 , 4)^((1)), dots.h.c, a_(1 , n)^((1)); #none, a_(2 , 2)^((2)), a_(2 , 3)^((2)), a_(2 , 4)^((2)), dots.h.c, a_(2 , n)^((2)); #none, , a_(3 , 3)^((3)), a_(3 , 4)^((3)), dots.h.c, a_(3 , n)^((3)); #none, , , a_(4 , 4)^((4)), dots.h.c, a_(1 , n)^((4)); #none, , , , dots.down, dots.v; #none, , , , , a_(n , n)^((n - 1))) equiv upright(bold(R)) . $

Let $upright(bold(Q)) = upright(bold(P))^T$ . We have the QR decomposition,

$ upright(bold(A)) = upright(bold(Q R)) . $

#rmk[
To solve the linear system (1), one may simultaneously multiply the Householder matrices with the coefficient matrix and the right hand side.
]

Note that the QR decomposition also has algorithm complexity $O (n^3)$ .

#exr[
Use the Householder matrix to make the QR decomposition by hand or computer for the matrix below

$
A = mat(delim: "(", 1, 1, 1; 2, - 1, - 1; 2, - 4, 5), quad
B = mat(delim: "(", 1, 3, - 2; - 1, - 2, 3; 1, 1, 2)
$

]
