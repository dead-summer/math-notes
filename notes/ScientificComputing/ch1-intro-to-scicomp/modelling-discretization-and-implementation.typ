#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#show: thmrules.with(qed-symbol: $square$)

#show: book-page.with(title: "Modelling, Discretization and Implementation")

#counter(heading).update(0)
#set heading(numbering: "1.1.1")



= Modelling, Discretization and Implementation

Scientific problems are often raised (or proposed) as mathematical models, which are typically described by differential equations, either or dinary differential equations or partial differential equations. After discretization by appropriate numerical algorithms, mathematical equations are further solved by computer programs.

The steps, modelling with mathematics, discretization by algorithms and implementation for computers, form the major components of scientific computing.

Each step may introduce errors, which are respectively called modelling errors, discretization errors and implementation errors. In this course, we are mainly focused on discretization errors by numerical algorithms or methods while pay attention to implementation errors.

#exm[
Spring
]

#exm[
Pendulum
]
  
#exm[
Motion of a planet around the sun
]

#exm[
Two point boundary value problem
]
