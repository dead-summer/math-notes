#import "@preview/ctheorems:1.1.3": *
#import "@preview/codly:1.0.0": *

// Theorem
#let thm = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#eeffee"),
  base_level: 0
)

#let prp = thmbox(
  "proposition",
  "Proposition",
  stroke: 0.5pt,
  base_level: 0
)

#let cor = thmplain(
  "corollary",
  "Corollary",
  titlefmt: strong,
  bodyfmt: body => [
    #text(style: "italic")[#body]
  ],
  base_level: 0
)

#let lem = thmbox(
  "lemma",
  "Lemma",
  stroke: 0.5pt,
  base_level: 0
)

#let def = thmbox(
  "definition",
  "Definition",
  // inset: (top: 1em),
  stroke: 0.5pt,
  base_level: 0
)

#let exm = thmplain(
  "example",
  "Example",
  titlefmt: strong,
  inset: (top: 0.8em, bottom: .5em),
  bodyfmt: body => [
    #text(style: "italic")[#body]
  ],
  base: "heading",
  base_level: 0
)

#let prf = thmplain(
  "proof",
  "Proof",
  titlefmt: smallcaps,
  inset: (x: .5em, y: .5em),
  bodyfmt: body => [
    #body #v(0.5pt) #h(1fr) $square$ // float a QED symbol to the right
  ]
).with(numbering: none)

#let sln = thmplain(
  "solution",
  "Solution",
  titlefmt: smallcaps,
  inset: (x: 0em, y: 0em),
  bodyfmt: body => [
    #body #v(0.5pt) #h(1fr) $square.filled.medium$ // float a QED symbol to the right
  ]
).with(numbering: none)

#let rmk = thmplain(
  "remark", 
  "Remark", 
  titlefmt: strong,
  inset: (top: 0.8em, bottom: .5em),
  bodyfmt: body => [
    #text(style: "italic")[#body]
  ],
  base_level: 0
)

#let exr = thmplain(
  "exercise",
  "Exercise",
  titlefmt: strong,
  inset: (top: 0.8em, bottom: .5em),
  bodyfmt: body => [
    #text(style: "italic")[#body]
  ],
  base: "heading",
  base_level: 0
)

