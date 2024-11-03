#import "/book.typ": book-page, cross-link
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

#counter(heading).update(1)
#set heading(numbering: "1.1.1")

// 由于上一节编号到 3，因此本节从 4 开始编号
#counter(math.equation).update(3)
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

= The LU Decomposition Method

The entries

$ ell_(i , k) = a_(i , k)^((k)) \/ a_(k , k)^((k)) $

in the Gauss elimination form a lower/left triangular matrix

$ upright(bold(L)) = mat(delim: "(", 1, , , , ; ell_(2 , 1), 1, , , ; ell_(3 , 1), ell_(3 , 2), , , ; dots.v, dots.v, dots.down, 1, ; ell_(n , 1), ell_(n , 2), dots.h.c, ell_(n , n - 1), 1) . $

Let

$ upright(bold(U)) = mat(delim: "(", u_(1 , 1), u_(1 , 2), u_(1 , 3), dots.h.c, u_(1 , n); #none, u_(2 , 2), u_(2 , 3), dots.h.c, u_(2 , n); #none, , u_(3 , 3), dots.h.c, u_(3 , n); #none, , , dots.down, dots.v; #none, , , , u_(n , n)) $



be the coefficient matrix of (3). As a matter of fact, the Gauss elimination amounts to the LU decomposition or LU factorization,

$ upright(bold(A)) = upright(bold(L U)) . $<eq:4>


That is, the matrix $upright(bold(A))$ is a product of the lower and upper triangular matrices, $upright(bold(L))$ and $upright(bold(U))$ .

The Gauss elimination amounts to left multiply $upright(bold(A))$ with the inverse matrix

$ upright(bold(L))^(- 1) = mat(delim: "(", 1, , , , ; - ell_(2 , 1), 1, , , ; - ell_(3 , 1), - ell_(3 , 2), , , ; dots.v, dots.v, dots.down, 1, ; - ell_(n , 1), - ell_(n , 2), dots.h.c, - ell_(2 , n - 1), 1) . $

Substituting the factorization (@eq:4) into the linear system (1) yields

$ upright(bold(L U x)) = upright(bold(A x)) = upright(bold(b)) . $

Let

$ upright(bold(y)) = upright(bold(U x)) . $<eq:5>


The linear system (@eq:5) is now decomposed into two triangular systems

$ upright(bold(L y)) = upright(bold(b)) , $<eq:6>

and

$ upright(bold(U x)) = upright(bold(y)) . $<eq:7>

Once an LU decomposition of the matrix $upright(bold(A))$ is ready,one can follow the steps below to solve the system:

- Step 1. first solve the lower triangular linear system (6) by forward substitution,

$ upright(bold(L)) = mat(delim: "(", 1, , , , ; ell_(2 , 1), 1, , , ; ell_(3 , 1), ell_(3 , 2), , , ; dots.v, dots.v, dots.down, 1, ; ell_(n , 1), ell_(n , 2), dots.h.c, ell_(n , n - 1), 1) vec(y_1, y_2, y_3, dots.v, y_n) = vec(b_1, b_2, b_3, dots.v, b_n) , $

from which one gets the values $y_i$ one by one,

$ y_i = b_i - sum_(j = 1)^(i - 1) ell_(i , j) y_j , quad "for" i = 1 , 2 , dots.h.c , n ; $

- Step 2. next solve the upper triangular linear system (7) by backward substitution,

$ mat(delim: "(", u_(1 , 1), u_(1 , 2), u_(1 , 3), dots.h.c, u_(1 , n); #none, u_(2 , 2), u_(2 , 3), dots.h.c, u_(2 , n); #none, , u_(3 , 3), dots.h.c, u_(3 , n); #none, , , dots.down, dots.v; #none, , , , u_(2 , n)) vec(x_1, x_2, x_3, dots.v, x_n) = vec(y_1, y_2, y_3, dots.v, y_2) . $

Note that both forward substitution and backward substitution for the triangular systems involves $O (n^2)$ operations. So the algorithm complexity is $O (n^2)$ .

Now we will present another method to get the LU decomposition/factorization. It starts from (@eq:4), assuming

$ mat(delim: "(", a_(1 , 1), a_(1 , 2), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), dots.h.c, a_(2 , n); dots.v, dots.v, dots.down, a_(n - 1 , n); a_(n , 1), a_(n , 2), dots.h.c, a_(n , n)) = mat(delim: "(", 1, , , ; ell_(2 , 1), 1, , ; dots.v, dots.down, 1, ; ell_(n , 1), dots.h.c, ell_(n , n - 1), 1) mat(delim: "(", u_(1 , 1), u_(1 , 2), dots.h.c, u_(1 , n); #none, u_(2 , 2), dots.h.c, u_(2 , n); #none, , dots.down, dots.v; #none, , , u_(n , n)) . $<eq:8>

// $ mat(delim: "(", a_(1 , 1), a_(1 , 2), a_(1 , 3), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), a_(2 , 3), dots.h.c, a_(2 , n); a_(3 , 1), a_(3 , 2), a_(3 , 3), dots.down, dots.v; dots.v, dots.v, dots.down, dots.down, a_(n - 1 , n); a_(n , 1), a_(n , 2), dots.h.c, a_(n , n - 1), a_(n , n)) = mat(delim: "(", 1, , , , ; ell_(2 , 1), 1, , , ; ell_(3 , 1), ell_(3 , 2), , , ; dots.v, dots.v, dots.down, 1, ; ell_(n , 1), ell_(n , 2), dots.h.c, ell_(n , n - 1), 1) mat(delim: "(", u_(1 , 1), u_(2 , 1), u_(3 , 2), dots.h.c, u_(1 , n); #none, u_(2 , 2), u_(2 , 3), dots.h.c, u_(2 , n); #none, , u_(3 , 3), dots.h.c, u_(3 , n); #none, , , dots.down, dots.v; #none, , , , u_(n , n)) . $

We can get $ell_(i , k)$ and $u_(k , j)$ by equating corresponding entries in (8). First,multiplying the first row of $upright(bold(L))$ with columns of $upright(bold(U))$ yields

$ a_(1 , j) = u_(1 , j) , quad "for" j = 1 , 2 , dots.h.c , n , $

i.e.,

$ u_(1 , j) = a_(1 , j) , quad "for" j = 1 , 2 , dots.h.c , n . $

Next,multiplying rows of $upright(bold(L))$ with the first column of $upright(bold(U))$ yields

$ ell_(i , 1) u_(1 , 1) = a_(i , 1) quad "for" i = 2 , 3 , dots.h.c , n , $

which implies

$ ell_(i , 1) = a_(i , 1) \/ u_(1 , 1) quad "for" i = 2 , 3 , dots.h.c , n , $

Then multiplying the second row of $upright(bold(L))$ with columns of $upright(bold(U))$ will give us formula for computing the non-zero entries in the second row of $upright(bold(U))$ ,

$ ell_(2 , 1) u_(1 , j) + u_(2 , j) = a_(2 , j) , quad "for" j = 2 , 3 , dots.h.c , n , $

i.e.,

$ u_(2 , j) = a_(2 , j) - ell_(2 , 1) u_(1 , j) , quad "for" j = 2 , 3 , dots.h.c , n . $

Multiplying rows of $upright(bold(L))$ with the second column of $upright(bold(U))$ will give us formula for computing the non-zero entries in the second column of $upright(bold(L))$ ,

$ ell_(i , 1) u_(1 , 2) + ell_(i , 2) u_(2 , 2) = a_(i , 2) quad "for" i = 2 , 3 , dots.h.c , n , $

which implies

$ ell_(i , 2) = (a_(i , 2) - ell_(i , 1) u_(1 , 2)) \/ u_(2 , 2) quad "for" i = 2 , 3 , dots.h.c , n , $

Similarly, one can alternatively get entries in rows of $upright(bold(U))$ and columns of $upright(bold(L))$ . In general,for $k =$ $1 , 2 , dots.h.c , n$ , we have

$ a_(k , j) = sum_(m = 1)^k ell_(k , m) u_(m , j) = u_(k , j) + sum_(m = 1)^(k - 1) ell_(k , m) u_(m , j) , #h(0em) j = k , k + 1 , dots.h.c , n , $

which implies

$ u_(k , j) = a_(k , j) - sum_(m = 1)^(k - 1) ell_(k , m) u_(m , j) , #h(0em) j = k , k + 1 , dots.h.c , n , $

and

$ a_(i , k) = sum_(m = 1)^k ell_(i , m) u_(m , k) = sum_(m = 1)^(k - 1) ell_(i , m) u_(m , k) + ell_(i , k) u_(k , k) , #h(0em) i = k + 1 , k + 2 , dots.h.c , n , $

which implies

$ ell_(i , k) = (a_(i , k) - sum_(m = 1)^(k - 1) ell_(i , m) u_(m , k)) \/ u_(k , k) , #h(0em) i = k + 1 , k + 2 , dots.h.c , n . $

This version of LU factorization/decomposition is called the Doolittle factorization/decomposition.

#thm[
The LU decomposition is unique if it exists.
]

#prf[
Assume the LU decomposition is not unique, say

$ upright(bold(L))_1 upright(bold(U))_1 = upright(bold(A)) = upright(bold(L))_2 upright(bold(U))_2 $

with the diagonal entries of $upright(bold(L))_1$ and $upright(bold(L))_2$ are all equal to one. We have

$ upright(bold(U))_1 upright(bold(U))_2^(- 1) = upright(bold(L))_1^(- 1) upright(bold(L))_2 $

Note that the inverse of a lower triangular matrix is again a lower triangular matrix; the inverse of an upper triangular matrix is again an upper triangular matrix. The product of two lower triangualr matrices is a lower triangular matrix. The product of two upper triangualr matrices is also an upper triangular matrix. The identity above implies that The matrices on both sides are diagonal matrices. Assume

$ upright(bold(L))_1^(- 1) upright(bold(L))_2 = upright(bold(D)) equiv "diag" (d_1 , d_2 , dots.h.c , d_n) , $

$ upright(bold(L))_2 = upright(bold(L))_1 upright(bold(D)) . $

As the diagonal entries of $upright(bold(L))_1$ and $upright(bold(L))_2$ are equal to one,the diagonal matrix $upright(bold(D))$ is the identity matrix. Thus,

$ upright(bold(L))_1 = upright(bold(L))_2 $

and thus

$ upright(bold(U))_1 = upright(bold(U))_2 $
]

