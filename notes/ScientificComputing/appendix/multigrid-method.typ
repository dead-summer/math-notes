#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/subpar:0.1.1"
#import "@preview/lovelace:0.3.0": *

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

= The weighted Jacobi method
<the-weighted-jacobi-method>

We start with the two-point boundary value problem (BVP)

$ - u^('') (x) = f (x) quad "for" x in (0 , 1) , $<eq:1>

$ u (x) = 0 quad "at" x = 0 , 1 $<eq:2>

with $f (x)$ be a known smooth function. Assume the problem is discretized with the three-point finite difference method on a uniform grid $cal(T)_h$ with mesh parameter $h = 1 \/ J$ and nodes ${x_j = j h}_(j = 0)^J$ . The finite difference equations read

$ 1 / h^2 mat(delim: "(", 2, - 1, , , ; - 1, 2, - 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 2, - 1; #none, , , - 1, 2) vec(u_1, u_2, dots.v, u_(J - 2), u_(J - 1)) = vec(f_1, f_2, dots.v, f_(J - 2), f_(J - 1)) . $

Here, $f_j = f (x_j)$ and $u_j$ is the finite difference approximation to $u (x_j)$ .

Let $upright(bold(A))_h$ be the coefficient matrix of the linear system; $upright(bold(u))_h = (u_1 , u_2 , dots.h.c , u_(J - 1))^(upright(T))$ and $upright(bold(b))_h = (f_1 , f_2 , dots.h.c , f_(J - 1))^(upright(T))$ be the unknown and known vectors. In matrix-vector notation, the linear system takes

$ upright(bold(A))_h upright(bold(u))_h = upright(bold(b))_h $

Let $upright(bold(D))_h$ be the diagonal part of matrix $upright(bold(A))_h$ , i.e.,

$ upright(bold(D))_h = "diag" (2 / h^2 , 2 / h^2 , dots.h.c , 2 / h^2) . $

#subpar.grid(
  figure(image("../img/eigenvector-image1.svg"), caption: [$k=1$]),
  figure(image("../img/eigenvector-image2.svg"), caption: [$k=2$]),
  figure(image("../img/eigenvector-image3.svg"), caption: [$k=3$]),
  figure(image("../img/eigenvector-image4.svg"), caption: [$k=4$]),
  columns: (15em, 15em),
  v(0.5pt),
  caption: [Plots of four eigenvectors]
)



The weighted Jacobi method for iteratively solving the discrete equations reads

$ upright(bold(u))_h^((n + 1)) = upright(bold(u))_h^((n)) + omega upright(bold(D))_h^(- 1) (upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h^((n))) $

for $n = 0 , 1 , dots.h.c$ , with $0 < omega lt.eq 1$ .

Recall that matrix $upright(bold(A))_h$ has $(J - 1)$ distinct real eigenvalues

$ lambda_k (upright(bold(A))_h) = 4 / h^2 sin^2 frac(k pi h, 2) quad "for" k = 1 , 2 , dots.h.c , J - 1 $

and the associated eigenvectors

$ upright(bold(g))_k = (g_k^((1)) , g_k^((2)) , dots.h.c , g_k^((J - 1)))^(upright(T)) $

with $upright(bold(g))_k = sin (k pi j h)$ .

Note that large mode index $k (k gt.eq J \/ 2)$ corresponds to high frequency modes while small mode index $k (k < J \/ 2)$ corresponds to low frequency modes. The eigenvalue $lambda_k (upright(bold(A))_h)$ increases as the

mode index $k$ increases,

$ lambda_1 (upright(bold(A))_h) lt.eq lambda_2 (upright(bold(A))_h) lt.eq dots.h.c lt.eq lambda_(J - 1) (upright(bold(A))_h) $

The smallest eigenvalue $lambda_1 (upright(bold(A))_h)$ is on the order of $pi^2$ ,

$ lambda_1 (upright(bold(A))_h) = 4 / h^2 sin^2 frac(pi h, 2) approx pi^2 . $

The largest eigenvalue $lambda_(J - 1) (upright(bold(A))_h)$ is on the order of $4 \/ h^2$ ,

$ lambda_(J - 1) (upright(bold(A))_h) = 4 / h^2 cos^2 frac(pi h, 2) approx 4 / h^2 . $

