#import "@preview/shiroa:0.2.3": *
#show: book


#book-meta(
  title: "Analysis",
  summary: [
    - #chapter("./ch1-measure/measure.typ", section: "1")[Measures]
      - #chapter("./ch1-measure/motivation-for-measure-theory.typ", section: "1.1")[Motivation for Measure Theory]
      - #chapter("./ch1-measure/sigma-algebras.typ", section: "1.2")[Sigma Algebra]
      - #chapter("./ch1-measure/measures.typ", section: "1.3")[Measures]
      - #chapter("./ch1-measure/construction-of-measures.typ", section: "1.4")[Construction of Measures]
      - #chapter("./ch1-measure/one-dimensional-lebesgue-stieltjes-measures.typ", section: "1.5")[One-Dimensional Lebesgue-Stieltjes Measures]
    - #chapter("./ch2-integration/integration.typ", section: "2")[Integration]
      - #chapter("./ch2-integration/measurable-functions.typ", section: "2.1")[Measurable Functions]
      - #chapter("./ch2-integration/integration-of-nonnegative-functions.typ", section: "2.2")[Integration of Nonnegative Functions]
      - #chapter("./ch2-integration/integration-of-complex-functions.typ", section: "2.3")[Integration of Nonnegative Functions]
      - #chapter("./ch2-integration/on-the-density-of-functions.typ", section: "2.4")[On the Density of Functions]
      - #chapter("./ch2-integration/modes-of-convergence.typ", section: "2.5")[Modes of Convergence]
  
    - #chapter("./ch3-differentiation/differentiation.typ", section: "3")[Differentiation]
      - #chapter("./ch3-differentiation/differentiation-of-measures.typ", section: "3.1")[Differentiation of Measures]
      - #chapter("./ch3-differentiation/lebesgue-decomposition-and-differentiation.typ", section: "3.2")[Lebesgue Decomposition and Differentiation]
      - #chapter("./ch3-differentiation/signed-measures.typ", section: "3.3")[Signed Measures]
      - #chapter("./ch3-differentiation/complex-measures.typ", section: "3.4")[Complex Measures]
      - #chapter("./ch3-differentiation/monotone-functions.typ", section: "3.5")[Monotone Functions]
      - #chapter("./ch3-differentiation/riesz-representation-theorem.typ", section: "3.6")[The Riesz Representation Theorem]
    
    - #chapter("./ch4-foundations-of-banach-space/foundations-of-banach-space.typ", section: "4")[Foundations of Banach Spaces]
      - #chapter("./ch4-foundations-of-banach-space/banach-space.typ", section: "4.1")[Banach Space]
      - #chapter("./ch4-foundations-of-banach-space/bounded-linear-operator.typ", section: "4.2")[Bounded Linear Operator]
      - #chapter("./ch4-foundations-of-banach-space/finite-dimensional-normed-vector-space.typ", section: "4.3")[Finite Dimensional Normed Vector Space]
      - #chapter("./ch4-foundations-of-banach-space/hahn-banach-theorem.typ", section: "4.4")[Hahn Banach Theorem]
      - #chapter("./ch4-foundations-of-banach-space/application-of-hahn-banach-theorem.typ", section: "4.5")[Application of Hahn Banach Theorem]
      - #chapter("./ch4-foundations-of-banach-space/separation-theorems-in-normed-vector-spaces.typ", section: "4.6")[Separation Theorems in Normed Vector Spaces]

    - #chapter("./ch5-fundamental-theorems-and-duality/fundamental-theorems-and-duality.typ", section: "5")[Fundamental Theorems and Duality]
      - #chapter("./ch5-fundamental-theorems-and-duality/baire-category-theorem.typ", section: "5.1")[Baire Category Theorem]
      - #chapter("./ch5-fundamental-theorems-and-duality/principle-of-uniform-boundedness-and-operator-topologies.typ", section: "5.2")[The Principle of Uniform Boundedness and Operator Topologies]
      - #chapter("./ch5-fundamental-theorems-and-duality/the-open-mapping-theorem-and-its-consequences.typ", section: "5.3")[The Open Mapping Theorem and Its Consequences]
      - #chapter("./ch5-fundamental-theorems-and-duality/adjoint-operators-in-banach-spaces.typ", section: "5.4")[Adjoint (Dual) Operators in Banach Spaces]
      - #chapter("./ch5-fundamental-theorems-and-duality/weak-convergence.typ", section: "5.5")[Weak Convergence]
      - #chapter("./ch5-fundamental-theorems-and-duality/the-direct-method-in-the-calculus-of-variations.typ", section: "5.6")[The Direct Method in the Calculus of Variations]
      
    - #chapter("./ch6-compactness-and-spectral-theory/compactness-and-spectral-theory.typ", section: "6")[Compactness and Spectral Theory]
      - #chapter("./ch6-compactness-and-spectral-theory/compact-operators.typ", section: "6.1")[Compact Operators]
      - #chapter("./ch6-compactness-and-spectral-theory/fredholm-theory.typ", section: "6.2")[Fredholm Theory]
      - #chapter("./ch6-compactness-and-spectral-theory/the-spectrum-of-compact-operators.typ", section: "6.3")[The Spectrum of Compact Operators]
      - #chapter("./ch6-compactness-and-spectral-theory/the-fredholm-alternative.typ", section: "6.4")[The Fredholm Alternative]
      - #chapter("./ch6-compactness-and-spectral-theory/hilbert-spaces.typ", section: "6.5")[Hilbert Spaces]
  ]
)

// re-export page template
#import "/templates/page.typ": *
#let book-page = project