#exr[
Please make LU decomposition by hand for the following matrices.

$ A = mat(delim: "(", 1, 2, 1; 2, 2, 3; - 1, - 3, 0), 
B = mat(delim: "(", 2, - 1, 1, 3; 4, - 1, 0, 5; - 4, 3, - 3, - 5; 2, 2, - 3, 2) ,
C = mat(delim: "(", 2, 1, 0, 0; 1, 4, 1, 0; 0, 1, 4, 1; 0, 0, 1, 2)
$

]

== The Cholesky Decomposition
<the-cholesky-decomposition>
When the matrix $upright(bold(A))$ is symmetric and positive definite,the LU decomposition may be replaced by the symmetric form

$ upright(bold(A)) = upright(bold(L L))^(upright(T)) $

with

$ upright(bold(L)) = mat(delim: "(", ell_(1 , 1), , , ; ell_(2 , 1), ell_(2 , 2), , ; dots.v, dots.v, dots.down, ; ell_(n , 1), ell_(n , 2), dots.h.c, ell_(n , n)) , $

assuming the diagonal entries $ell_(k , k)$ are all positive. The corresponding decomposition is called the Cholesky decomposition or square root decomposition.

#thm[
The Cholesky or square root decomposition of a symmetric and positive definite matrix is unique.
]

