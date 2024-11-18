#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(1)
#set heading(numbering: "1.1.1")

// 上一节编号到 0
#counter(math.equation).update(1)

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

= The steepest descent method
<the-steepest-descent-method>
In this section, we also assume matrix $upright(bold(A)) in bb(R)^(n times n)$ is symmetric positive definite. Starting from an initial guess $upright(bold(x))_0$ , the steepest descent method iteratively searches better approximations by finding local minimizers of the quadratic functional in one-dimensional subspaces.

Let $upright(bold(d))_1$ be the first search direction, which is to be described later. We look for the local minimizer of the quadratic functional $phi (upright(bold(x))_0 + alpha upright(bold(d))_1)$ along the line $upright(bold(x))_0 + alpha upright(bold(d))_1$ with $alpha in bb(R)$ . Assume that

$ phi (upright(bold(x))_0 + alpha_1 upright(bold(d))_1) = min_(alpha in bb(R)) phi (upright(bold(x))_0 + alpha upright(bold(d))_1) . $

Let

$ upright(bold(x))_1 = upright(bold(x))_0 + alpha_1 upright(bold(d))_1 $

and

$ upright(bold(r))_1 = upright(bold(b)) - upright(bold(A)) upright(bold(x))_1 $

Since the new approximation $upright(bold(x))_1$ is the local minimizer of the quadratic functional in the one-dimensional subspace, the residual $upright(bold(r))_1$ is orthogonal to the search direction, i.e.,

$ upright(bold(d))_1^(upright(T)) upright(bold(r))_1 = 0 . $<eq:2>

Let

$ J (alpha) = phi (upright(bold(x))_0 + alpha upright(bold(d))_1) , quad "for" alpha in bb(R) . $

It is a scalar function of $alpha$ and can also be regarded as a functional of the vector $upright(bold(d))_1$ . The identity (@eq:2) actually can be derived from

