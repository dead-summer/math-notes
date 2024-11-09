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

= Abstract Framework and Spectral Radius
<abstract-framework-and-spectral-radius>

== Abstract Framework

Find a solution to the one-variable equation

$ a x = b . $<eq:1>

We do not want to solve the equation directly. Instead, we want to solve it by an iterative method: given an initial guess $x_0$ for the solution,construct a convergent sequence of approximate solution ${x_k}$ so that the limit is the solution $x$ .

Let

$ f (x) = b - a x . $<eq:2>

Now please do not ask me why I did not define the function $f (x)$ to be ax - b. There is no reason that we could not define the function in other ways. It is just personal taste to define the function as shown in (@eq:2). Now in terms of the function $f (x)$ , the equation (@eq:1) becomes

$ f (x) = 0 . $<eq:3>

This equation is actually just a special case of the nonlinear scalar equation that we studied in Chapter 2.

As an iterative method, the fixed point iteration in the form

$ x_(k + 1) = phi (x_k) $

may be the first one that comes up to our mind. In particular, we may recall the following one

$ x_(k + 1) = phi (x_k) = x_k + f (x_k) = (1 - a) x_k + b "for" k = 0 , 1 , 2 , dots.h.c . $<eq:4>

As we know, the iteration (@eq:4) may fail to yield a convergent sequence ${x_k}$ . In general, we only know,when the first derivative of $phi (x)$ is less than one in absolute value, i.e.,

$ lr(|phi^(') (x)|) = lr(|1 + f^(') (x)|) = lr(|1 - a|) < 1 , $<eq:5>

for $x$ in some interval $[alpha, beta]$ of our interest, the sequence ${x_k}$ converges. The condition (@eq:5) is equivalent to say

