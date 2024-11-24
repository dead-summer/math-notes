#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

// 上一节编号到 2
#counter(math.equation).update(2)

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

= The Broyden quasi-Newton method
<the-broyden-quasi-newton-method>
In this section, we will introduce the so-called generalized secant method. The method is a generalization of the secant method for scalar nonlinear equations. It avoids the evaluation of first-order derivatives involved with the exact Newton method.

Recall the secant method for the scalar nonlinear equations

$ x_(k + 1) = x_k - a_k^(- 1) f (x_k) $

with the slope $a_k$ satisfying the secant equation

$ a_k (x_k - x_(k - 1)) = f (x_k) - f (x_(k - 1)) . $

For the nonlinear system (1), the generalized secant method has the form

$ upright(bold(x))_(k + 1) = upright(bold(x))_k - upright(bold(A))_k^(- 1) upright(bold(F)) (upright(bold(x))_k) quad "for" k = 0 , 1 , 2 , dots.h.c $<eq:3>

with the preconditioner $upright(bold(A))_k$ satisfying the generalized secant equation

$ upright(bold(A))_k (upright(bold(x))_k - upright(bold(x))_(k - 1)) = upright(bold(F)) (upright(bold(x))_k) - upright(bold(F)) (upright(bold(x))_(k - 1)) $<eq:4>

As we mentioned, the generalized secant method does not compute the matrix $upright(bold(A))_k$ by directly evaluating the first order partial derivatives of $upright(bold(F)) (upright(bold(x))_k)$ with respect to its independent variables. Instead, the matrix $upright(bold(A))_k$ is constructed incrementally. Provided the matrix $upright(bold(A))_(k - 1)$ in the previous iteration is known, the method constructs the matrix $upright(bold(A))_k$ as a low-rank matrix perturbation of $upright(bold(A))_(k - 1)$ . That is, the difference between the consecutive matrices, $upright(bold(A))_(k - 1)$ and $upright(bold(A))_k$ , is a low-rank matrix. In the method that we will study in this section, the difference matrix $(upright(bold(A))_k - upright(bold(A))_(k - 1))$ is a rank one matrix.

First of all, the iteration (@eq:3) implies

$ upright(bold(x))_k = upright(bold(x))_(k - 1) - upright(bold(A))_(k - 1)^(- 1) upright(bold(F)) (upright(bold(x))_(k - 1)) , $

i.e.,

$ upright(bold(A))_(k - 1) (upright(bold(x))_k - upright(bold(x))_(k - 1)) = - upright(bold(F)) (upright(bold(x))_(k - 1)) . $<eq:5>

Let $upright(bold(delta))_k = upright(bold(x))_k - upright(bold(x))_(k - 1)$ be the Newton step. From equations (@eq:4) and (@eq:5), we get

$ (upright(bold(A))_k - upright(bold(A))_(k - 1)) upright(bold(delta))_k = upright(bold(F)) (upright(bold(x))_k) . $<eq:6>

Let

$ upright(bold(Q))_k = upright(bold(A))_k - upright(bold(A))_(k - 1) $

be the difference matrix. From (@eq:6), we see

$ upright(bold(Q))_k upright(bold(delta))_k = upright(bold(F)) (upright(bold(x))_k) . $<eq:7>

There are many choices for the matrix $upright(bold(Q))_k$ which satisfies the equation above. However, it is natural to choose the matrix $upright(bold(Q))_k$ to be the simplest one

$ upright(bold(Q))_k = frac(upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) , $<eq:8>

which in fact is the least squares matrix as indicated by the proposition below.

#prp[
Among the matrices $upright(bold(T))_k$ that satisfy

$ upright(bold(T))_k upright(bold(delta))_k = upright(bold(F)) (upright(bold(x))_k) , $

the one given by

$ upright(bold(Q))_k = frac(upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k^T, upright(bold(delta))_k^T upright(bold(delta))_k) $

has the minimum 2-norm, i.e., $norm(upright(bold(Q))_k)_2 lt.eq norm(upright(bold(T))_k)_2$ .
]

