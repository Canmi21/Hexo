---
title: README
date: 2024-07-21 02:12:40
banner_img: /img/default.webp
category: README
sticky: 100
tags: 
  - README
  - zh_CN
excerpt: 读就完了(Xd)
---

{% note danger %}
请不要故意刷我的流量
{% endnote %} 
{% note warning %}
DDoS将会面临永久IP封禁
{% endnote %} 

由于网站今日内被多次请求访问，数据已经明显超出正常范围了( ) 目前采用的措施是添加 Cloudflare 的交互式验证请求(√) 今天开始修改了WAF的规则，低风险用户会被要求JS检查(该项目可能会导致在使用浏览器角色切换或者伪装插件时被拦截)，高风险用户会被要求做交互式验证码继续。 

![截止于2024-07-20](/img/blog/README/ReportData.png)
    
不过也有一个好消息是看起来CDN已经开始干活了目前国外访问速度基本都在1-2s内加载完整个框架，LightHS 评估网页得分大约75分左右，国内目前靠另外一个解析的CDN，泛域名在中国深圳，主页的背景采用了国内图床代） 一共4MB的图片差不多首次加载也就是3s左右。至于后续访问嘛，那就全靠Cookie咯(逃) 本网站会想办法往你的 Cookie 里写一点奇怪的内容用于保存 Dark | Light 模式的配置以及缓存部分数据用于改善浏览体验。

<div style="text-align: center;">
  <script type="text/javascript" src="//rf.revolvermaps.com/0/0/8.js?i=5aenvmg0fvd&amp;m=1&amp;c=ffc000&amp;cr1=ff0000&amp;f=arial&amp;l=33" async="async"></script>
</div>