$ - 2 < f^(') (x) = - a < 0 , quad "for all" x in [alpha , beta] . $<eq:6>

If the first-order derivative $f^(') (x)$ goes beyond the interval $[- 2 , 0]$ or too close to the endpoints, we have to switch the sign of $f (x)$ or rescale the function. For this, we introduce a parameter into the iteration and get the new one

$ x_(k + 1) = phi (x_k) = x_k + p^(- 1) f (x_k) . $<eq:7>

Here, the parameter $p$ is a preconditioner and is chosen so that

$ lr(|phi^(') (x)|) = lr(|1 + p^(- 1) f^(') (x)|) = lr(|1 - p^(- 1) a|) < 1 , #h(0em) upright(" for all ") x in [alpha , beta] $

or

$ - 2 < p^(- 1) f^(') (x) = - p^(- 1) a < 0 , quad "for all" x in [alpha , beta] . $<eq:8>

The condition (@eq:8) implies

$ 0 < p^(- 1) a < 2 $

If $a > 0 , p$ should satisfy $p > a \/ 2$ ; if $a < 0 , p$ should satisfy $p < a \/ 2$ . To emphasize the importance of the condition, we put the condition as a theorem.

#thm[
For the iteration (@eq:7) to converge, the parameter $p$ should be chosen to satisfy the condition below

$ cases(
p > a \/ 2 \, & "if" a > 0,
p < a \/ 2 \, & "if" a < 0 .
)
 $
]


Once the parameter $p$ satisfies the condition, we are sure the sequence ${x_k}$ generated will converge to the equation (@eq:3). Let $x^(\*) = b \/ a$ be the exact solution to the equation. It satisfies

$ x^(\*) = phi (x^(\*)) = x^(\*) + p^(- 1) f (x^(\*)) . $<eq:9>

Denote the error at the $k^(t h)$ iteration by $e_k = x^(\*) - x_k$ . Subtracting (@eq:9) by (@eq:7), we get the error equation

$ e_(k + 1) = e_k + p^(- 1) [f (x^(\*)) - f (x_k)] = (1 - p^(- 1) a) e_k equiv q e_k . $<eq:10>

Note that the coefficient $q = 1 - p^(- 1) a$ is less than one in absolute value,

$ lr(|q|) = lr(|1 - p^(- 1) a|) = lr(|1 + p^(- 1) f^(') (x)|) < 1 . $

The iteration error $e_k$ satisfies

$ e_(k + 1) = q e_k = q^2 e_(k - 1) = dots.h.c = q^k e_1 = q^(k + 1) e_0 , $

which tends to zero as $k$ goes to infinity. It is obvious that for the sequence ${x_k}$ to converge to the exact solution quickly,it is better to choose the parameter $p$ so that $lr(|q|)$ is small. The ideal case is to choose $p$ so that $lr(|q|) = 0$ , i.e., $p = a$ .

The parameter $p$ determines whether the iteration converges and how fast the sequence ${x_k}$ converges. We call it (or its inverse) as the preconditioner of the equation (1).

Now we consider the general case. Let $upright(bold(A)) in bb(R)^(n times n)$ be an invertible $n$ by $n$ matrix; $upright(bold(b)) , upright(bold(x)) in bb(R)^n$ be the known and unknown vectors, respectively. We will solve the linear system

$ upright(bold(A x)) = upright(bold(b)) $<eq:11>

by an iterative method in the form

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + upright(bold(P))^(- 1) upright(bold(F)) (upright(bold(x))_k) quad "for" k = 0 , 1 , 2 , dots.h.c . $<eq:12>

Here, $upright(bold(x))_0$ is a given initial guess for the solution; $upright(bold(F)) (upright(bold(x)))$ is the vector-valued (linear) function given by

$ upright(bold(F)) (upright(bold(x))_k) = upright(bold(b)) - upright(bold(A)) upright(bold(x))_k $

and $upright(bold(P))$ is a *preconditioner*. The preconditioner $upright(bold(P))$ can be a non-zero scalar number or a matrix. It is chosen such that the iteration will converge. In the case that the preconditioner is a matrix, we always assume $upright(bold(P))$ is invertible. The appearance of $upright(bold(P))^(- 1)$ does not mean that we need to compute the inverse of the preconditioner. Instead, we often implement the iterative method (@eq:12) as a two-step procedure:

- Step 1. solve the linear system

$ upright(bold(P)) upright(bold(z))_(k + 1) = upright(bold(F)) (upright(bold(x))_k) $

- Step 2. update the solution

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + upright(bold(z))_(k + 1) $

Let $upright(bold(x))^(\*) in bb(R)^n$ be the solution to the linear system (@eq:11). It is obvious that the solution $upright(bold(x))^(\*)$ is a fixed point of the iteration above, satisfying

$ upright(bold(x))^(\*) = upright(bold(x))^(\*) + upright(bold(P))^(- 1) upright(bold(F)) (upright(bold(x))^(\*)) $<eq:13>

Subtracting (@eq:13) by (@eq:12), we get the error equation

$ upright(bold(e))_(k + 1) = upright(bold(e))_k + upright(bold(P))^(- 1) [upright(bold(F)) (upright(bold(x))^(\*)) - upright(bold(F)) (upright(bold(x))_k)] = (upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A))) upright(bold(e))_k $<eq:14>

for $k = 0 , 1 , 2 , dots.h.c$ . This indicates

$ upright(bold(e))_(k + 1) &= 
(upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A))) upright(bold(e))_k \
&= (upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A)))^2 upright(bold(e))_(k - 1) \
&= dots.h.c = (upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A)))^k upright(bold(e))_k \
&= (upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A)))^(k + 1) upright(bold(e))_0 . $

For the iteration error $upright(bold(e))_k$ to converge to zero with any initial guess $upright(bold(x))_0$ or any initial error $upright(bold(e))_0$ , we expect the $k^(upright("th "))$ power of the matrix $(upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A)))$ multiplied by any vector $upright(bold(e))_0$ tends to zero as $k$ goes to infinity,

