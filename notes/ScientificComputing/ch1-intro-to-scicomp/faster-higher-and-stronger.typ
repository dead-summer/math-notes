#import "/book.typ": book-page

#show: book-page.with(title: "Modelling, Discretization and Implementation")

#counter(heading).update(1)
#set heading(numbering: "1.1.1")

= Faster, Higher and Stronger

There are three themes in scientific computing. They are efficiency, accuracy and stability, associated with which is the spirit of numerics: "faster, higher and stronger".

- *Faster*. faster (larger speed) in efficiency

- *Higher*. higher order in accuracy

- *Stronger*. stronger in stability (robustness)

An inefficient, inaccurate or unstable method may lead to bad accumulation of discretization and implementation errors, and yield totally wrong results.