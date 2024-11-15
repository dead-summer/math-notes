#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(9)
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

= Stability of Eigenvalue Computation
<stability-of-eigenvalue-computation>

#thm[
Let $upright(bold(A))$ be a diagonalizable $n times n$ matrix with eigenvalues $lambda_1 , lambda_2 , dots.h.c , lambda_n , delta upright(bold(A))$ be a perturbation matrix and $mu$ be an eigenvalue of $upright(bold(A)) + delta upright(bold(A))$ . Then we have

$ min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(upright(bold(T)))_p norm(upright(bold(T))^(- 1))_p norm(delta upright(bold(A)))_p , $

where $upright(bold(T))$ is a nonsingular matrix such that $upright(bold(T))^(- 1) upright(bold(A)) upright(bold(T))$ is diagonal. Here, the norm $norm(dot.op)_p$ can be the 1-norm, 2-norm or $oo$ -norm.
]

#prf[
Let $upright(bold(Lambda)) = "diag" (lambda_1 , lambda_2 , dots.h.c , lambda_n)$ be the diagonal matrix. Assume $upright(bold(T))$ is a nonsingular matrix such that

$ upright(bold(T))^(- 1) upright(bold(A)) upright(bold(T)) = upright(bold(Lambda)) . $

We have

$ (upright(bold(A)) + delta upright(bold(A))) upright(bold(x)) = mu upright(bold(x)) $

and

$ (upright(bold(T)) upright(bold(Lambda)) upright(bold(T))^(- 1) + delta upright(bold(A))) upright(bold(x)) = mu upright(bold(x)) . $

Furthermore, we get

$ (upright(bold(Lambda)) + upright(bold(T))^(- 1) delta upright(bold(A)) upright(bold(T))) upright(bold(T))^(- 1) upright(bold(x)) = mu upright(bold(T))^(- 1) upright(bold(x)) . $

Let $upright(bold(z)) = upright(bold(T))^(- 1) upright(bold(x))$ . The identity above is rewritten as

$ (mu upright(bold(I)) - upright(bold(Lambda))) upright(bold(z)) = upright(bold(T))^(- 1) delta upright(bold(A)) upright(bold(T)) upright(bold(z)) . $

This implies

$ norm((mu upright(bold(I)) - upright(bold(Lambda))) upright(bold(z))) lt.eq norm(upright(bold(T))^(- 1)) norm(upright(bold(T))) norm(delta upright(bold(A))) norm(delta upright(bold(A))) norm(upright(bold(z))) . $

In the 2-norm, we have

$ norm(upright(bold(z)))_2 min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq [sum_(i = 1)^n (mu - lambda_i)^2 z_i^2]^(1 \/ 2) lt.eq norm((mu upright(bold(I)) - upright(bold(Lambda))) upright(bold(z)))_2 . $

This yields

$ norm(upright(bold(z)))_2 min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(upright(bold(T))^(- 1))_2 norm(upright(bold(T)))_2 norm(parallel delta upright(bold(A)))_2 norm(upright(bold(z)))_2 . $

Since $norm(upright(bold(z)))_2 eq.not 0$ , we obtain

$ min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(upright(bold(T))^(- 1))_2 norm(upright(bold(T)))_2 norm(parallel delta upright(bold(A)))_2 . $

In the 1-norm, we have

$ norm(upright(bold(z)))_1 min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm((mu upright(bold(I)) - upright(bold(Lambda))) upright(bold(z)))_1 . $

This yields

$ norm(upright(bold(z)))_1 min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(upright(bold(T))^(- 1))_1 norm(upright(bold(T)))_1 norm(parallel delta upright(bold(A)))_1 norm(upright(bold(z)))_1 . $

Since $norm(upright(bold(z)))_1 eq.not 0$ , we obtain

$ min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(upright(bold(T))^(- 1))_1 norm(upright(bold(T)))_1 norm(parallel delta upright(bold(A)))_1 . $

In the $oo$ -norm, let $k$ be the index such that

$ abs(z_k) = norm(upright(bold(z)))_oo . $

We have

$ norm(upright(bold(z)))_oo min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq abs(mu - lambda_k) norm(upright(bold(z)))_oo = abs(mu - lambda_k) abs(z_k) lt.eq norm((mu upright(bold(I)) - upright(bold(Lambda))) upright(bold(z)))_oo . $

This yields

$ norm(upright(bold(z)))_oo min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(upright(bold(T))^(- 1))_oo norm(upright(bold(T)))_oo norm(parallel delta upright(bold(A)))_oo norm(upright(bold(z)))_oo . $

Since $norm(upright(bold(z)))_oo eq.not 0$ , we obtain

$ min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(upright(bold(T))^(- 1))_oo norm(upright(bold(T)))_oo norm(parallel delta upright(bold(A)))_oo . $
]

#cor[
If $upright(bold(A))$ is a symmetric matrix, we have