$ lim_(k arrow.r oo) (upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A)))^k upright(bold(e))_0 = 0 , $

for any vector $upright(bold(e))_0 in bb(R)^n$ .

Before presenting results on convergence of the approximated solutions by the iteration above, we firt go over the concept of spectral radius of a matrix.

== Spectral Radius
<spectral-radius>

#def[
The spectral radius of a matrix $upright(bold(A)) in bb(R)^(n times n)$ is defined as the maximum one of the moduli of eigenvalues. We denote it by

$ rho (upright(bold(A))) = max_(1 lt.eq i lt.eq n) lr(|lambda_i (upright(bold(A)))|) . $<eq:15>

Here, ${lambda_i (upright(bold(A)))}_(i = 1)^n$ are the eigenvalues of $upright(bold(A))$ .
]

#cor[
For a symmetric matrix $upright(bold(A)) in bb(R)^(n times n)$ ,we have

$ norm(upright(bold(A)))_2 = rho (upright(bold(A))) . $<eq:16>
]

#prp[
Any matrix norm is not less than its spectral radius

$ norm(upright(bold(A))) gt.eq rho (upright(bold(A))) . $<eq:17>
]

#lem[
Let $upright(bold(T))$ be an invertible matrix. The one given by

$ norm(upright(bold(A)))_T equiv norm(upright(bold(T A T))^(- 1)) $

introduces an induced matrix norm for $upright(bold(A)) in bb(R)^(n times n)$ , which is associated with the vector norm $norm(upright(bold(x)))_T =$ $norm(upright(bold(T x)))$ for $upright(bold(x)) in bb(R)^n .$
]

#prp[
Given a matrix $upright(bold(A)) in bb(R)^(n times n)$ , for any $epsilon.alt > 0$ , there exists an induced matrix norm $norm(dot.op)_epsilon.alt$ such that

$ norm(upright(bold(A)))_epsilon.alt lt.eq rho (upright(bold(A))) + epsilon.alt $
]

#prf[
Let $upright(bold(P))$ be an invertible matrix such that the similarity transformed matrix $upright(bold(P A P))^(- 1)$ is in the Jordan canonical form

$ upright(bold(P A P))^(- 1) = "diag" (upright(bold(J))_1 , upright(bold(J))_2 , dots.h.c , upright(bold(J))_K) $

which is a block diagonal matrix and where each block $upright(bold(J))_k (k = 1 , 2 , dots.h.c , K)$ has the form

