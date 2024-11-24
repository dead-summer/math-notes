#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(2)
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

= The exact Newton method
<the-exact-newton-method>
Let $Delta t = 1$ and the preconditioner to be Jacobian matrix of $upright(bold(F)) (upright(bold(x)))$ in the fixed-point iteration. We get the Newton method. It reads: for $k = 0 , 1 , 2 , dots.h.c$ , update the solution by

$ upright(bold(x))_(k + 1) = upright(bold(x))_k - [nabla upright(bold(F)) (upright(bold(x))_k)]^(- 1) upright(bold(F)) (upright(bold(x))_k) . $

Let

$ upright(bold(delta))_k = - [nabla upright(bold(F)) (upright(bold(x))_k)]^(- 1) upright(bold(F)) (upright(bold(x))_k) $

be the Newton step at the $k^(t h)$ Newton iteration, which is a solution to the linearized system

$ nabla upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k = - upright(bold(F)) (upright(bold(x))_k) . $<eq:2>

The Newton iteration can be regarded as a two-step process: first solve the linearized system (@eq:2) and then update iterate by

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + upright(bold(delta))_k . $

#exm[
The eigenvalue problem $upright(bold(A x)) = lambda upright(bold(x))$ for an $n times n$ matrix $upright(bold(A))$ is equivalent to the solution of the nonlinear system $upright(bold(F)) (upright(bold(z))) = 0$ , where $upright(bold(F)) : bb(R)^n times bb(R) arrow.r bb(R)^n times bb(R)$ is defined by

$ upright(bold(F)) : vec(upright(bold(x)), lambda) arrow.r.bar vec(upright(bold(A)) upright(bold(x)) - lambda upright(bold(x)), lambda - upright(bold(x))^T upright(bold(A)) upright(bold(x))) $

or

$ upright(bold(F)) : vec(upright(bold(x)), lambda) arrow.r.bar vec(upright(bold(A)) upright(bold(x)) - lambda upright(bold(x)), upright(bold(x))^T upright(bold(x)) - 1) . $

Write down the Newton method for this nonlinear system.

The Jacobian matrix

$ nabla upright(bold(F)) (upright(bold(x))) = mat(delim: "(", upright(bold(A)) - lambda upright(bold(I)), - upright(bold(x)); 2 upright(bold(x))^T, 0) . $

The Newton iteration reads

$ vec(upright(bold(x))_(k + 1), lambda_(k + 1)) = vec(upright(bold(x))_k, lambda_k) - mat(delim: "(", upright(bold(A)) - lambda upright(bold(I)), - upright(bold(x))_k; 2 upright(bold(x))_k^T, 0)^(- 1) vec(upright(bold(A)) upright(bold(x))_k - lambda upright(bold(x))_k, upright(bold(x))_k^T upright(bold(x))_k - 1) $

for $k = 0 , 1 , 2 , dots.h.c$ .
]

#exm[
Let $upright(bold(A))$ be an $n times n$ real anti-symmetric matrix such as

$ upright(bold(A)) = mat(delim: "(", 0, 1, , , ; - 1, 0, 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 0, 1; #none, , , - 1, 0) . $

Let $lambda = xi + upright(i) eta$ be an eigenvalue of $upright(bold(A))$ with $upright(bold(x)) = upright(bold(u)) + upright(i) upright(bold(v))$ be the associated eigenvector:

$ upright(bold(A)) vec(upright(bold(u)), upright(bold(v))) = mat(delim: "(", xi, - eta; eta, xi) vec(upright(bold(u)), upright(bold(v))) $

To fix a unique eigenvector, we impose the additional condition

$ upright(bold(u))^T upright(bold(u)) + upright(bold(v))^T upright(bold(v)) = 1 $

Here, $xi , eta in bb(R)$ and $upright(bold(u)) , upright(bold(v)) in bb(R)^n$ . In fact, $xi$ and $eta$ can be computed in terms of $upright(bold(u))$ and $upright(bold(v))$ :

$ xi = frac(upright(bold(u))^T upright(bold(A)) upright(bold(u)) + upright(bold(v))^T upright(bold(A)) upright(bold(v)), upright(bold(u))^T upright(bold(u)) + upright(bold(v))^T upright(bold(v))) = upright(bold(u))^T upright(bold(A)) upright(bold(u)) + upright(bold(v))^T upright(bold(A)) upright(bold(v)) equiv phi (upright(bold(u)) , upright(bold(v))) , $

$ eta = frac(upright(bold(u))^T upright(bold(A)) upright(bold(v)) - upright(bold(v))^T upright(bold(A)) upright(bold(u)), upright(bold(u))^T upright(bold(u)) + upright(bold(v))^T upright(bold(v))) = upright(bold(u))^T upright(bold(A)) upright(bold(v)) - upright(bold(v))^T upright(bold(A)) upright(bold(u)) equiv psi (upright(bold(u)) , upright(bold(v))) . $
]

#exm[
Let $upright(bold(A))$ be a real $n times n$ matrix, some of whose eigenvalues are complex. Let $lambda = xi + upright(i) eta$ be a complex eigenvalue of $upright(bold(A))$ with $upright(bold(x)) = upright(bold(u)) + upright(i) upright(bold(v))$ be the associated eigenvector with $xi , eta in bb(R)$ and $upright(bold(u)) , upright(bold(v)) in bb(R)^n$ . The eigenvalue problem

$ upright(bold(A)) (upright(bold(u)) + upright(i) upright(bold(v))) = (xi + upright(i) eta) (upright(bold(u)) + upright(i) upright(bold(v))) $

is equivalent to the solution of the nonlinear system $upright(bold(F)) (upright(bold(z))) = 0$ , where $upright(bold(F)) : bb(R)^n times bb(R)^n times bb(R) times bb(R) arrow.r$ $bb(R)^n times bb(R)^n times bb(R) times bb(R)$ is defined by

$ upright(bold(F)) : vec(upright(bold(u)), upright(bold(v)), xi, eta) arrow.r.bar vec(upright(bold(A u)) - xi upright(bold(u)) + eta upright(bold(v)), upright(bold(A v)) - eta upright(bold(u)) - xi upright(bold(v)), xi - phi (upright(bold(u)) , upright(bold(v))), eta - psi (upright(bold(u)) , upright(bold(v)))) $

Write down the Newton method for this nonlinear system.
]


Disadvantages of the exact Newton method:

- computation of derivatives

- solution of linearized systems

- local convergence