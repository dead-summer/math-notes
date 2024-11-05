#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(0)
#set heading(numbering: "1.1.1")

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

// = Vector and Matrix Norms

= Vector Norm
<vector-norm>
For a vector $upright(bold(x)) = (x_1 , x_2 , dots.h.c , x_n)^(upright(T)) in bb(R)^n$ , we may introduce the maximum norm $(ell^oo upright("-norm"))$

$ norm(upright(bold(x)))_oo = max_(1 lt.eq i lt.eq n) lr(|x_i|) $

the 2-norm $\(ell^2$ -norm)

$ norm(upright(bold(x)))_2 = sqrt(sum_(i = 1)^n x_i^2) $

and the 1-norm $\(ell^1$ -norm)

$ norm(upright(bold(x)))_1 = sum_(i = 1)^n lr(|x_i|) $

A vector norm $norm(dot.op)$ has three characteristic properties:

- positivity

$ norm(upright(bold(x))) gt.eq 0 quad forall upright(bold(x)) in bb(R)^n quad "and" quad norm(upright(bold(x))) = 0 quad upright(" iff ") quad upright(bold(x)) = 0 ; $

- homogeneity

$ norm(alpha upright(bold(x))) = lr(|alpha|) norm(upright(bold(x))) quad forall alpha in bb(R) , upright(bold(x)) in bb(R)^n ; $

- triangle inequality

$ norm(upright(bold(x)) + upright(bold(y))) lt.eq norm(upright(bold(x))) + norm(upright(bold(y))) quad forall upright(bold(x)) , upright(bold(y)) in bb(R)^n $

For $p gt.eq 1$ , we may introduce the $p$ -norm

$ norm(upright(bold(x)))_p = (sum_(i = 1)^n lr(|x_i|)^p)^(1 \/ p) , quad upright(bold(x)) in bb(R)^n . $

#prp[
Let $upright(bold(T))$ be an invertible matrix in $bb(R)^(n times n)$ . The one given by

$ norm(upright(bold(x)))_T equiv norm(upright(bold(T x))) $

introduces a vector norm for $upright(bold(x)) in bb(R)^n$ .
]

#prp[
Let $upright(bold(A)) in bb(R)^(n times n)$ be a symmetric and positive definite matrix. The one given by

$ norm(upright(bold(x)))_A equiv sqrt((upright(bold(x)) , upright(bold(A x)))) $

introduces a vector norm for $upright(bold(x)) in bb(R)^n$ .
]

#lem[
The Cauchy-Schwarz inequality For any two vectors $upright(bold(x)) , upright(bold(y)) in bb(R)^n$ , we have

$ (upright(bold(x)) , upright(bold(y))) lt.eq norm(upright(bold(x))) norm(upright(bold(y))) . $<eq:1>
]

#lem[
The Hölder inequality Let $p , q gt.eq 1$ be two real (dual) numbers, which satisfy

$ 1 / p + 1 / q = 1 $

For any two vectors $upright(bold(x)) , upright(bold(y)) in bb(R)^n$ , we have

$ (upright(bold(x)) , upright(bold(y))) lt.eq norm(upright(bold(x)))_p norm(upright(bold(y)))_q $<eq:2>

and in particular

$ (upright(bold(x)) , upright(bold(y))) lt.eq norm(upright(bold(x)))_1 norm(upright(bold(y)))_oo $<eq:3>
]

#prp[
The 1-norm of $upright(bold(x)) in bb(R)^n$ can be computed by

$ norm(upright(bold(x)))_1 = sup_(upright(bold(y)) eq.not 0) frac((upright(bold(x)) , upright(bold(y))), norm(upright(bold(y)))_oo) $

The maximum norm of $upright(bold(x)) in bb(R)^n$ can be computed by

$ norm(upright(bold(x)))_oo = sup_(upright(bold(y)) eq.not 0) frac((upright(bold(x)) , upright(bold(y))), norm(upright(bold(y)))_1) $
]