$ upright(bold(J))_k = mat(delim: "(", lambda_k, 1, , , ; #none, lambda_k, 1, , ; #none, , dots.down, dots.down, ; #none, , , lambda_k, 1; #none, , , , lambda_k)_(m_k times m_k) . $

Here, ${lambda_k}_(k = 1)^K$ are the distinct eigenvalues of $upright(bold(A))$ and $m_1 + m_2 + dots.h.c + m_K = n$ . Let $upright(bold(D)) =$ $"diag" (1 , epsilon.alt , epsilon.alt^2 , dots.h.c , epsilon.alt^(n - 1))$ be the diagonal matrix. We can verify that the matrix $upright(bold(D))^(- 1) upright(bold(P A P))^(- 1) upright(bold(D))$ is also a block diagonal matrix,

$ upright(bold(D))^(- 1) upright(bold(P A P))^(- 1) upright(bold(D)) = "diag" (upright(bold(J))_1^epsilon.alt , upright(bold(J))_2^epsilon.alt , dots.h.c , upright(bold(J))_K^epsilon.alt) $

with

$ upright(bold(J))_k^epsilon.alt = mat(delim: "(", lambda_k, epsilon.alt, , , ; #none, lambda_k, epsilon.alt, , ; #none, , dots.down, dots.down, ; #none, , , lambda_k, epsilon.alt; #none, , , , lambda_k)_(m_k times m) $

for $k = 1 , 2 , dots.h.c , K$ . It is obvious that

$ norm(upright(bold(D))^(- 1) upright(bold(P A P))^(- 1) upright(bold(D)))_oo = rho (upright(bold(A))) + epsilon.alt . $

By the Lemma above, we see that

$ norm(upright(bold(A)))_(upright(bold(D))^(- 1) upright(bold(P))) equiv norm(upright(bold(D))^(- 1) upright(bold(P A P))^(- 1) upright(bold(D)))_oo $

is an induced matrix norm of $upright(bold(A))$ . Thus we finished the proof.
]

We remark that the spectral radius will never be a matrix norm. If the spectral radius $rho (upright(bold(A)))$ is a matrix norm, then any matrix whose spectral radius equals zero should be identically equal to zero. In fact, any matrix similar to

$ upright(bold(A)) = mat(delim: "[", 0, 1, , , ; #none, 0, 1, , ; #none, , dots.down, dots.down, ; #none, , , 0, 1; #none, , , , 0) $

has its spectral radius equal to zero.

In terms of spectral radius, we have the following theorem on convergence of the iteration errors by (@eq:14).

#thm[
Let $upright(bold(B)) in bb(R)^(n times n)$ be a matrix. The $k^(upright("th "))$ power of the matrix multiplied by any vector converges to zero as $k$ goes to infinity, i.e.,

$ lim_(k arrow.r oo) upright(bold(B))^k upright(bold(x)) = 0 quad forall upright(bold(x)) in bb(R)^n $<eq:18>

if and only if the spectral radius of $upright(bold(B))$ is less than one, i.e.,

$ rho (upright(bold(B))) < 1 upright(".") $
]<thm:1.2>

#prf[
Necessity. Assume that the spectral radius of $upright(bold(B))$ is not less than one,i.e., $rho (upright(bold(B))) gt.eq 1$ . Then there is an eigenvalue $lambda = alpha + sqrt(- 1) beta = r (cos theta + sqrt(- 1) sin theta) in bb(C)$ whose modulus $r = lr(|lambda|)$ is not less than one. Let $upright(bold(z)) = upright(bold(v)) + sqrt(- 1) upright(bold(w)) in bb(C)^n$ with $upright(bold(v)) , upright(bold(w)) in bb(R)^n$ be the associated eigenvector. We see

$ upright(bold(B))^k upright(bold(z)) = lambda^k upright(bold(z)) $

and

$ mat(delim: "[", upright(bold(B))^k upright(bold(v)), upright(bold(B))^k upright(bold(w))) = mat(delim: "[", upright(bold(v)), upright(bold(w))) mat(delim: "[", alpha, beta; - beta, alpha)^k = r^k mat(delim: "[", upright(bold(v)), upright(bold(w))) mat(delim: "[", cos (k theta), sin (k theta); - sin (k theta), cos (k theta)) $

This implies

$ mat(delim: "[", upright(bold(B))^k upright(bold(v)), upright(bold(B))^k upright(bold(w))) mat(delim: "[", cos (k theta), - sin (k theta); sin (k theta), cos (k theta)) = mat(delim: "[", r^k upright(bold(v)), r^k upright(bold(w))) . $<eq:19>

The condition (@eq:18) indicates the left hand side of the identity above tends to zero as $k$ goes to infinity. However, at least one of the two column vectors on the right hand side will never converge to zero since $r = lr(|lambda|) gt.eq 1$ and $norm(upright(bold(z))) eq.not 0$ (we will not have both $upright(bold(v))$ and $upright(bold(w))$ equal to zero). This leads to a contradiction.

Sufficiency. Let $epsilon.alt = (1 - rho (upright(bold(B)))) \/ 2$ . We know there is an induced matrix norm $norm(dot.op)_epsilon.alt$ such that

$ norm(upright(bold(B)))_epsilon.alt lt.eq rho (upright(bold(B))) + epsilon.alt $

For any vector $upright(bold(v)) in bb(R)^n$ ,we see

$ norm(upright(bold(B))^k upright(bold(v)))_epsilon.alt lt.eq norm(upright(bold(B)))_epsilon.alt^k norm(upright(bold(v)))_epsilon.alt lt.eq [rho (upright(bold(B))) + epsilon.alt]^k norm(upright(bold(v)))_epsilon.alt $

The right hand side of the inequality above converges to zero as $k$ tends to infinity since the scalar $rho (upright(bold(B))) + epsilon.alt < 1$ . This completes the proof.
]

