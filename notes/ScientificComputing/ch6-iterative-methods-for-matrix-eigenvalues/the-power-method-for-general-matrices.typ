#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(0)
#set heading(numbering: "1.1.1")

// 上一节编号到 0
#counter(math.equation).update(0)

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

= The power method for general matrices
<the-power-method-for-general-matrices>
For simplicity, we first assume that real matrix $upright(bold(A)) in bb(R)^(n times n)$ has $n$ eigenvectors $upright(bold(v))_1 , upright(bold(v))_2 , dots.h.c , upright(bold(v))_n$ with the associated eigenvalues $lambda_1 , lambda_2 , dots.h.c , lambda_n$ , respectively.

Then assume that all of the eigenvectors have been normalized so that the maximum norm of every eigenvector is equal to one, i.e., $norm(upright(bold(v))_j)_oo = 1$ , for $j in { 1 , 2 , dots.h.c , n }$ .

We also assume that

$ abs(lambda_1) > abs(lambda_2) gt.eq dots.h.c gt.eq abs(lambda_n) . $

That is, the first eigenvalue $lambda_1$ has the maximum modulus. Since the matrix $upright(bold(A))$ is real and $abs(lambda_1) > abs(lambda_j), j>1$, the first eigenvalue must be a real number.

Let $upright(bold(x))_0$ be a given vector, which has the decomposition

$ upright(bold(x))_0 = alpha_1 upright(bold(v))_1 + alpha_2 upright(bold(v))_2 + dots.h.c + alpha_n upright(bold(v))_n $

in terms of the eigenvectors. Assume that $alpha_1 eq.not 0$ . Now if we multiply vector $upright(bold(x))_0$ by the $k^(t h)$ power of matrix $upright(bold(A))$ for each integer $k > 0$ , we will get a sequence of vectors ${upright(bold(A))^k upright(bold(x))_0}_(k = 1)^oo$ . Based on our assumption, we have

$
upright(bold(A))^k upright(bold(x))_0 &= alpha_1 lambda_1^k upright(bold(v))_1 + alpha_2 lambda_2^k upright(bold(v))_2 + dots.h.c + alpha_n lambda_n^k upright(bold(v))_n , \
&= lambda_1^k [alpha_1 upright(bold(v))_1 + sum_(j = 2)^n alpha_j (lambda_j / lambda_1)^k upright(bold(v))_j] .
$

It is obvious that the sequence of vectors ${upright(bold(A))^k upright(bold(x))_0}_(k = 1)^oo$ will blow up if $abs(lambda_1) > 1$ or decay to zero if $abs(lambda_1) < 1$ . It converges to a non-zero vector if and only if $lambda_1 = 1$ (By our assumption on the eigenvalues of the real matrix, the first eigenvalue must be a real number). Otherwise, if $lambda_1 = - 1$ , the sequence oscillates between two vectors: $upright(bold(v))_1$ and $- upright(bold(v))_1$ .

For the sequence to converge to a non-zero vector for the general case $lambda_1 eq.not 1$ , we re-normalize the vector $upright(bold(A))^k upright(bold(x))_0$ for each $k$ . Let

$ upright(bold(x))_k = 1 / s_k upright(bold(A))^k upright(bold(x))_0 $

with the scalar $s_k eq.not 0$ be chosen such that the maximum norm of vector $upright(bold(x))_k$ is equal to one, i.e., $norm(upright(bold(x))_k)_oo = 1$ . Then the new sequence of vectors ${upright(bold(x))_k}_(k = 1)^oo$ will never blow up or decay to zero. Moreover, note that we have two choices for $s_k$ : either $s_k = norm(upright(bold(A))^k upright(bold(x))_0)_oo$ or $s_k = - norm(upright(bold(A))^k upright(bold(x))_0)_oo$ . One choice leads to a convergent sequence of vectors and another one leads to a sign-alternating sequence of vectors. To generate a convergent sequence, we choose $s_k$ such that the first modulus-maximum entry of $upright(bold(x))_k$ is equal to one. We also notice that