#prf[
Let

$ upright(bold(P))_k = frac(upright(bold(delta))_k upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) $

be the orthogonal projection (matrix). Its 2-norm is not greater than one, i.e.,

$ norm(upright(bold(P))_k)_2 lt.eq 1 $

since

$ norm(upright(bold(P))_k upright(bold(z)))_2 = frac(norm(delta_k delta_k^(upright(T)) upright(bold(z)))_2, delta_k^(upright(T)) delta_k) = frac(norm(delta_k)_2, delta_k^(upright(T)) delta_k) abs(delta_k^(upright(T)) upright(bold(z))) lt.eq frac(norm(delta_k)_2, delta_k^(upright(T)) delta_k) norm(delta_k)_2 norm(upright(bold(z)))_2 lt.eq norm(upright(bold(z)))_2 quad forall upright(bold(z)) in bb(R)^n . $

We see that

$ upright(bold(Q))_k = frac(upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) = frac(upright(bold(T))_k upright(bold(delta))_k upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) = upright(bold(T))_k upright(bold(P))_k $

and

$ norm(upright(bold(Q))_k)_2 lt.eq norm(upright(bold(T))_k)_2 norm(upright(bold(P))_k)_2 lt.eq norm(upright(bold(T))_k)_2 . $
]

#exr[
Show that the matrix $upright(bold(A))_k$ is the one closest to $upright(bold(A))_(k - 1)$ in the induced 2-norm among all matrices that satisfy the generalized secant equation, i.e.,

$ norm(upright(bold(A))_k - upright(bold(A))_(k - 1))_2 lt.eq norm(upright(bold(A)) - upright(bold(A))_(k - 1))_2 $

for any matrix $upright(bold(A))$ satisfying

$ upright(bold(A)) (upright(bold(x))_k - upright(bold(x))_(k - 1)) = upright(bold(F)) (upright(bold(x))_k) - upright(bold(F)) (upright(bold(x))_(k - 1)) . $
]

As a matter of fact, the matrix $upright(bold(Q))_k$ given by the formula above is not just the simplest one but also to some extent minimizes the difference of the two approximations below,

$
0 &approx upright(bold(F)) (upright(bold(x))_k) + upright(bold(A))_k (upright(bold(x)) - upright(bold(x))_k) , \
0 &approx upright(bold(F)) (upright(bold(x))_(k - 1)) + upright(bold(A))_(k - 1) (upright(bold(x)) - upright(bold(x))_(k - 1)) .
$

Let

$ upright(bold(d))_k = upright(bold(F)) (upright(bold(x))_k) - upright(bold(F))_(k - 1) + upright(bold(A))_k (upright(bold(x)) - upright(bold(x))_k) - upright(bold(A))_(k - 1) (upright(bold(x)) - upright(bold(x))_(k - 1)) $

be the difference of the approximations. We can verify that

$
upright(bold(d))_k &= upright(bold(A))_k (upright(bold(x))_k - upright(bold(x))_(k - 1)) + upright(bold(A))_k (upright(bold(x)) - upright(bold(x))_k) - upright(bold(A))_(k - 1) (upright(bold(x)) - upright(bold(x))_(k - 1)) \
&= (upright(bold(A))_k - upright(bold(A))_(k - 1)) (upright(bold(x)) - upright(bold(x))_(k - 1)) = upright(bold(Q))_k (upright(bold(x)) - upright(bold(x))_(k - 1)) .
$

We shall look for the matrix $upright(bold(T))_k = upright(bold(A))_k - upright(bold(A))_(k - 1)$ satisfying

$ upright(bold(T))_k upright(bold(delta))_k = upright(bold(F)) (upright(bold(x))_k) $

so that

$ upright(bold(d))_k = upright(bold(T))_k (upright(bold(x)) - upright(bold(x))_(k - 1)) $

is minimized to some extent. Now we decompose the vector $upright(bold(x)) - upright(bold(x))_(k - 1)$ into two components, one parallel to $upright(bold(delta))_k$ and another one orthogonal to $upright(bold(delta))_k$ , say