In the proof above, we get the equivalence between the three statements below:

- For any vector $upright(bold(x)) in bb(R)^n$ , we have $lim_(k arrow.r oo) upright(bold(B))^k upright(bold(x)) = 0$ ;

- The spectral radius of $upright(bold(B))$ is less than one, i.e., $rho (upright(bold(B))) < 1$ ;

- There exists a matrix norm $norm(dot.op)$ such that $norm(upright(bold(B))) < 1$ .

Now we see that, to guarantee the convergence of the iterative method,

$ upright(bold(x))_(k + 1) = upright(bold(x))_k + upright(bold(P))^(- 1) (upright(bold(b)) - upright(bold(A)) upright(bold(x))_k) , quad "for" k = 0 , 1 , 2 , dots.h.c , $

we have to choose the preconditioner $upright(bold(P))$ so that the spectral radius of $upright(bold(B)) = upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A))$ is less than one.

#thm[
The iteration (@eq:12) converges for any initial guess $upright(bold(x))_0$ if and only if the spectral radius of the matrix $upright(bold(B)) = upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A))$ is less than one.
]

On the convergence of the iteration (@eq:12), we have another well-known theorem, which is analogous to @thm:1.2.

#thm("Samarskii")[
Assume the matrix $upright(bold(A))$ is symmetric and positive definite. If the preconditioner $upright(bold(P))$ is chosen such that the matrix $upright(bold(P)) - upright(bold(A)) \/ 2$ is positive definite, then the iteration (@eq:12) converges with any initial guess $upright(bold(x))_0$ .
]

#prf[
Let $upright(bold(x))^(\*) in bb(R)^n$ be the solution of the linear system $upright(bold(A x)) = upright(bold(b))$ and $upright(bold(e))_k = upright(bold(x))^(\*) - upright(bold(x))_k$ be the iteration error. We have

$ upright(bold(e))_(k + 1) - upright(bold(e))_k + upright(bold(P))^(- 1) upright(bold(A e))_k = 0 quad "for" k = 0 , 1 , 2 , dots.h.c . $<eq:20>

Note that

$ upright(bold(e))_k = 1 / 2 (upright(bold(e))_(k + 1) + upright(bold(e))_k) - 1 / 2 (upright(bold(e))_(k + 1) - upright(bold(e))_k) . $

We get

$ upright(bold(P)) (upright(bold(e))_(k + 1) - upright(bold(e))_k) + 1 / 2 upright(bold(A)) [(upright(bold(e))_(k + 1) + upright(bold(e))_k) - (upright(bold(e))_(k + 1) - upright(bold(e))_k)] = 0 $

or

$ (upright(bold(P)) - 1 / 2 upright(bold(A))) (upright(bold(e))_(k + 1) - upright(bold(e))_k) + 1/2 upright(bold(A)) (upright(bold(e))_(k + 1) + upright(bold(e))_k) = 0 . $

Left-multiplying the identity above by the row vector $(upright(bold(e))_(k + 1) - upright(bold(e))_k)^(upright(T))$ , we get

