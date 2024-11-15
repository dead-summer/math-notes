#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with()
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)

#counter(heading).update(4)
#set heading(numbering: "1.1.1")

// 上一节编号到 54
#counter(math.equation).update(54)

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

= The generalized minimal residual method
<the-generalized-minimal-residual-method>
In this section, we consider solving the linear system (1) with a general coefficient matrix $upright(bold(A))$ .

To overcome the problems associated with the Arnoldi method, Saad and Shultz (1986) proposed the generalized minimal residual (GMRES) method. In the GMRES method, the subspaces $cal(K)_m$ and $cal(L)_m$ are chosen to be different. The test space $cal(L)_m$ is chosen to be the range of matrix $upright(bold(A))$ on the trial space $cal(K)_m$ . That is,

$ cal(K)_m = "span" {upright(bold(r))_0 , upright(bold(A r))_0 , dots.h.c , upright(bold(A))^(m - 1) upright(bold(r))_0} $

and

$ cal(L)_m = "span" {upright(bold(A r))_0 , upright(bold(A))^2 upright(bold(r))_0 , dots.h.c , upright(bold(A))^m upright(bold(r))_0} . $

Or correspondingly,

$ upright(bold(W))_m = upright(bold(A)) upright(bold(V))_m $

Plugging this into

$ upright(bold(W))_m^(upright(T)) upright(bold(A)) upright(bold(V))_m upright(bold(z))_m = upright(bold(W))_m^(upright(T)) upright(bold(r))_0 $

we get

$ upright(bold(V))_m^(upright(T)) upright(bold(A))^(upright(T)) upright(bold(A)) upright(bold(V))_m upright(bold(z))_m = upright(bold(V))_m^(upright(T)) upright(bold(A))^(upright(T)) upright(bold(r))_0 $<eq:55>

Let $overline(upright(bold(H)))_m$ be the $(m + 1) times m$ matrix with the matrix $upright(bold(H))_m$ extended by row $(0 , dots.h.c , 0 , h_(m + 1 , m))$ from

the bottom,

$ overline(upright(bold(H)))_m = mat(delim: "[", h_(1 , 1), h_(1 , 2), dots.h.c, h_(1 , m - 1), h_(1 , m); h_(2 , 1), h_(2 , 2), dots.h.c, h_(2 , m - 1), h_(2 , m); 0, h_(3 , 2), dots.down, dots.v, dots.v; dots.v, dots.down, dots.down, h_(m - 1 , m - 1), h_(m - 1 , m); 0, dots.h.c, 0, h_(m , m - 1), h_(m , m); 0, dots.h.c, 0, 0, h_(m + 1 , m))_((m+1) times m) . $

Note that we have

$ upright(bold(A)) upright(bold(V))_m = upright(bold(V))_(m + 1) overline(upright(bold(H)))_(upright(bold(m))) $

and

$ upright(bold(V))_m^(upright(T)) upright(bold(r))_0 = beta upright(bold(V))_m^(upright(T)) upright(bold(v))_1 = beta upright(bold(e))_1 $

with $beta = norm(upright(bold(r))_0)$ . We can simplify linear system (@eq:55) as

$ overline(upright(bold(H)))_(upright(bold(m)))^(upright(T)) overline(upright(bold(H)))_(upright(bold(m))) upright(bold(z))_m = beta overline(upright(bold(H)))_(upright(bold(m)))^(upright(T)) upright(bold(e))_1 . $<eq:56>

The solution of linear system (@eq:56) is equivalent to the least squares problem:

$ min norm(overline(upright(bold(H)))_(upright(bold(m))) upright(bold(z))_m - beta upright(bold(e))_1)_2 , $

which can be further (easily and conveniently) solved by the QR decomposition for the rectangular matrix $overline(upright(bold(H)))_(upright(bold(m)))$ . In fact, assume that matrix $overline(upright(bold(H)))_(upright(bold(m)))$ has a QR decomposition as follows

$ overline(upright(bold(H)))_(upright(bold(m))) = upright(bold(Q))_(m + 1) upright(bold(R))_m $