$ J^(') (alpha_1) = 0 . $

by applying the extreme value theorem to $J (alpha)$ . Note that

$ J (alpha) = phi (upright(bold(x))_0 + alpha upright(bold(d))_1) = 1 / 2 upright(bold(d))_1^(upright(T)) upright(bold(A)) upright(bold(d))_1 alpha^2 + upright(bold(d))_1^(upright(T)) (upright(bold(A)) upright(bold(x))_0 - upright(bold(b))) alpha + phi (upright(bold(x))_0) . $

We have

$ 0 &= J^(') (alpha_1) = upright(bold(d))_1^(upright(T)) upright(bold(A)) upright(bold(d))_1 alpha_1 + upright(bold(d))_1^(upright(T)) (upright(bold(A)) upright(bold(x))_0 - upright(bold(b))) \
&= - upright(bold(d))_1^T [upright(bold(b)) - upright(bold(A)) (upright(bold(x))_0 + alpha_1 upright(bold(d))_1)] = - upright(bold(d))_1^T upright(bold(r))_1 = upright(bold(d))_1^T nabla phi (upright(bold(x))_0 + alpha_1 upright(bold(d))_1) .
$

Let

$ upright(bold(r))_0 = upright(bold(b)) - upright(bold(A)) upright(bold(x))_0 $

be the initial residual. The new residual $upright(bold(r))_1$ can be computed by

$ upright(bold(r))_1 = upright(bold(b)) - upright(bold(A)) upright(bold(x))_1 = upright(bold(b)) - upright(bold(A)) (upright(bold(x))_0 + alpha_1 upright(bold(d))_1) = upright(bold(r))_0 - alpha_1 upright(bold(A)) upright(bold(d))_1 . $<eq:3>

From (@eq:2)-(@eq:3), we get

$ alpha_1 = frac(upright(bold(d))_1^(upright(T)) upright(bold(r))_0, upright(bold(d))_1^(upright(T)) upright(bold(A)) upright(bold(d))_1) . $

Now we describe how to choose the search direction $upright(bold(d))_1$ . We choose the search direction $upright(bold(d))_1$ to be the steepest descent direction of the quadratic functional, which is the negative gradient of the functional. That is, we set

$ upright(bold(d))_1 = - nabla phi (upright(bold(x))_0) = upright(bold(b)) - upright(bold(A)) upright(bold(x))_0 = upright(bold(r))_0 $

With this selection, the parameter $alpha_1$ is equal to

$ alpha_1 = frac(upright(bold(r))_0^(upright(T)) upright(bold(r))_0, upright(bold(r))_0^(upright(T)) upright(bold(A)) upright(bold(r))_0) . $

Continuing the process above by repeatedly choosing the next search direction to be the steepest descent direction at the present approximation, i.e., $upright(bold(d))_(k + 1) = upright(bold(r))_k$ yields the steepest descent method,

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + alpha_(k+1) upright(bold(r))_k , quad "for" k = 0 , 1 , 2 , dots.h.c $<eq:4>

with

$ alpha_(k+1) = frac(upright(bold(r))_k^(upright(T)) upright(bold(r))_k, upright(bold(r))_k^(upright(T)) upright(bold(A)) upright(bold(r))_k) = norm(upright(bold(r))_k)^2 / norm(upright(bold(r))_k)_(upright(bold(A)))^2 . $

Alternatively, we restate the steepest descent method as follows: for $k = 0 , 1 , 2 , dots.h.c$ , do

- Step 1. choose the search direction $upright(bold(d))_(k + 1)$ to be the residual, the steepest descent direction,

$ upright(bold(d))_(k + 1) = upright(bold(r))_k $

- Step 2. compute the optimal coefficient $alpha_(k + 1)$ ,

$ alpha_(k + 1) = frac(upright(bold(r))_k^T upright(bold(r))_k, upright(bold(r))_k^T upright(bold(A)) upright(bold(r))_k) . $

- Step 3. update the solution and compute the new residual $upright(bold(r))_(k + 1)$ by

$ upright(bold(x))_(k + 1) &= upright(bold(x))_k + alpha_(k + 1) upright(bold(d))_(k + 1) , \ 
upright(bold(r))_(k + 1) &= upright(bold(r))_k - alpha_(k + 1) upright(bold(A d))_(k + 1) . $

The iteration is continued until the norm of the residual $upright(bold(r))_(k + 1)$ relative to the initial one is less than a pre-specified tolerance.

In the next, we will study convergence of the steepest descent method. Note that

$ upright(bold(A)) upright(bold(e))_k = upright(bold(A)) (upright(bold(x)) - upright(bold(x))_k) = upright(bold(b)) - upright(bold(A)) upright(bold(x))_k = upright(bold(r))_k . $

The steepest descent iteration implies

$ norm(upright(bold(e))_(k + 1))_(upright(bold(A)))^2 &= norm(upright(bold(x)) - upright(bold(x))_(k + 1))_(upright(bold(A)))^2 = norm(upright(bold(x)) - (upright(bold(x))_k + alpha_(k+1) upright(bold(r))_k))_(upright(bold(A)))^2 = norm((upright(bold(I)) - alpha_(k+1) upright(bold(A))) upright(bold(e))_k)_(upright(bold(A)))^2 \
&= norm(upright(bold(e))_k)_(upright(bold(A)))^2 - 2 alpha_(k+1) norm(upright(bold(A e))_k)^2 + alpha_(k+1)^2 norm(upright(bold(A e))_k)_(upright(bold(A)))^2 \
&= norm(upright(bold(e))_k)_(upright(bold(A)))^2 - 2 alpha_(k+1) norm(upright(bold(r))_k)^2 + alpha_(k+1)^2 norm(upright(bold(r))_k)_(upright(bold(A)))^2 = norm(upright(bold(e))_k)_(upright(bold(A)))^2 - alpha_(k+1) norm(upright(bold(r))_k)^2 \
&= (1 - frac(norm(upright(bold(r))_k)^4, norm(upright(bold(r))_k)_(upright(bold(A)))^2 norm(upright(bold(r))_k)_(upright(bold(A))^(- 1))^2)) norm(upright(bold(e))_k)_(upright(bold(A)))^2 .
$<eq:5>

Here, we used the fact $norm(upright(bold(e))_k)_(upright(bold(A))) = norm(upright(bold(r))_k)_(upright(bold(A))^(- 1))$ .

Let $lambda_min$ and $lambda_max$ be respectively the minimum and maximum eigenvalues of $upright(bold(A))$ . By the Kan-torovich inequality, we know that

$ 4 (upright(bold(r))_k^(upright(T)) upright(bold(A)) upright(bold(r))_k) (upright(bold(r))_k^(upright(T)) upright(bold(A))^(- 1) upright(bold(r))_k) &lt.eq [1 / sqrt(lambda_max lambda_min) (upright(bold(r))_k^(upright(T)) upright(bold(A)) upright(bold(r))_k) + sqrt(lambda_max lambda_min) (upright(bold(r))_k^(upright(T)) upright(bold(A))^(- 1) upright(bold(r))_k)]^2 \
&= [upright(bold(r))_k^(upright(T)) (1 / sqrt(lambda_max lambda_min) upright(bold(A)) + sqrt(lambda_max lambda_min) upright(bold(A))^(- 1)) upright(bold(r))_k]^2 \
&lt.eq (sqrt(lambda_min / lambda_max) + sqrt(lambda_max / lambda_min))^2 (upright(bold(r))_k^(upright(T)) upright(bold(r))_k)^2 = frac((lambda_min + lambda_max)^2, lambda_max lambda_min) (upright(bold(r))_k^(upright(T)) upright(bold(r))_k)^2
$<eq:6>

for any vector $upright(bold(r))_k in bb(R)^n$ . Here we used the inequality

$ upright(bold(r))_k^(upright(T)) (1 / sqrt(lambda_max lambda_min) upright(bold(A)) + sqrt(lambda_max lambda_min) upright(bold(A))^(- 1)) upright(bold(r))_k lt.eq (sqrt(lambda_min / lambda_max) + sqrt(lambda_max / lambda_min)) (upright(bold(r))_k^(upright(T)) upright(bold(r))_k) $

since the matrix

$ upright(bold(B)) = 1 / sqrt(lambda_max lambda_min) upright(bold(A)) + sqrt(lambda_max lambda_min) upright(bold(A))^(- 1) $

has the same eigenvectors as $upright(bold(A)) , upright(bold(A))^(- 1)$ and its eigenvalues are (not less than 2 and) not greater than

$ sqrt(lambda_min / lambda_max) + sqrt(lambda_max / lambda_min) . $

Thus, from (@eq:5) and (@eq:6), we get

$ norm(upright(bold(e))_(k + 1))_(upright(bold(A))) lt.eq frac(lambda_max - lambda_min, lambda_max + lambda_min) norm(upright(bold(e))_k)_(upright(bold(A))) . $<eq:7>

Let $0 < lambda_1 lt.eq lambda_2 lt.eq dots.h.c lt.eq lambda_n$ be the eigenvalues of the symmetric positive definite matrix $upright(bold(A))$ . We have the following estimate

$ norm(upright(bold(x)) - upright(bold(x))_m)_(upright(bold(A))) lt.eq (inf_(alpha in bb(R)) max_(lambda_1 lt.eq lambda lt.eq lambda_n) lr(|1 - alpha lambda|))^m norm(upright(bold(x)) - upright(bold(x))_0)_(upright(bold(A))) = (frac(lambda_(upright(n)) - lambda_1, lambda_(upright(n)) + lambda_1))^m norm(upright(bold(x)) - upright(bold(x))_0)_(upright(bold(A))) . $<eq:8>

Here, $norm(upright(bold(z)))_(upright(bold(A))) = (upright(bold(z))^(upright(T)) upright(bold(A z)))^(1 \/ 2)$ .

In fact, the inequality (@eq:7) can be proved in an alternative approach, using the inequality

$ norm(upright(bold(e))_(k + 1))_(upright(bold(A))) = inf_(alpha in bb(R)) norm((upright(bold(I)) - alpha upright(bold(A))) upright(bold(e))_k)_(upright(bold(A))) lt.eq (inf_(alpha in bb(R)) max_(lambda_1 lt.eq lambda lt.eq lambda_n) lr(|1 - alpha lambda|)) norm(upright(bold(e))_k)_(upright(bold(A))) $

since the parameter $alpha_k$ is the minimizer the quadratic form

$ J (alpha) = norm((upright(bold(I)) - alpha upright(bold(A))) upright(bold(e))_k)_(upright(bold(A)))^2 . $

by the construction of the steepest descent method.

#exr[
Show that

$ norm((upright(bold(I)) - alpha upright(bold(A))) upright(bold(e))_k)_(upright(bold(A))) lt.eq max_(lambda_1 lt.eq lambda lt.eq lambda_n) lr(|1 - alpha lambda|) norm(upright(bold(e))_k)_(upright(bold(A))) . $
]

#prf[
Assume the symmetric and positive defintie matrix $upright(bold(A))$ has $n$ positive eigenvalues

$ 0 < lambda_1 lt.eq lambda_2 lt.eq dots.h.c lt.eq lambda_n $

and $n$ associated eigenvectors

$ upright(bold(v))_1 , upright(bold(v))_2 , dots.h.c , upright(bold(v))_n in bb(R)^n , $

which satisfy $upright(bold(A)) upright(bold(v))_i = lambda_i upright(bold(v))_i$ and form an orthonormal basis of $upright(bold(R))^n$ . Assume the error $upright(bold(e))_k$ has the linear expansion

$ upright(bold(e))_k = sum_(i = 1)^n c_i upright(bold(v))_i $

Then we have

$ (upright(bold(I)) - alpha upright(bold(A))) upright(bold(e))_k = sum_(i = 1)^n (1 - alpha lambda_i) c_i upright(bold(v))_i $

and

$ upright(bold(e))_k^(upright(T)) (upright(bold(I)) - alpha upright(bold(A))) upright(bold(A)) (upright(bold(I)) - alpha upright(bold(A))) upright(bold(e))_k = sum_(i = 1)^n (1 - alpha lambda_i)^2 lambda_i c_i^2 lt.eq [max_(1 lt.eq j lt.eq n) (1 - alpha lambda_j)^2] sum_(i = 1)^n lambda_i c_i^2 $

$ = [max_(1 lt.eq j lt.eq n) (1 - alpha lambda_j)^2] upright(bold(e))_k^(upright(T)) upright(bold(A)) upright(bold(e))_k lt.eq upright(bold(e))_k^(upright(T)) upright(bold(A)) upright(bold(e))_k max_(lambda_min lt.eq lambda lt.eq lambda_max) (1 - alpha lambda)^2 . $
]