$ (upright(bold(e))_(k + 1) - upright(bold(e))_k)^(upright(T)) (upright(bold(P)) - 1 / 2 upright(bold(A))) (upright(bold(e))_(k + 1) - upright(bold(e))_k) + 1/2 (upright(bold(e))_(k + 1) - upright(bold(e))_k)^(upright(T)) upright(bold(A)) (upright(bold(e))_(k + 1) + upright(bold(e))_k) = 0 . $<eq:21>

By the positive definiteness of $(upright(bold(P)) - 1 / 2 upright(bold(A)))$ , we have

$ upright(bold(e))_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(e))_(k + 1) - upright(bold(e))_k^(upright(T)) upright(bold(A)) upright(bold(e))_k &= (upright(bold(e))_(k + 1) - upright(bold(e))_k)^(upright(T)) upright(bold(A)) (upright(bold(e))_(k + 1) + upright(bold(e))_k) \
&= - 2 (upright(bold(e))_(k + 1) - upright(bold(e))_k)^(upright(T)) (upright(bold(P)) - 1 / 2 upright(bold(A))) (upright(bold(e))_(k + 1) - upright(bold(e))_k) lt.eq 0 . $<eq:22>

The non-negative sequence ${upright(bold(e))_k^(upright(T)) upright(bold(A)) upright(bold(e))_k}$ is monotonely decreasing. So it converges. From identity (@eq:21), we get

$ lim_(k arrow.r oo) (upright(bold(e))_(k + 1) - upright(bold(e))_k)^(upright(T)) (upright(bold(P)) - 1 / 2 upright(bold(A))) (upright(bold(e))_(k + 1) - upright(bold(e))_k) = lim_(k arrow.r oo) [upright(bold(e))_k^(upright(T)) upright(bold(A)) upright(bold(e))_k - upright(bold(e))_(k + 1)^(upright(T)) upright(bold(A)) upright(bold(e))_(k + 1)] = 0 . $

Furthermore, by the positive definiteness of the matrix $(upright(bold(P)) - 1 / 2 upright(bold(A)))$ , the sequence ${norm(upright(bold(e))_(k + 1) - upright(bold(e))_k)}$ converges to zero as $k$ tends to infinity. That is,

$ lim_(k arrow.r oo) norm(upright(bold(e))_(k + 1) - upright(bold(e))_k) = 0 . $

In addition, identity (@eq:20) implies that

$ upright(bold(e))_k = upright(bold(A))^(- 1) upright(bold(P)) (upright(bold(e))_k - upright(bold(e))_(k + 1)) $

and moreover

$ norm(upright(bold(e))_k) = norm(upright(bold(A))^(- 1) upright(bold(P)) (upright(bold(e))_k - upright(bold(e))_(k + 1))) lt.eq norm(upright(bold(A))^(- 1)) norm(upright(bold(P))) norm(upright(bold(e))_k - upright(bold(e))_(k + 1)) arrow.r 0 #h(0em) upright(" as ") k arrow.r oo . $

We have already proved the convergence of the iteration.
]

Before we move on to specific examples of the iterative method, we would like to ask ourselves how fast the iterative method will be or how much the convergence rate depends on the preconditioner.

For example, assuming the initial guess $upright(bold(x))_0$ for the iteration is simply set to be zero, we may ask how many iterations are needed for the relative error of the iterated solution to be less than some tolerance $epsilon.alt$ . Let $upright(bold(B)) = upright(bold(I)) - upright(bold(P))^(- 1) upright(bold(A))$ . The equation

$ upright(bold(e))_k = upright(bold(B))^k upright(bold(e))_0 = upright(bold(B))^k upright(bold(x))^(\*) $

implies

$ norm(upright(bold(e))_k) lt.eq norm(upright(bold(B))^k) norm(upright(bold(x))^(\*)) . $

The quantity $norm(upright(bold(B))^k)$ gives an upper bound for the relative error $norm(upright(bold(e))_k) \/ norm(upright(bold(x))^(\*))$ . The minimum iteration $k_0$ that is needed for the relative error to be less than $epsilon.alt$ should satisfy