$
upright(bold(x)) - upright(bold(x))_(k - 1) &= upright(bold(v))_k + upright(bold(w))_k \
norm(upright(bold(x)) - upright(bold(x))_(k - 1))_2^2 &= norm(upright(bold(v))_k)_2^2 + norm(upright(bold(w))_k)_2^2
$

with

$ upright(bold(v))_k = upright(bold(P))_k (upright(bold(x)) - upright(bold(x))_(k - 1)) quad "and" quad upright(bold(w))_k = (upright(bold(I)) - upright(bold(P))_k) (upright(bold(x)) - upright(bold(x))_(k - 1)) . $

Here, $upright(bold(P))_k$ is the projection matrix given by

$ upright(bold(P))_k = frac(upright(bold(delta))_k upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) . $

Since

$ upright(bold(T))_k upright(bold(delta))_k = upright(bold(F)) (upright(bold(x))_k) , $

we have

$ upright(bold(T))_k upright(bold(v))_k = upright(bold(T))_k upright(bold(P))_k (upright(bold(x)) - upright(bold(x))_(k - 1)) = frac(upright(bold(delta))_k^(upright(T)) (upright(bold(x)) - upright(bold(x))_(k - 1)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) upright(bold(T))_k upright(bold(delta))_k = frac(upright(bold(delta))_k^(upright(T)) (upright(bold(x)) - upright(bold(x))_(k - 1)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) upright(bold(F)) (upright(bold(x))_k) , $

which is independent of $upright(bold(T))_k$ .

The approximation difference $upright(bold(d))_k = upright(bold(T))_k upright(bold(v))_k + upright(bold(T))_k upright(bold(w))_k$ to some extent is minimized if the second part

$upright(bold(T))_k upright(bold(w))_k$ is zero. Actually, it happens that

$ upright(bold(Q))_k upright(bold(w))_k = upright(bold(Q))_k (upright(bold(I)) - upright(bold(P))_k) (upright(bold(x)) - upright(bold(x))_(k - 1)) = 0 $

since

$ upright(bold(Q))_k = frac(upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) = frac(upright(bold(Q))_k upright(bold(delta))_k upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) = upright(bold(Q))_k upright(bold(P))_k . $

Thus, we can say the matrix $upright(bold(Q))_k$ in this sense minimizes the difference of the approximations.

The generalized secant method is also called the *Broyden method*. It updates the matrix $upright(bold(A))_k$ by

$ upright(bold(A))_k = upright(bold(A))_(k - 1) + upright(bold(Q))_k = upright(bold(A))_(k - 1) + frac(upright(bold(F)) (upright(bold(x))_k) upright(bold(delta))_k^(upright(T)), upright(bold(delta))_k^(upright(T)) upright(bold(delta))_k) . $

The rank of the matrix $upright(bold(Q))_k$ equals one. The possibly expensive evaluation of first-order partial derivatives associated with the exact Newton method is avoided.

One more advantage of the Broyden method is that, if the linear system involving the matrix $upright(bold(A))_(k - 1)$ can be solved efficiently, the linearized system

$ upright(bold(A))_k upright(bold(delta))_(k + 1) = - upright(bold(F)) (upright(bold(x))_k) $

can also be solved efficiently. This is guaranteed by the well-known *Shermann-Morrison formula*.

#thm([Shermann-Morrison formula])[
Let $upright(bold(A))$ be an invertible $n times n$ matrix in $bb(R)^(n times n)$ ; $upright(bold(alpha)) , upright(bold(beta)) in bb(R)^n$ be two vectors and $gamma in bb(R)$ be a scalar. Assume that $upright(bold(beta))^T upright(bold(A))^(- 1) upright(bold(alpha)) + 1 eq.not 0$ . Then the matrix $upright(bold(A)) + upright(bold(alpha)) upright(bold(beta))^T$ is invertible and the identity below holds

$ (upright(bold(A)) + upright(bold(alpha)) upright(bold(beta))^T)^(- 1) = upright(bold(A))^(- 1) (upright(bold(I)) - frac(upright(bold(alpha)) upright(bold(beta))^T upright(bold(A))^(- 1), 1 + upright(bold(beta))^T upright(bold(A))^(- 1) upright(bold(alpha)))) = (upright(bold(I)) - frac(upright(bold(A))^(- 1) upright(bold(alpha)) upright(bold(beta))^T, 1 + upright(bold(beta))^T upright(bold(A))^(- 1) upright(bold(alpha)))) upright(bold(A))^(- 1) . $<eq:9>
]

#prf[
We first verify the invertibility of the matrix $upright(bold(A)) + upright(bold(alpha)) upright(bold(beta))^(upright(T))$ . The factorization below

$ mat(delim: "(", upright(bold(I)), 0; - upright(bold(beta))^(upright(T)) upright(bold(A))^(- 1), 1) mat(delim: "(", upright(bold(A)), upright(bold(alpha)); upright(bold(beta))^(upright(T)), - 1) = mat(delim: "(", upright(bold(A)), upright(bold(alpha)); 0, - (upright(bold(beta))^(upright(T)) upright(bold(A))^(- 1) upright(bold(alpha)) + 1)) $

implies the block two by two matrix is invertible. The factorization below

$ mat(delim: "(", upright(bold(I)), upright(bold(alpha)); 0, 1)
mat(upright(bold(A)), upright(bold(alpha)); upright(bold(beta))^(upright(T)), -1)
= mat(delim: "(", upright(bold(A)) + upright(bold(alpha)) upright(bold(beta))^(upright(T)), 0; upright(bold(beta))^(upright(T)), - 1) $

further indicates the invertibility of the matrix $upright(bold(A)) + upright(bold(alpha)) upright(bold(beta))^(upright(T))$ .

In the next, we will derive the formula (@eq:9). Let $upright(bold(x)) in bb(R)^n$ and $gamma in bb(R)$ be two unknowns. The linear system

$ mat(delim: "(", upright(bold(A)), upright(bold(alpha)); upright(bold(beta))^(upright(T)), - 1) vec(upright(bold(x)), gamma) = vec(upright(bold(f)), 0) $<eq:10>

can be solved by the block Gauss elimination method in two different ways. One first eliminates the unknown vector $upright(bold(x))$ and then solves a scalar equation for $gamma$ . The other one first eliminates the unknown scalar $gamma$ and then solves a linear system for $upright(bold(x))$ .

First we adapt the former approach. Note that from the first equation in (@eq:10), we get

$ upright(bold(x)) = upright(bold(A))^(- 1) (upright(bold(f)) - upright(bold(alpha)) gamma) $

Plugging it into the second equation yields

$ upright(bold(beta))^(upright(T)) upright(bold(A))^(- 1) (upright(bold(f)) - upright(bold(alpha)) gamma) = gamma $

and

$ gamma = frac(upright(bold(beta))^T upright(bold(A))^(- 1) upright(bold(f)), 1 + upright(bold(beta))^(upright(T)) upright(bold(A))^(- 1) upright(bold(alpha))) . $

Substituting this into the equation for $upright(bold(x))$ , we get

$ upright(bold(x)) = (upright(bold(I)) - frac(upright(bold(A))^(- 1) upright(bold(alpha)) upright(bold(beta))^T, 1 + upright(bold(beta))^(upright(T)) upright(bold(A))^(- 1) upright(bold(alpha)))) upright(bold(A))^(- 1) upright(bold(f)) . $<eq:11>

Now we look backward and work with the latter approach. We first have

$ gamma = upright(bold(beta))^(upright(T)) upright(bold(x)) . $

Then substituting this into the first equation in (@eq:10), we arrive at

$ (upright(bold(A)) + alpha beta^(upright(T))) upright(bold(x)) = upright(bold(f)) $

and

$ upright(bold(x)) = (upright(bold(A)) + upright(bold(alpha)) upright(bold(beta))^(upright(T)))^(- 1) upright(bold(f)) . $<eq:12>

Since both identities (@eq:11) and (@eq:12) hold for any vector $upright(bold(f))$ , we conclude that

$ (upright(bold(A)) + upright(bold(alpha)) upright(bold(beta))^(upright(T)))^(- 1) = upright(bold(A))^(- 1) (upright(bold(I)) - frac(upright(bold(alpha)) upright(bold(beta))^T upright(bold(A))^(- 1), 1 + upright(bold(beta))^(upright(T)) upright(bold(A))^(- 1) upright(bold(alpha)))) = (upright(bold(I)) - frac(upright(bold(A))^(- 1) upright(bold(alpha)) upright(bold(beta))^T, 1 + upright(bold(beta))^(upright(T)) upright(bold(A))^(- 1) upright(bold(alpha)))) upright(bold(A))^(- 1) . $<eq:13>

We have completed the proof.
]