#figure(
  image("../img/iteration-trajectory-by-the-steepest-descent-method.svg"),
  caption: [Iteration trajectory by the steepest descent method]
)<fig:1>


#exr[
Show that

$ inf_(alpha in bb(R)) max_(lambda_1 lt.eq lambda lt.eq lambda_n) lr(|1 - alpha lambda|) = frac(lambda_n - lambda_1, lambda_n + lambda_1) . $
]

In the next, we will estimate the minimum number of steepest descent iterations needed for the relative error $norm(upright(bold(x)) - upright(bold(x))_m)_(upright(bold(A))) \/ norm(upright(bold(x)) - upright(bold(x))_0)_(upright(bold(A)))$ to be less than some pre-specified tolerance $epsilon.alt$ . Here, we may assume the initial guess $upright(bold(x))_0$ simply takes the zero vector. By the convergence estimate (@eq:8), the minimum number of iterations should satisfy

$ (frac(lambda_(upright(n)) - lambda_1, lambda_(upright(n)) + lambda_1))^m = (frac(kappa (upright(bold(A))) - 1, kappa (upright(bold(A))) + 1))^m < epsilon.alt , $

where $kappa (upright(bold(A))) = lambda_(upright(n)) \/ lambda_1$ is the 2-norm condition number of the matrix $upright(bold(A))$ . That is, we get