Similar to the Doolittle decomposition, by equating entries of the decomposition

$ mat(delim: "(", a_(1 , 1), a_(1 , 2), dots.h.c, a_(1 , n); a_(2 , 1), a_(2 , 2), dots.h.c, a_(2 , n); dots.v, dots.v, dots.down, a_(n - 1 , n); a_(n , 1), a_(n , 2), dots.h.c, a_(n , n)) = mat(delim: "(", ell_(1 , 1), , , ; ell_(2 , 1), ell_(2 , 2), , ; dots.v, dots.down, dots.down, ; ell_(n , 1), dots.h.c, ell_(n , n - 1), ell_(n , n)) mat(delim: "(", ell_(1 , 1), ell_(2 , 1), dots.h.c, ell_(n , 1); #none, ell_(2 , 2), dots.h.c, ell_(n , 2); #none, , dots.down, dots.v; #none, , , ell_(n , n)) . $<eq:9>

$ a_(k , k) = sum_(m = 1)^k ell_(k , m)^2 = ell_(k , k)^2 + sum_(m = 1)^(k - 1) ell_(k , m)^2 $

$ ell_(k , k) = sqrt(a_(k , k) - sum_(m = 1)^(k - 1) ell_(k , m)^2) . $

For $j < i$ ,we have

$ a_(i , j) = sum_(m = 1)^j ell_(i , m) ell_(j , m) = ell_(i , j) ell_(j , j) + sum_(m = 1)^(j - 1) ell_(i , m) ell_(j , m) , $

and

$ ell_(i , j) = (a_(i , j) - sum_(m = 1)^(j - 1) ell_(i , m) ell_(j , m)) \/ ell_(j , j) , quad "for" j = 1 , 2 , dots.h.c , i - 1 . $

#exr[
Please write a computer program to find the inverse of the matrix below,

$ upright(bold(A)) = frac(1, n + 1) mat(delim: "(", n, n - 1, n - 2, dots.h.c, 2, 1; n - 1, 2 (n - 1), 2 (n - 2), dots.h.c, 4, 2; n - 2, 2 (n - 2), 3 (n - 2), dots.down, 6, 3; dots.v, dots.v, dots.down, dots.down, dots.v, dots.v; 2, 4, 6, dots.h.c, 2 (n - 1), n - 1; 1, 2, 3, dots.h.c, n - 1, n)_(n times n) $
]