#def[
Two vector norms $norm(dot.op)_a$ and $norm(dot.op)_b$ are said to be equivalent if there exist two positive constants $mu$ and $M$ such that

$ mu norm(upright(bold(x)))_a lt.eq norm(upright(bold(x)))_b lt.eq M norm(upright(bold(x)))_a quad forall upright(bold(x)) in bb(R)^n . $
]

#thm[
Any two vector norms in $bb(R)^n$ are equivalent.
]

#prf[
It suffices to show that any vector norm $norm(dot.op)$ is equivalent to the maximum norm $norm(dot.op)_oo$ . First of all, we let

$ B = {upright(bold(x)) in bb(R)^n : norm(upright(bold(x)))_oo = 1} $

be the unit sphere associated with the maximum norm. We know that the unit sphere $upright(bold(B))$ is bounded and closed. We treat the norm $norm(upright(bold(x)))$ as a function of $upright(bold(x)) = (x_1 , x_2 , dots.h.c , x_n)^(upright(T)) in bb(R)^n$ . We can verify that the function $f (x_1 , x_2 , dots.h.c , x_n) = f (upright(bold(x))) = norm(upright(bold(x)))$ is continuous. The continuous function $f (upright(bold(x)))$ reaches its maximum and minimum values on the bounded and closed set $upright(bold(B))$ . Let $mu$ and $M$ be, respectively, the minimum and maximum values of $f (upright(bold(x)))$ on $upright(bold(B))$ . That is,

$ mu lt.eq f (upright(bold(x))) lt.eq M quad forall upright(bold(x)) in B . $

It is obvious that $M gt.eq mu gt.eq 0$ . We need to show that $mu > 0$ . If $mu = 0$ , we have a vector $upright(bold(x))^(\*) in B$ such that $norm(upright(bold(x))^(\*)) = f (upright(bold(x))^(\*)) = 0$ . By the positivity property of a vector norm, we see $upright(bold(x))^(\*) = 0$ . This implies that $norm(upright(bold(x))^(\*))_oo = 0$ . However, $upright(bold(x))^(\*)$ is on the unit sphere. We should have $norm(upright(bold(x))^(\*))_oo = 1$ . It is a contradiction. Finally, for any vector $upright(bold(z)) in bb(R)^n$ ,let $upright(bold(x)) = upright(bold(z)) \/ norm(upright(bold(z)))_oo$ . The vector $upright(bold(x))$ is on the unit sphere. We have

$ mu lt.eq f (upright(bold(x))) = f (upright(bold(z)) \/ norm(upright(bold(z)))_oo) lt.eq M . $

By the homogeneity property of a vector norm, we get

$ mu lt.eq frac(norm(upright(bold(z))), norm(upright(bold(z)))_oo) lt.eq M $

and

$ mu norm(upright(bold(z)))_oo lt.eq norm(upright(bold(z))) lt.eq M norm(upright(bold(z)))_oo $
]

#prp[
For $upright(bold(x)) in bb(R)^n$ , we have the following inequalities

$ norm(upright(bold(x)))_oo lt.eq norm(upright(bold(x)))_1 lt.eq n norm(upright(bold(x)))_oo $<eq:4>

$ norm(upright(bold(x)))_oo lt.eq norm(upright(bold(x)))_2 lt.eq sqrt(n) norm(upright(bold(x)))_oo $<eq:5>

$ norm(upright(bold(x)))_2 lt.eq norm(upright(bold(x)))_1 lt.eq sqrt(n) norm(upright(bold(x)))_2 $<eq:6>
]


= Matrix Norm
<matrix-norm>

A matrix norm $norm(dot.op)$ is characterized by the following four properties:

- positivity

$ norm(upright(bold(A))) gt.eq 0 quad forall upright(bold(A)) in bb(R)^(n times n) quad "and" quad norm(upright(bold(A))) = 0 quad upright(" iff ") quad upright(bold(A)) = 0 ; $

- homogeneity

