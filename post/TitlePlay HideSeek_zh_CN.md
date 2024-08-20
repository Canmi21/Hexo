---
title: TitlePlay HideSeek
date: 2024-07-20 20:34:21
banner_img: /img/default.webp
category: Code
tags: 
  - Code
  - Github
  - OpenSource
  - JavaScript
  - zh_CN
excerpt: 基于JS的动态标题
---

# 基于JS实现的交互式标题
至于实现的效果嘛，看顶上标签页不就知道了嘛

## 实现代码
```javascript
var OriginTitile = document.title;
var titleTime;
document.addEventListener('visibilitychange', function() {
    if (document.hidden) {
        document.title = '(つェ⊂)我藏好了哦~';
        clearTimeout(titleTime);
    } else {
        document.title = '(*´∇｀*)被你发现啦~';
        titleTime = setTimeout(function() {
            document.title = OriginTitile;
        }, 2100);
    }
});
```
   
## 原理讲解

```javascript
// 存储原始标题
var OriginTitile = document.title;

// 声明一个变量来保存定时器
var titleTime;

// 添加一个事件监听器监听可见性变化
document.addEventListener('visibilitychange', function() {
    // 检查文档是否隐藏
    if (document.hidden) {
        // 将标题改为隐藏信息
        document.title = '(つェ⊂)我藏好了哦~';
        // 清除任何已有的定时器
        clearTimeout(titleTime);
    } else {
        // 将标题改为发现信息
        document.title = '(*´∇｀*)被你发现啦~';
        // 设置定时器在2.1秒后将标题改回原始标题
        titleTime = setTimeout(function() {
            document.title = OriginTitile;
        }, 2100);
    }
});
```
怎么样，很简便吧 学废了就CV一下就好了 
{% note info %}
记得别忘了挂着这个JS(√)
{% endnote %} 

```javascript
<script src="<%- url_for('/js/title.js') %>"></script>
```

你可以此处继续浏览
{% btn https://github.com/Canmi21/Canmi21.github.io/blob/main/js/title.js,Github, title %}