---
title: WCH-Link R1&E
date: 2024-07-23 17:22:48
banner_img: /img/default.webp
category: Debugger
tags: 
  - Debugger
  - Programmer
  - WCH
  - zh_CN
excerpt: 感觉吃灰了(x)
---

{% note warning %}
WCH-Link 是真废物，感觉不如 JLink V11 或者 ST-Link V3
{% endnote %} 
## 起因
因为要调试某个 WCH 的垃圾 549F 还有 CH32V3 什么的，所以被迫做了个 Link-R1( ) 然后做完发现 R1 其实没啥用，关机是 WCH 自己的上位机就很垃圾。然后就换了个 LinkE 之后就被 ex 到了，WCH 家的芯片不知道在想什么 I2C 复用 SWD... ... 不好评价
![WCH-Link R1&E](/img/blog/WCH-Link-R1&E/WCH-Link-R1&E.jpg)

## 结论
以后反正感觉不会怎么玩 WCH 的片子了，除了便宜，一无是处( )