$ upright(bold(x))_k = lambda_1^k / s_k [alpha_1 upright(bold(v))_1 + alpha_2 (lambda_2 / lambda_1)^k upright(bold(v))_2 + dots.h.c + alpha_n (lambda_n / lambda_1)^k upright(bold(v))_n] $

or

$ frac(s_k, alpha_1 lambda_1^k) upright(bold(x))_k = upright(bold(v))_1 + alpha_2 / alpha_1 (lambda_2 / lambda_1)^k upright(bold(v))_2 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k upright(bold(v))_n . $<eq:1>

The terms except the first one on the right hand side of the identity above will all converge to zero as $k$ tends to infinity since

$ abs(lambda_j / lambda_1) < 1 quad "for" j = 2 , dots.h.c , n . $

From (@eq:1), we see

$
&lim_(k arrow.r oo) abs(s_k) / abs(alpha_1 lambda_1^k) = lim_(k arrow.r oo) abs(s_k) / abs(alpha_1 lambda_1^k) norm(upright(bold(x))_k)_oo \
&= lim_(k arrow.r oo) norm(upright(bold(v))_1 + alpha_2 / alpha_1 (lambda_2 / lambda_1)^k upright(bold(v))_2 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k upright(bold(v))_n)_oo = norm(upright(bold(v))_1)_oo = 1 ,
$

i.e.,

$ lim_(k arrow.r oo) abs(s_k) / abs(alpha_1 lambda_1^k) = 1 , $<eq:2>

and in particular, for large $k$ ,

$ abs(s_k) approx abs(alpha_1 lambda_1^k) . $<eq:3>

In addition, we assume the components of $upright(bold(v))_1$ which reach the maximum modulus all have the same sign or the eigenvector $upright(bold(v))_1$ has only one single component which reachs the maximum modulus. By the selection of $s_k$ , we may conclude that, for sufficiently large $k$ , the first modulus-maximum entry of $upright(bold(x))_k$ will have the same sign as the corresponding entry of $upright(bold(v))_1$ . This means that $s_k$ and $alpha_1 lambda_1^k$ have the same sign for large $k$ . Furthermore, from (@eq:2)-(@eq:3), we get

$ lim_(k arrow.r oo) frac(alpha_1 lambda_1^k, s_k) = 1 $

and

$ s_k approx alpha_1 lambda_1^k quad "for large" k . $

This indicates that

$
lim_(k arrow.r oo) upright(bold(x))_k &= lim_(k arrow.r oo) {frac(alpha_1 lambda_1^k, s_k) [upright(bold(v))_1 + alpha_2 / alpha_1 (lambda_2 / lambda_1)^k upright(bold(v))_2 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k upright(bold(v))_n]} \
&= (lim_(k arrow.r oo) frac(alpha_1 lambda_1^k, s_k)) lim_(k arrow.r oo) [upright(bold(v))_1 + alpha_2 / alpha_1 (lambda_2 / lambda_1)^k upright(bold(v))_2 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k upright(bold(v))_n] = upright(bold(v))_1
$<eq:4>

and

$ upright(bold(x))_k approx upright(bold(v))_1 + [alpha_2 / alpha_1 (lambda_2 / lambda_1)^k upright(bold(v))_2 + alpha_3 / alpha_1 (lambda_3 / lambda_1)^k upright(bold(v))_3 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k upright(bold(v))_n] $<eq:5>

for large $k$ . Moreover, we obtain the error estimate

$ norm(upright(bold(x))_k - upright(bold(v))_1)_oo lt.tilde [abs(alpha_2) / abs(alpha_1) + abs(alpha_3) / abs(alpha_1) + dots.h.c + abs(alpha_n) / abs(alpha_1)] (abs(lambda_2) / abs(lambda_1))^k . $<eq:6>

The approximation (@eq:5) also implies that there exists a non-zero vector $upright(bold(w))_k in bb(R)^n$ such that

$ upright(bold(x))_k - upright(bold(v))_1 approx (lambda_2 / lambda_1)^k upright(bold(w))_k $

for large $k$ . In the case that