The iteration/propagation matrix of the weighted Jacobi iteration reads

$ upright(bold(B))_h = upright(bold(I))_h - frac(omega h^2, 2) upright(bold(A))_h $

It has the same set of eigenvectors as matrix $upright(bold(A))_h$ . Its eigenvalues are given by

$ lambda_k (upright(bold(B))_h) = 1 - 2 omega sin^2 frac(k pi h, 2) quad "for" k = 1 , 2 , dots.h.c , J - 1 . $

They are decreasing as $k$ increases:

$ lambda_1 (upright(bold(B))_h) gt.eq lambda_2 (upright(bold(B))_h) gt.eq dots.h.c gt.eq lambda_(J - 1) (upright(bold(B))_h) $

The maximum eigenvalue

$ lambda_1 (upright(bold(B))_h) = 1 - 2 omega sin^2 frac(pi h, 2) approx 1 - omega / 2 (pi h)^2 $

and the minimum eigenvalue

$ lambda_(J - 1) (upright(bold(B))_h) = 1 - 2 omega sin^2 frac((J - 1) pi h, 2) = 1 - 2 omega cos^2 frac(pi, 2 J) approx 1 - 2 omega + 1 / 4 pi^2 omega h^2 . $

The eigenvalue in the middle (for $m = J \/ 2$ )

$ lambda_(J \/ 2) (upright(bold(B))_h) = 1 - 2 omega sin^2 pi / 4 = 1 - omega . $

For $omega = 1 , lambda_(J \/ 2) = 0$ and $lambda_(J - 1) approx - 1 + 1 / 4 pi^2 h^2$ . For $omega = 1 / 2 , lambda_(J \/ 2) = 1 \/ 2$ and $lambda_(J - 1) approx 1 / 8 pi^2 h^2$ . For $omega = 1 / 3 , lambda_(J \/ 2) = 2 \/ 3$ and $lambda_(J - 1) approx 1 / 3 + 1 / 12 pi^2 h^2$ . For $omega = 2 / 3 , lambda_(J \/ 2) = 1 \/ 3$ and $lambda_(J - 1) approx - 1 / 3 + 1 / 6 pi^2 h^2$ .

#figure(
  image("../img/weighted-jacobi-eigenvalue-distribution.svg"), caption: [Eigenvalue distribution for the weighted Jacobi iteration]
)<fig:2>


@fig:2 shows the eigenvalue distribution of the propagation matrix $upright(bold(B))_h$ for the weighted Jacobi iteration with different damping parameters: $omega = 1 \/ 3 , 1 \/ 2 , 2 \/ 3$ and 1 .

Note that the eigenvectors $upright(bold(g))_k$'s form is an orthogonal basis of $bb(R)^(J - 1)$ . Assume that the initial iteration error has the decomposition

$ upright(bold(e))_h^((0)) = upright(bold(u)) - upright(bold(u))_h^((0)) = sum_(k = 1)^(J - 1) c_k upright(bold(g))_k $

The error $upright(bold(e))_h^((n)) = upright(bold(u))_h - upright(bold(u))_h^((n))$ at the $n^(t h)$ iteration has the form

$ upright(bold(e))_h^((n)) = upright(bold(B))_h^((n)) upright(bold(e))_h^((0)) = sum_(k = 1)^(J - 1) c_k lambda_k^((n)) (upright(bold(B))_h) upright(bold(g))_k . $

We call the sum

$ upright(bold(e))_(h , "high")^((n)) = sum_(k = J \/ 2)^(J - 1) c_k lambda_k^((n)) upright(bold(g))_k $

as the "high frequency part" of the error $upright(bold(e))_h^((n))$ and call the sum

$ upright(bold(e))_(h , "low")^((n)) = sum_(k = 1)^(J \/ 2 - 1) c_k lambda_k^((n)) upright(bold(g))_k $

as the "low frequency part" of the error $upright(bold(e))_h^((n))$ .

By the orthogonality of the eigenvectors, we have

$ norm(upright(bold(e))_h^((n)))_2^2 = norm(upright(bold(e))_(h , "low")^((n)))_2^2 + norm(upright(bold(e))_(h , "high")^((n)))_2^2 . $

