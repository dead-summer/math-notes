#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(3)
#set heading(numbering: "1.1.1")

// 上一节编号到 50
#counter(math.equation).update(50)

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

= The Galerkin variational method
<the-galerkin-variational-method>
Assume that $upright(bold(A)) in bb(R)^(n times n)$ and $upright(bold(b)) in bb(R)^n$ . Suppose that an initial guess $upright(bold(x))_0$ for the linear system

$ upright(bold(A x)) = upright(bold(b)) quad "for" upright(bold(x)) in bb(R)^n $<eq:51>

is given. Let $upright(bold(r))_0 = upright(bold(b)) - upright(bold(A)) upright(bold(x))_0$ and $upright(bold(e))_0 = upright(bold(x)) - upright(bold(x))_0$ be the residual and the error, respectively. Note that the error $upright(bold(e))_0$ is unknown, satisfying the error (residual) equation

$ upright(bold(A e))_0 = upright(bold(r))_0 quad "for" upright(bold(e))_0 in bb(R)^n . $<eq:52>

The exact solution is the initial guess plus the error, i.e.,

$ upright(bold(x)) = upright(bold(x))_0 + upright(bold(e))_0 $

If we can find an approximation $upright(bold(d))_m$ for the error $upright(bold(e))_0$ , then the vector

$ upright(bold(x))_m = upright(bold(x))_0 + upright(bold(d))_m $

will be an approximate solution to linear system (@eq:51).

The Galerkin variational method approximately solves the residual equation (error equation) (5’ by finding a projection of its solution into a subspace.

Suppose $cal(K)_m = "span" {upright(bold(v))_1 , upright(bold(v))_2 , dots.h.c , upright(bold(v))_m}$ and $cal(L)_m = "span" {upright(bold(w))_1 , upright(bold(w))_2 , dots.h.c , upright(bold(w))_m}$ are two subspaces spanned by some known vectors in $bb(R)^n$ . Let $upright(bold(V))_m = (upright(bold(v))_1 , upright(bold(v))_2 , dots.h.c , upright(bold(v))_m)$ and $upright(bold(W))_m = (upright(bold(w))_1 , upright(bold(w))_2 , dots.h.c , upright(bold(w))_m)$ be the rectangular matrices. An approximate solution process for the linear system (@eq:52) is to find $upright(bold(d))_m = upright(bold(V))_m upright(bold(z))_m in cal(K)_m$ with $upright(bold(z))_m in bb(R)^m$ such that

$ upright(bold(w))^T (upright(bold(r))_0 - upright(bold(A d))_m) = 0 #h(0em) forall upright(bold(w)) in cal(L)_m $

or equivalently,

$ upright(bold(W))_m^T (upright(bold(r))_0 - upright(bold(A)) upright(bold(V))_m upright(bold(z))_m) = 0 . $<eq:53>

We can choose the subspaces $cal(K)_m$ and $cal(L)_m$ appropriately so that the coefficient matrix $upright(bold(W))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m$ has a good structure and the linear system can be cheaply and easily solved. After solving the linear system

$ upright(bold(W))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m upright(bold(z))_m = upright(bold(W))_m^(upright(T)) upright(bold(r))_0 $

we get

$ upright(bold(z))_m = (upright(bold(W))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m)^(- 1) upright(bold(W))_m^(upright(T)) upright(bold(r))_0 . $

Further, the vector

$ upright(bold(d))_m = upright(bold(V))_m (upright(bold(W))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m)^(- 1) upright(bold(W))_m^(upright(T)) upright(bold(r))_0 $

is an approximate solution to the linear system (@eq:52) and the vector

$ upright(bold(x))_m = upright(bold(x))_0 + upright(bold(V))_m (upright(bold(W))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m)^(- 1) upright(bold(W))_m^(upright(T)) upright(bold(r))_0 $

will be an approximate solution to the original linear system (@eq:51).

A question now is how to choose the subspaces $cal(K)_m$ and $cal(L)_m$ . Different choices of the subspaces lead to different algorithms.
== The Arnoldi Algorithm

It is natural to choose $cal(K)_m$ to be the Krylov subspace

$ cal(K)_m = "span" {upright(bold(r))_0 , upright(bold(A r))_0 , dots.h.c , upright(bold(A))^(m - 1) upright(bold(r))_0} $

since we know that

$ upright(bold(e))_0 = upright(bold(A))^(- 1) upright(bold(r))_0 in "span" {upright(bold(r))_0 , upright(bold(A)) upright(bold(r))_0 , dots.h.c , upright(bold(A))^(n - 1) upright(bold(r))_0} , $

which is guaranteed by the Cayley-Hamilton theorem.

#thm([Cayley-Hamilton])[
Let $p_n (lambda) = det lr(|lambda upright(bold(I)) - upright(bold(A))|) = lambda^n + a_1 lambda^(n - 1) + dots.h.c + a_(n - 1) lambda + a_n$ be the characteristic polynomial of the matrix $upright(bold(A)) in bb(R)^(n times n)$ . Then we have

$ p_n (upright(bold(A))) = upright(bold(A))^n + a_1 upright(bold(A))^(n - 1) + dots.h.c + a_(n - 1) upright(bold(A)) + a_n upright(bold(I)) = 0 . $
]

#cor[
Let $p_n (lambda) = det lr(|lambda upright(bold(I)) - upright(bold(A))|) = lambda^n + a_1 lambda^(n - 1) + dots.h.c + a_(n - 1) lambda + a_n$ be the characteristic polynomial of an invertible matrix $upright(bold(A)) in bb(R)^(n times n)$ . Then we have $a_n eq.not 0$ and