$ abs(lambda_2) > abs(lambda_3) , $

the vector $upright(bold(w))_k$ can be chosen to be independent of $k$ and

$ upright(bold(x))_(k + 1) - upright(bold(v))_1 approx lambda_2 / lambda_1 (upright(bold(x))_k - upright(bold(v))_1) $<eq:7>

for large $k$ .

To avoid repeatedly computing powers of the matrix $upright(bold(A))$ , the practical power method generates the sequence ${upright(bold(x))_k}_(k = 1)^oo$ by iteration. It has the form, for $k = 0 , 1 , 2 , dots.h.c$ ,

- Step 1. compute the matrix-vector product: $upright(bold(z))_(k + 1) = upright(bold(A)) upright(bold(x))_k$ ;

- Step 2. normalize vector $upright(bold(z))_(k + 1)$ : choose $r_(k + 1)$ such that the first modulus-maximum entry of vector

  $ upright(bold(x))_(k + 1) = 1 / r_(k + 1) upright(bold(z))_(k + 1) $

  is equal to one. Increase $k$ by one and go to step 1 unless that $norm(upright(bold(x))_(k + 1) - upright(bold(x))_k)_oo$ is less than a specified tolerance.

As

$ lim_(k arrow.r oo) upright(bold(x))_k = upright(bold(v))_1 , $

we see that

$ upright(bold(A)) upright(bold(v))_1 = (lim_(k arrow.r oo) r_k) upright(bold(v))_1 . $

The limit of the sequence of scalars ${r_k}_(k = 1)^oo$ is the modulus-maximum eigenvalue, i.e.,

$ lambda_1 = lim_(k arrow.r oo) r_k . $

To see the convergence rate of $r_k$ to $lambda_1$ , we start with the approximation (@eq:5). Multiplying (@eq:5) by $upright(bold(A))$ gives us

$ upright(bold(A)) upright(bold(x))_k approx lambda_1 upright(bold(v))_1 + [alpha_2 / alpha_1 (lambda_2 / lambda_1)^k lambda_2 upright(bold(v))_2 + alpha_3 / alpha_1 (lambda_3 / lambda_1)^k lambda_3 upright(bold(v))_3 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k lambda_n upright(bold(v))_n] . $

Using the fact

$ r_(k + 1) upright(bold(v))_1 approx r_(k + 1) upright(bold(x))_(k + 1) = upright(bold(z))_(k + 1) = upright(bold(A)) upright(bold(x))_k , $

we further get

$ r_(k + 1) upright(bold(v))_1 approx lambda_1 upright(bold(v))_1 + [alpha_2 / alpha_1 (lambda_2 / lambda_1)^k lambda_2 upright(bold(v))_2 + alpha_3 / alpha_1 (lambda_3 / lambda_1)^k lambda_3 upright(bold(v))_3 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k lambda_n upright(bold(v))_n] . $<eq:8>

This indicates

$ abs(r_(k + 1) - lambda_1) lt.tilde [abs(alpha_2) / abs(alpha_1) abs(lambda_2) + abs(alpha_3) / abs(alpha_1) abs(lambda_3) + dots.h.c + abs(alpha_n) / abs(alpha_1) abs(lambda_n)] (abs(lambda_2) / abs(lambda_1))^k . $

In the case that $abs(lambda_2) > abs(lambda_3)$ , from approximation (@eq:8), we see that there exists a vector $upright(bold(w)) in bb(R)^n$ such

that

$ (r_(k + 1) - lambda_1) upright(bold(v))_1 approx (lambda_2 / lambda_1)^k upright(bold(w)) $

for large $k$ . The sequence of scalars ${r_k}_(k = 1)^oo$ converges linearly to $lambda_1$ .

#exr[
Let
$
upright(bold(A))_n = mat(delim: "[", 2, - 1, , , ; - 1, 2, - 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 2, - 1; #none, , , - 1, 2)_(n times n) .
$
Write a computer program to find the modulus-maximum eigenvalue of the matrxi $upright(bold(A))_n$ with the standard power method.
]

#exr[
Let

