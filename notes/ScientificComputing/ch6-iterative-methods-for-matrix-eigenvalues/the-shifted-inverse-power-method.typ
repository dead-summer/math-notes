#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(3)
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

= The shifted inverse power method
<the-shifted-inverse-power-method>
The power method can also be used to compute any other eigenvalue if an approximation of the eigenvalue is known and the eigenvalue is well separated from others.

Let $mu$ be an approximate eigenvalue of $upright(bold(A))$ . Assume that there is an eigenvalue $lambda_m$ such that

$ abs(lambda_m - mu) < abs(lambda_j - mu) quad "for" j eq.not m . $

Note that now the scalar $(lambda_m - mu)$ is the modulus-minimum eigenvalue of the shifted matrix $(upright(bold(A)) - mu upright(bold(I)))$ . Then we can apply the inverse power method to the shifted matrix to compute the associated eigenvector $upright(bold(v))_m$ as well as the eigenvalue $lambda_m$ . The resulting method is called the shifted inverse power method. It takes the form, for $k = 0 , 1 , 2 , dots.h.c$ ,

- Step 1. compute the linear system: $(upright(bold(A)) - mu upright(bold(I))) upright(bold(z))_(k + 1) = upright(bold(x))_k$ ;

- Step 2. normalize vector $upright(bold(z))_(k + 1)$ : choose $r_(k + 1)$ such that the 2-norm of vector

  $ upright(bold(x))_(k + 1) = 1 / r_(k + 1) upright(bold(z))_(k + 1) $

  is equal to one and its first modulus-maximum entry has positive sign. If $norm(upright(bold(x))_(k + 1) - upright(bold(x))_k)_oo$ is less than a specified tolerance, compute

  $ mu_(k + 1) = upright(bold(x))_(k + 1)^T upright(bold(A)) upright(bold(x))_(k + 1) $

  and stop the iteration; otherwise, increase $k$ by one and go to step 1 .

Let $lambda_ell$ be the one which minimizes $abs(lambda_j - mu)$ for $j eq.not m$ . The convergence of the shifted inverse power method is determined by the ratio $abs(lambda_m - mu) \/ abs(lambda_ell - mu)$ . Analogous to (17)-(19), a few convergence estimates can also be obtained

$ (mu_(k + 1) - mu) - (lambda_m - mu) approx [(mu_k - mu) - (lambda_m - mu)] (frac(lambda_m - mu, lambda_ell - mu))^2 , $

i.e.,

$ mu_(k + 1) - lambda_m approx (mu_k - lambda_m) (frac(lambda_m - mu, lambda_ell - mu))^2 , $<eq:21>

$ abs(lambda_m - mu_k) lt.eq C norm(upright(bold(x))_k - upright(bold(v))_m)^2 $<eq:22>

and

$ norm(upright(bold(x))_k - upright(bold(v))_m)_2 lt.eq C (abs(lambda_m - mu) / abs(lambda_ell - mu))^k . $<eq:23>

If $abs(lambda_j - mu) > abs(lambda_ell - mu)$ for all $j eq.not ell , m$ , we have the approximation

$ upright(bold(x))_(k + 1) - upright(bold(v))_m approx frac(lambda_m - mu, lambda_ell - mu) (upright(bold(x))_k - upright(bold(v))_m) quad "for large" k , $<eq:24>

which is similar to (20).

The sequence of vectors ${upright(bold(x))_k}_(k = 1)^oo$ will converge to the eigenvector $upright(bold(v))_m$ and the sequence of scalars ${mu_k}_(k = 1)^oo$ will converge to the eigenvalue $lambda_m$ , which is initially approximated by $mu$ .

#exr[
Apply the shifted inverse power iteration to find the eigenvalue that is closest to $mu = 1.5$ of the tridiagonal matrix $upright(bold(A))_6 in bb(R)^(6 times 6)$ below

$ upright(bold(A))_6 = mat(delim: "[", 2, - 1, , , ; - 1, 2, - 1, , ; #none, dots.down, dots.down, dots.down, ; #none, , - 1, 2, - 1; #none, , , - 1, 2)_(n times n) . $

Please print out the computed eigenvalue and the associated eigenvector as well as the number of iterations used by the method. Please state the initial vector that you choose for the eigenvector.
]