// 定义代码块格式
#let matlab_img = "<svg xmlns=\"http://www.w3.org/2000/svg\"  viewBox=\"0 0 64 64\" width=\"64px\" height=\"64px\" baseProfile=\"basic\"><radialGradient id=\"Vfz-9abGZTJV8V0oFRkXja\" cx=\"-3526.01\" cy=\"1109.862\" r=\"30.775\" gradientTransform=\"matrix(-1 0 0 1 -3494.01 -1077.362)\" gradientUnits=\"userSpaceOnUse\"><stop offset=\"0\" stop-color=\"#afeeff\"/><stop offset=\".193\" stop-color=\"#bbf1ff\"/><stop offset=\".703\" stop-color=\"#d7f8ff\"/><stop offset=\"1\" stop-color=\"#e1faff\"/></radialGradient><path fill=\"url(#Vfz-9abGZTJV8V0oFRkXja)\" d=\"M0,40L0,40c0,2.761,2.239,5,5,5h3c2.761,0,5,2.238,5,5l0,0c0,2.762-2.238,5-5,5H7.435	C5.52,55,4,56.52,4,58.395V58.5C4,60.433,5.567,62,7.5,62h52c1.926,0,3.49-1.556,3.5-3.483V58.5c0.01-1.93-1.552-3.5-3.483-3.5H56	c-2.209,0-4-1.791-4-4l0,0c0-2.209,1.791-4,4-4h3c2.761,0,5-2.239,5-5l0,0c0-2.761-2.239-5-5-5h-1c-2.209,0-4-1.791-4-4l0,0	c0-2.209,1.791-4,4-4h0.5c3.038,0,5.5-2.462,5.5-5.5l0,0c0-3.038-2.462-5.5-5.5-5.5H45c-1.657,0-3-1.343-3-3l0,0	c0-1.657,1.343-3,3-3h0.5c2.485,0,4.5-2.015,4.5-4.5l0,0C50,5.015,47.985,3,45.5,3H28H14c-2.209,0-4,1.791-4,4l0,0	c0,2.209,1.791,4,4,4h0.5c1.933,0,3.5,1.567,3.5,3.5l0,0c0,1.933-1.567,4.5-3.5,4.5H6c-2.209,0-4,1.791-4,4l0,0c0,2.209,1.791,4,4,4	h8c2.485,0,4.438,1.14,4.438,3.625l0.031,0.688C18.469,33.798,16.485,35,14,35H5C2.239,35,0,37.239,0,40z\"/><radialGradient id=\"Vfz-9abGZTJV8V0oFRkXjb\" cx=\"-3520.885\" cy=\"1109.362\" r=\"26.875\" gradientTransform=\"matrix(-1 0 0 1 -3494.01 -1077.362)\" gradientUnits=\"userSpaceOnUse\"><stop offset=\"0\" stop-color=\"#afeeff\"/><stop offset=\".193\" stop-color=\"#bbf1ff\"/><stop offset=\".703\" stop-color=\"#d7f8ff\"/><stop offset=\"1\" stop-color=\"#e1faff\"/></radialGradient><path fill=\"url(#Vfz-9abGZTJV8V0oFRkXjb)\" d=\"M57.375,3L57.375,3c2.485,0,4.5,2.015,4.5,4.5l0,0c0,2.485-2.015,4.5-4.5,4.5l0,0	c-2.485,0-4.5-2.015-4.5-4.5l0,0C52.875,5.015,54.89,3,57.375,3z\"/><linearGradient id=\"Vfz-9abGZTJV8V0oFRkXjc\" x1=\"29.309\" x2=\"29.309\" y1=\"36.496\" y2=\"6.009\" gradientUnits=\"userSpaceOnUse\"><stop offset=\"0\" stop-color=\"#1ba7dd\"/><stop offset=\".244\" stop-color=\"#25b4e2\"/><stop offset=\"1\" stop-color=\"#40daf2\"/></linearGradient><path fill=\"url(#Vfz-9abGZTJV8V0oFRkXjc)\" d=\"M26.774,36.496l-8.793-7.573c0,0,14.829-24.048,22.656-22.872L28.322,33.103L26.774,36.496z\"/><linearGradient id=\"Vfz-9abGZTJV8V0oFRkXjd\" x1=\"15.624\" x2=\"15.624\" y1=\"43.652\" y2=\"28.923\" gradientUnits=\"userSpaceOnUse\"><stop offset=\"0\" stop-color=\"#1ba7dd\"/><stop offset=\".244\" stop-color=\"#25b4e2\"/><stop offset=\"1\" stop-color=\"#40daf2\"/></linearGradient><path fill=\"url(#Vfz-9abGZTJV8V0oFRkXjd)\" d=\"M12.708,43.077l-7.564-5.209c-1.554-1.07-1.279-3.453,0.478-4.137l12.359-4.809l9.141,6.898 l-9.141,7.07l-2.632,0.663C14.442,43.782,13.48,43.609,12.708,43.077z\"/><linearGradient id=\"Vfz-9abGZTJV8V0oFRkXje\" x1=\"36.324\" x2=\"36.324\" y1=\"58\" y2=\"6.045\" gradientUnits=\"userSpaceOnUse\"><stop offset=\"0\" stop-color=\"#ff9757\"/><stop offset=\"1\" stop-color=\"#ffb65b\"/></linearGradient><path fill=\"url(#Vfz-9abGZTJV8V0oFRkXje)\" d=\"M40.637,6.051c6.814-0.441,14.466,23.422,18.266,36.513c0.906,3.123-2.078,3.987-3.903,3.185 c-2.371-1.041-5.75-0.875-8.875-0.5c-5.03,0.604-7.03,3.814-12.375,9.125c-1.308,1.3-3.139,2.666-4.243,3.284 c-1.413,0.791-2.993,0.164-3.225-1.444c-0.481-3.32-1.856-8.514-5.788-10.884c-2.124-1.281-4.539-1.473-5.879-1.595 c-0.641-0.059-1.036-0.26-1.036-0.26s7.609-2.228,11.911-8.883S36.25,6.335,40.637,6.051z\"/></svg>"

