#import "@preview/shiroa:0.2.3": *

#import "/templates/ebook.typ"


#show: ebook.project.with(
  title: "测度与概率论",
  authors: ("Summer",),
  // display-title: "分析",
  spec: "./book.typ",
  // set a resolver for inclusion
  styles: (
    inc: it => {
      include it
      },
  ),
)