For the low frequency part, there is a positive number $c_1 > 0$ such that

$ norm(upright(bold(e))_(h , "low")^((n + 1)))_2 lt.eq (1 - c_1 h^2) norm(upright(bold(e))_(h , "low")^((n)))_2 $

while for the high frequency part of the error,there is another positive number $c_2 in (0 , 1)$ , independent of mesh parameter $h$ ,such that

$ norm(upright(bold(e))_(h , "high")^((n + 1)))_2 lt.eq (1 - c_2) norm(upright(bold(e))_(h , "high")^((n)))_2 $

By the weighted Jacobi method with $omega < 1$ ,the high frequency components of the iteration error $upright(bold(e))_h^((n))$ are associated with (absolute value) small eigenvalues $lambda_k (upright(bold(B))_h)$ and thus decay faster than low frequency components.

It is the fact that the eigenvalues of the iteration matrix associated with the low frequency error components are too close to one which makes the weighted Jacobi method converges extremely slowly on a fine grid.

On a fixed grid, the weighted Jacobi iteration damps out the high frequency errors quickly while it damps out the low frequency errors (very) slowly. However, low frequency error on a fine grid may become high frequency error on a coarse grid. Even though low frequency error may be hard to remove on a fine grid, it can be quickly and easily removed on a coarse grid by the weighted Jacobi method.

The idea of the two-grid and multigrid iterations, which will be introduced in the next two sections, is to use multiple (coarse and fine) grids to simultaneously and thus quickly damp out the low and high frequency errors.

= Two-grid iteration
<two-grid-iteration>
In this section, we will introduce a two-grid method, which uses a fine grid and a coarse grid to sequentially damp out the high and low frequency errors. A two-grid iteration consists of two steps:

- *Step 1.* reduce the high frequency errors on the fine grid with a smoothing or relaxation method such as the weighted Jacobi methods for a few iterations.

- *Step 2.* solve the residual equation on the coarse grid to remove the low frequency errors.

Since the dimension of the solution space on the coarse grid is much lower than that on the fine grid, the two-grid method/iteration will be much more efficient than the corresponding iterative method that simply solves equations on the fine grid.

The iteration on the fine grid in step 1 of the two-grid iteration is standard. In the next, we mainly discuss on the solution of the residual equation on the coarse grid of step 2 .

Denote the fine and coarse grids by $cal(T)_h$ and $cal(T)_(2 h)$ , respectively. Let $J$ be a positive even integer and $h = 1 \/ J$ . Let ${x_h^((j)) = h j}_(j = 0)^J$ be the nodes of the fine grid $cal(T)_h ; {x_(2 h)^((i)) = 2 h i}_(i = 0)^(J \/ 2)$ be the nodes of the coarse grid $cal(T)_(2 h)$ .

Assume the discrete linear system for the model two-point BVP (1)-(2) on the fine grid $cal(T)_h$ reads

$ upright(bold(A))_h upright(bold(u))_h = upright(bold(b))_h $

which may result from discretization with the finite difference method (or the finite element method).

Recall that a stationary iterative method for the linear system takes the form

$ upright(bold(u))_h^((n + 1)) = upright(bold(u))_h^((n)) + upright(bold(P))_h^(- 1) (upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h^((n))) quad "for" n = 0 , 1 , dots.h.c , $

with $upright(bold(P))_h$ being a preconditioner. The closer is the preconditioner $upright(bold(P))_h$ to $upright(bold(A))_h$ ,the faster the iteration converges. The weighted Jacobi method corresponds to the case that $upright(bold(P))_h = upright(bold(D))_h \/ omega$ with $omega in \( 0 , 1 \]$ and $upright(bold(D))_h$ be the diagonal part of $upright(bold(A))_h$ .

For step 2 of the two-grid method,the preconditioner $upright(bold(P))_h$ will be chosen to be close to the (stiffness) matrix $upright(bold(A))_(2 h)$ on the coarse grid $cal(T)_(2 h)$ . However,because of the difference in dimensions of the matrices and vectors on the fine and coarse grids, any vector on the fine grid must be appropriately restricted from the fine grid to the coarse grid before it is multiplied by the inverse of matrix $upright(bold(A))_(2 h)$ and the correction vector on the coarse grid must be prolonged from coarse grid to the fine grid before it is added to the approximate solution vector on the fine grid. We do this in four sub-steps:

- *Step 2.1.* we first restrict the fine residual

$ upright(bold(r))_h^((n)) = upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h^((n)) $

onto the coarse grid $cal(T)_(2 h)$ to get a coarse residual $upright(bold(r))_(2 h)^((n))$ ;

#figure(
  image("../img/residual-restriction.svg"),
  caption: [residual restriction along a line]
)

- *Step 2.2.* next solve the coarse grid residual equation

$ upright(bold(A))_(2 h) upright(bold(d))_(2 h)^((n)) = upright(bold(r))_(2 h)^((n)) $

- *Step 2.3.* then prolong the coarse correction $upright(bold(d))_(2 h)^((n))$ back onto the fine grid $cal(T)_h$ to get a fine correction $upright(bold(d))_h^((n))$ ;

#figure(
  image("../img/correction-prolongation.svg"), 
  caption: [correction prolongation along a line]
)

- *Step 2.4.* finally update the solution by adding the fine correction

$ upright(bold(u))_h^((n + 1)) = upright(bold(u))_h^((n)) + upright(bold(d))_h^((n)) . $

Denote by $upright(bold(I))_h^(2 h)$ the map/operator for the fine residual $upright(bold(r))_h^((n))$ to the coarse residual $upright(bold(r))_(2 h)^((n))$ ; denote by $upright(bold(I))_(2 h)^h$ the map/operator for the coarse correction $upright(bold(d))_(2 h)^((n))$ to the fine correction $upright(bold(d))_h^((n))$ . That is,

$ upright(bold(r))_(2 h)^((n)) = upright(bold(I))_h^(2 h) upright(bold(r))_h^((n)) #h(0em) upright(" and ") #h(0em) upright(bold(d))_h^((n)) = upright(bold(I))_(2 h)^h upright(bold(d))_(2 h)^((n)) . $

The four sub-steps above can be all put together by a single equation

$ upright(bold(u))_h^((n + 1)) = upright(bold(u))_h^((n)) + upright(bold(I))_(2 h)^h upright(bold(A))_(2 h)^(- 1) upright(bold(I))_h^(2 h) (upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h^((n))) . $

Note that $upright(bold(I))_h^(2 h)$ and $upright(bold(I))_(2 h)^h$ are actually rectangular matrices,which are called the restriction and prolongation matrices respectively,while the matrix $upright(bold(I))_(2 h)^h upright(bold(A))_(2 h)^(- 1) upright(bold(I))_h^(2 h)$ is square. Even though the square matrix may not be invertible, it is an approximation of the inverse of matrix $upright(bold(A))_(2 h)$ or $upright(bold(A))_h$ . In the next, we will consider specific instances of the restriction and prolongation matrices.

First, we can make the prolongation by linear interpolation

$ d_h^(2 i) = d_(2 h)^i $

$ d_h^(2 i - 1) = 1 / 2 (d_(2 h)^(i - 1) + d_(2 h)^i) . $

In matrix-vector notation, we have

$ upright(bold(d))_h equiv vec(d_h^0, d_h^1, d_h^2, d_h^3, d_h^4) =
mat(delim: "(",
  1, 0, 0;
  1 \/ 2, 1 \/ 2, 0;
  0, 1, 0;
  0, 1 \/ 2, 1 \/ 2;
  0, 0, 1
  ) vec(d_(2 h)^0, , d_(2 h)^1, , d_(2 h)^2) equiv upright(bold(I))_(2 h)^h upright(bold(d))_(2 h) . $

For the preconditioning matrix $upright(bold(P))_h$ to be symmetric, we often choose the restriction matrix $upright(bold(I))_h^(2 h)$ as the transpose/adjoint of the prolongation matrix $upright(bold(I))_(2 h)^h$ scaled by an appropriate constant, i.e., $upright(bold(I))_h^(2 h) = mu (upright(bold(I))_(2 h)^h)^(upright(T))$ for some constant $mu$ . For the example above, we have

$ (upright(bold(I))_(2 h)^h)^(upright(T)) = mat(delim: "(", 1, 1 \/ 2, 0, 0, 0; 0, 1 \/ 2, 1, 1 \/ 2, 0; 0, 0, 0, 1 \/ 2, 1) $