$ m > frac(- log (epsilon.alt), - log { 1 - 2 \/ [kappa (upright(bold(A))) + 1] }) . $

The convergence rate of the steepest descent method reads

$ R_(upright(S D)) = - log [1 - frac(2, kappa (upright(bold(A))) + 1)] approx frac(2, kappa (upright(bold(A))) + 1) approx frac(2, kappa (upright(bold(A)))) $

when the matrix has a large condition number. In summary, in order for the relative error to be

less than some pre-specified tolerance, the number of iterations needed is approximately given by

$ m_min approx frac(- log epsilon.alt, 2) kappa (upright(bold(A))) , $

which is linearly proportional to the 2-norm condition number of the matrix.

The steepest descent method does converge for symmetric and positive definite matrices. However, the convergence is in general very slow and quite unsatisfying. As a matter of fact, the steepest descent direction is not the best direction. Figure 1 shows an iteration trajectory (red line segments) by the steepest descent method for finding the minimizer of the following quadratic functional

$ J (x , y) = x^2 + 25 y^2 $

which amounts to the solution of the two by two linear system

$ mat(delim: "[", 2, 0; 0, 50) mat(delim: "[", x; y) = mat(delim: "[", 0; 0) . $

When the initial guess $(x_0 , y_0)$ for the iteration is not on the coordinate axis, it takes too many unnecessary iterations to get an accurate solution close to the exact one, which is the origin.

The slow convergence of the steepest descent iteration is because it wastes too much effort in searching the minimizer alternatively along some directions which are almost the same. In the two dimensional example shown in @fig:1, any pair of every other search or descent directions are actually the same. A good method should never come back to search the minimizer along any direction which was computed before.