#let cpp_img = "<svg xmlns=\"http://www.w3.org/2000/svg\"  viewBox=\"0 0 50 50\" width=\"50px\" height=\"50px\"><path d=\"M 25 2 C 24.285156 2 23.574219 2.179688 22.933594 2.539063 L 6.089844 12.003906 C 4.808594 12.726563 4 14.074219 4 15.535156 L 4 34.464844 C 4 35.929688 4.808594 37.277344 6.089844 38 L 22.933594 47.460938 C 24.214844 48.183594 25.785156 48.183594 27.066406 47.460938 L 43.910156 38 C 45.195313 37.277344 46 35.925781 46 34.464844 L 46 15.535156 C 46 14.074219 45.191406 12.726563 43.910156 12.003906 L 27.066406 2.539063 C 26.425781 2.179688 25.714844 2 25 2 Z M 25 4 C 25.375 4 25.753906 4.09375 26.089844 4.28125 L 42.933594 13.746094 C 43.601563 14.125 44 14.804688 44 15.535156 L 44 24 L 42 24 L 42 22 L 40 22 L 40 24 L 38 24 L 38 26 L 40 26 L 40 28 L 42 28 L 42 26 L 44 26 L 44 34.464844 C 44 35.195313 43.601563 35.875 42.929688 36.253906 L 26.089844 45.71875 C 25.417969 46.09375 24.582031 46.09375 23.910156 45.71875 L 7.070313 36.253906 C 6.398438 35.875 6 35.199219 6 34.464844 L 6 15.535156 C 6 14.804688 6.398438 14.125 7.070313 13.746094 L 23.910156 4.28125 C 24.246094 4.09375 24.625 4 25 4 Z M 25 12 C 17.839844 12 12 17.839844 12 25 C 12 32.160156 17.839844 38 25 38 C 29.089844 38 32.886719 36.09375 35.339844 32.863281 L 36.023438 31.960938 L 29.96875 28.453125 L 29.421875 29.046875 C 28.292969 30.28125 26.691406 31 25 31 C 21.683594 31 19 28.316406 19 25 C 19 21.683594 21.683594 19 25 19 C 26.691406 19 28.292969 19.71875 29.421875 20.953125 L 29.96875 21.546875 L 36.023438 18.039063 L 35.339844 17.136719 C 32.886719 13.90625 29.089844 12 25 12 Z M 25 14 C 28.074219 14 30.886719 15.316406 32.945313 17.511719 L 30.203125 19.097656 C 28.757813 17.832031 26.960938 17 25 17 C 20.597656 17 17 20.597656 17 25 C 17 29.402344 20.597656 33 25 33 C 26.960938 33 28.757813 32.167969 30.203125 30.902344 L 32.945313 32.488281 C 30.886719 34.683594 28.074219 36 25 36 C 18.925781 36 14 31.074219 14 25 C 14 18.925781 18.925781 14 25 14 Z M 33 22 L 33 24 L 31 24 L 31 26 L 33 26 L 33 28 L 35 28 L 35 26 L 37 26 L 37 24 L 35 24 L 35 22 Z\"/></svg>"

#let python_img = "<svg  xmlns=\"http://www.w3.org/2000/svg\"  width=\"24\"  height=\"24\"  viewBox=\"0 0 24 24\"  fill=\"none\"  stroke=\"currentColor\"  stroke-width=\"2\"  stroke-linecap=\"round\"  stroke-linejoin=\"round\"  class=\"icon icon-tabler icons-tabler-outline icon-tabler-brand-python\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M12 9h-7a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h3\" /><path d=\"M12 15h7a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-3\" /><path d=\"M8 9v-4a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2v5a2 2 0 0 1 -2 2h-4a2 2 0 0 0 -2 2v5a2 2 0 0 0 2 2h4a2 2 0 0 0 2 -2v-4\" /><path d=\"M11 6l0 .01\" /><path d=\"M13 18l0 .01\" /></svg>"


#let icon(codepoint) = {
  box(
    height: 0.8em,
    baseline: 0.01em,
    image.decode(codepoint)
  )
  h(0.1em)
}

#let codly_init() = {
  codly(
  languages: (
    matlab: (
      name: "MATLAB",
      // icon: icon("icons8-matlab.svg"),
      icon: icon(matlab_img),
      color: rgb("#CE412B")
    ),
    python: (
      name: "Python",
      icon: icon(python_img)
    ),
    cpp: (
      name: "C++",
      icon: icon(cpp_img),
      color: rgb("#b725b2")
    ),
    output: (
      name: "output",
      color: rgb("#000000"),
    )
  ),
)
}


#let quote(body, author: none) = {
  rect(fill: luma(240), stroke: (left: 0.25em))[
    #text(style: "italic")[#body #h(1fr)]
    #if(author != none) {
      align(right)[
        ------ #author
      ]
    }
  ]
}