$ norm(alpha upright(bold(A))) = lr(|alpha|) norm(upright(bold(A))) quad forall alpha in bb(R) , upright(bold(A)) in bb(R)^(n times n) ; $

- triangle inequality

$ norm(upright(bold(A)) + upright(bold(B))) lt.eq norm(upright(bold(A))) + norm(upright(bold(B))) quad forall upright(bold(A)) , upright(bold(B)) in bb(R)^(n times n) ; $

- sub-multiplicativity

$ norm(upright(bold(A B))) lt.eq norm(upright(bold(A))) norm(upright(bold(B))) quad upright(" for ") upright(bold(A)) , upright(bold(B)) in bb(R)^(n times n) . $

#def[
The Frobenius norm of a matrix $upright(bold(A)) = (a_(i , j))_(n times n) in bb(R)^(n times n)$ is defined by

$ norm(upright(bold(A)))_F equiv (sum_(i = 1)^n sum_(j = 1)^n a_(i , j)^2)^(1 \/ 2) = ["trace" (upright(bold(A)) upright(bold(A))^T)]^(1 \/ 2) . $

By the definition,the Frobenius norm of an orthogonal matrix $upright(bold(A))$ is equal to $sqrt(n)$ .
]

#prp[
The Frobenius norm of a matrix $upright(bold(A)) in bb(R)^(n times n)$ can be computed by

$ norm(upright(bold(A)))_F = sqrt(sigma_1^2 + sigma_2^2 + dots.h.c + sigma_n^2) $

Here, $sigma_1 , sigma_2 , dots.h.c , sigma_n$ are the singular values of $upright(bold(A))$ .
]

#def[
For $upright(bold(A)) in bb(R)^(n times n)$ , we define an induced matrix norm by

$ norm(upright(bold(A))) equiv sup_(upright(bold(x)) in bb(R)^n\
upright(bold(x)) eq.not 0) frac(norm(upright(bold(A)) upright(bold(x))), norm(upright(bold(x)))) $
]

#prp[
In an induced matrix norm, we have

$ norm(upright(bold(A x))) lt.eq norm(upright(bold(A))) norm(upright(bold(x))) , quad upright(bold(A)) in bb(R)^(n times n) , upright(bold(x)) in bb(R)^n . $<eq:7>

An induced matrix norm is induced by a vector norm. We also say an induced matrix norm is a matrix norm subordinate to the associated vector norm.
]

The induced matrix norms associated with the $ell^oo - , ell^2 -$ and $ell^1$ -norms are respectively given by

$ norm(upright(bold(A)))_oo equiv sup_(upright(bold(x)) in bb(R)^n\
upright(bold(x)) eq.not 0) frac(norm(upright(bold(A)) upright(bold(x)))_oo, norm(upright(bold(x)))_oo) , quad norm(upright(bold(A)))_2 equiv sup_(upright(bold(x)) in bb(R)^n\
upright(bold(x)) eq.not 0) frac(norm(upright(bold(A)) upright(bold(x)))_2, norm(upright(bold(x)))_2) quad "and" quad norm(upright(bold(A)))_1 equiv sup_(upright(bold(x)) in bb(R)^n\
upright(bold(x)) eq.not 0) frac(norm(upright(bold(A)) upright(bold(x)))_1, norm(upright(bold(x)))_1) . $

#prp[
For $upright(bold(A)) in bb(R)^(n times n)$ , we have

$ norm(upright(bold(A)))_2^2 lt.eq norm(upright(bold(A)))_1 norm(upright(bold(A)))_oo $
]

#prf[
$ norm(upright(bold(A)))_2^2 = rho (upright(bold(A))^(upright(T)) upright(bold(A))) lt.eq norm(upright(bold(A))^(upright(T)) upright(bold(A)))_oo lt.eq norm(upright(bold(A))^(upright(T)))_oo norm(upright(bold(A)))_oo = norm(upright(bold(A)))_1 norm(upright(bold(A)))_oo . $
]