$ upright(bold(A))_n = 1 / (n + 1)^3 mat(delim: "[", n, n - 1, n - 2, dots.h.c, 2, 1; n - 1, 2 (n - 1), 2 (n - 2), dots.h.c, 4, 2; n - 2, 2 (n - 2), 3 (n - 2), dots.down, 6, 3; dots.v, dots.v, dots.down, dots.down, dots.v, dots.v; 2, 4, 6, dots.h.c, 2 (n - 1), n - 1; 1, 2, 3, dots.h.c, n - 1, n)_(n times n) . $

Write a computer program to find the modulus-maximum eigenvalue of the matrxi $upright(bold(A))_n$ with the standard power method.
]

#rmk[
In the case that there are multiple eigenvalues with equal moduli, the sequence of vectors ${upright(bold(x))_k}_(k = 1)^oo$ generated by the power method may not be able to converge. For example, assume that the first two eigenvalues $lambda_1$ and $lambda_2$ have the same moduli and they are complex conjugate while

$abs(lambda_1) = abs(lambda_2) > abs(lambda_3)$ . Assume that $lambda_1 = rho e^(i theta)$ and $lambda_2 = rho e^(- i theta)$ with $rho = abs(lambda_1)$ and $theta in (0 , pi)$ . We have

$ upright(bold(x))_k = 1 / s_k upright(bold(A))^k upright(bold(x))_0 approx rho^k / s_k [alpha_1 e^(i k theta) upright(bold(v))_1 + alpha_2 e^(- i k theta) upright(bold(v))_2] $

for large $k$ . The vector on the right hand side depends on $k$ and will never converge.
]

#rmk[
Apply the power method to find the maximum eigenvalue of the matrix

$ upright(bold(A)) = 1 / 8 mat(delim: "[", 5, - 1, 1, - 1; - 1, 5, - 1, 1; 1, - 1, 5, - 1; - 1, 1, - 1, 5) $

Note that

$ upright(bold(A)) = upright(bold(P D P))^(- 1) = upright(bold(P D P)) $

with

$ upright(bold(P)) = 1 / 2 mat(delim: "[", 1, 1, 1, 1; 1, 1, - 1, - 1; 1, - 1, - 1, 1; 1, - 1, 1, - 1) #h(0em) upright(" and ") #h(0em) upright(bold(D)) = 1 / 2 mat(delim: "[", 1, , , ; #none, 1, , ; #none, , 1, ; #none, , , 1) . $

The matrix $upright(bold(P))$ is symmetric and orthogonal. Its column vectors are the eigenvectors of $upright(bold(A))$ . The diagonal entries of $upright(bold(D))$ are the corresponding eigenvalues. For the matrix $upright(bold(A))$ , we have $lambda_1 = 1$ and the associated eigenvector $upright(bold(v))_1 = (1 , - 1 , 1 , - 1)^T$ . All components of the eigenvector $upright(bold(v))_1$ reach the maximum in modulus but have different signs. Thus, the eigenvector $upright(bold(v))_1$ does not satisfy our assumption. As a matter of fact, the sequence of vectors ${upright(bold(x))_k}$ generated by the power method may converge to a different limit when a different initial vector $upright(bold(x))_0$ is used.
]

#rmk[
Apply the power method to find the maximum eigenvalue of the matrix

$ upright(bold(A)) = mat(delim: "[", 2, - 1, , , ; - 1, 2, - 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 2, - 1; #none, , , - 1, 2)_(n times n) . $

When $n$ is an even integer, the eigenvector $upright(bold(v))_1$ associated with the modulus-maximum eigenvalue $lambda_1 = 4 [cos frac(pi, 2 (n + 1))]^2$ has two components both of which reach the maximum in modulus but have opposite signs. The sequence of vectors ${upright(bold(x))_k}$ generated by the power method for $upright(bold(A))$ may also converge to a different limit when a different initial vector $upright(bold(x))_0$ is used.
]

