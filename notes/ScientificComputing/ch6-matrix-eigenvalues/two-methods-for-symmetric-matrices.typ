#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(8)
#set heading(numbering: "1.1.1")

// 上一节编号到 32
#counter(math.equation).update(32)

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

= Two methods for symmetric matrices
<two-methods-for-symmetric-matrices>
== The Jacobi method
<the-jacobi-method>
The Jacobi method for symmetric matrices works with the Givens transform so that the transformed matrix has a smaller sum of squares of the non-diagonal entries. The Jacobi method iterates until the matrix becomes a diagonal matrix.

$ Psi (upright(bold(A))) = sum_(i eq.not j) a_(i , j)^2 $

$ Psi (upright(bold(A))_(k + 1)) = Psi (upright(bold(A))_k) - 2 (a_(p , q)^((k)))^2 lt.eq Psi (upright(bold(A))_k) . $

The cyclic Jacobi method converges quadratically.

$ mat(delim: "(", a_0, b_0, , ; b_0, a_1, b_1, ; #none, b_1, a_2, b_2; #none, , b_2, a_3) $

$ & mat(delim: "(", c, s; - s, c) mat(delim: "(", a_1, b_1; b_1, a_2) mat(delim: "(", c, - s; s, c) \
=& mat(delim: "(", a_1 c^2 + 2 b_1 c s + a_2 s^2, (c^2 - s^2) b_1 + (a_2 - a_1) c s; (c^2 - s^2) b_1 + (a_2 - a_1) c s, a_1 s^2 - 2 b_1 c s + a_2 c^2) $

We will choose $c = cos (theta)$ and $s = sin (theta)$ such that

$ (c^2 - s^2) b_1 + (a_2 - a_1) c s = 0 $

i.e.,

$ 2 b_1 cos (2 theta) + (a_2 - a_1) sin (2 theta) = 0 . $

Let

$ rho = sqrt((a_2 - a_1)^2 + 4 b_1^2) $

and

$ cases(
  cos (2 theta) = frac(a_1 - a_2, rho) ,\
  sin (2 theta) = frac(2 b_1, rho)
 ) $

== The bisection method
<the-bisection-method>
We will introduce the bisection method for computing the eigenvalues of a symmetric tridiagonal matrix.

Let

$ upright(bold(A))_k = mat(delim: "(", a_1, b_1, , , ; b_1, a_2, b_2, , ; #none, dots.down, dots.down, dots.down, ; #none, , b_(k - 2), a_(k - 1), b_(k - 1); #none, , , b_(k - 1), a_k) $

for $k = 1 , 2 , dots.h.c , n$ . Assume that

$ b_j eq.not 0 quad "for" j in { 1 , 2 , dots.h.c , n - 1 } . $

Otherwise, we can find the eigenvalues of matrix A block by block since it is reducible.

We consider the characteristic polynomial

$ P_k (lambda) = det (upright(bold(A))_k - lambda upright(bold(I))_k) = lr(|upright(bold(A))_k - lambda upright(bold(I))_k|) = mat(delim: "|", a_1 - lambda, b_1, , , , ; b_1, a_2 - lambda, b_2, , , ; #none, dots.down, dots.down, dots.down, , ; #none, , b_(k - 2), a_(k - 1) - lambda, b_(k - 1), ; #none, , , , b_(k - 1), a_k - lambda) . $

Assume that $P_(- 1) (lambda) = 0$ and $P_0 (lambda) = 1$ . It is easy to see that the characteristic polynomials satisfy the following three-term recursion

$ P_(k + 1) (lambda) = (a_(k + 1) - lambda) P_k (lambda) - b_k^2 P_(k - 1) (lambda) $

for $k = 0 , 1 , dots.h.c , n - 1$ .

We know each polynomial $P_k (lambda)$ has $k$ real roots as the corresponding symmetric matrix $upright(bold(A))_k$ has $k$ real eigenvalues. We denote the roots of $P_k (lambda)$ by $lambda_j^((k))$ for $j = 1 , 2 , dots.h.c , k$ and assume that

$ lambda_k^((k)) lt.eq lambda_(k - 1)^((k)) lt.eq dots.h.c lt.eq lambda_2^((k)) lt.eq lambda_1^((k)) $

Later we will see that all of the eigenvalues are distinct.

First, we have the following two propositions.

#prp[
Two consecutive polynomials can not share the same root. In other words,

$ lambda_i^((k)) eq.not lambda_j^((k + 1)) #h(0em) forall i , j . $
]

#prf[
We will prove the proposition by contradiction. Assume $lambda$ is a root of both $P_(k + 1) (lambda)$ and $P_k (lambda)$ . Then by the three-term recursion formula it must also be a root of $P_(k - 1) (lambda)$ . Furthermore, it must be a root shared by all polynomials $P_j (lambda)$ while we know that $P_1 (lambda)$ has only one root $lambda_1^((1)) = a_1$ and $P_2 (lambda)$ has two roots different from $a_1$ :

$ lambda_1^((2)) > max {a_1 , a_2} gt.eq a_1 #h(0em) upright(" and ") #h(0em) lambda_2^((2)) < min {a_1 , a_2} lt.eq a_1 . $

This is a contradiction.
]

#prp[
The values of $P_(k + 1) (lambda)$ and $P_(k - 1) (lambda)$ at $lambda = lambda_j^((k))$ must have opposite signs.
]