The induced matrix norm defined above does not give us an explicit expression/formula. We may wonder if there are alternative ways to compute an induced matrix norm. The answer is yes at least for some induced matrix norms.

#prp[
The induced matrix norm of $upright(bold(A)) in bb(R)^(n times n)$ associated with the $ell^oo$ -norm can be computed by

$ norm(upright(bold(A)))_oo = max_(1 lt.eq i lt.eq n) sum_(j = 1)^n lr(|a_(i , j)|) . $<eq:8>
]

#prf[
Let $upright(bold(x)) in bb(R)^n$ be a vector. By the definition of the $ell^oo$ -norm for a vector, we have

$ norm(upright(bold(A x)))_oo = max_(1 lt.eq i lt.eq n) lr(|sum_(j = 1)^n a_(i , j) x_j|) lt.eq max_(1 lt.eq i lt.eq n) sum_(j = 1)^n lr(|a_(i , j)|) lr(|x_j|) lt.eq norm(upright(bold(x)))_oo max_(1 lt.eq i lt.eq n) sum_(j = 1)^n lr(|a_(i , j)|) $

and

$ frac(norm(upright(bold(A x)))_oo, norm(upright(bold(x)))_oo) lt.eq max_(1 lt.eq i lt.eq n) sum_(j = 1)^n lr(|a_(i , j)|) $

Since the inequality above holds for any non-zero vector $upright(bold(x)) in bb(R)^n$ , we see that

$ norm(upright(bold(A)))_oo lt.eq max_(1 lt.eq i lt.eq n) sum_(j = 1)^n lr(|a_(i , j)|) $<eq:9>

In the next, we will show that there exists a vector $upright(bold(z)) in bb(R)^n$ such that

$ frac(norm(upright(bold(A z)))_oo, norm(upright(bold(z)))_oo) gt.eq max_(1 lt.eq i lt.eq n) sum_(j = 1)^n lr(|a_(i , j)|) $

Let $k$ be the index such that

$ sum_(j = 1)^n lr(|a_(k , j)|) = max_(1 lt.eq i lt.eq n) sum_(j = 1)^n lr(|a_(i , j)|) $

and $upright(bold(z)) = (z_1 , z_2 , dots.h.c , z_n)^(upright(T))$ be the vector given by

$ z_j = cases(1 & "if" a_(k , j) gt.eq 0 \, ,
- 1 & "if" a_(k , j) < 0)  $

It is obvious that $norm(upright(bold(z)))_oo = 1$ . We also see that the $k^(t h)$ entry of the vector $upright(bold(A z))$ reads

$ (upright(bold(A z)))_k = sum_(j = 1)^n a_(k , j) z_j = sum_(j = 1)^n lr(|a_(k , j)|) . $

Then we have

$ norm(upright(bold(A z)))_oo gt.eq lr(|(upright(bold(A z)))_k|) = sum_(j = 1)^n lr(|a_(k , j)|) . $

This indicates

$ norm(upright(bold(A)))_oo equiv sup_(upright(bold(x)) eq.not 0) frac(norm(upright(bold(A x)))_oo, norm(upright(bold(x)))_oo) gt.eq frac(norm(upright(bold(A z)))_oo, norm(upright(bold(z)))_oo) gt.eq sum_(j = 1)^n lr(|a_(k , j)|) . $<eq:10>

Thus, by combining (@eq:9)-(@eq:10), we completed the proof.
]

#prp[
The induced matrix norm of $upright(bold(A)) in bb(R)^(n times n)$ associated with the $ell^1$ -norm can be computed by

$ norm(upright(bold(A)))_1 = max_(1 lt.eq j lt.eq n) sum_(i = 1)^n lr(|a_(i , j)|) . $
]

#prp[
The induced matrix norm of $upright(bold(A)) in bb(R)^(n times n)$ associated with the $ell^2$ -norm can be computed by

$ norm(upright(bold(A)))_2 = sigma_max (upright(bold(A))) $

Here, $sigma_max (upright(bold(A)))$ is the maximum singular value of $upright(bold(A))$ .
]
