#import "/book.typ": book-page
#import "../../../templates/conf.typ": *
#import "@preview/mitex:0.2.4": *

#show: book-page.with(title: "Efficiency")
#show: codly-init.with()
#show: thmrules.with(qed-symbol: $square$)
#codly_init()

Let $f(x) in C[a, b]$ be a continuous function on some closed interval $[a, b]$ . We look for a solution to the scalar nonlinear equation
$
f(x) = 0.
$
