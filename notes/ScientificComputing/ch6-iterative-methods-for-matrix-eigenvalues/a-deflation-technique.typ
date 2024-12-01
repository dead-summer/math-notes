#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

// 上一节编号到 20
#counter(math.equation).update(20)

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

= A deflation technique
<a-deflation-technique>
For the matrix all of whose eigenvalues have different moduli, the power method can be used together with a technique called deflation to sequentially compute all of the eigenvalues of the matrix.

Let $upright(bold(A))_n in bb(R)^(n times n)$ be such a matrix. Assume that we have already applied one of the power methods (for example, the Rayleigh inverse iteration) to find the an eigenvalue $lambda_m$ and the associated eigenvector $upright(bold(v))_m$ , whose 2-norm is equal to one, i.e., $norm(upright(bold(v))_m)_2 = 1$ .

In the next, we will see that the matrix $upright(bold(A))_n$ can be similarly transformed into a new matrix, which has the following form

$ mat(delim: "(", lambda_m, \*; 0, upright(bold(A))_(n - 1)) tilde.op upright(bold(A))_n . $

The block $upright(bold(A))_(n - 1)$ at the lower-right corner is an $(n - 1) times (n - 1)$ matrix.

Let $upright(bold(H))_n$ be the Householder reflection matrix which maps the eigenvector $upright(bold(v))_m$ to the unit vector $upright(bold(e))_1 = (1 , 0 , dots.h.c , 0)^(upright(T))$ , the first column of the identity matrix $upright(bold(I)) in bb(R)^(n times n)$ . It reads

$ upright(bold(H))_n = upright(bold(I)) - 2 upright(bold(w w))^(upright(T)) $

with

$ upright(bold(w)) = frac(upright(bold(v))_m - upright(bold(e))_1, norm(upright(bold(v))_m - upright(bold(e))_1)_2) . $

It is straightforward to verify that the first column of the matrix $upright(bold(H))_n upright(bold(A))_n upright(bold(H))_n$ is vector $upright(bold(e))_1$ multiplied by the eigenvalue $lambda_m$ since

$ upright(bold(H))_n upright(bold(A))_n upright(bold(H))_n upright(bold(e))_1 = upright(bold(H))_n upright(bold(A))_n upright(bold(v))_m = lambda_m upright(bold(H))_n upright(bold(v))_m = lambda_m upright(bold(e))_1 . $

More specifically, we have

$ upright(bold(H))_n upright(bold(A))_n upright(bold(H))_n = mat(delim: "(", lambda_m, \*; 0, upright(bold(A))_(n - 1)) . $

The matrix $upright(bold(A))_(n - 1) in bb(R)^((n - 1) times (n - 1))$ has the same eigenvalues except $lambda_m$ as $upright(bold(A))_n$ .

After the similarity transformation, another eigenvalue can be computed by applying one of the power methods (such as the Rayleigh inverse iteration) to the(n - 1)-dimensional matrix $upright(bold(A))_(n - 1)$ . After the second eigenvalue is found, we can make another similarity transformation to get matrix $upright(bold(A))_(n - 2) in bb(R)^((n - 2) times (n - 2))$ . The process is repeated until the last eigenvalue of $upright(bold(A))$ is found. The procedure is called the power method with deflation since the dimension of the matrix is repeatedly decreased/deflated.