$ min_(1 lt.eq i lt.eq n) abs(mu - lambda_i) lt.eq norm(delta upright(bold(A)))_2 . $
]

== Sensitivity analysis
<sensitivity-analysis>
Suppose that $lambda$ is an eigenvalue of the square matrix $upright(bold(A))$ with the vector $upright(bold(x))$ be an associated eigenvector:

$ upright(bold(A x)) = lambda upright(bold(x)) . $

Assume that the matrix $upright(bold(A))$ , the eigenvector $upright(bold(x))$ and the eigenvalue $lambda$ all smoothly depends on a parameter $t$ :

$ upright(bold(A)) (t) upright(bold(x)) (t) = lambda (t) upright(bold(x)) (t) . $

Differentiating the equality above with respect to $t$ gives us

$ dot(upright(bold(A))) upright(bold(x)) + upright(bold(A)) dot(upright(bold(x))) = dot(lambda) upright(bold(x)) + lambda dot(upright(bold(x))) . $

Let $upright(bold(y))$ be a left eigenvector of $upright(bold(A))$ associated with the eigenvalue $lambda$ :

$ upright(bold(y))^(upright(H)) upright(bold(A)) = lambda upright(bold(y))^(upright(H)) . $

Here $upright(bold(y))^(upright(H))$ means the conjugate transpose of the possibly complex vector $upright(bold(y))$ . Then

$
& upright(bold(y))^(upright(H)) dot(upright(bold(A))) upright(bold(x)) + upright(bold(y))^(upright(H)) upright(bold(A)) dot(upright(bold(x))) = dot(lambda) upright(bold(y))^(upright(H)) upright(bold(x)) + lambda upright(bold(y))^(upright(H)) dot(upright(bold(x))) \
=>& upright(bold(y))^(upright(H)) dot(upright(bold(A))) upright(bold(x)) = dot(lambda) upright(bold(y))^(upright(H)) upright(bold(x)) \
=>& abs(dot(lambda)) abs(upright(bold(y))^(upright(H)) upright(bold(x))) lt.eq norm(upright(bold(y))) norm(upright(bold(x))) norm(dot(upright(bold(A)))) \
=>& abs(dot(lambda)) lt.eq frac(norm(upright(bold(y))) norm(upright(bold(x))), abs(upright(bold(y))^(upright(H)) upright(bold(x)))) norm(dot(upright(bold(A)))) .
$

We call

$ kappa (upright(bold(A)) , lambda) lt.eq frac(norm(upright(bold(y))) norm(upright(bold(x))), abs(upright(bold(y))^(upright(H)) upright(bold(x)))) $

as the _eigenvalue condition number_. Since

$ upright(bold(A X)) = upright(bold(X)) upright(bold(Lambda)) $

$ upright(bold(X))^(- 1) upright(bold(A)) = upright(bold(Lambda)) upright(bold(X))^(- 1) $

if $upright(bold(A))$ is symmetric or Hermitian matrice, then the eigenvalue condition number is equal to one. So the eigenvalue is not sensitive to perturbation in the matrix $upright(bold(A))$ .

Assume that we have already computed the the matrix $upright(bold(X))$ whose columns are the right eigenvectors.

Then the row vectors of $upright(bold(X))^(- 1)$ are the left eigenvectors. Let

$ upright(bold(Y)) = upright(bold(X))^(- upright(H)) . $

We have

$ upright(bold(Y))^(upright(H)) upright(bold(A)) = upright(bold(Lambda)) upright(bold(Y))^(upright(H)) $

In this case, the eigenvalue condition number is simply

$ kappa (lambda , upright(bold(A))) = norm(upright(bold(y))) norm(upright(bold(x))) . $

Since $upright(bold(x)) norm(lt.eq) upright(bold(X)) parallel$ and $norm(upright(bold(y))) lt.eq norm(upright(bold(X))^(- 1))$ , we have

$ kappa (lambda , upright(bold(A))) lt.eq kappa (upright(bold(X))) , $

i.e., the individual eigenvalue condition number is bounded by the condition number of the eigenvector matrix.

Let

$ upright(bold(A)) = mat(delim: "(", - a_1, 1, , , ; - a_2, 0, 1, , ; dots.v, , dots.down, dots.down, ; dots.v, , , 0, 1; - a_n, 0, dots.h.c, dots.h.c, 0) . $

and

$ p_n (x) = abs(x upright(bold(I)) - upright(bold(A))) = x^n + a_1 x^(n - 1) + dots.h.c + a_n . $
In particular, when
$ upright(bold(A)) = mat(delim: "(", 0, 1, , , ; #none, 0, 1, , ; #none, , dots.down, dots.down, ; #none, , , 0, 1; epsilon.alt, , , , 0) $
then
$ p_n (x) = x^n - epsilon.alt . $

So even if $epsilon.alt$ may be very small, the modulus of the roots still could be close to one: $abs(x) = epsilon.alt^(1 \/ n) arrow.r 1$ as $n arrow.r oo$ .