We may write down the coarse residual entry by entry,

$ r_(2 h)^0 = mu (r_h^0 + 1 / 2 r_h^1) $

$ r_(2 h)^1 = mu (1 / 2 r_h^1 + r_h^2 + 1 / 2 r_h^3) $

$ r_(2 h)^2 = mu (1 / 2 r_h^3 + 1 / 2 r_h^4) $

We remark here that we have to choose the constant $mu$ carefully. The constant $mu$ needs to be selected so that both the fine grid equation and the coarse grid equation are consistent with the corresponding continuous problem.

Assume that the residual equation

$ upright(bold(A))_h upright(bold(d))_h = upright(bold(r))_h $

is an approximation of the differential equation

$ - d^('') (x) = s (x) $

on the fine grid $cal(T)_h$ with

$ lim_(h arrow.r 0) d_h^((i)) = d (x_h^((i))) $

for each fixed value of $h i$ . Assume the projected system

$ upright(bold(A))_(2 h) upright(bold(d))_(2 h) = upright(bold(r))_(2 h) $

is an approximation of the same differential equation on the coarse grid $cal(T)_(2 h)$ with

$ lim_(h arrow.r 0) d_(2 h)^((i)) = d (x_(2 h)^((i))) $

for each fixed value of $2 h i$ .

In general, if $norm(upright(bold(r))_h)_oo approx h^k norm(s)_oo$ , we should choose the constant $mu$ such that

$ mu norm((upright(bold(I))_(2 h)^h)^(upright(T)) upright(bold(r))_h)_oo = norm(upright(bold(I))_h^(2 h) upright(bold(r))_h)_oo = norm(upright(bold(r))_(2 h))_oo approx (2 h)^k norm(s)_oo approx 2^k norm(upright(bold(r))_h)_oo . $

Assume

$ norm((upright(bold(I))_(2 h)^h)^(upright(T)) upright(bold(r))_h)_oo approx 2^m norm(upright(bold(r))_h)_oo $

for some integer $m > 0$ . When $upright(bold(I))_h^(2 h)$ is defined by piecewise linear interpolation, $m$ is the space dimensions. Anyway, we have

$ mu approx 2^(k - m) $

Only in this way, the approximations of the differential equations on the fine and coarse grids are consistent.

For example, if the ODE

$ - d^('') (x) = s (x) $

is discretized with the finite difference method, entries of the right hand side in the discrete equations are simply the values of $s (x)$ at the grid nodes, i.e.,

$ upright(bold(r))_h = (s (x_h^((1)) , x_h^((2)) , dots.h.c , s (x_h^((J - 1)))))^(upright(T)) . $

In this case, $norm(upright(bold(r))_h)_oo approx norm(s)_oo$ , i.e., $k = 0$ and $m = 1$ . As a result, $mu = 2^(k - m) = 1 \/ 2$ . If the ODE is discretized with the finite element method, entries of the right hand side in the discrete equations are roughly the values of $s (x)$ at the grid nodes multiplied by the mesh parameter $h$ , i.e.,

$ upright(bold(r))_h approx h (s (x_h^((1)) , x_h^((2)) , dots.h.c , s (x_h^((J - 1)))))^(upright(T)) . $

In this case, $norm(upright(bold(r))_h)_oo approx h norm(s)_oo$ , i.e., $k = 1$ and $m = 1$ . As a result, $mu = 2^(k - m) = 1$ .

#figure(
  kind: "algorithm",
  supplement: [Algorithm],

  pseudocode-list(hooks: .5em, booktabs: true, numbered-title: [The two-grid iteration], line-numbering: none)[
    + *While* $(norm(upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h) gt.eq upright(" tol "))$ *do* #h(1fr)

      + *step 1.* smoothing
      
      + make the weighted Jacobi relaxation several times

      + $u_h arrow.l u_h + omega upright(bold(D))_h^(- 1) (upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h)$

      + *step 2.* residual restriction

      + compute the residual $upright(bold(r))_h = upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h$

      + restrict residual $upright(bold(r))_(2 h) = upright(bold(I))_h^(2 h) upright(bold(r))_h .$

      + *step 3.* solve coarse grid equation

      + solve the residual equation: $upright(bold(A))_(2 h) upright(bold(d))_(2 h) = upright(bold(r))_(2 h)$ .

      + *step 4.* correction prolongation

      + prolong the correction: $upright(bold(d))_h = upright(bold(I))_(2 h)^h upright(bold(d))_(2 h)$ .

      + *step 5.* update the iterated solution

      + add correction to the iterated solution: $upright(bold(u))_h arrow.l upright(bold(u))_h + upright(bold(d))_h$ .

    + *end while*
  ]
)