#exr[
Let $upright(bold(A)) in bb(R)^(n times n)$ be an invertible matrix and $upright(bold(alpha)) , upright(bold(beta)) in bb(R)^n$ be two vectors. Assume $upright(bold(beta))^T upright(bold(A))^(- 1) upright(bold(alpha)) eq.not 0$ . Derive a formula for computing the inverse of the matrix $mat(delim: "(", upright(bold(A)), upright(bold(alpha)); upright(bold(beta))^T, 0)$ .
]

In the Broyden quasi-Newton iteration, let

$ upright(bold(alpha))_k = frac(upright(bold(F)) (upright(bold(x))_k), norm(upright(bold(delta))_k)_2) , #h(0em) upright(bold(beta))_k = upright(bold(delta))_k / norm(upright(bold(delta))_k)_2 #h(0em) upright(" and ") #h(0em) upright(bold(gamma))_k = frac(upright(bold(A))_(k - 1)^(- 1) upright(bold(alpha))_k, 1 + upright(bold(beta))_k^(upright(T)) upright(bold(A))_(k - 1)^(- 1) upright(bold(alpha))_k) . $

The inverse of $upright(bold(A))_k$ is computed by

$ upright(bold(A))_k^(- 1) = (upright(bold(I)) - frac(upright(bold(A))_(k - 1)^(- 1) upright(bold(alpha))_k upright(bold(beta))_k^T, 1 + upright(bold(beta))_k^(upright(T)) upright(bold(A))_(k - 1)^(- 1) upright(bold(alpha))_k)) upright(bold(A))_(k - 1)^(- 1) = (upright(bold(I)) - upright(bold(gamma))_k upright(bold(beta))_k^(upright(T))) upright(bold(A))_(k - 1)^(- 1) . $

