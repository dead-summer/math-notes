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
#let interior = math.circle
#let weakTo = math.harpoon.rt
#let graph = math.op("graph")

#let ball = math.upright(math.bold("B"))
#let imUnit = math.upright("i")