#import "/book.typ": book-page

#show: book-page.with(title: "Measure Theory")

= Motivation

Motivation: Lebesgue measure ($cal(L)^n$) on $bb(R)^n$ is approximately
n-dimensional volume: 
1. #emph[Countable] Additivity If $E_1 , E_2 , dots.h , subset bb(R)^n$ is disjoint, then
$ cal(L)^n (union.sq.big E_i) = sum cal(L)^n (E_i). $
2. If$E subset bb(R)^n$ is (Euclidean) congruent to $E^(') subset bb(R)^n$ (that is, if $E$ can be transformed into $E^(')$ by translations, rotations, and reflections), then 
$ cal(L)^n (E) = cal(L)^n (E^(')). $
3. Normalization: $cal(L)^n ([0 , 1]^n) = 1$ .

It's impossible for 1-3 to hold simultaneously if $cal(L)^n$ is defined
on the whole
$ cal(P) (bb(R)^n) = { E : E subset bb(R)^n } .$
We define $cal(L)^n$ (or more general measure) on a subset of $cal(P) (bb(R)^n)$ .