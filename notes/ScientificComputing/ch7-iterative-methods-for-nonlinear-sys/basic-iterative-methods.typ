#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(0)
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

= Basic iterative methods
<basic-iterative-methods>
Suppose that we are given an approximate solution $upright(bold(x)) = (x_1 , x_2 , dots.h.c , x_n)^(upright(T))$ . We can get a hopefully better solution $upright(bold(z)) = (z_1 , z_2 , dots.h.c , z_n)^(upright(T))$ by solving the nonlinear scalar equations one by one,

$ 
cases(f_1 (z_1 , x_2 , x_3 , dots.h.c , x_n) & = 0\
f_2 (x_1 , z_2 , x_3 , dots.h.c , x_n) & = 0\
 & dots.v & \
f_n (x_1 , x_2 , x_3 , dots.h.c , z_n) & = 0
)
$

and repeat the process after replacing $upright(bold(x))$ with $upright(bold(z))$ . The resulting method as a generalization of the Jacobi method for linear systems is called the nonlinear Jacobi method.

As a variant of the nonlinear Jacobi iteration, if we use the newly computed values for the first $(i - 1)$-th variables in the solution of the $i$-th equation for $z_i , i = 1 , 2 , dots.h.c , n$ , i.e., solving the following scalar equations one by one:

$
cases(
f_1 (z_1 , x_2 , x_3 , dots.h.c , x_n) & = 0\
f_2 (z_1 , z_2 , x_3 , dots.h.c , x_n) & = 0\
 & dots.v & \
f_n (z_1 , z_2 , z_3 , dots.h.c , z_n) & = 0 
) ,
$

the resulting method as a generalization of the Gauss-Seidel method for linear systems is called the nonlinear Gauss-Seidel method.

#rmk[
For each nonlinear scalar equation, there is no need to solve the equation accurately since the whole cycle itself is just an iteration step. Too accurate solution of any individual scalar equation will not improve the accuracy of the iterated solution, which is a vector instead of a scalar.
]
