---
title: Waline
date: 2024-07-22 12:06:42
banner_img: /img/default.webp
category: README
tags: 
  - Hexo
  - Waline
  - README
  - zh_CN
excerpt: 现在您可以使用 Waline 留下你的评价
---

{% note warning %}
请珍惜你的权利
{% endnote %} 

关于评论插件，我想了很久，最后还是觉得再相信你们一次( ) 保留评论的权利给你们。但是如果还是喜欢往我数据库里面灌水或者来恶心我的，可能随时被我永久 Ban 掉。   
  
   
### 关于这次部署的评论插件
    
{% btn https://github.com/Canmi21/Blog-waline,Github, title %} 
#### Waline 基于 Valine 
Waline 主要 添加了多种数据库支持，对使用H5注入 Hexo 框架中，Fluid 也为此专门适配了 CSS 优化。
这是 Waline 官方的 DEMO：
{% btn https://blog-waline-orcin.vercel.app/,Waline, title %} 
     
对于这次的改动，主要修改了一下选项：
```yml
waline:
  serverURL: 'https://vercel.canmi.xyz'
  path: window.location.pathname
  meta: []
  requiredMeta: ['nick', 'mail']
  lang: 'en'
  emoji: ['https://cdn.jsdelivr.net/gh/walinejs/emojis/weibo']
  dark: 'html[data-user-color-scheme="dark"]'
  wordLimit: 0
  pageSize: 10
  admin: ['Canmi21@gmail.com']
  adminLabel: 'Owner'
```

首先评论改成 IP+ID+Mail 认证的形式尽量实名制，禁用了访客评论   
   
```yml
dark: 'html[data-user-color-scheme="dark"]'
```
受益于 Fluid 的适配，默认 Waline 可以原生适配 DarkMode

#### 配置流程

这次的 [Waline](https://github.com/Canmi21/Blog-waline) 服务我采用了 [Leancloud](https://www.leancloud.app) 作为托管数据库，由于网站和数据库都在境外，所以无需备案还可以做 CNAME 到自己的自定义域名上，关于部署请不要直接 git clone 我的 Github 仓库，你可以在 [Waline](https%3A%2F%2Fgithub.com%2Fwalinejs%2Fwaline%2Ftree%2Fmain%2Fexample) 的初始仓库上执行 clone.   
![Vercel](/img/blog/Waline/Vercel.png)
这里容器的托管服务我选择了 [Vercel](https://vercel.com/) 的服务，同样在境外不用备案但是速度尚可。你可以在 [Vercel](https://vercel.com/canmis-projects/blog-waline) 上继续查看我的项目，同样需要初始化请 clone [Vercel](https://vercel.com/new/canmis-projects/clone?repository-url=https%3A%2F%2Fgithub.com%2Fwalinejs%2Fwaline%2Ftree%2Fmain%2Fexample) 的初始化仓库。
![Vercel](/img/blog/Waline/Vercel-status.png)
#### 强制要求
在 Waline V2.15.5 的版本中支持你通过 Fluid 或者其他主题的 .yml 来限制最小的要求。
```yml
requiredMeta: ['nick', 'mail']
```
在我的 Blog 中您可以使用右下角的 Login 来绑定你的 Github 账号，这将会自动同步您的头像以及昵称。但是切记保护好你的账号，我并没有配置重置密码的邮箱，所以不推荐直接使用邮箱注册，这将无法使用"忘记密码"的功能。
![Waline](/img/blog/Waline/Waline.png)