The proof of this proposition simply follows the relation

$ P_(k + 1) (lambda_j^((k))) = - b_k^2 P_(k - 1) (lambda_j^((k))) . $

Now we are ready to prove the following theorem.

Figure 1: Interleaving eigenvalues and signs of the characteristic polynomials

#thm[
The roots of two consecutive polynomials $P_k (lambda)$ and $P_(k + 1) (lambda)$ interlace in the following way

$ lambda_(k + 1)^((k + 1)) < lambda_k^((k)) < lambda_k^((k + 1)) < lambda_(k - 1)^((k)) < dots.h.c < lambda_2^((k + 1)) < lambda_1^((k)) < lambda_1^((k + 1)) . $

In words, the minimum root of $P_(k + 1) (lambda)$ is strictly less than the minimum root of $P_k (lambda)$ . The maximum root of $P_(k + 1) (lambda)$ is strictly greater than the maximum root of $P_k (lambda)$ . There is a unique root of $P_(k + 1) (lambda)$ between any two consecutive roots of $P_k (lambda)$ . There is a unique root of $P_k (lambda)$ between any two consecutive roots of $P_(k + 1) (lambda)$ .
]

#prf[
Let $b_(- 1) = 0$ . Let $mu$ be a number less than $min_k {a_k - lr(|b_k|) - lr(|b_(k - 1)|)}$ and $M$ be a number greater than $max_k {a_k + lr(|b_k|) + lr(|b_(k - 1)|)}$ . By the Gerschgorin theorem, the eigenvalues of matrix $upright(bold(A))_n$ as well as other matrices $upright(bold(A))_k$ all lie in the interval $(mu , M)$ . It is straightforward to check that at $lambda = mu$ , all polynomials $P_k (lambda)$ have positive signs, i.e., $"sign" (P_k (mu)) = 1$ while at $lambda = M$ , the values of $P_k (lambda)$ alternate their signs as $k$ increases from 1 to $n$ (none of two consecutive values have the same sign). More specifically, we have $"sign" (P_k (M)) = (- 1)^k$ .

For $k = 1$ , it is easy to see the validity of the inequalities. We will prove the theorem by induction. Assume the inequalities hold for $j = 1 , 2 , dots.h.c , k - 1$ .

First, we will show that polynomial $P_(k + 1) (lambda)$ has a root in interval $(lambda_1^((k)) , M)$ . By induction $P_(k - 1) (lambda_1^((k)))$ has the same sign as $P_(k - 1) (M)$ (since all roots of $P_(k - 1) (lambda)$ are less than $lambda_1^((k))$ ) while $P_(k + 1) (lambda_1^((k)))$ has

an opposite sign against $P_(k - 1) (lambda_1^((k)))$ . So we see that $P_(k + 1) (lambda_1^((k)))$ and $P_(k - 1) (M)$ have opposite signs. In addition, as we know $P_(k - 1) (M)$ and $P_(k + 1) (M)$ have the same sign. We conclude that $P_(k + 1) (lambda)$ changes sign in interval $(lambda_1^((k)) , M)$ . Thus polynomial $P_(k + 1) (lambda)$ has a root there.

Next, we will show that polynomial $P_(k + 1) (lambda)$ has a root in interval $(mu , lambda_k^((k)))$ . By induction $P_(k - 1) (lambda_k^((k)))$ has the same sign as $P_(k - 1) (mu)$ (since all roots of $P_(k - 1) (lambda)$ are greater than $lambda_k^((k))$ ) while $P_(k + 1) (lambda_k^((k)))$ has an opposite sign against $P_(k - 1) (lambda_k^((k)))$ . So we see that $P_(k + 1) (lambda_k^((k)))$ and $P_(k - 1) (mu)$ have opposite signs. In addition, as we know $P_(k - 1) (mu)$ and $P_(k + 1) (mu)$ have the same sign. We conclude that $P_(k + 1) (lambda)$ changes sign in interval $(mu , lambda_k^((k)))$ . Thus polynomial $P_(k + 1) (lambda)$ has a root here, too.