#rmk[
For the matrix $upright(bold(A))$ above, when $n$ is even, if the initial vector is chosen to be $upright(bold(x))_0 =$ $(1 , 1 , dots.h.c , 1)^T$ , the power method only converges to the eigenvalue which has the second maximum modulus no matter how many iterations are made (since the initial vector $upright(bold(x))_0$ is orthogonal to the eigenvector $upright(bold(v))_1$ and the operations involved do not introduce any computer round-off errors at all).
]

To guarantee the convergence of the power method for the case when the eigenvector $upright(bold(v))_1$ has multiple components which reach the maximum modulus but with different signs, we may modify the power method as follows: let $i_0$ be the index of the first modulus-maximum entry of $upright(bold(x))_0$ ; for $k = 0 , 1 , 2 , dots.h.c$ , make the iteration below

- Step 1. compute the matrix-vector product: $upright(bold(z))_(k + 1) = upright(bold(A)) upright(bold(x))_k$ ;

- Step 2. find the index of the first modulus-maximum entry of $upright(bold(z))_(k + 1)$ and denote the index by $i_(k + 1)$ . If the ratio of the $i_k^(upright("th "))$ entry of $upright(bold(z))_(k + 1)$ to the $i_(k + 1)^(upright("th "))$ entry in absolute value is equal to or greater than a threshold $theta$ , which is slightly less than but close to one (say, $theta = 0.9$ ), set $i_(k + 1) = i_k .$

- Step 3. normalize vector $upright(bold(z))_(k + 1)$ : choose $r_(k + 1)$ such that the maximum norm of the vector

  $ upright(bold(x))_(k + 1) = 1 / r_(k + 1) upright(bold(z))_(k + 1) $

  is equal to one and the $i_(k + 1)^(t h)$ entry of $upright(bold(x))_(k + 1)$ is positive. Increase $k$ by one and go to step 1 unless that $norm(upright(bold(x))_(k + 1) - upright(bold(x))_k)_oo$ is less than a specified tolerance.

The second step above avoids sign-alternating vectors.

#prp[
The sequence of indices ${i_k}_(k = 1)^oo$ will become invariant as $k$ increases.
]

#prf[
Let $epsilon.alt = (1 - theta) \/ 4$ . By (@eq:2) and our assumption on the eigenvalues, there exists a large integer $K > 0$ such that for any $k > K$

$ 1 - epsilon.alt < abs(s_k) / abs(alpha_1 lambda_1^k) < 1 + epsilon.alt upright(" and ") norm(upright(bold(w))_k)_oo < epsilon.alt . $
Now we claim that the sequence of indices ${i_k}_(k = 1)^oo$ will change at most once for $k > K$ . Assume the index changes at $k = k_0 > K$ , i.e., $i_(k_0) eq.not i_(k_0 + 1)$ . Step 2 indicates the $i_(k_0 + 1)^(t h)$ component of the vector $upright(bold(x))_(k_0 + 1)$ has absolute value equal to one. Let

$ upright(bold(w))_k = alpha_2 / alpha_1 (lambda_2 / lambda_1)^k upright(bold(v))_2 + dots.h.c + alpha_n / alpha_1 (lambda_n / lambda_1)^k upright(bold(v))_n . $

We rewrite (@eq:1) as

$ frac(s_k, alpha_1 lambda_1^k) upright(bold(x))_k = upright(bold(v))_1 + upright(bold(w))_k $<eq:9>

which implies

$ v_1^((i_(k_0 + 1))) = frac(s_(k_0 + 1), alpha_1 lambda_1^(k_0 + 1)) x_(k_0 + 1)^((i_(k_0 + 1))) - w_(k_0 + 1)^((i_(k_0 + 1))) . $

The $i_(k_0 + 1)^(t h)$ component of the eigenvector $upright(bold(v))_1$ has a lower bound

$ abs(v_1^((i_(k_0 + 1)))) gt.eq abs(s_(k_0 + 1)) / abs(alpha_1 lambda_1^(k_0 + 1)) abs(x_(k_0 + 1)^((i_(k_0 + 1)))) - abs(w_(k_0 + 1)^((i_(k_0 + 1)))) gt.eq 1 - 2 epsilon.alt . $