Finally, we get the Broyden quasi-Newton method: assuming an initial approximate Jacobian matrix $upright(bold(A))_0$ is obtained by another method and the first iteration just proceeds as usual, which yields $upright(bold(delta))_1 = - upright(bold(A))_0^(- 1) upright(bold(F)) (upright(bold(x))_0)$ and $upright(bold(x))_1 = upright(bold(x))_0 + upright(bold(delta))_1$ , for $k = 1 , 2 , 3 , dots.h.c$ , do as follows

- Step 1. compute the Jacobian matrix $upright(bold(A))_k$ by

$ upright(bold(A))_k^(- 1) = (upright(bold(I)) - gamma_k upright(bold(beta))_k^T) upright(bold(A))_(k - 1)^(- 1) ; $

- Step 2. compute the quasi-Newton step $upright(bold(delta))_(k + 1)$ by

$ upright(bold(delta))_(k + 1) = - upright(bold(A))_k^(- 1) upright(bold(F)) (upright(bold(x))_k) $

- Step 3. update the solution by

  $ upright(bold(x))_(k + 1) = upright(bold(x))_k + upright(bold(delta))_(k + 1) $

  until the vector $upright(bold(F)) (upright(bold(x))_(k + 1))$ in some norm $norm(dot.op)$ relative to the initial one $norm(upright(bold(F)) (upright(bold(x))_0))$ is less than a prespecified tolerance.