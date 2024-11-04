#import "/book.typ": book-page
#import "../../../templates/conf.typ": *

#show: book-page.with(title: "Direct Methods for Linear Systems")
#show: codly-init.with()

In this chapter, we will study on some basic iterative methods for the linear system,

$ upright(bold(A x)) = upright(bold(b)) , $

with

$ upright(bold(x)) , upright(bold(b)) in bb(R)^n , #h(0em) upright(bold(A)) in bb(R)^(n times n) . $

Assume that the matrix $upright(bold(A))$ is at least invertible.

As the fixed point iteration for scalar nonlinear equations, an iterative method for the linear system also generates a sequence of approximate solutions ${upright(bold(x))_k}_(k = 0)^(+ oo) subset bb(R)^n$ , one by one from the initial guess,

$ upright(bold(x))_0 arrow.r upright(bold(x))_1 arrow.r upright(bold(x))_2 arrow.r dots.h.c arrow.r upright(bold(x))_k arrow.r upright(bold(x))_(k + 1) arrow.r dots.h.c . $

The basic iterative methods in this chapter also generate approximate solutions $upright(bold(x))_k$ by some map,

$ upright(bold(x))_(k + 1) = phi (upright(bold(x))_k) , quad "for" k = 0 , 1 , 2 , dots.h.c . $

The limit of the sequence if it converges is a fixed point of the iteration.