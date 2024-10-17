
#import "@preview/shiroa:0.1.1": *

#show: book

#book-meta(
  title: "math-notes",
  description: "Notes from math class",
  authors: ("dead-summer",),
  language: "en",
  summary: [
    #prefix-chapter("sample-page.typ")[Hello, typst]

    = Analysis
    - #chapter("notes/Analysis/ch1_measures/ch1-measures.typ")[Measures]
      - #chapter("notes/Analysis/ch1_measures/measure-theory.typ")[Measure Theory]
      - #chapter("notes/Analysis/ch1_measures/sigma-algebras.typ")[sigma-Algebras]
      - #chapter("notes/Analysis/ch1_measures/construct-of-measures.typ")[Construct of Measures]
      - #chapter("notes/Analysis/ch1_measures/1-d-lebesgue-measure.typ")[1-D Lebesgue Measure]

    = Scientific Computing
    - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/intro-to-scicomp.typ", section: "1")[Introduction to Scientific Computing]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/modelling-discretization-and-implementation.typ")[Modelling, Discretization and Implementation]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/faster-higher-and-stronger.typ")[Faster, Higher and Stronger]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/computer-representation-of-numbers.typ")[Computer Representation of Numbers]
      - #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/accuracy.typ")[Accuracy]
      -  #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/efficiency.typ")[Efficiency]
      -  #chapter("notes/ScientificComputing/ch1-intro-to-scicomp/stability.typ")[stability]
  ]
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
