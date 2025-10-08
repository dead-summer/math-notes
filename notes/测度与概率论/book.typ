#import "@preview/shiroa:0.2.3": *
#show: book


#book-meta(
  title: "测度与概率论",
  language: "zh",
  summary: [
    - #chapter("./ch1-集合与测度/集合与测度.typ", section: "1")[集合与测度]
      - #chapter("./ch1-集合与测度/集合运算与集类.typ", section: "1.1")[集合运算与集类]
      - #chapter("./ch1-集合与测度/单调类定理.typ", section: "1.2")[单调类定理]
      - #chapter("./ch1-集合与测度/测度与非负函数.typ", section: "1.3")[测度与非负函数]
      - #chapter("./ch1-集合与测度/外测度与测度的扩张.typ", section: "1.4")[外测度与测度的扩张]
    
    - #chapter("./ch5-测度的收敛/测度的收敛.typ", section: "5")[测度的收敛]
      - #chapter("./ch5-测度的收敛/欧氏空间上Borel测度的收敛.typ", section: "5.1")[欧氏空间上Borel测度的收敛]
      
    - #chapter("./ch6-概率论基础/概率论基础.typ", section: "6")[概率论基础]
      - #chapter("./ch6-概率论基础/事件的独立性与0-1律.typ", section: "6.1")[事件的独立性与0-1律]
      - #chapter("./ch6-概率论基础/条件数学期望.typ", section: "6.2")[条件数学期望]
      - #chapter("./ch6-概率论基础/随机变量族的一致可积性.typ", section: "6.3")[随机变量族的一致可积性]
  ]
)

// re-export page template
#import "/templates/page.typ": *
#let book-page = project