= Multigrid iteration
<multigrid-iteration>
The two-grid iteration is much more efficient than the single grid iteration since the low frequency errors are damped out on the much lower dimensional coarse grid, which greatly reduces the number of arithmetic operations.

However, even though the coarse grid solution space has a much lower space dimension, there are still situations where the dimension of the coarse grid space is very large. To get more efficient algorithms, we can recursively apply the idea of the two-grid iteration. The low frequency errors on the fine grid, after they are projected/restricted onto the coarse grid space, can also be decomposed into a low frequency part and a high frequency part. The high frequency part can also be efficiently reduced by a smoothing procedure and the low frequency part on the coarse grid can be further reduced on the even coarser grid.

#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(hooks: .5em,
    booktabs: true,
    numbered-title: [makeMultigridIteration $(upright(bold(A))_h , upright(bold(b))_h , upright(bold(u))_h)$],
    line-numbering: none)[
    + *If* the dimension is sufficiently small *then* #h(1fr)
      + directly solve the system
      + *return*
    + *else*
      + *step 1.* pre-smoothing

      + make the weighted Jacobi relaxation several times

      + $u_h arrow.l u_h + omega upright(bold(D))_h^(- 1) (upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h)$

      + *step 2.* residual restriction

      + compute the residual $upright(bold(r))_h = upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h$

      + restrict residual $upright(bold(r))_(2 h) = upright(bold(I))_h^(2 h) upright(bold(r))_h .$

      + *step 3.* solve the coarse grid equation

      + makeMultigridIteration $(upright(bold(A))_(2 h) , upright(bold(r))_(2 h) , upright(bold(d))_(2 h))$

      + *step 4.* correction prolongation

      + prolong the correction: $upright(bold(d))_h = upright(bold(I))_(2 h)^h upright(bold(d))_(2 h)$ .

      + *step 5.* update the iterated solution

      + add the correction: $upright(bold(u))_h arrow.l upright(bold(u))_h + upright(bold(d))_h$ .

      + *step 6.* post-smoothing

      + make the weighted Jacobi relaxation several times

      + $u_h arrow.l u_h + omega upright(bold(D))_h^(- 1) (upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h)$
  ]
)

#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(hooks: .5em,
    booktabs: true,
    numbered-title: [solveByMultigridIteration $(upright(bold(A))_h , upright(bold(b))_h , upright(bold(u))_h)$],
    line-numbering: none)[
      + *while* $(norm(upright(bold(b))_h - upright(bold(A))_h upright(bold(u))_h) gt.eq upright(" tol "))$ *do*
        + makeMultigridIteration $(upright(bold(A))_h , upright(bold(b))_h , upright(bold(u))_h)$

      + *end while* #h(1fr)
  ]
)

#rmk[
The weighted Jacobi method in the pre- and post-smoothing steps can be replaced with other relaxation method such as the Gauss-Seidel method or even the GMRES method (for the Helmholtz equation).
]

#rmk[
The number of iterations in the pre- and post-smoothing steps needs to be fine-tuned and is problem-dependent to get best performance.
]

The multigrid method is an optimal iterative method for linear systems in that the iteration number used to achieve a fixed accuracy is independent of the mesh parameter on the finest grid.

Once again, the multigrid method simultaneously damps out low and high frequency errors with multiple grids. Low frequency errors are damped out on coarse grids and high frequency errors are damped out on fine grids.

= The full multigrid method
<the-full-multigrid-method>
The initial guess for the multigrid iteration on the fine grid $cal(T)_h$ can be obtained from the prolongation of the solution on the coarse grid $cal(T)_(2 h)$ . The resulting method is called the full multigrid method.

#rmk[
The multigrid iteration can be used as a preconditioner for a Krylov subspace iterative method.
]
