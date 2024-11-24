#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(1)
#set heading(numbering: "1.1.1")

// 上一节编号到 1
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

= The fixed point method
<the-fixed-point-method>
Similar to the case for scalar nonlinear equations, we may also regard the nonlinear system as the steady state of an evolution system as follows

$ frac(d upright(bold(x)) (t), d t) = - [upright(bold(P)) (upright(bold(x)))]^(- 1) upright(bold(F)) (upright(bold(x)) (t)) quad "for" t > 0 . $

Also, let $Delta t > 0$ be the timestep and $t^k = k Delta t (k = 0 , 1 , dots.h.c)$ be the discrete times. Let $upright(bold(x))_k$ be an approximation of $upright(bold(x)) (t^k)$ . Provided an initial condition for the time-dependent equation

$ upright(bold(x)) (0) = upright(bold(x))_0 $

we discretize the equation with an explicit method such as the forward Euler method:

$ frac(upright(bold(x))_(k + 1) - upright(bold(x))_k, Delta t) = - [upright(bold(P)) (upright(bold(x))_k)]^(- 1) upright(bold(F)) (upright(bold(x))_k) , $

i.e.,

$ upright(bold(x))_(k + 1) = upright(bold(x))_k - Delta t [upright(bold(P)) (upright(bold(x))_k)]^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

The iteration locally converges to a solution $upright(bold(x)) = upright(bold(x))^(\*)$ of the nonlinear system (1) if there is a neighborhood of $upright(bold(x))^(\*)$ such that, for any $upright(bold(x))$ and $upright(bold(y))$ in the neighborhood, the spectral radius of $\( upright(bold(I)) -$ $Delta t [upright(bold(P)) (upright(bold(x)))]^(- 1) nabla upright(bold(F)) (upright(bold(y)))\)$ is less than one, i.e.,

$ rho (upright(bold(I)) - Delta t [upright(bold(P)) (upright(bold(x)))]^(- 1) nabla upright(bold(F)) (upright(bold(y)))) < 1 . $

Let

$ phi (upright(bold(x))) = upright(bold(I)) - Delta t [upright(bold(P)) (upright(bold(x)))]^(- 1) upright(bold(F)) (upright(bold(x))) . $

The iteration reads

$ upright(bold(x))_(k + 1) = phi (upright(bold(x))_k) quad "for" k = 0 , 1 , 2 , dots.h.c . $

This is a fixed-point iteration, too.

If we choose the preconditioner $upright(bold(P)) (upright(bold(x)))$ to be the diagonal part of the Jacobian matrix $upright(bold(F)) (upright(bold(x)))$ , the method is the synchronized nonlinear Jacobi method.

If we choose the preconditioner $upright(bold(P)) (upright(bold(x)))$ to be the the lower triangular part of the Jacobian matrix $nabla upright(bold(F)) (upright(bold(x)))$ , the method is the synchronized nonlinear Gauss-Seidel method.