#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(5)
#set heading(numbering: "1.1.1")

// 上一节编号到 27
#counter(math.equation).update(27)

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

= Stopping Criterion
<stopping-criterion>

Finally, we need to check whether an iterated solution $upright(bold(x))_k$ to the linear system $upright(bold(A x)) = upright(bold(b))$ is sufficiently close to the exact solution $upright(bold(x))$ . We have the following lemma.

#lem[
Let $upright(bold(x))_k$ be an approximate solution to the linear system $upright(bold(A x)) = upright(bold(b))$ . Denote by $upright(bold(r))_k =$ $upright(bold(b)) - upright(bold(A)) upright(bold(x))_k$ the residual. We have the following estimate for the relative error of the approximate solution

$ frac(norm(upright(bold(x)) - upright(bold(x))_k), norm(upright(bold(x)))) lt.eq "cond" (upright(bold(A))) frac(norm(upright(bold(r))_k), norm(upright(bold(b)))) $<eq:28>

Here, $"cond" (upright(bold(A))) = norm(upright(bold(A))) norm(upright(bold(A))^(- 1))$ is the condition number of the matrix $upright(bold(A))$ .
]

#prf[
Let $upright(bold(e))_k = upright(bold(x)) - upright(bold(x))_k$ be the error of the approximate solution $upright(bold(x))_k$ to the exact one. We have

$ upright(bold(A)) upright(bold(e))_k = upright(bold(A)) upright(bold(x)) - upright(bold(A)) upright(bold(x))_k = upright(bold(b)) - upright(bold(A)) upright(bold(x))_k = upright(bold(r))_k . $

That is, the error satisfies the residual equation

$ upright(bold(A)) upright(bold(e))_k = upright(bold(r))_k $

It implies that

$ upright(bold(e))_k = upright(bold(A))^(- 1) upright(bold(r))_k $

and

$ norm(upright(bold(e))_k) lt.eq norm(upright(bold(A))^(- 1)) norm(upright(bold(r))_k) . $<eq:29>

Note that

$ norm(upright(bold(b))) = norm(upright(bold(A x))) lt.eq norm(upright(bold(A))) norm(upright(bold(x))) $

and

$ frac(1, norm(upright(bold(x)))) lt.eq frac(norm(upright(bold(A))), norm(upright(bold(b)))) $<eq:30>

Combining (@eq:29) and (@eq:30) together, we get the estimate (@eq:28) .
]

By this lemma, we see that, for a well-conditioned linear system, we can stop an iterative method by checking whether the residual relative to the initial one in some vector norm is less than some specified tolerance.