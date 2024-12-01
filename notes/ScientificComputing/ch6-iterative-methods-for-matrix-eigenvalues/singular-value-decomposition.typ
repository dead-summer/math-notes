#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(10)
#set heading(numbering: "1.1.1")

// 上一节编号到 36
#counter(math.equation).update(36)

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

= Singular value decomposition
<singular-value-decomposition>
Let $upright(bold(A)) in bb(R)^(n times n)$ be an $n$ by $n$ real matrix.

There exists an orthogonal matrix $upright(bold(V)) in bb(R)^(n times n)$ such that

$ upright(bold(V))^(upright(T)) upright(bold(A))^(upright(T)) upright(bold(A)) upright(bold(V)) = upright(bold(D))^2 . $

Here,

$ upright(bold(D)) = "diag" (sigma_1 , sigma_2 , dots.h.c , sigma_n) $

with

$ sigma_1 gt.eq sigma_2 gt.eq dots.h.c gt.eq sigma_n . $

Let $upright(bold(W)) = upright(bold(A V))$ . Make QR decomposition for $upright(bold(W))$ :

$ upright(bold(U R)) = upright(bold(W)) . $

Assume that the diagonal entries of $upright(bold(R))$ are non-negative. Here, $upright(bold(U))$ is an orthogonal matrix and $upright(bold(R))$ is a right triangular matrix. We have

$ upright(bold(R))^(upright(T)) upright(bold(R)) = upright(bold(W))^(upright(T)) upright(bold(W)) = upright(bold(D))^2 . $

It is easy to see that $upright(bold(R))$ must be a diagonal matrix. Let

