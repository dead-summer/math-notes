#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(0)
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

= The Ritz variational method
<the-ritz-variational-method>
Assume matrix $upright(bold(A)) in bb(R)^(n times n)$ is symmetric and positive definite. We will see that that the quadratic functional

$ phi (upright(bold(y))) = 1 / 2 (upright(bold(y)) - upright(bold(x)))^(upright(T)) upright(bold(A)) (upright(bold(y)) - upright(bold(x))) - 1 / 2 upright(bold(x))^(upright(T)) upright(bold(A)) upright(bold(x)) = 1 / 2 upright(bold(y))^(upright(T)) upright(bold(A)) upright(bold(y)) - upright(bold(b))^(upright(T)) upright(bold(y)) , $

has a unique minimizer $upright(bold(x))$ ,

$ phi (upright(bold(x))) = min_(upright(bold(y)) in bb(R)^n) phi (upright(bold(y))) $

The solution of the linear system (1) is equivalent to find the minimizer of the quadratic functional.

#thm([The Ritz principle])[
Let $upright(bold(A))$ be an $n times n$ symmetric positive definite matrix. The solution of the linear system

$ upright(bold(A x)) = upright(bold(b)) $

is equivalent to the minimization problem: find $upright(bold(x)) in bb(R)^n$ such that

$ phi (upright(bold(x))) = min_(upright(bold(y)) in bb(R)^n) phi (upright(bold(y))) $

with $phi (upright(bold(y)))$ being the quadratic functional given by

$ phi (upright(bold(y))) = 1 / 2 upright(bold(y))^T upright(bold(A)) upright(bold(y)) - upright(bold(b))^T upright(bold(y)) . $
]

#prf[
"$arrow.r.double$": Assume $upright(bold(x)) in bb(R)^n$ is the solution to the linear system $upright(bold(A x)) = upright(bold(b))$ . For any $upright(bold(y)) in bb(R)^n$ , let $upright(bold(z)) = upright(bold(y)) - upright(bold(x))$ . So we have

$
phi (upright(bold(y))) &= phi (upright(bold(x)) + upright(bold(z))) \
&= 1 / 2 (upright(bold(x)) + upright(bold(z)))^(upright(T)) upright(bold(A)) (upright(bold(x)) + upright(bold(z))) - upright(bold(b))^(upright(T)) (upright(bold(x)) + upright(bold(z))) \
&= 1 / 2 upright(bold(x))^(upright(T)) upright(bold(A)) upright(bold(x)) + upright(bold(z))^(upright(T)) upright(bold(A)) upright(bold(x)) + 1 / 2 upright(bold(z))^(upright(T)) upright(bold(A)) upright(bold(z)) - upright(bold(b))^(upright(T)) (upright(bold(x)) + upright(bold(z))) \
&= phi (upright(bold(x))) + 1 / 2 upright(bold(z))^(upright(T)) upright(bold(A z)) + upright(bold(z))^(upright(T)) (upright(bold(A x)) - upright(bold(b))) \
&= phi (upright(bold(x))) + 1 / 2 upright(bold(z))^(upright(T)) upright(bold(A z)) \
&gt.eq phi (upright(bold(x))) .
$




The equality holds if and only if $upright(bold(z)) = 0$ or $upright(bold(y)) = upright(bold(x))$ . So, $upright(bold(x))$ is the minimizer of the quadratic functional.

"$arrow.l.double$": Assume $upright(bold(x))$ is the minimizer of the quadratic functional. For any vector $upright(bold(z))$ and any scalar $lambda in bb(R)$ , we have

$ phi (upright(bold(x)) + lambda upright(bold(z))) gt.eq phi (upright(bold(x))) . $

For fixed $upright(bold(z)) in bb(R)^n$ , let

$ psi (lambda) = phi (upright(bold(x)) + lambda upright(bold(z))) = 1 / 2 upright(bold(z))^(upright(T)) upright(bold(A)) upright(bold(z)) lambda^2 + upright(bold(z))^(upright(T)) (upright(bold(A)) upright(bold(x)) - upright(bold(b))) lambda + phi (upright(bold(x))) . $

Taking derivative for $psi (lambda)$ with respect to $lambda$ , we get

$ psi^(') (lambda) = upright(bold(z))^(upright(T)) upright(bold(A z)) lambda + upright(bold(z))^(upright(T)) (upright(bold(A x)) - upright(bold(b))) . $

Since $lambda = 0$ is the point where the function $psi (lambda)$ reaches its minimum, we have

$ 0 = psi^(') (0) = upright(bold(z))^(upright(T)) (upright(bold(A x)) - upright(bold(b))) , $

the right hand side of which is called the first variation of the quadratic functional $phi (upright(bold(y)))$ at $upright(bold(x))$ along direction $upright(bold(z))$ . The identity above is true for all $upright(bold(z)) in bb(R)^n$ . Letting $upright(bold(z)) = upright(bold(A x)) - upright(bold(b))$ , we get

$ norm(upright(bold(A x)) - upright(bold(b)))^2 = upright(bold(z))^(upright(T)) (upright(bold(A x)) - upright(bold(b))) = 0 . $

This indicates that

$ upright(bold(A x)) - upright(bold(b)) = 0 . $
]
