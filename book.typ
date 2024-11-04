
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
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/the-gauss-seidel-method.typ")[The Gauss-Seidel method]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/the-sor-method.typ")[The SOR method]
      - #chapter("notes/ScientificComputing/ch4-iterative-methods-linsys/stopping-criterion.typ")[Stopping Criterion]
  ]
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