$ upright(bold(R)) = mat(delim: "(", upright(bold(R))_11, upright(bold(R))_12; #none, upright(bold(R))_22) $

and

$ upright(bold(D)) = mat(delim: "(", upright(bold(D))_11, 0; 0, 0) $

with $upright(bold(D))_11$ be invertible. We can show that $upright(bold(R))_12 = 0 , upright(bold(R))_22 = 0$ . Thus $upright(bold(R))_11$ is invertible and satisfies

$ upright(bold(R))_11^(upright(T)) = upright(bold(D))_11 upright(bold(R))_11^(- 1) . $

This indicates that $upright(bold(R))_11$ is both upper/right and lower/left triangular. So $upright(bold(R))_11$ is diagonal matrix.

Then we have

$ upright(bold(R)) = upright(bold(D)) . $

So we have the singular value decomposition

$
upright(bold(A V)) &= upright(bold(U D)) ,\
upright(bold(U))^(upright(T)) upright(bold(A V)) &= upright(bold(D)) ,
$

or

$ upright(bold(A)) = upright(bold(U D V))^(upright(T)) . $

Let $upright(bold(V)) = (upright(bold(v))_1 , upright(bold(v))_2 , dots.h.c , upright(bold(v))_n)$ and $upright(bold(U)) = (upright(bold(u))_1 , upright(bold(u))_2 , dots.h.c , upright(bold(u))_n)$ . We have

$ upright(bold(A)) = sum_(j = 1)^n sigma_j upright(bold(u))_j upright(bold(v))_j^(upright(T)) . $

If $sigma_1 gt.eq sigma_2 gt.eq dots.h.c gt.eq sigma_r > sigma_(r + 1) = dots.h.c = sigma_n = 0$ , we have

$ upright(bold(A)) = sum_(j = 1)^r sigma_j upright(bold(u))_j upright(bold(v))_j^(upright(T)) . $

The approach above to make the singular value decomposition (SVD) is too expensive. Another approach to make SVD is to work with the following symmetric matrix:

$ upright(bold(S)) = mat(, upright(bold(A))^(upright(T)); upright(bold(A)),) . $

The characteristic polynomial of $upright(bold(S))$ is given by

$ p (lambda) = mat(delim: "|", lambda upright(bold(I)), - upright(bold(A))^(upright(T)); - upright(bold(A)), lambda upright(bold(I))) = mat(delim: "|", lambda upright(bold(I)), - upright(bold(A))^(upright(T)); 0, lambda upright(bold(I)) - lambda^(- 1) upright(bold(A)) upright(bold(A))^(upright(T))) = lr(|lambda^2 upright(bold(I)) - upright(bold(A)) upright(bold(A))^(upright(T))|) . $

We see that the singular values of $upright(bold(A))$ and their negatives are the eigenvalues of the symmetric matrix $upright(bold(S))$ . To see what the eigenvectors of $upright(bold(S))$ looks like, we assume vector

$ vec(upright(bold(p))_i, upright(bold(q))_i) $

is an eigenvector associated with the singular value $sigma_i$ . We have

$ mat(delim: "(", #none, upright(bold(A))^(upright(T)); upright(bold(A)), ) vec(upright(bold(p))_i, upright(bold(q))_i) = sigma_i vec(upright(bold(p))_i, upright(bold(q))_i) . $

From this, we get

$
cases(
upright(bold(A))^(upright(T)) upright(bold(q))_i &= sigma_i upright(bold(p))_i \, \
upright(bold(A p))_i &= sigma_i upright(bold(q))_i .
)
$

It is easy to see that $upright(bold(p))_i$ should be an eigenvector of $upright(bold(A))^upright(T) upright(bold(A))$ associated with the singular value $sigma_i$ and $upright(bold(q))_i$ should be an eigenvector of $upright(bold(A)) upright(bold(A))^(upright(T))$ associated with the singular value $sigma_i$ . Thus, it is natural to choose (since $upright(bold(A))^(upright(T)) upright(bold(A)) = upright(bold(V)) upright(bold(D))^2upright(bold(V))^(upright(T)), upright(bold(A)) upright(bold(A))^(upright(T)) = upright(bold(U)) upright(bold(D))^2upright(bold(U))^(upright(T))$)

$
cases(
upright(bold(p))_i &= upright(bold(v))_i \, \
upright(bold(q))_i &= upright(bold(u))_i .
)
$

Similarly, for the eigenvectors associated with the negatives of the singular values, we have

$
mat(delim: "(", #none, upright(bold(A))^(upright(T)); upright(bold(A)), ) vec(upright(bold(p))_i, upright(bold(q))_i) = - sigma_i vec(upright(bold(p))_i, upright(bold(q))_i) ,
$
then
$
cases(
upright(bold(A))^(upright(T)) upright(bold(q))_i = - sigma_i upright(bold(p))_i \, ,
upright(bold(A)) upright(bold(p))_i = - sigma_i upright(bold(q))_i .
)
$
so take
$
cases(
upright(bold(p))_i = - upright(bold(v))_i \, ,
upright(bold(q))_i = upright(bold(u))_i .
)
$

We define the eigenvector matrix

$ upright(bold(X)) = sqrt(2) / 2 mat(delim: "(", upright(bold(V)), - upright(bold(V)); upright(bold(U)), upright(bold(U))) . $

Here, the factor $1 \/ sqrt(2)$ is introduced for the purpose of scaling/normalization.

We have

$ upright(bold(X))^(upright(T)) upright(bold(S)) upright(bold(X)) = mat(delim: "(", upright(bold(V))^(upright(T)), upright(bold(U))^(upright(T)); - upright(bold(V))^(upright(T)), upright(bold(U))^(upright(T))) vec(upright(bold(A))^(upright(T)), upright(bold(A))) mat(delim: "(", upright(bold(V)), - upright(bold(V)); upright(bold(U)), upright(bold(U))) = mat(delim: "(", upright(bold(D)), ; #none, - upright(bold(D))) . $

In practice, we do not directly work with the approach above for the singular value decomposition.

We first bidiagonalize matrix $upright(bold(A))$ before making the decomposition.

For matrix

$ upright(bold(A))_n = mat(delim: "(", a_(1 , 1), a_(1 , 2), a_(1 , 3), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), a_(2 , 3), dots.h.c, a_(2 , n); a_(3 , 1), a_(3 , 2), a_(3 , 3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n); a_(n , 1), a_(n , 2), dots.h.c, a_(n , n - 1), a_(n , n)) , $

let $upright(bold(H))_n$ be an $n$ by $n$ Householder matrix such that

$ upright(bold(H))_n upright(bold(A))_n = mat(delim: "(", b_(1 , 1), b_(1 , 2), b_(1 , 3), dots.h.c, b_(1 , n); 0, b_(2 , 2), b_(2 , 3), dots.h.c, b_(2 , n); 0, b_(3 , 2), b_(3 , 3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, b_(n - 1 , n); 0, b_(n , 2), dots.h.c, b_(n , n - 1), b_(n , n)) . $

Let $upright(bold(G))_(n - 1)$ be another $(n - 1)$ by $(n - 1)$ Householder matrix such that

$ upright(bold(H))_n upright(bold(A))_n mat(delim: "(", 1, , ; #none, upright(bold(G))_(n - 1), ) = mat(delim: "(", b_(1 , 1), c_(1 , 2), 0, dots.h.c, 0; 0, c_(2 , 2), c_(2 , 3), dots.h.c, c_(2 , n); 0, c_(3 , 2), c_(3 , 3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, c_(n - 1 , n); 0, c_(n , 2), dots.h.c, c_(n , n - 1), c_(n , n)) . $

Next repeat the process for the $(n - 1)$ by $(n - 1)$ submatrix

$ upright(bold(A))_(n - 1) = mat(delim: "(", c_(2 , 2), c_(2 , 3), dots.h.c, c_(2 , n); c_(3 , 2), c_(3 , 3), dots.down, dots.v; dots.v, dots.down, dots.down, c_(n - 1 , n); c_(n , 2), dots.h.c, c_(n , n - 1), c_(n , n)) . $

We will finally get a bidiagonal matrix

$ mat(delim: "(", b_(1 , 1), c_(1 , 2), , , ; #none, b_(1 , 1), c_(2 , 3), , ; #none, , dots.down, dots.down, ; #none, , , b_(n - 1 , n - 1), c_(n - 1 , n); #none, , , , b_(n , n)) . $