== The Thomas Algorithm
<the-thomas-algorithm>
When the matrix $upright(bold(A))$ is tridiagonal, e.g.,

$ upright(bold(A)) = mat(delim: "(", a_1, b_1, , , ; c_1, a_2, b_2, , ; #none, dots.down, dots.down, dots.down, ; #none, , c_(n - 2), a_(n - 1), b_(n - 1); #none, , , c_(n - 1), a_n) , $

the LU-decomposition has a special form, where both the lower triangualr and upper triangular matrices reduce to bidiagonal ones,

$ upright(bold(L)) = mat(delim: "(", 1, , , , , ; gamma_1, 1, , , , ; #none, gamma_2, 1, , , ; #none, , gamma_3, dots.down, , ; #none, , , dots.down, dots.down, ; #none, , , , gamma_(n - 1), 1) #h(0em) upright(" and ") #h(0em) upright(bold(U)) = mat(delim: "(", alpha_1, beta_1, , , , ; #none, alpha_2, beta_2, , , ; #none, , alpha_3, beta_3, , ; #none, , , dots.down, dots.down, ; #none, , , , dots.down, beta_(n - 1); #none, , , , , alpha_n) . $

The decomposition is the so-called *Thomas algorithm* or the *chasing algorithm*.

To get formula for the entries in the bidiagonal matrices, we first have

$ upright(bold(L U)) = mat(delim: "(", alpha_1, beta_1, , , , ; gamma_1 alpha_1, gamma_1 beta_1 + alpha_2, beta_2, , , ; #none, gamma_2 alpha_2, gamma_2 beta_2 + alpha_3 beta_3, , , ; #none, , gamma_3 alpha_3, dots.down, dots.down, ; #none, , , dots.down, dots.down, beta_(n - 1); #none, , , , gamma_(n - 1) alpha_(n - 1), gamma_(n - 1) beta_(n - 1) + alpha_n) . $

Equating entries of the matrices $upright(bold(A))$ and $upright(bold(L U))$ ,we get

$ cases(delim: "{",
gamma_(i - 1) beta_(i - 1) + alpha_i & = a_i ,
beta_i & = b_i ,
gamma_i alpha_i & = c_i ,
) $

and moreover

$ 
cases(
alpha_i = a_i - gamma_(i - 1) beta_(i - 1)  & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n ,
beta_i = b_i  & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 1 ,
gamma_i = c_i \/ alpha_i & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 1 ,
)


 . $

Here, $beta_0$ and $gamma_0$ are assumed to take zero.

Suppose the tridiagonal system to be solved reads

$ upright(bold(A x)) = upright(bold(f)) , $

with the vector $upright(bold(f)) in bb(R)^n$ on the right hand side given by

$ upright(bold(f)) = (f_1 , f_2 , f_3 , dots.h.c , f_n)^T . $

Again after the LU decomposition, we can get a solution to the tridiagonal system by solving first

$ upright(bold(L y)) = upright(bold(f)) $

with the forward substitution,

$ y_i = f_i - gamma_(i - 1) y_(i - 1) , quad "for" i = 1 , 2 , 3 , dots.h.c , n , $

and next

$ upright(bold(U x)) = upright(bold(y)) $

with the backward substitution,

$ x_n = y_n \/ alpha_n $

and

$ x_i = (y_i - beta_i x_(i + 1)) \/ alpha_i , quad "for" i = n - 1 , n - 2 , dots.h.c , 2 , 1 . $


#exr[
Show that the Thomas algorithm works for the tridiagonal Matrix

$ upright(bold(A)) = mat(delim: "(", a_1, c_1, , , , ; b_2, a_2, c_2, , , ; #none, b_3, a_3, c_3, , ; #none, , dots.down, dots.down, dots.down, ; #none, , , b_(n - 1), a_(n - 1), c_(n - 1); #none, , , , b_n, a_n) $

with the properties
$ lr(|a_j|) gt.eq lr(|b_j|) + lr(|c_j|) , #h(0em) b_j c_j eq.not 0 , #h(0em) j = 2 , dots.h.c , n - 1 , $

and $lr(|a_1|) > lr(|c_1|) > 0 , lr(|a_n|) > lr(|b_n|) > 0$ .
]

#prf[
Just show that $alpha_k eq.not 0$ . By contradiction, Assume that $exists k > 1$ , s.t. $alpha_k = 0$. Then $ 0 = alpha_k = a_k - frac(b_k c_(k - 1), alpha_(k - 1)) arrow.r.double.long alpha_(k - 1) = frac(b_k c_(k - 1), a_k) , $ so $lr(|alpha_k|) < lr(|c_(k - 1)|)$. Since $alpha_(k - 1) = a_(k - 1) - frac(b_(k - 1) c_(k - 2), alpha_(k - 2))$, then $ lr(|a_(k - 1)|) - lr(|frac(b_(k - 1) c_(k - 2), alpha_(k - 2))|) < lr(|c_(k - 1)|) , $ thus $ lr(|alpha_(k - 2)|) < frac(lr(|b_(k - 1)|), lr(|a_(k - 1 \|) -|) c_(k - 1 \|)) lr(|c_(k - 2)|) lt.eq lr(|c_(k - 2)|) . $ Hence, we can induce that $lr(|alpha_1|) = lr(|a_1|) < lr(|c_1|)$ , this is a contradiction.
]

#exr[
Please write a computer program to find out the inverse of the matrix below,

$ upright(bold(A)) = mat(delim: "(", 2, - 1, , , ; - 1, 2, - 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 2, - 1; #none, , , - 1, 2)_(n times n) . $
]


== Cyclic Tridiagonal System

The Thomas algorithm can also be applied to solve cyclic tridiagonal systems.

Let $upright(bold(A))$ be a cyclic tridiagonal matrix in the form

$ upright(bold(A)) = mat(delim: "(", a_1, b_1, , , c_n; c_1, a_2, b_2, , ; #none, dots.down, dots.down, dots.down, ; #none, , c_(n - 2), a_(n - 1), b_(n - 1); b_n, , , c_(n - 1), a_n) . $

Its LU-decomposition also has a special form with the lower triangualr and upper triangular matrices be given by

$ upright(bold(L)) = mat(delim: "(", 1, , , , , ; gamma_1, 1, , , , ; #none, gamma_2, 1, , , ; #none, , gamma_3, dots.down, , ; #none, , , dots.down, dots.down, ; eta_1, eta_2, eta_3, dots.h.c, eta_(n - 1), 1) #h(0em) upright(" and ") #h(0em) upright(bold(U)) = mat(delim: "(", alpha_1, beta_1, , , , delta_1; #none, alpha_2, beta_2, , , delta_2; #none, , alpha_3, beta_3, , delta_3; #none, , , dots.down, dots.down, dots.v; #none, , , , dots.down, delta_(n - 1); #none, , , , , alpha_n) , $

which are no longer bidiagonal.

To get formula for the entries in the special triangular matrices above, we first have

$ upright(bold(L U)) = mat(delim: "(",
alpha_1, beta_1, , , , delta_1;
gamma_1 alpha_1, gamma_1 beta_1 + alpha_2, beta_2, , , gamma_1 delta_1 + delta_2;
#none, gamma_2 alpha_2, gamma_2 beta_2 + alpha_3, beta_3, , gamma_2 delta_2 + delta_3;
#none, , gamma_3 alpha_3, dots.down, dots.down, dots.v, ;
#none, , , dots.down, dots.down, gamma_(n - 2) delta_(n - 2) + delta_(n - 1), ; eta_1 alpha_1, eta_1 beta_1 + eta_2 alpha_2, eta_2 beta_2 + eta_3 alpha_3, dots.h.c, eta_(n - 2) beta_(n - 2) + eta_(n - 1) alpha_(n - 1), sum_(i = 1)^(n - 1) eta_i delta_i + alpha_n, ) . $

First equating entries of the $(n - 1)$ by $(n - 1)$ sub-matrices of $upright(bold(A))$ and $upright(bold(L U))$ , we get

$ cases(
gamma_(i - 1) beta_(i - 1) + alpha_i &= a_i & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 1 \, ,
beta_i &= b_i & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 2 \, ,
gamma_i alpha_i &= c_i  & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 2 \, ,
) $

and moreover

$
cases(
alpha_i &= a_i - gamma_(i - 1) beta_(i - 1) & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 1 \, ,
beta_i &= b_i & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 2 \, ,
gamma_i &= c_i \/ alpha_i  & "for" i = 1 \, 2 \, 3 \, dots.h.c \, n - 2 .
)
$

Here, $beta_0$ and $gamma_0$ are assumed to take zero.

Equating the last column and last row of $upright(bold(L U))$ ,respectively,with those of $upright(bold(A))$ , we have

$ cases(delim: "{",
delta_1  = c_n ,
gamma_(i - 1) delta_(i - 1) + delta_i  = 0  quad "for" i = 2 \, 3 \, dots.h.c \, n - 2 \,,
gamma_(n - 2) delta_(n - 2) + delta_(n - 1) = b_(n - 1) ,
) $

$ cases(delim: "{",
eta_1 alpha_1 & = b_n ,
eta_(j - 1) beta_(j - 1) + eta_j alpha_j & = 0 quad "for" j = 2 \, 3 \, dots.h.c \, n - 2 ,
eta_(n - 2) beta_(n - 2) + eta_(n - 1) alpha_(n - 1) & = c_(n - 1) ,
) $

and

$ sum_(i = 1)^(n - 1) eta_i delta_i + alpha_n = a_n $

Furthermore, we obtain

$ cases(delim: "{",
delta_1 & = c_n ,
delta_i & = - gamma_(i - 1) delta_(i - 1) quad "for" i = 2 \, 3 \, dots.h.c \, n - 2 ,
delta_(n - 1) & = b_(n - 1) - gamma_(n - 2) delta_(n - 2) ,
) $

$ cases(delim: "{",
eta_1 & = b_n \/ alpha_1 ,
eta_j & = - eta_(j - 1) beta_(j - 1) \/ alpha_j quad "for" j = 2 \, 3 \, dots.h.c \, n - 2 ,
eta_(n - 1) & = (c_(n - 1) - eta_(n - 2) beta_(n - 2)) \/ alpha_(n - 1) ,
) $

and

$ alpha_n = a_n - sum_(i = 1)^(n - 1) eta_i delta_i $

Suppose the cyclic tridiagonal system to be solved also reads

$ upright(bold(A x)) = upright(bold(f)) , $

with the vector $upright(bold(f)) in bb(R)^n$ on the right hand side given by

$ upright(bold(f)) = (f_1 , f_2 , f_3 , dots.h.c , f_n)^T . $

Again after the LU decomposition, we can get a solution to the cyclic tridiagonal system by solving

first

$ upright(bold(L y)) = upright(bold(f)) , $

i.e.,

$ mat(delim: "(", 1, , , , , ; gamma_1, 1, , , , ; #none, gamma_2, 1, , , ; #none, , gamma_3, dots.down, , ; #none, , , dots.down, dots.down, ; gamma_1, gamma_2, gamma_3, dots.h.c, gamma_(n - 1), 1) vec(y_1, y_2, y_3, y_4, dots.v, y_n) = vec(f_1, f_2, f_3, f_4, dots.v, f_n) , $

with the forward substitution, which yields

$ y_1 = f_1 $

$ y_i = f_i - gamma_(i - 1) y_(i - 1) , quad "for" i = 2 , 3 , 4 , dots.h.c , n - 1 , $

$ y_n = f_n - sum_(j = 1)^(n - 1) eta_j y_j $

and next

$ upright(bold(U x)) = upright(bold(y)) , $

i.e.,

$ mat(delim: "(", alpha_1, beta_1, , , , delta_1; #none, alpha_2, beta_2, , , delta_2; #none, , alpha_3, beta_3, , delta_3; #none, , , dots.down, dots.down, dots.v; #none, , , , dots.down, delta_(n - 1); #none, , , , , alpha_n) vec(x_1, x_2, x_3, x_4, dots.v, x_n) = vec(y_1, y_2, y_3, y_4, dots.v, y_n) , $

with the backward substitution, which leads to

$ x_n = y_n \/ alpha_n $

$ x_(n - 1) = (y_(n - 1) - delta_(n - 1) x_n) \/ alpha_(n - 1) , $

and

$ x_i = (y_i - beta_i x_(i + 1) - delta_i x_n) \/ alpha_i , quad "for" i = n - 2 , n - 3 , dots.h.c , 2 , 1 . $

#exr[
Please write a computer program to find out the inverse of the matrix below,

$ upright(bold(A)) = mat(delim: "(", 4, 1, , , 1; 1, 4, 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , 1, 4, 1; 1, , , 1, 4)_(n times n) . $
]