$ norm(upright(bold(B))^(k_0)) < epsilon.alt . $<eq:23>

Now a natural question arise. Can we get any estimate on $k_0$ from the inequality above?

#thm[
$ lim_(k arrow.r oo) norm(upright(bold(B))^k)^(1 \/ k) = rho (upright(bold(B))) . $
]

#prf[
First of all, by the Jordan canonical form, we have

$ rho (upright(bold(B)))^k = rho (upright(bold(B))^k) lt.eq norm(upright(bold(B))^k) , $

which implies that

$ rho (upright(bold(B))) lt.eq norm(upright(bold(B))^k)^(1 / k) $

Next,we will show that for any $epsilon.alt > 0$ , there exists a large integer $N > 0$ such that for any $k > N$

$ norm(upright(bold(B))^k)^(1 / k) < rho (upright(bold(B))) + epsilon.alt , $

which is equivalent to say

$ norm(upright(bold(B))^k) < (rho (upright(bold(B))) + epsilon.alt)^k upright(" or ") norm(upright(bold(B))_epsilon.alt^k) < 1 . $

with

$ upright(bold(B))_epsilon.alt = frac(upright(bold(B)), rho (upright(bold(B))) + epsilon.alt) . $

As a matter of fact,since the spectral radius of $upright(bold(B))_epsilon.alt$ is less than one, there exists an induced matrix norm $norm(dot.op)_a$ such that

$ norm(upright(bold(B))_epsilon.alt)_a < 1 $

As a result, the sequence of scalars ${norm(upright(bold(B))_epsilon.alt^k)_a}$ converges to zero. This further indicates that the sequence of matrices ${upright(bold(B))_epsilon.alt^k}$ converges to the zero matrix and the sequence of scalars ${norm(upright(bold(B))_epsilon.alt^k)}$ also converges to zero as $k$ tends to infinity (this step can also be shown by the equivalence of the two norms $norm(dot.op)$ and $norm(dot.op)_a$ ). The rest of the proof just follows naturally.
]

By this theorem, for large $k$ , we have

$ norm(upright(bold(B))^k)^(1 \/ k) approx rho (upright(bold(B))) $

and may treat the one on the left hand side approximately as a constant. From (@eq:23), we get

$ k_0 log norm(upright(bold(B))^(k_0))^(1 \/ k_0) < log epsilon.alt < 0 $

and

$ k_0 > frac(- log epsilon.alt, - log norm(upright(bold(B))^(k_0))^(1 \/ k_0)) approx frac(- log epsilon.alt, - log rho (upright(bold(B)))) . $<eq:24>

Now we see that the ratio $log epsilon.alt \/ log rho (upright(bold(B)))$ gives an estimate on the iteration number which is needed for the relative iteration error to be less than the tolerance $epsilon.alt$ . The quantity $(- log rho (upright(bold(B))))$ is called the asymptotic convergence rate.

As we see from the iteration (@eq:12), we need to invert the preconditioner $upright(bold(P))$ . As a criterion for the selection of $upright(bold(P))$ , the preconditioner $upright(bold(P))$ should be easily invertible or a linear system with $upright(bold(P))$ be its coefficient matrix can be easily solved.

We know the preconditioner $upright(bold(P))$ can be easily inverted if it is a scalar, a diagonal matrix,a triangular matrix, a tri-diagonal matrix or an orthogonal matrix (but an orthogonal matrix is less likely able to significantly change the conditioning of a linear system).

- *The Richardson Iteration*
  
  ​Choose $upright(bold(P))$ to be a scalar or a multiple of the identity matrix.

- *The Jacobi Method*
  
  ​Choose $upright(bold(P))$ to be the diagonal part of $upright(bold(A))$ .

- *The Gauss-Seidel Method*
  
  ​Choose $upright(bold(P))$ to be the lower or upper triangular part of $upright(bold(A))$ .