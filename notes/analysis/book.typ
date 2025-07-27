#import "@preview/shiroa:0.2.3": *
#show: book


#book-meta(
  title: "Analysis",
  summary: [
    - #chapter("./ch1-measures/ch1-measures.typ", section: "1")[Measures]
      - #chapter("./ch1-measures/measure-theory.typ", section: "1.1")[Motivation]
      - #chapter("./ch1-measures/sigma-algebras.typ", section: "1.2")[Sigma Algebra]
      - #chapter("./ch1-measures/measures.typ", section: "1.3")[Measures]
      - #chapter("./ch1-measures/construct-of-measures.typ", section: "1.4")[Construct of Measures]
      - #chapter("./ch1-measures/1-d-lebesgue-measure.typ", section: "1.5")[1-D Lebesgue Measure]
    - #chapter("./ch2-integration/integration.typ", section: "2")[Integration]
      - #chapter("./ch2-integration/measurable-functions.typ", section: "2.1")[Measurable Functions]
      - #chapter("./ch2-integration/integration-of-nonnegative-functions.typ", section: "2.2")[Integration of Nonnegative Functions]
      - #chapter("./ch2-integration/integration-of-complex-functions.typ", section: "2.3")[Integration of Nonnegative Functions]
  
    - #chapter("./ch3-differentiation/differentiation.typ", section: "3")[Differentiation]
      - #chapter("./ch3-differentiation/differentiation-of-measures.typ", section: "3.1")[Differentiation of Measures]
      - #chapter("./ch3-differentiation/lebesgue-decomposition.typ", section: "3.2")[Lebesgue Decomposition]
      - #chapter("./ch3-differentiation/signed-measures.typ", section: "3.3")[Signed Measures]
      - #chapter("./ch3-differentiation/complex-measures.typ", section: "3.4")[Complex Measures]
      - #chapter("./ch3-differentiation/monotone-functions.typ", section: "3.5")[Monotone Functions]
    
    - #chapter("./ch4-foundations-of-banach-space/foundations-of-banach-space.typ", section: "4")[Foundations of Banach Spaces]
      - #chapter("./ch4-foundations-of-banach-space/banach-space.typ", section: "4.1")[Banach Space]
      - #chapter("./ch4-foundations-of-banach-space/bounded-linear-operator.typ", section: "4.2")[Bounded Linear Operator]
      - #chapter("./ch4-foundations-of-banach-space/finite-dimensional-nvs.typ", section: "4.3")[Finite Dimensional Normed Vector Space]
      - #chapter("./ch4-foundations-of-banach-space/hahn-banach-theorem.typ", section: "4.4")[Hahn Banach Theorem]
      - #chapter("./ch4-foundations-of-banach-space/application-of-hbt.typ", section: "4.5")[Application of Hahn Banach Theorem]
      - #chapter("./ch4-foundations-of-banach-space/separation.typ", section: "4.6")[Separation]
    - #chapter("./ch5-fundamental-theorems-and-duality/fundamental-theorems-and-duality.typ", section: "5")[Fundamental Theorems and Duality]
      - #chapter("./ch5-fundamental-theorems-and-duality/baire-category-theorem.typ", section: "5.1")[Baire Category Theorem]
  ]
)

// re-export page template
#import "/templates/page.typ": *
#let book-page = project