Last, we will show that polynomial $P_(k + 1) (lambda)$ has a root in interval $(lambda_(j + 1)^((k)) , lambda_j^((k)))$ for each $j in$ ${ 1 , 2 , dots.h.c , k - 1 }$ . For each $j in { 1 , 2 , dots.h.c , k - 1 }$ , by induction, there is a unique root of $P_(k - 1) (lambda)$ in interval $(lambda_(j + 1)^((k)) , lambda_j^((k)))$ . This means that the pair, $P_(k - 1) (lambda_(j + 1)^((k)))$ and $P_(k - 1) (lambda_j^((k)))$ , have opposite signs while we know that $P_(k + 1) (lambda_(j + 1)^((k)))$ has a sign opposite to $P_(k - 1) (lambda_(j + 1)^((k)))$ and $P_(k + 1) (lambda_j^((k)))$ has a sign opposite to $P_(k - 1) (lambda_j^((k)))$ . So we see that the pair, $P_(k + 1) (lambda_(j + 1)^((k)))$ and $P_(k + 1) (lambda_j^((k)))$ , also have opposite signs. This indicates that polynomial $P_(k + 1) (lambda)$ has a root in interval $(lambda_(j + 1)^((k)) , lambda_j^((k)))$ .

Now we see that polynomial $P_(k + 1) (lambda)$ has a root in each of the $(k + 1)$ intervals. As the polynomial has at most $(k + 1)$ distinct roots, it has exactly one root in each interval below:

$ (mu , lambda_k^((k))) , (lambda_k^((k)) , lambda_(k - 1)^((k))) , dots.h.c , (lambda_2^((k)) , lambda_1^((k))) , (lambda_k^((k)) , M) . $
]

Let $P_0 (lambda) = 1$ . Now we introduce a sequence

$ {P_0 (lambda) , P_1 (lambda) , dots.h.c , P_n (lambda)} $

which is called the Sturm sequence.

In the sequence, if $P_k (lambda) = 0$ , we assume that $P_(k - 1) (lambda)$ and $P_k (lambda)$ have the same sign while $P_k (lambda)$ and $P_(k + 1) (lambda)$ have opposite signs. For each given $lambda$ , let $S_n (lambda)$ be the times that two consecutive numbers in the Sturm sequence have the same sign. We call $S_n (lambda)$ as the Sturm function.

For $lambda > M$ , we have $S_n (lambda) = 0$ since $"sign" (P_k (lambda)) = (- 1)^k$ . For $lambda < mu$ , we have $S_n (lambda) = n$ since $"sign" (P_k (lambda)) = 1$ for all $k in { 0 , 1 , dots.h.c , n }$ .

We can compute the values of $S_n (lambda)$ in different ways.

One way is to use the relation between $S_(k - 1) (lambda)$ and $S_k (lambda)$ . We will have

$ S_k (lambda) = cases(delim: "{", S_(k - 1) (lambda) & upright(" if ") P_k (lambda) upright(" and ") P_(k - 1) (lambda) upright(" have opposite signs "), S_(k - 1) (lambda) + 1 & upright(" if ") P_k (lambda) upright(" and ") P_(k - 1) (lambda) upright(" have the same sign ")) $

We can prove by induction that

$ S_k (lambda) = 0 quad "if" lambda in (lambda_1^((k)) , M) $<eq:33>

$ S_k (lambda) = j quad "if" lambda in lr((lambda_(j + 1)^((k)) , lambda_j^((k))]) quad "for" j = 1 , 2 , dots.h.c , k - 1 $<eq:34>

and

$ S_k (lambda) = k quad "if" lambda in lr((mu , lambda_k^((k))]) $<eq:35>

In particular, we have

$ S_k (lambda_j^((k))) = j quad "for" j = 1 , 2 , dots.h.c , k . $

Another way is to show that the Sturm function $S_k (lambda)$ is a decreasing function of $lambda$ ; it changes its value only at the roots (the eigenvalues); it reduces its value exactly by one at each root.

As a matter of fact, first we can show that, within each interval $(lambda_(j + 1)^((k)) , lambda_j^((k)))$ for $j = 1 , 2 , dots.h.c , k - 1$ , the Sturm function never changes its value. Note that within each interval $(lambda_(j + 1)^((k)) , lambda_j^((k)))$ the Sturm function $S_k (lambda)$ may change its value only when it goes across a root of a polynomial of lower degree. But this will never happen since around any root $lambda_i^((ell))$ with $ell < k$ the pair $P_(ell - 1) (lambda)$ and $P_(ell + 1) (lambda)$ always have opposite signs and the polynomial $P_ell (lambda)$ will have the same sign as exactly one of them, which means that the Sturm function $S (lambda)$ has the same value on both sides of $lambda_i^((ell))$ .

Moreover, we can check that the polynomials $P_k (lambda)$ and $P_(k - 1) (lambda)$ always have the same sign on the left side of a root $lambda_j^((k))$ while they always have opposite signs on the right side. This implies that

the Sturm function $S_n (lambda)$ reduces its value by one as $lambda$ goes across a root of the polynomial from left to right.

By the properties (@eq:33)-(@eq:35) that the Sturm function has, we can apply the bisection method to locate the roots of $P_n (lambda)$ , the eigenvalues of the symmetric tridiagonal matrix.