#exr[
Apply the shifted inverse power iteration to find the eigenvalue that is closest to $mu = 1.5$ of the matrix $upright(bold(A))_n in bb(R)^(n times n)$ below

$ upright(bold(A))_n = 1 / (n + 1)^3 mat(delim: "[", n, n - 1, n - 2, dots.h.c, 2, 1; n - 1, 2 (n - 1), 2 (n - 2), dots.h.c, 4, 2; n - 2, 2 (n - 2), 3 (n - 2), dots.down, 6, 3; dots.v, dots.v, dots.down, dots.down, dots.v, dots.v; 2, 4, 6, dots.h.c, 2 (n - 1), n - 1; 1, 2, 3, dots.h.c, n - 1, n)_(n times n) . $

For $n = 6$ , please print out the computed eigenvalue and the associated eigenvector as well as the number of iterations used by the method. Please state the initial vector that you choose for the eigenvector.
]

Once the scalar $mu_k$ is close to $lambda_m$ (but it is hard to tell in practice when $mu_k$ is close to $lambda_m$ ), the convergence can be accelerated by replacing $mu$ with $mu_k$ in each iteration. The power method is the so-called the Rayleigh quotient accelerated inverse iteration or Rayleigh inverse iteration for symmetric matrices. Let $mu_0 = mu$ . It takes the form, for $k = 0 , 1 , 2 , dots.h.c$ ,

- Step 1. solve the linear system: $(upright(bold(A)) - mu_k upright(bold(I))) upright(bold(z))_(k + 1) = upright(bold(x))_k$ ;

- Step 2. normalize vector $upright(bold(z))_(k + 1)$ : choose $r_(k + 1)$ such that the 2-norm of vector

  $ upright(bold(x))_(k + 1) = 1 / r_(k + 1) upright(bold(z))_(k + 1) $

  is equal to one and its first modulus-maximum entry has positive sign. If $norm(upright(bold(x))_(k + 1) - upright(bold(x))_k)_oo$ is less than a specified tolerance, compute

  $ mu_(k + 1) = upright(bold(x))_(k + 1)^T upright(bold(A)) upright(bold(x))_(k + 1) $

  and stop the iteration; otherwise, increase $k$ by one and go to step 1 .

The Rayleigh quotient inverse iteration has a higher convergence rate than the previous versions of the power method. For example, if $abs(lambda_j - mu) > abs(lambda_ell - mu)$ for all $j eq.not ell , m$ , estimate (@eq:24) indicates that we have the approximation

$ upright(bold(x))_(k + 1) - upright(bold(v))_m approx frac(lambda_m - mu_k, lambda_ell - mu_k) (upright(bold(x))_k - upright(bold(v))_m) $<eq:25>

while

$ abs(lambda_m - mu_k) lt.eq C norm(upright(bold(x))_k - upright(bold(v))_m)^2 $<eq:26>

Combining these two estimates above together, we get

$ norm(upright(bold(x))_(k + 1) - upright(bold(v))_m) lt.eq C norm(upright(bold(x))_k - upright(bold(v))_m)^3 $<eq:27>

with $C$ be a generic positive constant, independent of $k$ . On the other hand, estimate (@eq:21) implies that

$ lambda_m - mu_(k + 1) approx (lambda_m - mu_k) (frac(lambda_m - mu_k, lambda_ell - mu_k))^2 = (lambda_m - mu_k)^3 / (lambda_ell - mu_k)^2 lt.eq 4 (lambda_m - mu_k)^3 / (lambda_ell - lambda_m)^2 $<eq:28>

for sufficiently large $k$ . That the last inequality holds is because we have

$ abs(lambda_ell - lambda_m) lt.eq abs(lambda_ell - mu_k) + abs(mu_k - lambda_m) lt.eq 2 abs(lambda_ell - mu_k) , $

i.e.,

$ abs(lambda_ell - mu_k) gt.eq 1 / 2 abs(lambda_ell - lambda_m) $

when $k$ is sufficiently large. Both sequences converge at a cubic convergence rate.

#rmk[
It is true that the Rayleigh inverse iteration converges cubically once it converges. However, the Rayleigh iteration may converge to an eigenvalue which is far away from the initial guess $mu$ .
]
