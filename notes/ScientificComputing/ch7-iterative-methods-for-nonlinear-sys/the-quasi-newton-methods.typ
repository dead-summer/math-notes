#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(3)
#set heading(numbering: "1.1.1")

// 上一节编号到 2
#counter(math.equation).update(2)

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

= The quasi-Newton methods
<the-quasi-newton-methods>
The Newton method could be very expensive in both evaluation and inversion of the Jacobian matrix as in each iteration there are $n^2$ first-order derivatives to compute for the Jacobian matrix and the solution of the $n$ by $n$ Jacobian system may involve computational work on the order of $O (n^3)$ .

So, we often work with a modified Newton method, also called a quasi-Newton or inexact Newton method, by replacing the Jacobian matrix with another matrix, which approximates the Jacobian matrix but is much easier to invert. A modified Newton method even can avoid evaluation of any partial derivatives.

== The quasi-Newton methods of the first kind
<the-quasi-newton-methods-of-the-first-kind>
=== The synchronized nonlinear Jacobi/Gauss-Seidel method
<the-synchronized-nonlinear-jacobigauss-seidel-method>
We know that as long as we do not exactly solve the linearized system (2), the resulting Newton method is a quasi-Newton method.

We can choose the approximate matrix $upright(bold(A))_k$ to be the diagonal part of the Jacobian matrix $nabla upright(bold(F)) (upright(bold(x)))$ (if the Jacobian matrix is strictly diagonally dominant or irreducibly diagonally dominant, for example), which results in the synchronized nonlinear Jacobi method.

We can also choose the approximate matrix $upright(bold(A))_k$ to be the lower-triangular or the upper-triangular part of the Jacobian matrix $nabla upright(bold(F)) (upright(bold(x)))$ (if the Jacobian matrix is symmetric and positive definite, for example), which results in the synchronized nonlinear Gauss method.

These methods fall into the category of the quasi-Newton methods too even though we expect they may converge not as fast as the Broyden quasi-Newton method.

=== The nonlinear variational method of the first kind
<the-nonlinear-variational-method-of-the-first-kind>
We can accept as the Newton step the approximate solution of the linearized system after one Krylov subspace iteration, which may be the steepest descent iteration, the conjugate gradient iteration, the BICGSTAB iteration or the GMRES iteration.

If the Jacobian matrix $nabla upright(bold(F)) (upright(bold(x)))$ is a symmetric and positive definite matrix, we have the corresponding steepest descent method and the conjugate gradient method.

=== The nonlinear variational method of the second kind
<the-nonlinear-variational-method-of-the-second-kind>
In the case that the Jacobian matrix is symmetric and positive definite, we can compute the Newton step $upright(bold(delta))_k$ by minimizing the nonlinear functional

$ J (upright(bold(delta))) = 1 / 2 upright(bold(delta))^(upright(T)) frac(upright(bold(F)) (upright(bold(x))_k + epsilon.alt upright(bold(delta))) - upright(bold(F)) (upright(bold(x))_k), epsilon.alt) - upright(bold(delta))^(upright(T)) upright(bold(F)) (upright(bold(x))_k) , $

which approximates the quadratic one

$ tilde(J) (upright(bold(delta))) = 1 / 2 upright(bold(delta))^(upright(T)) nabla upright(bold(F)) (upright(bold(x))_k) upright(bold(delta)) - upright(bold(delta))^(upright(T)) upright(bold(F)) (upright(bold(x))_k) . $

The resulting method could be a nonlinear steepest descent method or a nonlinear conjugate gradient method.

In the case that the Jacobian matrix is non-symmetric or indefinite, we can compute the Newton step $upright(bold(delta))_k$ by minimizing the square of the residual

$ r (upright(bold(delta))) = norm(frac(upright(bold(F)) (upright(bold(x))_k + epsilon.alt upright(bold(delta))) - upright(bold(F)) (upright(bold(x))_k), epsilon.alt) - upright(bold(F)) (upright(bold(x))_k))_2^2 $

instead of

$ tilde(r) (upright(bold(delta))) = norm(nabla upright(bold(F)) (upright(bold(x))_k) upright(bold(delta)) - upright(bold(F)) (upright(bold(x))_k))_2^2 . $

The resulting method could be a nonlinear BICGSTAB method or a nonlinear GMRES method (Probably the nonlinear BICGSTAB method will be more preferable than the GMRES method since the former does not require storing the past approximations).

== The quasi-Newton method of the second kind
<the-quasi-newton-method-of-the-second-kind>
=== The Jacobian-free quasi-Newton method
<the-jacobian-free-quasi-newton-method>
Note that when we solve the linearized system (2) in the Newton iteration with a Krylov subspace method such as the conjugate gradient method (if the Jacobian matrix is symmetric and positive definite) or the GMRES method, there is not need to explicitly know the entries of the matrix and it suffices to know the matrix vector product. So, if we can approximate the matrix vector product in another way, the resulting method will be Jacobian-free.