with $upright(bold(Q))_(m + 1) in bb(R)^((m + 1) times (m + 1))$ be an orthogonal matrix and $upright(bold(R))_m in bb(R)^((m + 1) times m)$ be an upper triangular matrix. The QR decomposition can be completed with the Householder transform or the Givens transform. After the QR decomposition for matrix $overline(upright(bold(H)))_(upright(bold(m)))$ , we get an equivalent least squares problem:

$ min norm(overline(upright(bold(H)))_(upright(bold(m))) upright(bold(z))_m - beta upright(bold(e))_1)_2 = min norm(upright(bold(R))_m upright(bold(z))_m - beta upright(bold(Q))_(m + 1)^(upright(T)) upright(bold(e))_1)_2 . $

Note that the linear system

$ upright(bold(R))_m upright(bold(z))_m = beta upright(bold(Q))_(m + 1)^(upright(T)) upright(bold(e))_1 $

has $(m + 1)$ equations for $m$ unknowns. We can easily solve the right triangular system consisting of the first $m$ equations of the linear system above.

In the next, we will present some result on the convergence of the GMRES method. Let

$ upright(bold(r))_m = (1 - c_1 upright(bold(A)) - c_2 upright(bold(A))^2 - dots.h.c - upright(bold(c))_m upright(bold(A))^m) upright(bold(r))_0 $

with $c_k in bb(R)$ computed by the GMRES algorithm. Since the method minimizes the residual in the two norm, we have

$
norm(upright(bold(r))_m)_2 &= norm((1 - c_1 upright(bold(A)) - c_2 upright(bold(A))^2 - dots.h.c - c_m upright(bold(A))^k) upright(bold(r))_0)_2 \
&lt.eq norm((1 - a_1 upright(bold(A)) - a_2 upright(bold(A))^2 - dots.h.c - a_m upright(bold(A))^k) upright(bold(r))_0)_2 \
&lt.eq norm(1 - a_1 upright(bold(A)) - a_2 upright(bold(A))^2 - dots.h.c - a_m upright(bold(A))^k) zws_2 norm(upright(bold(r))_0)_2
$<eq:57>

for any real numbers $a_k in bb(R)$ .

If the matrix $upright(bold(A))$ is diagonalizable, i.e., assuming

$ upright(bold(A)) = upright(bold(S D S))^(- 1) $

for any polynomial $p_m (lambda)$ we have

$ norm(p_m (upright(bold(A))))_2 lt.eq norm(upright(bold(S)))_2 norm(upright(bold(S))^(- 1))_2 norm(p_m (upright(bold(D))))_2 = norm(upright(bold(S)))_2 norm(upright(bold(S))^(- 1))_2 max_(1 lt.eq i lt.eq n) abs(p_m (lambda_i)) . $

From inequality (@eq:57), we get

$ norm(upright(bold(r))_m)_2 / norm(upright(bold(r))_0)_2 lt.eq norm(upright(bold(S)))_2 norm(upright(bold(S))^(- 1))_2 min_(p_m in cal(P)_m) max_(1 lt.eq i lt.eq n) abs(p_m (lambda_i)) . $

Here, $cal(P)_m$ is the set of polynomials $p_m (lambda)$ of degree not greater than $m$ and $p_m (0) = 1$ .

If the matrix $upright(bold(A))$ is a normal matrix, i.e.,

$ upright(bold(A))^(upright(T)) upright(bold(A)) = upright(bold(A)) upright(bold(A))^(upright(T)) $

or there exists an orthogonal matrix $upright(bold(Q))$ such that

$ upright(bold(A)) = upright(bold(Q D Q))^(- 1) $

Then we have

$ norm(p_m (upright(bold(A))))_2 lt.eq max_(1 lt.eq i lt.eq n) abs(p_m (lambda_i)) $

and

$ norm(upright(bold(r))_m)_2 / norm(upright(bold(r))_0)_2 lt.eq min_(p_m in cal(P)_m) max_(1 lt.eq i lt.eq n) abs(p_m (lambda_i)) . $

Additionally, if the eigenvalues $lambda_i$ are all real and positive, the GMRES method has the same convergence rate as the conjugate gradient method for the two special cases.