(@eq:9) also implies

$ x_k^((i_(k_0 + 1))) = frac(alpha_1 lambda_1^k, s_k) [v_1^((i_(k_0 + 1))) - w_k^((i_(k_0 + 1)))] quad "for" k gt.eq k_0 + 1 . $

Furthermore, we get a lower bound for the $i_(k_0 + 1)^(t h)$ entry of the vector $upright(bold(x))_k$ ,

$ abs(x_k^((i_(k_0 + 1)))) gt.eq abs(alpha_1 lambda_1^k) / abs(s_k) [abs(v_1^((i_(k_0 + 1)))) - abs(w_k^((i_(k_0 + 1))))] gt.eq frac(1 - 3 epsilon.alt, 1 + epsilon.alt) > 1 - 4 epsilon.alt = theta quad "for" k gt.eq k_0 + 1 . $

The index will be fixed for all $k gt.eq k_0 + 1$ , i.e., $i_k = i_(k_0 + 1)$ , by Step 2 . Otherwise, we will have $abs(x_k^(i_(k_0 + 1))) < theta$ right after the change. This is a contradiction.
]

#prp[
The sign of $s_k / lambda_1^k$ will never change when $k$ becomes sufficiently large.
]

#prf[
Let $epsilon.alt = (1 - theta) \/ 4$ . By the previous proposition, we know there exists a large integer $K > 0$ such that for any $k > K$ , the index $i_k$ becomes invariant and

$ 1 - epsilon.alt < abs(s_k) / abs(alpha_1 lambda_1^k) < 1 + epsilon.alt , #h(0em) norm(upright(bold(w))_k)_oo < epsilon.alt . $

Assume $i_k = i_(k_0) + 1$ for all $k > K$ . By Step 2, we have

$ x_k^((i_(k_0 + 1))) = abs(x_k^((i_(k_0 + 1)))) gt.eq theta . $

(@eq:9) implies

$ v_1^((i_(k_0 + 1))) = frac(s_k, alpha_1 lambda_1^k) x_k^((i_(k_0 + 1))) - w_k^((i_(k_0 + 1))) $<eq:10>

and

$ abs(v_1^((i_(k_0 + 1)))) gt.eq abs(s_k) / abs(alpha_1 lambda_1^k) abs(x_k^((i_(k_0 + 1)))) - abs(w_k^((i_(k_0 + 1)))) gt.eq (1 - epsilon.alt) theta - epsilon.alt gt.eq theta / 2 , $

provided that $theta$ is a sufficiently large number in the interval $(1 \/ 2 , 1)$ . This means that the $i_k^(t h)$ entry of the eigenvector $upright(bold(v))_1$ is non-zero. We rewrite @eq:10) as

$ v_1^((i_(k_0 + 1))) + w_k^((i_(k_0 + 1))) = frac(s_k, alpha_1 lambda_1^k) x_k^((i_(k_0 + 1))) . $

Note that $v_1^((i_(k_0 + 1))) + w_k^((i_(k_0 + 1)))$ and $v_1^((i_(k_0 + 1)))$ have the same sign since $v_1^((i_(k_0 + 1)))$ dominates $w_k^((i_(k_0 + 1)))$ . As $x_k^((i_(k_0) + 1))$ is fixed to be positive, from the identity above, we see that the sign of $s_k \/ lambda_1^k$ is the same as $alpha_1 v_1^((i_(k_0 + 1)))$ and will not change for all $k > K$ .
]

As a result of the proposition above, together with (@eq:2), we get

$ lim_(k arrow.r oo) frac(s_k, alpha_1 lambda_1^k) = 1 #h(0em) upright(" or ") #h(0em) lim_(k arrow.r oo) frac(s_k, alpha_1 lambda_1^k) = - 1 . $

and correspondingly

$ lim_(k arrow.r oo) upright(bold(x))_k = upright(bold(v))_1 #h(0em) upright(" or ") #h(0em) lim_(k arrow.r oo) upright(bold(x))_k = - upright(bold(v))_1 $