Actually, to avoid computation of the Jacobian matrix, we can approximate the matrix vector products with finite differences in the Krylov subspace method since, provided that $upright(bold(F)) (upright(bold(x)))$ is sufficiently smooth, we have

$ nabla upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k approx frac(upright(bold(F)) (upright(bold(x))_k + epsilon.alt upright(bold(delta))_k) - upright(bold(F)) (upright(bold(x))_k), epsilon.alt) $

or

$ nabla upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k approx frac(upright(bold(F)) (upright(bold(x))_k + epsilon.alt upright(bold(delta))_k) - upright(bold(F)) (upright(bold(x))_k - epsilon.alt upright(bold(delta))_k), 2 epsilon.alt) $

for small parameter $epsilon.alt in (0 , 1)$ . The resulting method is called the Jacobian-free (matrix-free) quasi-Newton method.

== The quasi-Newton method of the third kind
<the-quasi-newton-method-of-the-third-kind>
We know the Newton method may not work or diverge (for example, when the Jacobian matrix is not invertible) and only converges locally. To get a globally convergent method, we need modify

either the Newton step or its size.

Let

$ g (upright(bold(x))) = 1 / 2 norm(upright(bold(F)) (upright(bold(x))))_2^2 . $

The gradient of $g (upright(bold(x)))$ is given by

$ nabla g (upright(bold(x))) = [nabla upright(bold(F)) (upright(bold(x)))]^(upright(T)) upright(bold(F)) (upright(bold(x))) . $

The Newton step

$ upright(bold(delta)) = - [nabla upright(bold(F)) (upright(bold(x)))]^(- 1) upright(bold(F)) (upright(bold(x))) $

is a descent direction of $g (upright(bold(x)))$ since

$ [nabla g (upright(bold(x)))]^(upright(T)) upright(bold(delta)) = - upright(bold(F)) (upright(bold(x)))^(upright(T)) [nabla upright(bold(F)) (upright(bold(x)))] [nabla upright(bold(F)) (upright(bold(x)))]^(- 1) upright(bold(F)) (upright(bold(x))) = - norm(upright(bold(F)) (upright(bold(x))))_2^2 . $

For sufficiently small $lambda > 0$ , we have

$ norm(upright(bold(F)) (upright(bold(x))_k + lambda upright(bold(delta))_k))_2 lt.eq norm(upright(bold(F)) (upright(bold(x))_k))_2 . $

The Newton or quasi-Newton method with damping

$ upright(bold(x))_(k + 1) = upright(bold(x))_k - lambda_k upright(bold(A))_k^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

Initialize $lambda_k = 1$ , set

$ upright(bold(z))_(k + 1) = upright(bold(x))_k - lambda_k upright(bold(A))_k^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

If $norm(upright(bold(F)) (upright(bold(z))_(k + 1))) > norm(upright(bold(F)) (upright(bold(x))_k))$ , reduce the size of $lambda_k$ by a half and compute $upright(bold(z))_(k + 1)$ until $upright(bold(F)) (upright(bold(z))_(k + 1)) parallel < norm(upright(bold(F)) (upright(bold(x))_k))$ .

#rmk[
The Newton method with damping above may fail to converge when the iterates $upright(bold(x))_k$'s fall into a valley while the minimum/bottom of the valley is away from the $upright(bold(x))$ -hyperplane, i.e., $norm(upright(bold(F)) (upright(bold(x)))) > 0$ for all $upright(bold(x))$ in the valley.
]

Similar to the scalar case, we should not use the Newton method to update the iterate when the Jacobian matrix or the approximate Jacobian matrix is too small or too large in some matrix norm.

Let

$ upright(bold(delta))_(k + 1) = - upright(bold(A))_k^(- 1) upright(bold(F)) (upright(bold(x))_k) $

be the Newton or quasi-Newton step. We dynamically set a few parameters $rho_max > rho_("thr") > rho_min > 0$ . When $norm(upright(bold(delta))_(k + 1))$ is greater than $rho_max$ , we work with other method. When $norm(upright(bold(delta))_(k + 1))$ is less than $rho_max$ but greater than $rho_(t h r)$ , we stick to the Newton or the quasi-Newton method only if $norm(upright(bold(F)) (upright(bold(x))_k + upright(bold(delta))_(k + 1))) <$ $alpha norm(upright(bold(F)) (upright(bold(x))_k))$ and otherwise work with other method. When $norm(upright(bold(delta))_(k + 1))$ is less than $rho_min$ , we stick to the Newton or quasi-Newton method only if $norm(upright(bold(F)) (upright(bold(x))_k + upright(bold(delta))_(k + 1))) < alpha norm(upright(bold(F)) (upright(bold(x))_k))$ and otherwise work with other method.

#rmk[
The quasi-Newton method with line search is a typical technique for optimization problems.
]
