#import "@preview/theorion:0.3.3": *
#import cosmos.fancy: *

// 数学环境
#let question-box = note-box.with(
  fill: rgb("#0f766e"),
  title: (
    en: "Question",
    zh: "问题"
  ),
  icon-name: "question", // icon to display from octicons set
) // 基于 note-box 创建 question-box

#let definition = definition.with(
  breakable: true
)

#let theorem = theorem.with(
  breakable: true
)

#let corollary = corollary.with(
  breakable: true
)

#let proposition = proposition.with(
  breakable: true
)

#let claim(
  title: (
    en: "Claim",
    zh: "断言"
  ),
  body,
) = [#emph(theorion-i18n(title)).#sym.space#body]

// 数学符号定义
#let card = math.op("card")
#let dist = math.op("dist")
#let span = math.op("span")
#let codim = math.op("codim")
#let coker = math.op("coker")
#let interior = math.circle
#let weakTo = math.harpoon.rt
#let graph = math.op("graph")
#let ran = math.op("ran") // the range of the operator
#let ann(x) = $#x^circle.small$ // annihilator
#let preann(x) = $#x _(circle.small)$ // pre-annihilator
#let fred = math.upright("Fred")
#let index = math.upright("index")
#let supp = math.op("supp") // support set
#let diam = math.op("diam") // diameter
#let aplim = math.op("ap lim", limits: true) // approximate limit

#let ball = math.upright(math.bold("B"))
#let sphere = math.upright(math.bold("S"))
#let disc = math.upright(math.bold("D"))
#let imUnit = math.upright("i")
#let indicator = math.upright(math.bold("1"))

#let bv = math.upright("BV") // bounded value functions
#let tv = math.upright("T.V.") // total variation
#let ac = math.upright("AC") // absolute continuity
#let aut = math.upright("Aut")