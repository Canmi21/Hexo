---
title: Code Block
date: 2024-07-21 14:43:10
banner_img: /img/default.webp
category: Code
tags: 
  - Code
  - Github
  - OpenSource
  - CSS
  - zh_CN
excerpt: CodeBlock代码着色器指定
---

# CodeBlock 代码着色器风格
{% note info %}
推荐使用 Dark Mode 继续阅读  
{% endnote %} 
   
起因：
今天感觉Fluid的代码块好丑啊，所以直接自己调了一个(√)
### 效果展示
![Dark Mode](/img/blog/CodeBlock/CodeBlock_NEW.png)
### 原始效果
![Dark Mode](/img/blog/CodeBlock/CodeBlock.png)
原版的 CodeBlock 着色效果真是一言难尽，感觉着色了 但不多。而且对于 DarkMode 的适配是真的差劲，竟然没有对应把字体调成浅色( ) 深色的背景+深色的代码真的看得清嘛(x)   
   
### 修改步骤
我们可以这样来新增一个CSS：
```css
/* Custom styles for dark mode code blocks */
@media (prefers-color-scheme: dark) {
    pre, code {
        background-color: #2e3440; /* Dark background color */
        color: #d8dee9; /* Light font color for better readability */
    }

    /* Keyword styles */
    .hljs-keyword, .hljs-selector-tag, .hljs-title, .hljs-section {
        color: #81a1c1 !important;
    }

    /* String and literal styles */
    .hljs-string, .hljs-symbol, .hljs-bullet, .hljs-addition {
        color: #a3be8c !important;
    }

    /* Number styles */
    .hljs-number, .hljs-link {
        color: #b48ead !important;
    }

    /* Comment and meta styles */
    .hljs-comment, .hljs-quote, .hljs-meta {
        color: #616e88 !important;
    }

    /* Variable and template variable */
    .hljs-variable, .hljs-template-variable, .hljs-attr, .hljs-attribute, .hljs-tag {
        color: #ebcb8b !important;
    }

    /* Built-in and preprocessor */
    .hljs-built_in, .hljs-builtin-name, .hljs-preprocessor {
        color: #88c0d0 !important;
    }

    /* Deletion and emphasis */
    .hljs-deletion {
        color: #bf616a !important;
    }

    /* Emphasis */
    .hljs-emphasis {
        font-style: italic;
    }

    /* Strong */
    .hljs-strong {
        font-weight: bold;
    }
}
```
在 CSS 中使用 !important 可以强调其重要性，用于优先覆盖其他效果展示。本质上 Hexo 框架中已经存在了 hljs (HighLight) 规则，所以我们可以直接调用识别的类型然后分开着色，这里用到了 VScode 的颜色配置。
    
{% note info %}
记得分别挂载自定义的 Light&Dark 模式下的渲染规则
{% endnote %} 

```javascript
<link rel="stylesheet" href="<%= url_for('/css/dark.css') %>">
```
```javascript
<link rel="stylesheet" href="<%= url_for('/css/light.css') %>">
```

下面是 Light 模式的规则抄作业：
```css
/* Custom styles for light mode code blocks */
@media (prefers-color-scheme: light) {
    pre, code {
        background-color: #f5f5f5; /* Light grey background color */
        color: #4a4a4a; /* Dark grey font color for better readability */
    }

    /* Keyword styles */
    .hljs-keyword, .hljs-selector-tag, .hljs-title, .hljs-section {
        color: #005cc5 !important; /* Dark blue for control elements and sections */
    }

    /* String and literal styles */
    .hljs-string, .hljs-symbol, .hljs-bullet, .hljs-addition {
        color: #22863a !important; /* Green for strings and additions */
    }

    /* Number styles */
    .hljs-number, .hljs-link {
        color: #953800 !important; /* Brownish color for numbers and links */
    }

    /* Comment and meta styles */
    .hljs-comment, .hljs-quote, .hljs-meta {
        color: #6a737d !important; /* Dark gray for comments and meta information */
    }

    /* Variable and template variable */
    .hljs-variable, .hljs-template-variable, .hljs-attr, .hljs-attribute, .hljs-tag {
        color: #e36209 !important; /* Orange for variables, attributes, and tags */
    }

    /* Built-in and preprocessor */
    .hljs-built_in, .hljs-builtin-name, .hljs-preprocessor {
        color: #005cc5 !important; /* Dark blue for built-in functions and preprocessors */
    }

    /* Deletion */
    .hljs-deletion {
        color: #d73a49 !important; /* Red for deletions */
    }

    /* Emphasis */
    .hljs-emphasis {
        font-style: italic;
    }

    /* Strong */
    .hljs-strong {
        font-weight: bold;
    }
}

```
你可以此处继续浏览
{% btn https://github.com/Canmi21/Canmi21.github.io/blob/main/css/dark.css,Github, title %}