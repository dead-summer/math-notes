#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(5)
#set heading(numbering: "1.1.1")

// 上一节编号到 13
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

= The nonlinear least squares problem
<the-nonlinear-least-squares-problem>
Consider the nonlinear least squares problem

$ min g (upright(bold(x))) = 1 / 2 sum_(m = 1)^M [p_m (upright(bold(x)))]^2 . $

Here, $upright(bold(x)) = (x_1 , x_2 , dots.h.c , x_n)^(upright(T))$ .

We need to find a solution such that the gradient of $g (upright(bold(x)))$ is equal to zero,

$ 0 = nabla g (upright(bold(x))) = upright(bold(F)) (upright(bold(x))) = (f_1 (upright(bold(x))) , f_2 (upright(bold(x))) , dots.h.c , f_M (upright(bold(x))))^(upright(T)) $

with

$ f_i (upright(bold(x))) = sum_(m = 1)^M [p_m (upright(bold(x)))] frac(partial p_m (upright(bold(x))), partial x_i) . $

for $i = 1 , 2 , dots.h.c , n$ .

The Jacobian matrix $upright(bold(H)) = (h_(i , j))_(n times n)$ with

$ h_(i , j) = sum_(m = 1)^M {frac(partial p_m (upright(bold(x))), partial x_i) frac(partial p_m (upright(bold(x))), partial x_j) + [p_m (upright(bold(x)))] frac(partial^2 p_m (upright(bold(x))), partial x_i partial x_j)} , $<eq:14>

which is the Hessian matrix of the nonlinear function $g (upright(bold(x)))$ .

Apply the Newton method to the gradient equation

$ upright(bold(F)) (upright(bold(x))) = nabla g (upright(bold(x))) = 0 . $

Given $upright(bold(x))_k$ ,

$ upright(bold(x))_(k + 1) = upright(bold(x))_k - upright(bold(H)) (upright(bold(x))_k)^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

First, the second order derivatives on the right hand side of (@eq:14) are too annoying. Note that the terms with the second order derivatives become small since the differences, $p_m (upright(bold(x))_k)$ , are close to zero in the minimization process. It is justified to neglect them. In other words, we may replace the Hessian matrix $upright(bold(H))$ in the Newton iteration by the simpler matrix $upright(bold(S)) = (s_(i , j))_(n times n)$ with

$ s_(i , j) = sum_(m = 1)^M frac(partial p_m (upright(bold(x))), partial x_i) frac(partial p_m (upright(bold(x))), partial x_j) , $

which does not involve any second derivatives. However, this method still does not necessarily converge when $upright(bold(x))_k$ is not sufficiently close to a local minimizer of $g (upright(bold(x)))$ .

There are a variety of alternative methods that will lead to convergent solutions.

Newton’s method with damping:

$ upright(bold(x))_(k + 1) = upright(bold(x))_k - lambda_k upright(bold(S)) (upright(bold(x))_k)^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

Initialize $lambda_k = 1$ , set

$ upright(bold(z))_(k + 1) = upright(bold(x))_k - lambda_k upright(bold(S)) (upright(bold(x))_k)^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

If $g (upright(bold(z))_(k + 1)) > g (upright(bold(x))_k)$ , reduce the size of $lambda_k$ by a half and compute $upright(bold(z))_(k + 1)$ . Repeat the process until$g (upright(bold(z))_(k + 1)) < g (upright(bold(x))_k) .$

The *Levenberg-Marquardt* method reads

$ upright(bold(x))_(k + 1) = upright(bold(x))_k - [upright(bold(S)) (upright(bold(x))_k) + lambda_k upright(bold(D)) (upright(bold(x))_k)]^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

Here, $upright(bold(D)) (upright(bold(x))_k)$ is the diagonal part of matrix $upright(bold(S))$ . The parameter $lambda_k$ ranges from a small positive number to infinity. When $lambda_k gt.double 1$ , the method becomes a descent method.