$ upright(bold(A))^(- 1) = - 1 / a_n (upright(bold(A))^(n - 1) + a_1 upright(bold(A))^(n - 2) + dots.h.c + a_(n - 1) upright(bold(I))) . $
]

As a result of the corollary above, we see

$ upright(bold(A))^(- 1) upright(bold(r)) = - 1 / a_n (upright(bold(A))^(n - 1) upright(bold(r)) + a_1 upright(bold(A))^(n - 2) upright(bold(r)) + dots.h.c + a_(n - 1) upright(bold(r))) . $

The Arnoldi algorithm not just chooses $cal(K)_m$ to be the Krylov subspace but also make $cal(L)_m = cal(K)_m$ . For the matrix $upright(bold(W))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m$ to be a matrix, which is easier to invert than a general matrix, the Arnoldi method further chooses the vectors $upright(bold(v))_j$'s to be an orthonormal basis of $cal(K)_m$ . The orthonormal vectors $upright(bold(v))_j$'s can be generated by the Gram-Schmidt orthogonalization process: Let $upright(bold(v))_1 = upright(bold(r))_0 \/ norm(upright(bold(r))_0)$ ; for $k = 1 , 2 , dots.h.c , m ,$ do

$
upright(bold(w))_k &= upright(bold(A)) upright(bold(v))_k \
h_(j , k) &= upright(bold(w))_k^T upright(bold(v))_j quad "for" j = 1 , dots.h.c , k , \
tilde(upright(bold(v)))_(upright(bold(k)) + upright(bold(1))) &= upright(bold(w))_k - sum_(j = 1)^k upright(bold(v))_j h_(j , k) \
h_(k + 1 , k) &= norm(tilde(upright(bold(v)))_(upright(bold(k)) + upright(bold(1)))) , \
upright(bold(v))_(k + 1) &= tilde(upright(bold(v)))_(upright(bold(k)) + upright(bold(1))) \/ h_(k + 1 , k)
$

The process has to terminate when $h_(k + 1 , k) = 0$ . In the case that the dimension of $cal(K)_m$ is equal to $m , h_(k + 1 , k)$ may be equal to zero only when $k = m$ . In the next, we assume that the vectors $upright(bold(r))_0 , upright(bold(A r))_0 , dots.h.c , upright(bold(A))^(m - 1) upright(bold(r))_0$ are linearly independent (that is, the dimension of the Krylov subspace is equal to $m$ ).

We rewrite the Gram-Schmidt orthogonalization process above as follows,

$
upright(bold(A)) upright(bold(v))_1 &= upright(bold(v))_1 h_(1 , 1) + upright(bold(v))_2 h_(2 , 1) , \
upright(bold(A v))_2 &= upright(bold(v))_1 h_(1 , 2) + upright(bold(v))_2 h_(2 , 2) + upright(bold(v))_3 h_(3 , 2) , \
&dots.v \
upright(bold(A v))_m &= upright(bold(v))_1 h_(1 , m) + upright(bold(v))_2 h_(2 , m) + dots.h.c + upright(bold(v))_m h_(m , m) + upright(bold(v))_(m + 1) h_(m + 1 , m) .
$

Let $h_(i , j) = 0$ for $i > (j + 1)$ . Let $upright(bold(H))_m$ be the upper Hessenberg matrix with $h_(i , j)$ being its entries,

$ upright(bold(H))_m = mat(delim: "[", h_(1 , 1), h_(1 , 2), dots.h.c, h_(1 , m - 1), h_(1 , m); h_(2 , 1), h_(2 , 2), dots.h.c, h_(2 , m - 1), h_(2 , m); 0, h_(3 , 2), dots.down, dots.v, dots.v; dots.v, dots.down, dots.down, h_(m - 1 , m - 1), h_(m - 1 , m); 0, dots.h.c, 0, h_(m , m - 1), h_(m , m))_(m times m) . $

By the construction of the vectors $upright(bold(v))_j$'s , we see that the matrix $upright(bold(V))_m$ is an orthogonal matrix and

$ upright(bold(A)) upright(bold(V))_m = upright(bold(V))_m upright(bold(H))_m + h_(m + 1 , m) upright(bold(v))_(m + 1) upright(bold(e))_m^(upright(T)) . $<eq:54>

Here $upright(bold(e))_k in bb(R)^m$ is the $k^(t h)$ unit vector with its $k^(t h)$ component equal to one and others being zeros.

By the orthogonality of the vectors $upright(bold(v))_j$'s , we have

$ upright(bold(V))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m = upright(bold(H))_m $

which is actually the Schur decomposition.

If the upper Hessenberg matrix $upright(bold(H))_m$ is invertible, solving the system

$ upright(bold(V))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m upright(bold(d))_m = upright(bold(V))_m^(upright(T)) upright(bold(r))_0 $

we get

$ upright(bold(d))_m = (upright(bold(V))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m)^(- 1) upright(bold(V))_m^(upright(T)) upright(bold(r))_0 . $

Further, an approximate solution of the linear system is given by

$ upright(bold(x))_m = upright(bold(x))_0 + upright(bold(V))_m (upright(bold(V))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m)^(- 1) upright(bold(V))_m^(upright(T)) upright(bold(r))_0 . $

#rmk[
When the matrix $upright(bold(A))$ is symmetric, the upper Hessenberg matrix becomes a tri-diagonal matrix, the Gram-Schmidt process has a special form and the corresponding process is called the Lanczos process. In the case that the matrix $upright(bold(A))$ is symmetric positive definite, the Arnoldi method is essentially the conjugate gradient method.
]

One problem with the Arnoldi method is that, for a general system, the Hessenberg matrix $upright(bold(H))_m$ may not be invertible. Another problem is that it is hard to study the convergence of the Arnoldi method.