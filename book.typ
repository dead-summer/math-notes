
#import "@preview/shiroa:0.1.2": *

#show: book

#book-meta(
  title: "math-notes",
  description: "Notes from math class",
  authors: ("dead-summer",),
  language: "en",
  summary: [
    #prefix-chapter("sample-page.typ")[Hello, typst]

    = Analysis
    - #chapter("notes/Analysis/ch1-measures/ch1-measures.typ")[Measures]
      - #chapter("notes/Analysis/ch1-measures/measure-theory.typ")[Measure Theory]
      - #chapter("notes/Analysis/ch1-measures/sigma-algebras.typ")[sigma-Algebras]
      - #chapter("notes/Analysis/ch1-measures/measures.typ")[Measures]
      - #chapter("notes/Analysis/ch1-measures/construct-of-measures.typ")[Construct of Measures]
      - #chapter("notes/Analysis/ch1-measures/1-d-lebesgue-measure.typ")[1-D Lebesgue Measure]
    - #chapter("notes/Analysis/ch3-differentiation/differentiation.typ")[Differentiation]
      - #chapter("notes/Analysis/ch3-differentiation/differentiation-of-measures.typ")[Differentiation of Measures]
      - #chapter("notes/Analysis/ch3-differentiation/lebesgue-decomposition.typ")[Lebesgue Decomposition]
      - #chapter("notes/Analysis/ch3-differentiation/signed-measures.typ")[Signed Measures]
      - #chapter("notes/Analysis/ch3-differentiation/complex-measures.typ")[Complex Measures]
      - #chapter("notes/Analysis/ch3-differentiation/monotone-functions.typ")[Monotone Functions]

    = Scientific Computing
    - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/intro-to-scicomp.typ", section: "1")[Introduction to Scientific Computing]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/modelling-discretization-and-implementation.typ")[Modelling, Discretization and Implementation]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/faster-higher-and-stronger.typ")[Faster, Higher and Stronger]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/computer-representation-of-numbers.typ")[Computer Representation of Numbers]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/accuracy.typ")[Accuracy]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/efficiency.typ")[Efficiency]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/stability.typ")[Stability]
    - #chapter("notes/ScientificComputing/ch2-scalar-nonlinear-eqns/scalar-nonlinear-eqns.typ")[Iterative Methods for Scalar Nonlinear Equations]
      - #chapter("notes/ScientificComputing/ch2-scalar-nonlinear-eqns/the-bisection-method.typ")[The Bisection Method]
      - #chapter("notes/ScientificComputing/ch2-scalar-nonlinear-eqns/the-fixed-point-method.typ")[The Fixed Point Method]
      - #chapter("notes/ScientificComputing/ch2-scalar-nonlinear-eqns/the-aitken-steffenson-acceleration-technique.typ")[The Aitken/Steffenson Acceleration Technique]
      - #chapter("notes/ScientificComputing/ch2-scalar-nonlinear-eqns/the-newton-method.typ")[The Newton Method]
      - #chapter("notes/ScientificComputing/ch2-scalar-nonlinear-eqns/the-secant-method.typ")[The Secant Method]
      - #chapter("notes/ScientificComputing/ch2-scalar-nonlinear-eqns/zeros-of-polynomials.typ")[Zeros of Polynomials]
    - #chapter("notes/ScientificComputing/ch3-direct-methods-linsys/direct-methods-linsys.typ")[Direct Methods for Linear Systems]
      - #chapter("notes/ScientificComputing/ch3-direct-methods-linsys/the-gauss-elimination-method.typ")[The Gauss Elimination Method]
      - #chapter("notes/ScientificComputing/ch3-direct-methods-linsys/the-lu-decomposition-method.typ")[The LU Decomposition Method]
      - #chapter("notes/ScientificComputing/ch3-direct-methods-linsys/the-qr-method.typ")[The QR Method]
      -  #chapter("notes/ScientificComputing/ch3-direct-methods-linsys/stability-analysis.typ")[Stability Analysis]
    - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/iterative-methods-linsys.typ")[Stationary Iterative Methods for Linear Systems]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/abstract-framework-and-spectral-radius.typ")[Abstract Framework and Spectral Radius]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/the-richardson-iteration.typ")[The Richardson Iteration]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/the-jacobi-method.typ")[The Jacobi Method]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/the-gauss-seidel-method.typ")[The Gauss-Seidel Method]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/the-sor-method.typ")[The SOR Method]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/stopping-criterion.typ")[Stopping Criterion]
    - #chapter("notes/ScientificComputing/ch5-variational-iterative-methods-for-linsys/variational-iterative-methods-for-linear-systems.typ")[Variational Iterative Methods for Linear Systems]
      - #chapter("notes/ScientificComputing/ch5-variational-iterative-methods-for-linsys/the-ritz-variational-method.typ")[The Ritz variational Method]
      - #chapter("notes/ScientificComputing/ch5-variational-iterative-methods-for-linsys/the-steepest-descent-method.typ")[The steepest Descent Method]
      - #chapter("notes/ScientificComputing/ch5-variational-iterative-methods-for-linsys/the-conjugate-gradient-method.typ")[The Conjugate Gradient Method]
      - #chapter("notes/ScientificComputing/ch5-variational-iterative-methods-for-linsys/the-galerkin-variational-method.typ")[The Galerkin Variational Method]
      - #chapter("notes/ScientificComputing/ch5-variational-iterative-methods-for-linsys/the-generalized-minimal-residual-method.typ")[The Generalized Minimal Residual Method]
    - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/iterative-methods-for-matrix-eigenvalues.typ")[Iterative Methods for Matrix Eigenvalues]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/the-power-method-for-general-matrices.typ")[The Power Method for General Matrices]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/the-power-method-for-symmetric-matrices.typ")[The Power Method for Symmetric Matrices]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/the-inverse-power-method.typ")[The Inverse Power Method]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/the-shifted-inverse-power-method.typ")[The Shifted Inverse Power Method]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/a-deflation-technique.typ")[A Deflation Technique]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/the-generalized-power-method.typ")[The Generalized Power Method]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/the-qr-algorithm.typ")[The QR Algorithm]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/the-qr-algorithm-with-shifts.typ")[The QR Algorithm with Shifts]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/two-methods-for-symmetric-matrices.typ")[Two Methods for Symmetric Matrices]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/stability-of-eigenvalue-computation.typ")[Stability of Eigenvalue Computation]
      - #chapter("notes/ScientificComputing/ch6-iterative-methods-for-matrix-eigenvalues/singular-value-decomposition.typ")[Singular Value Decomposition]
  

    #suffix-chapter("notes/ScientificComputing/appendix/vector-and-matrix-norms.typ")[Appendix. Vector and Matrix Norms]
    #suffix-chapter("notes/ScientificComputing/appendix/multigrid-method.typ")[Appendix. Multigrid Method]

  ]
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
